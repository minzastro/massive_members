#!/bin/bash

#average
echo "N $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_avg.1 | tab_calc -c avg -Q )" > est_averages
echo "M $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$2)/$2, 100*abs($4-$2)/$2, 100*abs($5-$2)/$2 }' < est_M_avg.1 | tab_calc -c avg -Q )" >> est_averages
#median
echo "N $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_med.1 | tab_calc -c avg -Q )" >> est_averages
echo "M $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$2)/$2, 100*abs($4-$2)/$2, 100*abs($5-$2)/$2 }' < est_M_med.1 | tab_calc -c avg -Q )" >> est_averages
#maximum
echo "N $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_N_max.1 | tab_calc -c avg -Q )" >> est_averages
echo "M $(awk 'function abs(x){return x<0 ? -x : x} { print 100*abs($3-$1)/$1, 100*abs($4-$1)/$1, 100*abs($5-$1)/$1 }' < est_M_max.1 | tab_calc -c avg -Q )" >> est_averages

echo "N $(awk '{print 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_avg.1 | tab_calc -c avg -Q )" > est_disp
echo "M $(awk '{print 100*$6/$2, 100*$7/$1, 100*$8/$2}' < est_M_avg.1 | tab_calc -c avg -Q )" >> est_disp
echo "N $(awk '{print 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_med.1 | tab_calc -c avg -Q )" >> est_disp
echo "M $(awk '{print 100*$6/$2, 100*$7/$1, 100*$8/$2}' < est_M_med.1 | tab_calc -c avg -Q )" >> est_disp
echo "N $(awk '{print 100*$6/$1, 100*$7/$1, 100*$8/$1}' < est_N_max.1 | tab_calc -c avg -Q )" >> est_disp
echo "M $(awk '{print 100*$6/$2, 100*$7/$1, 100*$8/$2}' < est_M_max.1 | tab_calc -c avg -Q )" >> est_disp
