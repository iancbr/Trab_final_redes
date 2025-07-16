#!/bin/bash

time=90
bwnet=1.5
delay=10

for qsize in 20 100; do
    data_dir=data_TCP_BBR_parte3/q$qsize
    plots_dir=plots_TCP_BBR_parte3/q$qsize

    mkdir -p $data_dir
    mkdir -p $plots_dir

    python3 bufferbloat.py \
        --bw-host 1000 \
        --bw-net $bwnet \
        --delay $delay \
        --dir $data_dir \
        --time $time \
        --maxq $qsize \
        --cong bbr

    python3 plot_queue.py -f $data_dir/q.txt -o $plots_dir/buffer.png
    python3 plot_ping.py -f $data_dir/ping.txt -o $plots_dir/rtt.png
done
