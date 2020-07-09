echo started at $(date)
echo "call Generators"
bash callGenerators_var.sh

echo "call varAddition1"
bash Eval.sh varAddition/
echo "call varMultiplication1"
bash Eval.sh varMultiplication/
echo "call varDivision1"
bash Eval.sh varDivision/

echo "call varAddition2"
bash Eval.sh varAddition/
echo "call varMultiplication2"
bash Eval.sh varMultiplication/
echo "call varDivision2"
bash Eval.sh varDivision/

echo "call varAddition3"
bash Eval.sh varAddition/
echo "call varMultiplication3"
bash Eval.sh varMultiplication/
echo "call varDivision3"
bash Eval.sh varDivision/

echo "call varAddition4"
bash Eval.sh varAddition/
echo "call varMultiplication4"
bash Eval.sh varMultiplication/
echo "call varDivision4"
bash Eval.sh varDivision/

echo "call varAddition5"
bash Eval.sh varAddition/
echo "call varMultiplication5"
bash Eval.sh varMultiplication/
echo "call varDivision5"
bash Eval.sh varDivision/

echo finished at $(date)