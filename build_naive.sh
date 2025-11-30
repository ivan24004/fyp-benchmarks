gcc -O3 -S naive.c -o naive.s
gcc naive.s -o naive
perf stat -e branch-misses,branch-instructions ./naive