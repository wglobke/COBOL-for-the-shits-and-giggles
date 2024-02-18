       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Relative_File.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT data-file ASSIGN TO "rel-records.dat"
               ORGANIZATION IS RELATIVE
               ACCESS MODE IS RANDOM
               RELATIVE KEY IS rel-key.
      ****************************
       DATA DIVISION.
       FILE SECTION.
       FD  data-file.
       01  data-set.
           05  data-name   PIC X(20).
           05  data-age    PIC 999.
       WORKING-STORAGE SECTION.
       01  rel-key PIC 99.
       01  n       PIC 99.
      ****************************
       PROCEDURE DIVISION.
           
           DISPLAY "[+] Enter how many records?". ACCEPT n.
           DISPLAY "---".
           IF n = 0 THEN GO TO Read-Record.

       Write-Records.
      *    Write data to data-file.
           OPEN OUTPUT data-file.
           PERFORM TEST AFTER VARYING TALLY FROM 1 BY 1 UNTIL TALLY = n
               DISPLAY "[+] Enter record #" TALLY
               DISPLAY "   Name : " ACCEPT data-name
               DISPLAY "   Age  : " ACCEPT data-age
               MOVE TALLY TO rel-key
               WRITE data-set
           END-PERFORM.
           CLOSE data-file.

           DISPLAY "---".
       
       Read-Record.
      *    Display entry of data-file.
           OPEN INPUT data-file.
           DISPLAY "[+] Read which record?".
           ACCEPT rel-key.
           READ data-file
               INVALID KEY
                   DISPLAY "[-] Invalid key."
                   CLOSE data-file
                   STOP RUN
           END-READ.
           DISPLAY "[+] Retrieving record #" rel-key.
           DISPLAY "   Name : " data-name
           DISPLAY "   Age  : " data-age
           CLOSE data-file.

       Delete-Record.
      *    Pick a record to delete.
           OPEN I-O data-file.
           DISPLAY "[+] Delete which record?".
           ACCEPT rel-key.
           READ data-file
               INVALID KEY
                   DISPLAY "[-] Invalid key."
                   CLOSE data-file
                   STOP RUN
           END-READ.
           DELETE data-file.
           CLOSE data-file.
           
           STOP RUN.
