#!/bin/bash
for i in `seq 0 $2`; do
  n=$(echo "1000+$i*500" | bc)
  echo "$i $n"
  ./IMFtest3 $1 $n > data$1_$n.3
#  echo "$(tab_calc -c avg -x 3,4,5 -f data$1_$n.3) $(tab_calc -c dis -x 3,4,5 -f data$1_$n.3)" >> runme_3.dat
done