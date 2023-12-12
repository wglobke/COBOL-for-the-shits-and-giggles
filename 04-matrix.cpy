       01  n-rows      PIC 999 VALUE 3.
       01  n-cols      PIC 999 VALUE 3.
       01  matrix.
           02  matrix-row OCCURS 20 DEPENDING ON n-rows.
               03 matrix-column OCCURS 20 DEPENDING ON n-cols.
                   05  matrix-entry PIC S9999v99 USAGE BINARY.
