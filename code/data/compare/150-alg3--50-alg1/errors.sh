#!/bin/bash

#average
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $1, 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_avg | tc -c int_avg -x 1 -y 2,3,4 -Q )" > est_averages
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $2, 100*abs($3-$2)/$2, 100*abs($4-$2)/$2, 100*abs($5-$2)/$2 }' < est_M_avg | tc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_averages
#median
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $1, 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_med | tc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_averages
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $2, 100*abs($3-$2)/$2, 100*abs($4-$2)/$2, 100*abs($5-$2)/$2 }' < est_M_med | tc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_averages
#maximum
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $1, 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_max | tc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_averages
echo "$(awk 'function abs(x){return x<0 ? -x : x} { print $2, 100*abs($3-$2)/$2, 100*abs($4-$2)/$2, 100*abs($5-$2)/$2 }' < est_M_max | tc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_averages

echo "$(awk '{print $1, 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_avg | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" > est_disp
echo "$(awk '{print $2, 100*$6/$2, 100*$7/$2, 100*$8/$2}' < est_M_avg | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_disp
echo "$(awk '{print $1, 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_med | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_disp
echo "$(awk '{print $2, 100*$6/$2, 100*$7/$2, 100*$8/$2}' < est_M_med | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_disp
echo "$(awk '{print $1, 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_max | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_disp
echo "$(awk '{print $2, 100*$6/$2, 100*$7/$2, 100*$8/$2}' < est_M_max | tab_calc -c int_avg -x 1 -y 2,3,4 -Q )" >> est_disp
