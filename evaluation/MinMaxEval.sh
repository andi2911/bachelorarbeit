#!/bin/bash

#Tool Paths
GETETASMT=$HOME/verifaps-lib/exec/build/install/exec/bin/geteta-smt
GETETA=$HOME/verifaps-lib/exec/build/install/exec/bin/geteta
NUXMV=$HOME/nuXmv-1.1.1-Linux/bin/nuXmv
ELDARICA=$HOME/eldarica/eld

#Directories
FILES=minmax/
HCCS=$FILES/hccs
TIMES=$HOME/times

#Max Time per call
TIMEOUT=600

#Format for time output
STD_FORMAT="%Uuser;%Ssystem;%Eelapsed;%PCPU;(%Xavgtext+%Davgdata %Mmaxresident)k;%Iinputs+%Ooutputs;(%Fmajor+%Rminor)pagefaults;%Wswaps"
HEADER="identifier;user;system;elapsed;CPU;other Stats;other Stats;other Stats;other Stats"
BASE_FORMAT="%U;%S;%E;%P;(%Xavgtext+%Davgdata %Mmaxresident)k;%Iinputs+%Ooutputs;(%Fmajor+%Rminor)pagefaults;%Wswaps"

#Date/Time
TIMESTAMP=($(date +%Y%m%d_%H%M%S))


#SMT
echo "Calling SMTeta"
echo $HEADER > $TIMES/time_smt_$TIMESTAMP.csv 
for gtt in $FILES/*.gtt
do
    #gtt=${st%%.st}.gtt
    
    hvar=${gtt%%.gtt}.hcc
    hcc=${HCCS}${hvar##$FILES}
    
    ID="smteta_${gtt##$FILES/}"
    
    #call SMTeta
    /usr/bin/time -f "${ID};${BASE_FORMAT}" -a -o $TIMES/time_smt_$TIMESTAMP.csv timeout $TIMEOUT bash $GETETASMT -o $HCCS -c minmax/MinMax.st -t $gtt
    echo "$hcc created"
done

echo "Calling Eldarica: math"
for hcc in $HCCS/*.hcc
do
    ID="eld-math_${hcc##$HCCS/}"
    
   #call Eldarica
    /usr/bin/time -f "${ID};${BASE_FORMAT}" -a -o $TIMES/time_smt_$TIMESTAMP.csv timeout $TIMEOUT bash $ELDARICA $hcc
    echo "finished call of $hcc"
done

echo "Calling Eldarica: ilp32"
for hcc in $HCCS/*.hcc
do
    ID="eld-ilp32_${hcc##$HCCS/}"
    
   #call Eldarica
    /usr/bin/time -f "${ID};${BASE_FORMAT}" -a -o $TIMES/time_smt_$TIMESTAMP.csv timeout $TIMEOUT bash $ELDARICA -arithMode:ilp32 $hcc
    echo "finished call of $hcc"
done
nuXmv
echo "Calling geteta with nuXmv"
echo $HEADER > $TIMES/time_nuxmv_$TIMESTAMP.csv

for gtt in $FILES/*.gtt
do
    #gtt=${st%%.st}.gtt
    
    ID="nuXmv_${gtt##$FILES/}"
    
    #call Geteta with nuXmv
    /usr/bin/time -f "${ID};${BASE_FORMAT}" -a -o $TIMES/time_nuxmv_$TIMESTAMP.csv timeout $TIMEOUT bash $GETETA --nuxmv $NUXMV -c minmax/MinMax.st -t $gtt
     
done
