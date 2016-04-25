#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "1000+$i*1000" | bc)
  IMFtest $1 $n > data$1_$n
#  echo "$n $(tab_calc -c avg -x 2,3,4 -f data$1_$n) $(tab_calc -c dis -x 2,3,4 -f data$1_$n)"
#  tab_calc -c hist -x 2 -f data$1_$n -m 1 -M 100 -t 50 -o 1 | awk -v n=$n '{ print n, $0 }'  >> histx_1
done