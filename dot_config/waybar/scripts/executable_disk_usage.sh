#!/bin/bash

# Compute the percentage of disk used
disk_pcent=$(df --output=pcent / | tail -n 1 | tr -d '% ')
disk_used=$(df --output=used --human-readable / | tail -n 1 | xargs)
disk_size=$(df --output=size --human-readable / | tail -n 1 | xargs)

echo "{\"text\": \"${disk_used} / ${disk_size} (${disk_pcent}%)\", \"percentage\": ${disk_pcent} }"
