       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Loops.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  n   PIC 9999 USAGE BINARY.
       01  fac PIC 9(9) USAGE BINARY.
       01  x   PIC 9(9) USAGE BINARY.
       01  i   PIC 9999 USAGE BINARY.
       01  j   PIC 9999 USAGE BINARY.
      ****************************
       PROCEDURE DIVISION.
           
      *    Compute n! (factorial of n)
           DISPLAY "---".
           DISPLAY "Enter non-negative integer n = ". ACCEPT n.
           DISPLAY n "! = "

           MOVE 1 TO fac.
           PERFORM n TIMES
               COMPUTE fac = fac * n
               COMPUTE n = n - 1
           END-PERFORM.

           DISPLAY fac.

      *    Alternative: Compute n! (factorial of n)
           DISPLAY "---".
           DISPLAY "Enter non-negative integer n = ". ACCEPT n.
           DISPLAY n "! = "

           MOVE 1 TO fac.
           PERFORM TEST AFTER VARYING i FROM 1 BY 1 UNTIL i = n
               COMPUTE fac = fac * i
           END-PERFORM.

           DISPLAY fac.

      *    Compute Collatz sequence until we run into cycle 4, 2, 1.
           DISPLAY "---".
           DISPLAY "Enter positive integer x = ". ACCEPT x.
           DISPLAY "Collatz sequence for x = " x.
           
           IF x = 0 THEN
               DISPLAY "... x should be > 0."
               STOP RUN
           END-IF.

           PERFORM VARYING j FROM 0 BY 1 UNTIL x = 1
               DISPLAY "x(" j ") = " x
               IF FUNCTION MOD(x,2) = 0 THEN
                   COMPUTE x = x/2
               ELSE
                   COMPUTE x = 3*x + 1
               END-IF
           END-PERFORM.
           
           DISPLAY "x(" j ") = " x " -> cycle 4, 2, 1 reached in "
               j " steps".

           STOP RUN.
           