       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Pretty_Print.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  personnel-record.
           05  first-name  PIC X(20) VALUE "Homer".
           05  last-name   PIC X(20) VALUE "Simpson".
           05  street      PIC X(20) VALUE "742 Evergreen Tce".
           05  city        PIC X(20) VALUE "Springfield".
           05  department  PIC X(20) VALUE "Safety".
           05  salary      PIC 9(7)v9(2) VALUE 362.19.

       01  pretty-personnel-record.
           05  FILLER      PIC X VALUE x'0A'.                               
           05  FILLER      PIC X(20) VALUE "# Full name  :".                    
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  FILLER      PIC X VALUE x'0A'.           
           05  FILLER      PIC X(20) VALUE "# Address    :".                    
           05  street      PIC X(20).
           05  FILLER      PIC XX VALUE ", ".                               
           05  city        PIC X(20).
           05  FILLER      PIC X VALUE x'0A'.              
           05  FILLER      PIC X(20) VALUE "# Department :".                                     
           05  department  PIC X(20).
           05  FILLER      PIC X VALUE x'0A'.                               
           05  FILLER      PIC X(20) VALUE "# Salary     :".                                     
           05  salary      PIC Z(6)9.9(2) USAGE DISPLAY.

       01  matrix.
           02  matrix-row OCCURS 3.
               03 matrix-column OCCURS 2.
                   05  matrix-entry PIC S9999v99 VALUE 0.

       01  pretty-matrix.
           02  FILLER  PIC X VALUE x'0A'.
           02  FILLER  PIC X(21) VALUE "+-                 -+".
           02  FILLER  PIC X VALUE x'0A'.
           02  p-matrix-row OCCURS 3.
               03  FILLER  PIC X VALUE "|".
               03  FILLER  VALUE SPACE.
               03  p-matrix-column OCCURS 2.
                       05  p-matrix-entry PIC -ZZZ9.99 USAGE DISPLAY.
                       05  FILLER VALUE SPACE.
               03  FILLER  PIC X VALUE "|".
               03  FILLER  PIC X VALUE x'0A'.
           02  FILLER  PIC X(21) VALUE "+-                 -+".
      ****************************
       PROCEDURE DIVISION.

           MOVE CORRESPONDING personnel-record
               TO pretty-personnel-record.

           DISPLAY "[+] Shitty print: ".
           DISPLAY "    Personnel record: " personnel-record.
           DISPLAY "[+] Pretty print: ".
           DISPLAY "    Personnel record: " pretty-personnel-record.

           MOVE 1.1 TO matrix-entry(1,1).
           MOVE 1.2 TO matrix-entry(1,2).
           MOVE 2.1 TO matrix-entry(2,1).
           MOVE 2.2 TO matrix-entry(2,2).
           MOVE 3.1 TO matrix-entry(3,1).
           MOVE 3.2 TO matrix-entry(3,2).
           
           MOVE matrix-entry(1,1) TO p-matrix-entry(1,1).
           MOVE matrix-entry(1,2) TO p-matrix-entry(1,2).
           MOVE matrix-entry(2,1) TO p-matrix-entry(2,1).
           MOVE matrix-entry(2,2) TO p-matrix-entry(2,2).
           MOVE matrix-entry(3,1) TO p-matrix-entry(3,1).
           MOVE matrix-entry(3,2) TO p-matrix-entry(3,2).

           DISPLAY " --- "

           DISPLAY "[++] Shitty print: ".
           DISPLAY "    Matrix: " matrix.

           DISPLAY "[++] Pretty print: ".
           DISPLAY "    Matrix: " pretty-matrix.

           STOP RUN.
