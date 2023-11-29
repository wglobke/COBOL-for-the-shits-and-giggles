       IDENTIFICATION DIVISION.
       PROGRAM-ID.     Fibo_Rec RECURSIVE.
      ****************************
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01  n1  PIC 9(2) USAGE BINARY.
       01  n2  PIC 9(2) USAGE BINARY.
       01  fn1 PIC 9(10) USAGE BINARY.
       01  fn2 PIC 9(10) USAGE BINARY.
       LINKAGE SECTION.
       01  n   PIC 9(2) USAGE BINARY.
       01  fn  PIC 9(10) USAGE BINARY.
      ****************************
       PROCEDURE DIVISION USING n fn.

           IF n = 1 OR n = 2 THEN
               MOVE 1 TO fn
               GOBACK
           END-IF.

           COMPUTE n1 = n - 1.
           COMPUTE n2 = n - 2.
           CALL "Fibo_Rec" USING BY CONTENT n1 BY REFERENCE fn1.
           CALL "Fibo_Rec" USING BY CONTENT n2 BY REFERENCE fn2.

           COMPUTE fn = fn1 + fn2.

       END PROGRAM "Fibo_Rec".
