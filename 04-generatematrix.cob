       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Generate_Matrix.
      * requires subprogram 03-prettymatrix.cob
      * compile with
      *    cobc -x -std=ibm 03-generatematrix.cob 03-prettymatrix.cob -o 03-generatematrix
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY "matrix.cpy".

       01  i           PIC 999 USAGE BINARY VALUE 1.
       01  j           PIC 999 USAGE BINARY VALUE 1.
       01  seed        PIC 9(8).
       01  dummy       PIC X.
      ****************************
       PROCEDURE DIVISION.

           DISPLAY "[+] Enter matrix dimensions"
           DISPLAY "   Number of rows    = ". ACCEPT n-rows.
           DISPLAY "   Number of columns = ". ACCEPT n-cols.

      *    Generate random matrix entries.
           PERFORM TEST AFTER VARYING i FROM 1 BY 1 UNTIL i = n-rows
               PERFORM TEST AFTER VARYING j FROM 1 BY 1 UNTIL j = n-cols
                   ACCEPT seed FROM TIME
                   COMPUTE matrix-entry(i,j)
                       = 1000 * FUNCTION RANDOM(seed * i * j)
               END-PERFORM
           END-PERFORM.
      
      *    Raw-display the matrix to remind us how ugly its.
           DISPLAY "[+] Here is our matrix in raw COBOL display: "
           DISPLAY matrix.
           ACCEPT dummy.

      *    Call external subprogram to pretty-print the matrix.
           CALL "Pretty_Matrix" USING
               BY REFERENCE n-rows,
               BY REFERENCE n-cols,
               BY REFERENCE matrix.

           DISPLAY "[+] Now, wasn't that a pretty matrix? Goodbye!".

           STOP RUN.
