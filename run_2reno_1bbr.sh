#!/bin/bash

time=90
bwnet=1.5
delay=10

for qsize in 20 100; do
    dir_data=compete-2reno-1bbr/q$qsize
    dir_plots=plots-compete-2reno-1bbr/q$qsize

    mkdir -p $dir_data
    mkdir -p $dir_plots

    python3 bufferbloat.py \
        --bw-host 1000 \
        --bw-net $bwnet \
        --delay $delay \
        --dir $dir_data \
        --time $time \
        --maxq $qsize \
        --compete \
        --reno-flows 2 \
        --bbr-flows 1

    python3 plot_queue.py -f $dir_data/q.txt -o $dir_plots/buffer.png
    python3 plot_ping.py -f $dir_data/ping.txt -o $dir_plots/rtt.png
done
