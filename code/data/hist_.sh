#!/bin/bash
#x=$(echo "$2+1" | bc)
tab_calc -f data150_$1 -x 2 -c histl -m 3 -M 150 -t 50 -o 1 > hist_m1_$1
tab_calc -f data150_$1 -x 3 -c histl -m 3 -M 150 -t 50 -o 1 > hist_m2_$1
tab_calc -f data150_$1 -x 4 -c histl -m 3 -M 150 -t 50 -o 1 > hist_m3_$1
