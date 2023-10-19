       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Variable_Tables.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  matrix.
           02  n-rows  PIC 99 VALUE 1.
           02  n-cols  PIC 99 VALUE 1.                                              
           02  matrix-row OCCURS 99 DEPENDING ON n-rows.
               03 matrix-column OCCURS 99 DEPENDING ON n-cols.
                   05  matrix-entry PIC 9999v99 VALUE 0.
           02  trailing-garbage PIC XXXX VALUE "WXYZ".

       01  after-matrix PIC XXXX VALUE "ABCD".
      ****************************
       PROCEDURE DIVISION.

           DISPLAY "Building a " n-rows "x" n-cols "-matrix."
           DISPLAY matrix.

           DISPLAY "[1.] Number of columns? "
           ACCEPT n-rows.
           DISPLAY "[1.] Number of rows? "
           ACCEPT n-cols.
           DISPLAY "Rebuilding a " n-rows "x" n-cols "-matrix."

           MOVE 1111.11 TO matrix-entry(1,1).
           MOVE 9999.99 TO matrix-entry(n-rows, n-cols).
           MOVE "XXXX" TO trailing-garbage.
           DISPLAY "   Matrix: " matrix.
           DISPLAY "   Trailing garbage: " trailing-garbage.
           DISPLAY "   After matrix: " after-matrix.

           DISPLAY "[2.] Number of columns? "
           ACCEPT n-rows.
           DISPLAY "[2.] Number of rows? "
           ACCEPT n-cols.
           DISPLAY "Rebuilding a " n-rows "x" n-cols "-matrix."

           DISPLAY "   Matrix: " matrix.
           DISPLAY "   Trailing garbage: " trailing-garbage.
           DISPLAY "   After matrix: " after-matrix.

           DISPLAY "[3.] Number of columns? "
           ACCEPT n-rows.
           DISPLAY "[3.] Number of rows? "
           ACCEPT n-cols.
           DISPLAY "Rebuilding a " n-rows "x" n-cols "-matrix."

           DISPLAY "   Matrix: " matrix.
           DISPLAY "   Trailing garbage: " trailing-garbage.
           DISPLAY "   After matrix: " after-matrix.

           STOP RUN.
