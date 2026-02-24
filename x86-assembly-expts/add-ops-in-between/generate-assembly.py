#!/usr/bin/env python3
import sys
from pathlib import Path

MAX_SUFFIX = 8192  # last power-of-2 you want
START_POWER = 1    # 2^1 = 2 (change to 0 if you also want 1)
START_MARK = "### REPEAT START"
END_MARK   = "### REPEAT END"


def derive_prefix(src: Path) -> str:
    # naive-0000.s -> naive, optimized-0000.s -> optimized
    stem = src.stem
    if not stem.endswith("-0000"):
        raise SystemExit("Input file must be like naive-0000.s or optimized-0000.s")
    return stem[:-5]  # drop "-0000"


def extract_repeat_block(lines: list[str]) -> tuple[int, int, list[str]]:
    try:
        start = next(i for i, l in enumerate(lines) if l.strip() == START_MARK)
    except StopIteration:
        raise SystemExit(f"Couldn't find marker: {START_MARK}")

    try:
        end = next(i for i, l in enumerate(lines) if i > start and l.strip() == END_MARK)
    except StopIteration:
        raise SystemExit(f"Couldn't find marker: {END_MARK} (after {START_MARK})")

    return start, end, lines[start + 1:end]


def normalize_payload(payload: list[str]) -> list[str]:
    """
    - removes blank lines
    - uncomments lines beginning with '#'
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
        raise SystemExit("Repeat payload between markers is empty after normalization.")
    return out


def powers_of_two_up_to(max_val: int, start_power: int = 1):
    p = start_power
    while True:
        v = 1 << p
        if v > max_val:
            break
        yield v
        p += 1


def main():
    if len(sys.argv) != 2:
        print("Usage: python3 gen_variants_pow2.py <template-0000.s>")
        sys.exit(1)

    src = Path(sys.argv[1])
    prefix = derive_prefix(src)

    base_lines = src.read_text().splitlines(keepends=True)

    start, end, raw_payload = extract_repeat_block(base_lines)
    payload = normalize_payload(raw_payload)
    payload_len = len(payload)

    prefix_lines = base_lines[: start + 1]  # include START_MARK
    suffix_lines = base_lines[end:]         # include END_MARK + rest

    print(f"Template: {src}")
    print(f"Output prefix: {prefix}")
    print(f"Payload lines per repeat: {payload_len}")
    print(f"Generating powers of 2 up to {MAX_SUFFIX}:")
    print()

    for suffix in powers_of_two_up_to(MAX_SUFFIX, START_POWER):
        # Want EXACTLY `suffix` extra lines inserted
        if suffix % payload_len != 0:
            raise SystemExit(
                f"Cannot make exactly {suffix} extra lines because payload has "
                f"{payload_len} lines per repeat. (Need divisibility.)"
            )

        repeats = suffix // payload_len
        repeated = payload * repeats

        outname = Path(f"{prefix}-{suffix:04d}.s")
        outname.write_text("".join(prefix_lines + repeated + suffix_lines))

        print(f"Wrote {outname} (extra_lines={len(repeated)}, repeats={repeats})")


if __name__ == "__main__":
    main()