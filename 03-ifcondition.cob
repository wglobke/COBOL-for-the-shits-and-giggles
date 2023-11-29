       IDENTIFICATION DIVISION.

       PROGRAM-ID.     If_Conditions.
      ****************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS ALPHA-AND-PUNCTUATION IS
               "a" THROUGH "z", "A" THROUGH "Z", ".", ",",
               ":", ";", " ", "?", "!".
      ****************************
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01  dummy   PIC 9.
       01  n       PIC S9999 USAGE BINARY.
       01  rem     PIC 9999 USAGE BINARY.                                       
       01  x       PIC S9999v99 USAGE COMP-3.
       01  y       PIC S9999v99 USAGE COMP-3.
       01  r       PIC 9999v99 USAGE COMP-3.
       01  seed    PIC 9(8).
       01  txt     PIC X(10).
       01  num     PIC 9(10) USAGE BINARY.
      ****************************
       PROCEDURE DIVISION.

      *    Check if a given number is positive and even.
           DISPLAY "---".                                         
           DISPLAY "Enter a positive even number,  n = ". ACCEPT n.

           IF n < 0 THEN
               DISPLAY "No Silly, " n " is NOT positive!"
               STOP RUN
           END-IF.

           DIVIDE n BY 2 GIVING dummy REMAINDER rem.                          
           IF rem = 0 THEN
               DISPLAY "Good job, " n " is indeed even!"
           ELSE
               DISPLAY "Sorry, but EVEN means divisible by 2."
               STOP RUN
           END-IF.

      *    Check if a point (x,y) lies within the circle of radius r.
           DISPLAY "---".
           ACCEPT seed from TIME.
           COMPUTE r = 100 * FUNCTION RANDOM(seed).
           DISPLAY "Random circle a radius r =". 
           DISPLAY r.                   

           DISPLAY "Enter a point (x,y) in the circle of radius " r.
           DISPLAY " x = ". ACCEPT x.
           DISPLAY " y = ". ACCEPT y.
           
           IF FUNCTION SQRT(x**2 + y**2) <= r THEN
               DISPLAY "Yes, (" x "," y ") lies within radius " r "."
           ELSE
               DISPLAY "Sorry, (" x "," y ") lies outside radius " r "."
               STOP RUN
           END-IF.

      *    Check if a point (x,y) lies in the triangle with
      *    vertices (-1,0), (0,1), (1,0).           
           IF (x>=0 AND y >= 0 AND y <= 1 - x)
               OR (x<0 AND y >= 0 AND y <= 1+x) THEN
               DISPLAY "---"
               DISPLAY "Moreover, (" x "," y ") lies in the triangle "
                   "with vertices (-1,0), (0,1), (1,0)."
           END-IF.

      *    Compare strings and numbers... ew!
           DISPLAY "---".
           DISPLAY "Enter a short text: ". ACCEPT txt.
           DISPLAY "Enter a number: ". ACCEPT num.

           IF FUNCTION TRIM(txt, TRAILING) IS NUMERIC THEN
               DISPLAY txt " is a number alright..."
               IF txt < num THEN
                   DISPLAY "and it is smaller than " num
               ELSE
                   DISPLAY "and it is at greater or equal " num
                       "or is it...? "
                       "Do not compare different types!"
               END-IF
           ELSE
               DISPLAY "Noooo! '"
                   FUNCTION TRIM(txt, TRAILING)
                   "' does not represent a number!"
               IF txt IS ALPHA-AND-PUNCTUATION THEN
                   DISPLAY "Well, at least it is ALPHA-AND-PUNCTUATION."      
                END-IF
           END-IF.

           STOP RUN.
           