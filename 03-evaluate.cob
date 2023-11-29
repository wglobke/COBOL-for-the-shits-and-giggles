       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Evaluate.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  weekday PIC 9.
       01  now.
           02  hr  PIC 99.
           02  min PIC 99.
           02  sec PIC 99.
           02  ds  PIC 99.

       01  x   PIC S9999 USAGE BINARY.
       01  y   PIC S9999 USAGE BINARY.
       01  z   PIC S9999 USAGE BINARY.

       01  population-size PIC 9(8).
           88  ghost-town  VALUE 0.
           88  village     VALUE 1 THROUGH 9999.
           88  town        VALUE 10000 THROUGH 99999.
           88  city        VALUE 100000 THROUGH 10000000.
      ****************************
       PROCEDURE DIVISION.

      *    Display weekday and part of the day.
           ACCEPT weekday FROM DAY-OF-WEEK.
           ACCEPT now FROM TIME.

           DISPLAY "---".
           DISPLAY "Now it is..."
           EVALUATE weekday ALSO hr IN now
               WHEN 1 ALSO 0 THROUGH 5     DISPLAY "Monday night"
               WHEN 1 ALSO 6 THROUGH 11    DISPLAY "Monday morning"
               WHEN 1 ALSO 12 THROUGH 13   DISPLAY "Monday noon"   
               WHEN 1 ALSO 14 THROUGH 17   DISPLAY "Monday afternoon"   
               WHEN 1 ALSO 18 THROUGH 21   DISPLAY "Monday evening"   
               WHEN 1 ALSO 22 THROUGH 24   DISPLAY "Monday night"  

               WHEN 2 ALSO 0 THROUGH 5     DISPLAY "Tuesday night"
               WHEN 2 ALSO 6 THROUGH 11    DISPLAY "Tuesday morning"
               WHEN 2 ALSO 12 THROUGH 13   DISPLAY "Tuesday noon"   
               WHEN 2 ALSO 14 THROUGH 17   DISPLAY "Tuesday afternoon"   
               WHEN 2 ALSO 18 THROUGH 21   DISPLAY "Tuesday evening"   
               WHEN 2 ALSO 22 THROUGH 24   DISPLAY "Tuesday night"   

               WHEN 3 ALSO 0 THROUGH 5     DISPLAY "Wednesday night"
               WHEN 3 ALSO 6 THROUGH 11    DISPLAY "Wednesday morning"
               WHEN 3 ALSO 12 THROUGH 13   DISPLAY "Wednesday noon"   
               WHEN 3 ALSO 14 THROUGH 17   DISPLAY "Wednesday afternoon"   
               WHEN 3 ALSO 18 THROUGH 21   DISPLAY "Wednesday evening"   
               WHEN 3 ALSO 22 THROUGH 24   DISPLAY "Wednesday night"   

               WHEN 4 ALSO 0 THROUGH 5     DISPLAY "Thursday night"
               WHEN 4 ALSO 6 THROUGH 11    DISPLAY "Thursday morning"
               WHEN 4 ALSO 12 THROUGH 13   DISPLAY "Thursday noon"   
               WHEN 4 ALSO 14 THROUGH 17   DISPLAY "Thursday afternoon"   
               WHEN 4 ALSO 18 THROUGH 21   DISPLAY "Thursday evening"   
               WHEN 4 ALSO 22 THROUGH 24   DISPLAY "Thursday night"  

               WHEN 5 ALSO 0 THROUGH 5     DISPLAY "Friday night"
               WHEN 5 ALSO 6 THROUGH 11    DISPLAY "Friday morning"
               WHEN 5 ALSO 12 THROUGH 13   DISPLAY "Friday noon"   
               WHEN 5 ALSO 14 THROUGH 17   DISPLAY "Friday afternoon"   
               WHEN 5 ALSO 18 THROUGH 21   DISPLAY "Friday evening"   
               WHEN 5 ALSO 22 THROUGH 24   DISPLAY "Friday night"   

               WHEN 6 ALSO 0 THROUGH 5     DISPLAY "Saturday night"
               WHEN 6 ALSO 6 THROUGH 11    DISPLAY "Saturday morning"
               WHEN 6 ALSO 12 THROUGH 13   DISPLAY "Saturday noon"
               WHEN 6 ALSO 14 THROUGH 17   DISPLAY "Saturday afternoon"
               WHEN 6 ALSO 18 THROUGH 21   DISPLAY "Saturday evening"   
               WHEN 6 ALSO 22 THROUGH 24   DISPLAY "Saturday night" 

               WHEN 7 ALSO 0 THROUGH 5     DISPLAY "Sunday night"
               WHEN 7 ALSO 6 THROUGH 11    DISPLAY "Sunday morning"
               WHEN 7 ALSO 12 THROUGH 13   DISPLAY "Sunday noon"
               WHEN 7 ALSO 14 THROUGH 17   DISPLAY "Sunday afternoon"
               WHEN 7 ALSO 18 THROUGH 21   DISPLAY "Sunday evening"
               WHEN 7 ALSO 22 THROUGH 24   DISPLAY "Sunday night"

               WHEN OTHER DISPLAY "Something went horribly wrong!"
           END-EVALUATE.
  
      *    Arbitrary comparisons between numbers
           DISPLAY "---".
           DISPLAY "Enter three numbers... ".
           DISPLAY " x = ". ACCEPT x.
           DISPLAY " y = ". ACCEPT y.
           DISPLAY " z = ". ACCEPT z.
           
           EVALUATE x**2 - y < y ALSO x
               WHEN TRUE ALSO ANY DISPLAY " x^2 - y is < y"
               WHEN FALSE ALSO < z DISPLAY " x is > y and < z"
               WHEN OTHER DISPLAY " whatevs"
           END-EVALUATE.

      *    What place do you live in?
           DISPLAY "---".
           DISPLAY "Enter the population number: ".
           ACCEPT population-size.

           EVALUATE TRUE
               WHEN ghost-town DISPLAY "You live in a ghost town."
               WHEN village    DISPLAY "You live in a village."
               WHEN town       DISPLAY "You live in a town."
               WHEN city       DISPLAY "You live in a city."
               WHEN OTHER DISPLAY "Cannot make sense of your number."
           END-EVALUATE.
           
           STOP RUN.
           