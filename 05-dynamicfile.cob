       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Dynamic_File.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      *    Cheat mode: Dynamic filenames are not allowed
      *    by proper IBM COBOL, but by GnuCOBOL with -std=ibm.
       FILE-CONTROL.
           SELECT data-file ASSIGN TO DYNAMIC var-filename.
      ****************************
       DATA DIVISION.
       FILE SECTION.
       FD  data-file.
       01  data-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       WORKING-STORAGE SECTION.
       01  n           PIC 99.
       01  var-filename  PIC X(255).
      ****************************
       PROCEDURE DIVISION.
      *    Read filename.
           DISPLAY "[+] Enter file name: ". ACCEPT var-filename.
      *    Write data to file.
           OPEN OUTPUT data-file.
           DISPLAY "[+] Enter data: ".
           DISPLAY "   First name: ". ACCEPT first-name.
           DISPLAY "   Last name : ". ACCEPT last-name.
           DISPLAY "   Age       : ". ACCEPT age.
           WRITE data-set.
           CLOSE data-file.           
       
           STOP RUN.
