       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Conditions.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  population-size PIC 9(8).
           88  ghost-town  VALUE 0.                                           
           88  village     VALUE 1 THROUGH 9999.
           88  town        VALUE 10000 THROUGH 99999.
           88  city        VALUE 100000 THROUGH 10000000.
      ****************************
       PROCEDURE DIVISION.

           SET city TO TRUE.
           DISPLAY "Population size: " population-size.

           IF ghost-town   THEN DISPLAY "Population 0"
           ELSE IF village THEN DISPLAY "Population 1+"
           ELSE IF town    THEN DISPLAY "Population 1000+"
           ELSE IF city    THEN DISPLAY "Population 100000+"
           END-IF.

           STOP RUN.
