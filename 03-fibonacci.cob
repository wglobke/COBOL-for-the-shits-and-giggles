       IDENTIFICATION DIVISION.
       PROGRAM-ID.     Fibonacci.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  n   PIC 9(2) USAGE BINARY.
       01  fn  PIC 9(10) USAGE BINARY.
      ****************************
       PROCEDURE DIVISION.
           DISPLAY "[+] Enter a positive integer: ". ACCEPT n.

           CALL "Fibo_Rec" USING BY CONTENT n BY REFERENCE fn.

           DISPLAY "[+] f(" n ") = " fn.

           STOP RUN.
