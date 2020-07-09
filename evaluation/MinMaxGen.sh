#normal
VALUES="0001 0002 0003 0004 0005 0010 0015 0020 0025 0050 0075 0100 0200 0300 0400 0500 1000"

for i in $VALUES; do
echo $i

MAX=$(($i))

    NAME="MinMax_${i}"
    PATH="minmax/$NAME"

echo "table t_$NAME {">$PATH.gtt
echo "    var input mode : ENUM
    var input learn : BOOL
    var input I : INT
    var output Q : INT
    var output W : BOOL
    
    gvar min : INT with 0">>$PATH.gtt
echo "    gvar max : INT with $MAX">>$PATH.gtt
echo "
    group {
        row   I >=1 { mode: Active; learn: -; I: -; Q: 0; W: true }
        row Lmin >=1 { mode: Learn; learn: true; I: min;  Q: 0; W: false }
        row Lmax >=1 { mode: Learn; learn: true; I: max;  Q: 0; W: false }

        group L >=1 {
            row >=1 { mode: Learn; learn: false; I: -;  Q: 0; W: false }
            row >=1 { mode: Learn; learn: true;  I: [min,max]; Q: [min,max]; W: =false }
        }

        group A omega {
            row A1 >= 0 { mode: Active; learn: -; I: [min,max]; Q: [min,max]; W: =false }

            row AHigh      2      { mode: Active; learn: -; I: >max; Q: <=max; W: =false  }
            row AHighError 1      { mode: Active; learn: -; I: >max; Q: <=max; W: =true }

            row ACooldown  2      { mode: Active; learn: -; I: [min,max]; Q: [min,max]; W: =true  }
            row ACooled    >=1    { mode: Active; learn: -; I: [min,max]; Q: [min,max]; W: =false }

            /*row A6 [10, 10] { mode: Active; learn: -; I: <min; Q: >=min; W: =false }
            row A7 >=1      { mode: Active; learn: -; I: <min; Q: >=min; W: =true  }

            row A8 [5, 5]   { mode: Active; learn: -; I: [min,max]; Q: [min,max]; W: true  }
            row A9 >=1      { mode: Active; learn: -; I: [min,max]; Q: [min,max]; W: false }*/
       }
    }
}
">>$PATH.gtt

done

#minmal
for i in $VALUES; do
echo $i

MAX=$(($i))

    NAME="MinMax_Minimal_${i}"
    PATH="minmax/$NAME"

echo "table t_$NAME {">$PATH.gtt
echo "    var input mode : ENUM
    var input learn : BOOL
    var input I : INT
    var output Q : INT
    var output W : BOOL
    
    gvar min : INT with 0">>$PATH.gtt
echo "    gvar max : INT with $MAX">>$PATH.gtt
echo "
    group {
        row >=1 { mode: Active; learn: -; I: -; Q: 0; W: true }
        group >=1 {
            row >=1 { mode: Learn; learn: false; I: -;  Q: 0; W: false }
            row >=1 { mode: Learn; learn: true;  I: [min,max]; Q: [min,max]; W: false }
        }
    }
}">>$PATH.gtt

done