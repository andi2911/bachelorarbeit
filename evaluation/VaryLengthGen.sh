
#LENGTH=$1

for i in {001..100}; do
echo $i

LENGTH=$i

    NAME="varyLength_${LENGTH}"
    PATH="varyLength/$NAME"

    #ST
    echo "PROGRAM p_$NAME" >$PATH.st
    echo "" >>$PATH.st

    #Scope
    echo "VAR_OUTPUT">>$PATH.st
    echo "X : INT := 0;">>$PATH.st
    echo "END_VAR">>$PATH.st
    echo "" >>$PATH.st

    #Body
    echo "X := X + 1;">>$PATH.st
    echo "END_PROGRAM">>$PATH.st
    
    #GTT    
    echo "table t_$NAME {" >$PATH.gtt
    echo "var output X : INT" >>$PATH.gtt
   
    echo "group 0 [1,1] {" >>$PATH.gtt
    echo "row 1 [1,1] {" >>$PATH.gtt
    echo "X:= 1" >>$PATH.gtt
    echo "}" >>$PATH.gtt
    COUNTER=2
    while [ $COUNTER -le $LENGTH ]; do
        echo "row ${COUNTER} [1,1] {" >>$PATH.gtt
        echo "X:= X[-1] + 1" >>$PATH.gtt
        echo "}" >>$PATH.gtt
        COUNTER=$(($COUNTER + 1))
    done
    echo "}" >>$PATH.gtt
    echo "}" >>$PATH.gtt

done
