echo started at $(date)
echo "call Generator"
bash VaryLengthGen.sh

echo "call varyLength1"
bash Eval.sh varyLength/
echo "call varyLength2"
bash Eval.sh varyLength/
echo "call varyLength3"
bash Eval.sh varyLength/
echo "call varyLength4"
bash Eval.sh varyLength/
echo "call varyLength5"
bash Eval.sh varyLength/

echo finished at $(date)