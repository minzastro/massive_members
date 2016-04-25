#!/bin/bash
perform() {
for i in `seq 0 $2`; do
  n=$(echo "$1+$i*$3" | bc)
  echo "$n"
  ./fa ../alg3/data150_$n.3 $n
  echo "$(tab_calc -c avg -x 1,2 -f fort.61 ) $(tab_calc -c med -s -f fort.61 -x 3,4,5 ) $(tab_calc -c dis -f fort.61 -x 3,4,5 )" >> est_N_avg
  echo "$(tab_calc -c avg -x 1,2 -f fort.62 ) $(tab_calc -c med -s -f fort.62 -x 3,4,5 ) $(tab_calc -c dis -f fort.62 -x 3,4,5 )" >> est_N_med
  echo "$(tab_calc -c avg -x 1,2 -f fort.63 ) $(tab_calc -c med -s -f fort.63 -x 3,4,5 ) $(tab_calc -c dis -f fort.63 -x 3,4,5 )" >> est_N_max
  echo "$(tab_calc -c avg -x 1,2 -f fort.71 ) $(tab_calc -c med -s -f fort.71 -x 3,4,5 ) $(tab_calc -c dis -f fort.71 -x 3,4,5 )" >> est_M_avg
  echo "$(tab_calc -c avg -x 1,2 -f fort.72 ) $(tab_calc -c med -s -f fort.72 -x 3,4,5 ) $(tab_calc -c dis -f fort.72 -x 3,4,5 )" >> est_M_med
  echo "$(tab_calc -c avg -x 1,2 -f fort.73 ) $(tab_calc -c med -s -f fort.73 -x 3,4,5 ) $(tab_calc -c dis -f fort.73 -x 3,4,5 )" >> est_M_max
done
}

perform 200 3 100
perform 1000 4 500
perform 4000 2 2000
beep.sh
