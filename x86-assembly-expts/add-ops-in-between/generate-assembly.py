#!/usr/bin/env python3
import sys
import subprocess
from pathlib import Path

# -------------------------
# Config
# -------------------------
MAX_SUFFIX = 8192          # generate up to this power of 2
START_POWER = 1            # 2^1 = 2
CC = "gcc"                 # or "clang"
CFLAGS = ["-O2", "-no-pie"]  # adjust if you want; -no-pie often avoids toolchain defaults
LDFLAGS = []               # add e.g. ["-lm"] if needed

START_MARK = "### REPEAT START"
END_MARK   = "### REPEAT END"


def die(msg: str) -> None:
    raise SystemExit(msg)


def derive_prefix(src: Path) -> str:
    # naive-0000.s -> naive ; optimized-0000.s -> optimized
    stem = src.stem
    if not stem.endswith("-0000"):
        die("Input must be like naive-0000.s or optimized-0000.s")
    return stem[:-5]  # drop "-0000"


def extract_repeat_block(lines: list[str]) -> tuple[int, int, list[str]]:
    try:
        start = next(i for i, l in enumerate(lines) if l.strip() == START_MARK)
    except StopIteration:
        die(f"Couldn't find marker line: {START_MARK}")

    try:
        end = next(i for i, l in enumerate(lines) if i > start and l.strip() == END_MARK)
    except StopIteration:
        die(f"Couldn't find marker line: {END_MARK} (after {START_MARK})")

    return start, end, lines[start + 1:end]


def normalize_payload(payload: list[str]) -> list[str]:
    """
    - remove blank lines
    - uncomment lines that begin with '#'
    """
    out: list[str] = []
    for l in payload:
        if not l.strip():
            continue
        stripped = l.lstrip()
        if stripped.startswith("#"):
            after = stripped[1:]
            if after.startswith(" "):
                after = after[1:]
            indent = l[: len(l) - len(stripped)]
            l = indent + after
        out.append(l if l.endswith("\n") else (l + "\n"))

    if not out:
        die("Repeat payload between markers is empty after normalization.")
    return out


def powers_of_two_up_to(max_val: int, start_power: int = 1):
    p = start_power
    while True:
        v = 1 << p
        if v > max_val:
            break
        yield v
        p += 1


def run(cmd: list[str]) -> None:
    # show command for logging + easier debugging
    print("+", " ".join(cmd))
    subprocess.run(cmd, check=True)


def compile_asm(asm_path: Path, out_path: Path) -> None:
    cmd = [CC, *CFLAGS, str(asm_path), "-o", str(out_path), *LDFLAGS]
    run(cmd)


def main():
    if len(sys.argv) != 2:
        print("Usage: python3 gen_and_build_pow2.py <template-0000.s>")
        sys.exit(1)

    template = Path(sys.argv[1])
    if not template.exists():
        die(f"Template not found: {template}")

    prefix = derive_prefix(template)

    base_lines = template.read_text().splitlines(keepends=True)
    start, end, raw_payload = extract_repeat_block(base_lines)
    payload = normalize_payload(raw_payload)
    payload_len = len(payload)

    head = base_lines[: start + 1]   # include START_MARK
    tail = base_lines[end:]          # include END_MARK + rest

    print(f"Template: {template}")
    print(f"Prefix  : {prefix}")
    print(f"Payload lines per repeat: {payload_len}")
    print()

    for suffix in powers_of_two_up_to(MAX_SUFFIX, START_POWER):
        # We want exactly `suffix` extra lines inserted
        if suffix % payload_len != 0:
            die(
                f"Cannot make exactly {suffix} extra lines with payload length {payload_len}. "
                f"(Need {suffix} % {payload_len} == 0.)"
            )

        repeats = suffix // payload_len
        injected = payload * repeats

        asm_out = Path(f"{prefix}-{suffix:04d}.s")
        exe_out = Path(f"{prefix}-{suffix:04d}")

        asm_out.write_text("".join(head + injected + tail))
        print(f"Wrote {asm_out} (extra_lines={len(injected)}, repeats={repeats})")

        compile_asm(asm_out, exe_out)
        print(f"Built {exe_out}")
        print()

    print("Done.")


if __name__ == "__main__":
    main()