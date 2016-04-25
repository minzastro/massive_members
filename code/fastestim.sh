#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "$1+$i*$3" | bc)
  echo "$n"
  echo "$n" | ./fastestimateA data/alg1/data150_$n
  tab_calc -c avg -f fort.77 >> estA_N_avg
  tab_calc -c med -f fort.77 >> estA_N_med
  tab_calc -c avg -f fort.78 >> estA_M_avg
  tab_calc -c med -f fort.78 >> estA_M_med  
done
