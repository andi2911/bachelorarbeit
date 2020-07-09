
LIMIT=$1
CONSTANT=$2

NAME="constAddition_${LIMIT}"
PATH="constAddition/$NAME"

#ST
echo "PROGRAM p_$NAME" >$PATH.st
echo "" >>$PATH.st

#Scope
echo "VAR_INPUT">>$PATH.st
echo "i : INT;">>$PATH.st
echo "END_VAR">>$PATH.st
echo "" >>$PATH.st
echo "VAR_OUTPUT">>$PATH.st

COUNTER=0
while [ $COUNTER -lt $LIMIT ]; do
  echo "o$COUNTER : INT;">>$PATH.st
  COUNTER=$(($COUNTER + 1))
done

echo "END_VAR">>$PATH.st
echo "" >>$PATH.st

#Body
echo "o0 := i + $CONSTANT;">>$PATH.st

COUNTER=1
while [ $COUNTER -lt $LIMIT ]; do
  echo "o$COUNTER := o$(($COUNTER - 1)) + $CONSTANT;">>$PATH.st
  COUNTER=$(($COUNTER + 1))
done

echo "END_PROGRAM">>$PATH.st


#GTT
echo "table t_$NAME {" >$PATH.gtt
echo "var input i : INT" >>$PATH.gtt
COUNTER=0
while [ $COUNTER -lt $LIMIT ]; do
  echo "var output o$COUNTER : INT;">>$PATH.gtt
  COUNTER=$(($COUNTER + 1))
done
echo "" >>$PATH.gtt

echo "group 0 [1,1] {" >>$PATH.gtt
echo "row 1 omega {" >>$PATH.gtt
echo "i: -" >>$PATH.gtt
echo "o0:= i + $CONSTANT" >>$PATH.gtt
COUNTER=1
while [ $COUNTER -lt $LIMIT ]; do
  echo "o$COUNTER := o$(($COUNTER - 1)) + $CONSTANT">>$PATH.gtt
  COUNTER=$(($COUNTER + 1))
done
echo "}" >>$PATH.gtt
echo "}" >>$PATH.gtt
echo "}" >>$PATH.gtt
