       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Tables.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  idx-1 USAGE IS INDEX.
       01  sub PIC 9 USAGE BINARY.

       01  simple-array VALUE "abcdefghij".
           02 array-entry PIC X OCCURS 10 INDEXED BY idx.                          

       01  personnel-table.
           02  personnel-record OCCURS 30.
               05  first-name  PIC X(20).
               05  last-name   PIC X(20).
               05  department  PIC X(20).

       01  matrix.
           02  matrix-row OCCURS 3.
               03 matrix-column OCCURS 2.
                   05  matrix-entry PIC 9999v99.
       01  long-vector REDEFINES matrix.
           02  vector-entry PIC 9999v99 OCCURS 6.
      ****************************
       PROCEDURE DIVISION.

           DISPLAY array-entry(1).
           DISPLAY array-entry(5).
           DISPLAY array-entry(10).

           MOVE 1.1 TO matrix-entry(1,1).
           MOVE 2.1 TO matrix-entry(2,1).
           MOVE 3.1 TO matrix-entry(3,1).
           MOVE 1.2 TO matrix-entry(1,2).
           MOVE 2.2 TO matrix-entry(2,2).
           MOVE 3.2 TO matrix-entry(3,2).
           DISPLAY matrix-row(1).
           DISPLAY matrix-row(2).
           DISPLAY matrix-row(3).
           DISPLAY matrix-column(1,2).                                  
           DISPLAY matrix-entry(1,2). 
           DISPLAY matrix.       

           DISPLAY long-vector.
           DISPLAY vector-entry(6).                          

           SET idx TO 1.
           DISPLAY array-entry(idx).
           SET idx-1 TO idx.
           SET idx-1 UP BY 2.
           DISPLAY array-entry(idx-1).
           DISPLAY idx.

           MOVE 5 TO sub.
           DISPLAY array-entry(sub).                                

           STOP RUN.
