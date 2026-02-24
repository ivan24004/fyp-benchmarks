#!/usr/bin/env python3
import sys
import subprocess
from pathlib import Path

CC = "gcc"                      # or "clang"
CFLAGS = ["-O2", "-no-pie"]     # tweak as needed
LDFLAGS = []                    # e.g. ["-lm"] if you need math lib


def run(cmd: list[str]) -> None:
    print("+", " ".join(cmd))
    subprocess.run(cmd, check=True)


def main():
    # Default: naive-*.s
    pattern = sys.argv[1] if len(sys.argv) >= 2 else "naive-*.s"

    asm_files = sorted(Path(".").glob(pattern))
    if not asm_files:
        print(f"No files matched pattern: {pattern}", file=sys.stderr)
        sys.exit(1)

    print(f"Building {len(asm_files)} file(s) matching: {pattern}")
    print(f"Compiler: {CC}")
    print()

    for asm in asm_files:
        if asm.suffix != ".s":
            continue

        out = asm.with_suffix("")  # naive-0002.s -> naive-0002
        cmd = [CC, *CFLAGS, str(asm), "-o", str(out), *LDFLAGS]
        run(cmd)

    print("\nDone.")


if __name__ == "__main__":
    main()