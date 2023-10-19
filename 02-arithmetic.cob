       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Arithmetic.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  int1    PIC 9(18) USAGE BINARY.                              
       01  int2    PIC 9(18) USAGE BINARY.
       01  p-int   PIC 9(20) USAGE DISPLAY.
       01  r       PIC 9(20) USAGE DISPLAY.                                                 

       01  fix1    PIC S9(20)v9(8) USAGE COMP-3.
       01  fix2    PIC S9(20)v9(8) USAGE COMP-3.
       01  p-fix   PIC -Z(19)9.9(8) USAGE DISPLAY.

       01  float1  USAGE COMP-2.
       01  float2  USAGE COMP-2.
       01  p-float USAGE COMP-2.

       01  w   PIC 9(10) USAGE COMP-3.
       01  x   PIC 9(10) USAGE COMP-3.
       01  y   PIC 9(10) USAGE COMP-3.
       01  z   PIC Z(10)9.99 USAGE DISPLAY.
      ****************************
       PROCEDURE DIVISION.                               

           MOVE 324232.54667 TO fix1.
           MOVE -948694.54395 TO fix2.                                
           ADD fix1 TO fix2 GIVING p-fix.                               
           DISPLAY "[+] fix1 + fix2 = " p-fix.
           MULTIPLY fix1 BY fix2 GIVING p-fix
               ON SIZE ERROR DISPLAY "    OH NO - OVERFLOW!".
           DISPLAY "[*] fix1 * fix2 = " p-fix.

           MOVE 25 TO int1.
           MOVE 4 TO int2.
           DIVIDE int1 BY int2 GIVING p-int REMAINDER r.
           DISPLAY "[/] int1 / int2 = " p-int.
           DISPLAY "[%] int1 mod int2 = " r.

           MOVE 324232.54667 TO float1.
           MOVE -948694.54395 TO float2.
           COMPUTE p-float = float1 + float2.
           DISPLAY "[+] float1 + float2 = " p-float. 
           MULTIPLY float1 BY float2 GIVING p-float.
           DISPLAY "[*] float1 * float2 = " p-float.   

           MOVE 3 TO x.
           MOVE 192 TO y.
           MOVE 23 TO w.
           COMPUTE z = (y - x)**2 / w.              
           DISPLAY "[A] (y - x)**2 / w = " z.

           STOP RUN.
