       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Sequential_File.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT data-file ASSIGN TO "records.dat"
               ORGANIZATION IS SEQUENTIAL.
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
           DISPLAY "[+] Display how many entries?".
           ACCEPT n.
           
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

           DISPLAY "---".

      *    Replace first record in data-file.
           OPEN I-O data-file.
           READ data-file.
           DISPLAY "[+] Replace first record:".
           DISPLAY "   New name : ".
           ACCEPT data-name.
           DISPLAY "   New age  : ".
           ACCEPT data-age.
           REWRITE data-set.
           CLOSE data-file.

           STOP RUN.
