       IDENTIFICATION DIVISION.
       PROGRAM-ID.     Pretty_Matrix.
      ****************************
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01  left-offset PIC 99 USAGE BINARY VALUE 5.
       01  top-offset  PIC 99 USAGE BINARY VALUE 5.
       01  i           PIC 999 USAGE BINARY VALUE 1.
       01  j           PIC 999 USAGE BINARY VALUE 1.
       01  display-entry   PIC -ZZZ9.99.
       01  dummy       PIC X.

       LINKAGE SECTION.
       01  n-rows      PIC 999 VALUE 3.
       01  n-cols      PIC 999 VALUE 3.
       01  matrix.
           02  matrix-row OCCURS 20 DEPENDING ON n-rows.
               03 matrix-column OCCURS 20 DEPENDING ON n-cols.
                   05  matrix-entry PIC S9999v99 USAGE BINARY.
      ****************************
       PROCEDURE DIVISION USING n-rows, n-cols, matrix.

      *    Check if it makes sense to print on terminal
           IF n-cols > 20 OR n-rows > 20 THEN
               DISPLAY "[-] Matrix dimensions too large to print."
               EXIT PROGRAM
           END-IF.

      *    Print row 0
           DISPLAY "+---"
               AT LINE top-offset
               AT COLUMN left-offset.
           DISPLAY "---+"
               AT LINE top-offset
               AT COLUMN left-offset - 1 + 8*n-cols.
      *    Print matrix, row by row
           PERFORM TEST AFTER VARYING i FROM 1 BY 1 UNTIL i = n-rows
               DISPLAY "|"
                   AT LINE 2*(i - 1) + top-offset + 1
                   AT COLUMN left-offset
               DISPLAY "|"
                   AT LINE 2*(i - 1) + top-offset + 2
                   AT COLUMN left-offset
      *        Print matrix row i, column by column
               PERFORM TEST AFTER VARYING j FROM 1 BY 1 UNTIL j = n-cols
                   MOVE matrix-entry(i,j) TO display-entry
                   DISPLAY display-entry
                       AT LINE 2*(i - 1) + top-offset + 2
                       AT COLUMN left-offset + 1 + 8*(j - 1)
                       WITH SIZE 8
               END-PERFORM
               DISPLAY "|"
                   AT LINE 2*(i - 1) + top-offset + 1
                   AT COLUMN left-offset + 2 + 8*n-cols
               DISPLAY "|"
                   AT LINE 2*(i - 1) + top-offset + 2 
                   AT COLUMN left-offset + 2 + 8*n-cols
           END-PERFORM.

           DISPLAY SPACES UPON CRT.

      *    Print two final rows
           DISPLAY "|"
               AT LINE 2*n-rows + top-offset + 1
               AT COLUMN left-offset.
           DISPLAY "|"
               AT LINE 2*n-rows + top-offset + 1
               AT COLUMN left-offset + 2 + 8*n-cols.
           DISPLAY "+---"
               AT LINE 2*n-rows + top-offset + 2
               AT COLUMN left-offset.
           DISPLAY "---+"
               AT LINE 2*n-rows + top-offset + 2
               AT COLUMN left-offset - 1 + 8*n-cols.

      *    Press Enter to end (sub)program
           ACCEPT dummy
               AT LINE 2*n-rows + top-offset + 4
               AT COLUMN 1.

       END PROGRAM Pretty_Matrix.
           