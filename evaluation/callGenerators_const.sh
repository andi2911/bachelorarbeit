RANDOM=$1 #seed
for i in {001..100}; do
echo $i
bash ConstAddition.sh $i $RANDOM
bash ConstMultiplication.sh $i $RANDOM
bash ConstDivision.sh $i $RANDOM
done