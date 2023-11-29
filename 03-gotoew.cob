       IDENTIFICATION DIVISION.

       PROGRAM-ID.     GOTO_Ew.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  x   PIC 9.
      ****************************
       PROCEDURE DIVISION.

       where-it-all-began.
           DISPLAY "Enter a number: ". ACCEPT x.
           
           GO TO label1 label2 label3 label4 DEPENDING ON x.
           DISPLAY "[-] Wrong!".
           GO TO where-it-all-began.

       label1.
           DISPLAY "I".

       label2.
           DISPLAY "II".

       label3.
           DISPLAY "III".

       label4.
           DISPLAY "IV".

           STOP RUN.
