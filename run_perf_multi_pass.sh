#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <program> [args...]" >&2
  exit 1
fi

# =========================
# Configuration
# =========================
RUNS=30
OUT="perf_multi_pass.csv"
WARMUP=1
GROUP_SIZE=4   # how many events to measure per run

CMD=("$@")

PASS_NAMES=(
  "bp internal flushes"
  "early redirects"
  "bp redirects (resync)"
  "bp redirects (exredir)"
  "flushed ops due to mispredicts"
  "branches"
  "branch-misses"
)

PASS_EVENTS=(
  "r008b"
  "r0091"
  "r019f"
  "r029f"
  "r00c3"
  "branches"
  "branch-misses"
)

# =========================
# Safety checks
# =========================
if (( ${#PASS_NAMES[@]} != ${#PASS_EVENTS[@]} )); then
  echo "ERROR: PASS_NAMES and PASS_EVENTS length mismatch" >&2
  exit 2
fi

# =========================
# CSV header
# =========================
echo "pass,run,value,unit,event,time_enabled,time_running,metric,metric_unit" > "$OUT"

# =========================
# Warmup
# =========================
echo "Warmup runs..."
for _ in $(seq 1 "$WARMUP"); do
  "${CMD[@]}" > /dev/null
done

# =========================
# Measurement
# =========================
NUM_EVENTS=${#PASS_EVENTS[@]}

for run in $(seq 1 "$RUNS"); do
  echo "=== Run $run / $RUNS ==="

  # process events in groups of GROUP_SIZE
  for ((i=0; i<NUM_EVENTS; i+=GROUP_SIZE)); do

    # Build event list and names for this group
    EVENTS=()
    NAMES=()

    for ((j=0; j<GROUP_SIZE && i+j<NUM_EVENTS; j++)); do
      EVENTS+=("${PASS_EVENTS[i+j]}")
      NAMES+=("${PASS_NAMES[i+j]}")
    done

    EVENT_STR=$(IFS=,; echo "${EVENTS[*]}")
    NAME_STR=$(IFS=" | "; echo "${NAMES[*]}")

    echo "Run $run: measuring [$NAME_STR]"

    # Run perf once for this group
    perf stat -x, -e "$EVENT_STR" -- "${CMD[@]}" 2>&1 | \
      awk -F, -v run="$run" '
        $1 !~ /^#/ && NF >= 3 {
          # event name comes in column 3 from perf
          printf "%s,%d,%s,%s,%s,%s,%s,%s,%s\n",
                 $3,run,$1,$2,$3,$4,$5,$6,$7
        }
      ' >> "$OUT"

  done
done

echo "Wrote $OUT"
