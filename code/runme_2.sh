#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "3000+$i*1000" | bc)
  IMFtest2 $1 $n > data$1_$n.2
  echo "$1 $n $(tab_calc -c avg -x 2,3,4 -f data$1_$n.2) $(tab_calc -c dis -x 2,3,4 -f data$1_$n.2)"
  tab_calc -c hist -x 2 -f data$1_$n.2 -m 1 -M 100 -t 50 -o 1 | awk -v n=$n '{ print n, $0 }'  >> histx
done