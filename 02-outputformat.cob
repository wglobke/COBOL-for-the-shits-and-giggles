       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Output_Format.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   October, 2023.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  integer-1   PIC +++++9 VALUE "1234".                           
       01  signed-1    PIC -----9 VALUE "-4321" SIGN LEADING.                          
       01  integer-2   PIC 999999 BINARY VALUE 1234.
       01  signed-2    PIC S9(6) BINARY VALUE -4321.            

       01  fraction    PIC 9999v99 COMP-3 VALUE 23.98.                                     
       01  s-fraction  PIC S9999v99 COMP-3 VALUE -98.32.
       01  frac-2      PIC +++9.99 VALUE "23.98".                                  
       01  s-frac-2    PIC +++9.99.

       01  float-1     USAGE COMP-1 VALUE 1234.56.
       01  float-2     USAGE COMP-2 VALUE 9876.54.       

      ****************************
       PROCEDURE DIVISION.

           DISPLAY "integers - USAGE IS DISPLAY: "
           DISPLAY " integer-1 = " integer-1.
           DISPLAY " signed-1 = " signed-1.

           DISPLAY "integers - USAGE IS BINARY: "
           DISPLAY " integer-2 = " integer-2.
           DISPLAY " signed-2 = " signed-2.

           DISPLAY "fractions - USAGE IS COMP-3 (PACKED-DECIMAL): "
           DISPLAY " fraction = " fraction.                            
           DISPLAY " s-fraction = " s-fraction.

           DISPLAY "fractions - USAGE IS DISPLAY: "
           DISPLAY " frac-2 = " frac-2.          
           MOVE 23.98 TO s-frac-2.                     
           DISPLAY " s-frac-2 = " s-frac-2.

           DISPLAY "floating-point: "
           DISPLAY " float-1 = " float-1.
           DISPLAY " float-2 = " float-2.

           STOP RUN.                                             
