       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Exceptions.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT test-file ASSIGN TO "does-not-exist.dat"
               FILE STATUS IS test-status.
      ****************************
       DATA DIVISION.
       FILE SECTION.
       FD  test-file.
       01  home-address.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  zip         PIC 99999.
           05  street      PIC X(30).
           05  city        PIC X(30).
       WORKING-STORAGE SECTION.
       01  test-status.
           02  test-status-1   PIC X.
           02  test-status-2   PIC X.
      ****************************
       PROCEDURE DIVISION.
       DECLARATIVES.
       test-error SECTION.
           USE AFTER ERROR PROCEDURE ON test-file.
           DISPLAY "[E] Caught exception."
           DISPLAY "    Exception code "
                   test-status-1 "(" test-status-2 ")".
           EVALUATE test-status-1
               WHEN 0 DISPLAY "    regular execution"
               WHEN 1 DISPLAY "    end of file"
               WHEN 2 DISPLAY "    invalid key"
               WHEN 3 DISPLAY "    permanent file error"
               WHEN 4 DISPLAY "    error in logical I-O order"
               WHEN 9 DISPLAY "    other error"
               WHEN OTHER DISPLAY "    unknown error code"
           END-EVALUATE.
       END DECLARATIVES.

           OPEN INPUT test-file.

           DISPLAY "[+] File status          : " test-status.
           DISPLAY "[+] File status class    : " test-status-1.
           DISPLAY "[+] File status subclass : " test-status-2.

           CLOSE test-file.
           STOP RUN.
