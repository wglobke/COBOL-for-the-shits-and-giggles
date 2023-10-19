       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Records.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   August, 2023.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  record-name.
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
           MOVE 1234 TO x1 IN sub-record-1 IN record-name.
           MOVE -1234 TO x1 IN sub-record-2 IN record-name.
           
           DISPLAY y IN record-name.
           DISPLAY x1 IN sub-record-1 IN record-name.
           DISPLAY x2 IN sub-record-1 IN record-name.
           DISPLAY x1 IN sub-record-2 IN record-name.
           DISPLAY x2 IN sub-record-2 IN record-name.
           DISPLAY x3.

           STOP RUN.                                             
