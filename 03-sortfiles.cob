       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Sort_Files.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT buffer-file ASSIGN TO "buffer.dat".
           SELECT unsorted-file ASSIGN TO "unsorted.dat".
           SELECT sorted-file ASSIGN TO "sorted.dat".
      ****************************
       DATA DIVISION.
       FILE SECTION.
       SD  buffer-file.
       01  buffer-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       FD  unsorted-file.
       01  unsorted-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       FD  sorted-file.
       01  sorted-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
      ****************************
       PROCEDURE DIVISION.

      *    Read data to sort from an existing file.
           SORT buffer-file
               ON DESCENDING KEY age IN buffer-set
               ON ASCENDING KEY last-name IN buffer-set
               USING unsorted-file
               GIVING sorted-file.
           DISPLAY "[+] Sorting done.".

           STOP RUN.
