#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "$1+$i*$3" | bc)
  echo "$n $(tab_calc -c med -f data150_$n.3)"
done
