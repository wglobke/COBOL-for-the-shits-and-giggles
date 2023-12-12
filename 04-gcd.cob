       IDENTIFICATION DIVISION.
       PROGRAM-ID.     gcd.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  x   PIC 9(9) USAGE BINARY.
       01  y   PIC 9(9) USAGE BINARY.
       01  g   PIC 9(9) USAGE BINARY.
      ****************************
       PROCEDURE DIVISION.

           DISPLAY "[COBOL] Enter x = ". ACCEPT x.
           DISPLAY "[COBOL] Enter y = ". ACCEPT y.

      *    Set the library search path via
      *        export LD_LIBRARY_PATH=/path/to/library/
      *    to the directory with the dylib containing "C_function".
           CALL "C_function" USING BY VALUE x BY VALUE y RETURNING g.

           DISPLAY "[COBOL] gcd(" x "," y ") = " g.

           CALL "C_print".

           STOP RUN.
       