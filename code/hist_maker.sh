#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "$1+$i*$3" | bc)
  tab_calc -c histl -x 2 -f data150_$n  -t 50 -o 1 | echo "$n $(tab_calc -c max -x 2 -Q )" 
done
