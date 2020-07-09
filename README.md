# bachelorarbeit
Dieses Repository enthält die Forschungsdaten und Skripte des Evaluationsteils meiner Bachelorarbeit "Horn-basierte Verifikation mit Generalisierten Testtabellen"

Im Ordner "Rohdaten" sind die unbearbeiteten Ergebnisse meiner Evaluationsdurchführungen.
Im Ordner "Eval_Ergebnisse" sind die aufbereiteten Ergebnisse, in der Form wie sie in der BAchelorarbeit zu finden sind (inkl. Median, Minimum, Maximum, ...)

Im Ordner "evaluation" sind alle Skripte, die zur Durchführung der Evaluation benötigt wurden.
Außerdem ist dort die verwendete Versionen vom Model-Checker nuXmv (1.1.1). ELDARICA (2.0.2) ist auf https://github.com/uuverifiers/eldarica zu finden.

Die Skripte ConstAddition.sh, ConstDivision.sh, ConstMultiplication.sh, VarAddition.sh, VarDivision.sh und VarMultiplication.sh sind Generator-Skripte für die jeweilige Arithmetik.
Sie erzeugen genau ein Paar aus ST-Programm und GTT.

callGenerators_const.sh, callGenerators_constPrime.sh und callGenerators_var.sh rufen die Generator-Skripte auf.
Hier kann die Anzahl und Komplexität der generierten Paare (ST-Programm & GTT) verändert werden. 

Eval.sh ruft, für alle Paare xy.st und xy.gtt, des angegebenen Ordners jede der drei Pipeline-Konfigurationen (Model-Checker, SMT math, SMT ilp32) auf.
Hier müssen die korrekten Pfade zu geteta, geteta-smt, nuXmv und ELDARICA angegeben werden.
Ebenso kann der Ordner für die Ausgabe festgelegt werden.

MinMaxGen.sh und MinMaxEval.sh sind die separaten Skripte zur Generierung bzw Evaluation des MinMax-Beispiels mit verschiedenen Grenzen.
Auch in MinMaxEval.sh müssen die korrekten Pfade zu geteta, geteta-smt, nuXmv und ELDARICA angegeben werden.
Ebenso kann der Ordner für die Ausgabe festgelegt werden.

Die callEval*.sh Skripte führen für die jeweilige Kategorie die Evaluation (inkl. Generierung der st und gtt Dateien) durch.
Für die Arithmetik mit Konstanten können hier die Seeds der Pseudozufallszahlen geändert werden.


