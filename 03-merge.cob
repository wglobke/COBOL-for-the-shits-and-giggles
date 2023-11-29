       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Merge.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT buffer-file      ASSIGN TO "buffer.dat".
           SELECT sorted-file-1    ASSIGN TO "sorted1.dat".
           SELECT sorted-file-2    ASSIGN TO "sorted2.dat".
           SELECT big-sorted-file  ASSIGN TO "bigsorted.dat".
      ****************************
       DATA DIVISION.

       FILE SECTION.
       SD  buffer-file.
       01  buffer-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       FD  sorted-file-1.
       01  sorted-set-1.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       FD  sorted-file-2.
       01  sorted-set-2.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       FD  big-sorted-file.
       01  big-sorted-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.

       WORKING-STORAGE SECTION.
       01  unsorted-table-1 OCCURS 5.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       01  unsorted-table-2 OCCURS 5.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.

       01  sort-idx        PIC 9.
      ****************************
       PROCEDURE DIVISION.

      *    Initialize unsorted data 1.
           MOVE "Homer"    TO first-name IN unsorted-table-1(1).
           MOVE "Simpson"  TO last-name IN unsorted-table-1(1).
           MOVE 36         TO age IN unsorted-table-1(1).
           MOVE "Marge"    TO first-name IN unsorted-table-1(2).
           MOVE "Simpson"  TO last-name IN unsorted-table-1(2).
           MOVE 34         TO age IN unsorted-table-1(2).
           MOVE "Bart"     TO first-name IN unsorted-table-1(3).
           MOVE "Simpson"  TO last-name IN unsorted-table-1(3).
           MOVE 10         TO age IN unsorted-table-1(3).
           MOVE "Lisa"     TO first-name IN unsorted-table-1(4).
           MOVE "Simpson"  TO last-name IN unsorted-table-1(4).
           MOVE 8          TO age IN unsorted-table-1(4).
           MOVE "Maggie"   TO first-name IN unsorted-table-1(5).
           MOVE "Simpson"  TO last-name IN unsorted-table-1(5).
           MOVE 1          TO age IN unsorted-table-1(5).
      *    Initialize unsorted data 2.
           MOVE "Ned"      TO first-name IN unsorted-table-2(1).
           MOVE "Flanders" TO last-name IN unsorted-table-2(1).
           MOVE 36         TO age IN unsorted-table-2(1).
           MOVE "Maude"    TO first-name IN unsorted-table-2(2).
           MOVE "Flanders" TO last-name IN unsorted-table-2(2).
           MOVE 34         TO age IN unsorted-table-2(2).
           MOVE "Barney"   TO first-name IN unsorted-table-2(3).
           MOVE "Gumble"   TO last-name IN unsorted-table-2(3).
           MOVE 40         TO age IN unsorted-table-2(3).
           MOVE "C. Montgomery" TO first-name IN unsorted-table-2(4).
           MOVE "Burns"    TO last-name IN unsorted-table-2(4).
           MOVE 99         TO age IN unsorted-table-2(4).
           MOVE "Waylon"   TO first-name IN unsorted-table-2(5).
           MOVE "Smithers" TO last-name IN unsorted-table-2(5).
           MOVE 35         TO age IN unsorted-table-2(5).

      *    Sort the unsorted table 1 into a file.
           DISPLAY "[+] Unsorted table 1: ".
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 5
               DISPLAY unsorted-table-1(TALLY)
           END-PERFORM.
           MOVE 1 TO sort-idx.
           SORT buffer-file
               ON ASCENDING KEY age IN buffer-set
               ON DESCENDING KEY last-name IN buffer-set
               INPUT PROCEDURE Get-Unsorted
               GIVING sorted-file-1.
           DISPLAY "[+] Sorting table 1 done.".
      *    Sort the unsorted table 2 into a file.
           DISPLAY "[+] Unsorted table 2: ".
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 5
               DISPLAY unsorted-table-2(TALLY)
           END-PERFORM.
           MOVE 2 TO sort-idx.
           SORT buffer-file
               ON ASCENDING KEY age IN buffer-set
               ON DESCENDING KEY last-name IN buffer-set
               INPUT PROCEDURE Get-Unsorted
               GIVING sorted-file-2.
           DISPLAY "[+] Sorting table 2 done.".
      *    Merge the two sorted tables into one.
           MERGE buffer-file
               ON ASCENDING KEY age IN buffer-set
               ON DESCENDING KEY last-name IN buffer-set
               USING sorted-file-2 sorted-file-1
               GIVING big-sorted-file.
           DISPLAY "[+] Merging of two sorted files complete.".

           STOP RUN.

       Get-Unsorted.
           IF sort-idx = 1 THEN
                  PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 5
                      MOVE unsorted-table-1(TALLY) TO buffer-set
                      RELEASE buffer-set
                  END-PERFORM
           ELSE IF sort-idx = 2 THEN
                  PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 5
                      MOVE unsorted-table-2(TALLY) TO buffer-set
                      RELEASE buffer-set
                  END-PERFORM
           ELSE
               DISPLAY "[-] Invalid index for unsorted table."
           END-IF.
       End-Get-Unsorted.
           EXIT PARAGRAPH.
           