

LIMIT=$1

NAME="varAddition_${LIMIT}"
PATH="varAddition/$NAME"

#ST
echo "PROGRAM p_$NAME" >$PATH.st
echo "" >>$PATH.st

#Scope
echo "VAR_INPUT">>$PATH.st
echo "i1 : INT;">>$PATH.st
echo "i2 : INT;">>$PATH.st
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
echo "o0 := i1 + i2;">>$PATH.st
if [ $LIMIT -gt 1 ]; then
  echo "o1 := i2 + o0;">>$PATH.st
fi

COUNTER=2
while [ $COUNTER -lt $LIMIT ]; do
  echo "o$COUNTER := o$(($COUNTER - 1)) + o$(($COUNTER - 2));">>$PATH.st
  COUNTER=$(($COUNTER + 1))
done

echo "END_PROGRAM">>$PATH.st


#GTT
echo "table t_$NAME {" >$PATH.gtt
echo "var input i1 : INT" >>$PATH.gtt
echo "var input i2 : INT" >>$PATH.gtt
COUNTER=0
while [ $COUNTER -lt $LIMIT ]; do
  echo "var output o$COUNTER : INT;">>$PATH.gtt
  COUNTER=$(($COUNTER + 1))
done
echo "" >>$PATH.gtt

echo "group 0 [1,1] {" >>$PATH.gtt
echo "row 1 omega {" >>$PATH.gtt
echo "i1: -" >>$PATH.gtt
echo "i2: -" >>$PATH.gtt
echo "o0:= i1 + i2" >>$PATH.gtt
if [ $LIMIT -gt 1 ]; then
  echo "o1:= i2 + o0;">>$PATH.gtt
fi
COUNTER=2
while [ $COUNTER -lt $LIMIT ]; do
  echo "o$COUNTER:= o$(($COUNTER - 1)) + o$(($COUNTER - 2));">>$PATH.gtt
  COUNTER=$(($COUNTER + 1))
done
echo "}" >>$PATH.gtt
echo "}" >>$PATH.gtt
echo "}" >>$PATH.gtt
