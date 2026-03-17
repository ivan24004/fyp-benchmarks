import subprocess
import time
import statistics
import csv

# --- CONFIGURE YOUR EXECUTABLES HERE ---
EXECUTABLES = [
]

start = 0
p = 0.25
for p in [0.75, 0.875, 0.9375, 0.96875]:
    EXECUTABLES.append(f"./naive_{p}-0000")
    EXECUTABLES.append(f"./optimized_{p}-0000")
    if start == 0:
        start = 2
    else:
        start *= 2
    p /= 2




NUM_RUNS = 30
CSV_OUTPUT = "runtime_results.csv"


def run_once(cmd):
    """Run the executable once, return runtime in seconds."""
    start = time.perf_counter()
    subprocess.run(cmd, shell=True, check=True)
    end = time.perf_counter()
    return end - start


def collect_stats(times):
    """Return a dict of statistical metrics."""
    return {
        "mean": statistics.mean(times),
        "median": statistics.median(times),
        "stdev": statistics.stdev(times) if len(times) > 1 else 0.0,
        "min": min(times),
        "max": max(times),
    }


def main():
    all_results = {}

    for exe in EXECUTABLES:
        print(f"\n=== Running {exe} for {NUM_RUNS} iterations ===")
        times = []

        for i in range(NUM_RUNS):
            t = run_once(exe)
            times.append(t)
            print(f"Run {i+1:02d}: {t:.6f} sec")

        all_results[exe] = times

    # Save CSV
    with open(CSV_OUTPUT, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["executable", "run_index", "runtime_sec"])

        for exe, times in all_results.items():
            for idx, t in enumerate(times):
                writer.writerow([exe, idx, t])

    print(f"\nSaved raw results to {CSV_OUTPUT}\n")

    # Print summary
    print("=== Summary Statistics ===")
    for exe, times in all_results.items():
        stats = collect_stats(times)
        print(f"\n{exe}:")
        for k, v in stats.items():
            print(f"  {k:6s}: {v:.6f}")


if __name__ == "__main__":
    main()
