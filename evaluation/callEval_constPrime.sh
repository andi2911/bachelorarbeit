echo started at $(date)
echo "call Generators1"
bash callGenerators_constPrime.sh 2911 #seed1
echo "call constAddition1"
bash Eval.sh constAddition/
echo "call constMultiplication1"
bash Eval.sh constMultiplication/
echo "call Generators2"
bash callGenerators_constPrime.sh 42 #seed2
echo "call constAddition2"
bash Eval.sh constAddition/
echo "call constMultiplication2"
bash Eval.sh constMultiplication/
echo "call Generators3"
bash callGenerators_constPrime.sh 1997 #seed3
echo "call constAddition3"
bash Eval.sh constAddition/
echo "call constMultiplication3"
bash Eval.sh constMultiplication/
echo "call Generators4"
bash callGenerators_constPrime.sh 345 #seed4
echo "call constAddition4"
bash Eval.sh constAddition/
echo "call constMultiplication4"
bash Eval.sh constMultiplication/
echo "call Generators5"
bash callGenerators_constPrime.sh 2262 #seed5
echo "call constAddition5"
bash Eval.sh constAddition/
echo "call constMultiplication5"
bash Eval.sh constMultiplication/

echo finished at $(date)