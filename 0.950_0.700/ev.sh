#!/bin/bash


for mass in `seq 70 5 90`
do 
    for q in  2 3
    do 
        for p in 100
        do 
            echo "&binary_controls
            m1=${mass}
            m2=`awk -v "x=${mass}" -v "y=${q}" 'BEGIN{printf("%g",x*y*0.25)}'`
            initial_period_in_days=${p}
            /!end of binary_controls namelist" > ./inlist_extra
            ./rn
            m2=`awk -v "x=${mass}" -v "y=${q}" 'BEGIN{printf("%g",x*y*0.25)}'`

            mkdir ./models/${mass}_${q}_${p} 
            dir=./models/${mass}_${q}_${p}
            mv binary_his* ${dir}/
            mv LOGS* ${dir}/
            mv model*.dat ${dir}/
            mv photos* ${dir}/
            mv png ${dir}/
            mv summ* ${dir}/
            rm inlist_extra
        done
    done
done
exit 0
