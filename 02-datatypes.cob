       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Data_Types.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   October, 2023.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  text-1      PIC AAAA VALUE "ABCD".
       01  text-2      PIC A(10) VALUE "HelloWorld".

       01  alphanum-1  PIC X(10) VALUE "123134".                         
       01  alphanum-2  PIC X(4) VALUE "XY98".     

       01  integer-1   PIC 9999 VALUE 1234.
       01  integer-2   PIC 9(4) USAGE BINARY VALUE 4321.
       01  integer-3   PIC 9(4) USAGE COMP-3 VALUE 5678.
       01  signed-1    PIC S9(6) VALUE -4321.            

       01  fraction    PIC 9999v99 VALUE 2345.98.                                     
       01  s-fraction  PIC S9999v99 VALUE -9876.32.

       01  float-1     USAGE COMP-1 VALUE 1234.56.
       01  float-2     USAGE COMP-2 VALUE 9876.54.       

       01  array.
           02  byte-field PIC X OCCURS 6.

      ****************************
       PROCEDURE DIVISION.

           DISPLAY "text-1 = " text-1.
           DISPLAY "text-2 = " text-2.
           DISPLAY "alphanum-1 = " alphanum-1.
           DISPLAY "alphanum-2 = " alphanum-2.
           DISPLAY "integer-1 = " integer-1.
           DISPLAY "integer-2 = " integer-2.
           DISPLAY "signed-1 = " signed-1.
           DISPLAY "fraction = " fraction.                            
           DISPLAY "s-fraction = " s-fraction.

           MOVE x'DE' TO byte-field(1).
           MOVE x'AD' TO byte-field(2).
           MOVE x'BE' TO byte-field(3).
           MOVE x'EF' TO byte-field(4).
           MOVE x'0A' TO byte-field(5).
           MOVE x'65' TO byte-field(6).

           DISPLAY "byte-field = " array.

           STOP RUN.
           