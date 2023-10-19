       IDENTIFICATION DIVISION.

       PROGRAM-ID.     File_Record.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   August, 2023.
      ****************************
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT file-descriptor ASSIGN TO "/tmp/testfile.txt"
      ****************************
       DATA DIVISION.

       FILE SECTION.
       FD  file-descriptor.
       01  record-in-file.
           05  y   PIC X(10) VALUE "data".
           05  sub-record-1.
               10  x1  PIC XXXX.
               10  x2  PIC 9999.
           05  sub-record-2.
               10  x1  PIC S9999.
               10  x2  PIC AAAA VALUE "HiHo".
               10  x3  PIC X VALUE x'9F'.

      ****************************
       PROCEDURE DIVISION.

           MOVE "9876" TO x1 IN sub-record-1 IN record-name.
           MOVE 9876 TO x1 IN sub-record-1 IN record-name.
           MOVE -1234 TO x1 IN sub-record-2 IN record-name.
           
           DISPLAY y.
           DISPLAY x1 IN sub-record-1 IN record-name.
           DISPLAY x2 IN sub-record-1 IN record-name.
           DISPLAY x1 IN sub-record-2 IN record-name.
           DISPLAY x2 IN sub-record-2 IN record-name.
           DISPLAY x3.

           STOP RUN.                                             
