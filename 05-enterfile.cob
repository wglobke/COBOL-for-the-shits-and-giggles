       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Enter_File.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT data-file ASSIGN TO "records.dat".
      ****************************
       DATA DIVISION.
       FILE SECTION.
       FD  data-file.
       01  data-set.
           05  data-name   PIC X(20).
           05  data-age    PIC 999.
       WORKING-STORAGE SECTION.
       01  n   PIC 99.
      ****************************
       PROCEDURE DIVISION.
           
           DISPLAY "[+] How many records?". ACCEPT n.
           DISPLAY "---".

      *    Read data for data-file.
           OPEN OUTPUT data-file.
           PERFORM TEST AFTER VARYING TALLY FROM 1 BY 1 UNTIL TALLY = n
               DISPLAY "[+] Enter record #" TALLY
               DISPLAY "   Name : " ACCEPT data-name
               DISPLAY "   Age  : " ACCEPT data-age
               WRITE data-set
           END-PERFORM.
           CLOSE data-file.

           DISPLAY "---".
           
      *    Display entries of data-file.
           OPEN INPUT data-file.
           PERFORM TEST AFTER VARYING TALLY FROM 1 BY 1 UNTIL TALLY = n
               READ data-file
                   AT END DISPLAY "[-] Premature end of file"
                          NEXT SENTENCE
               END-READ
               DISPLAY "[+] Record #" TALLY
               DISPLAY "   Name : " data-name
               DISPLAY "   Age  : " data-age
           END-PERFORM.
           CLOSE data-file.

           STOP RUN.
