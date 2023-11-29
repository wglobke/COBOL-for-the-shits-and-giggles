       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Sort_Tables.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT buffer-file ASSIGN TO "buffer.dat".
      ****************************
       DATA DIVISION.

       FILE SECTION.
       SD  buffer-file.
       01  buffer-set.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.

       WORKING-STORAGE SECTION.
       01  unsorted-table OCCURS 10.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
       01  sorted-table OCCURS 10.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  age         PIC 999.
      ****************************
       PROCEDURE DIVISION.

      *    Initialize unsorted data.
           MOVE "Homer"    TO first-name IN unsorted-table(1).
           MOVE "Simpson"  TO last-name IN unsorted-table(1).
           MOVE 36         TO age IN unsorted-table(1).
           MOVE "Marge"    TO first-name IN unsorted-table(2).
           MOVE "Simpson"  TO last-name IN unsorted-table(2).
           MOVE 34         TO age IN unsorted-table(2).
           MOVE "Bart"     TO first-name IN unsorted-table(3).
           MOVE "Simpson"  TO last-name IN unsorted-table(3).
           MOVE 10         TO age IN unsorted-table(3).
           MOVE "Lisa"     TO first-name IN unsorted-table(4).
           MOVE "Simpson"  TO last-name IN unsorted-table(4).
           MOVE 8          TO age IN unsorted-table(4).
           MOVE "Maggie"   TO first-name IN unsorted-table(5).
           MOVE "Simpson"  TO last-name IN unsorted-table(5).
           MOVE 1          TO age IN unsorted-table(5).
           MOVE "Ned"      TO first-name IN unsorted-table(6).
           MOVE "Flanders" TO last-name IN unsorted-table(6).
           MOVE 36         TO age IN unsorted-table(6).
           MOVE "Maude"    TO first-name IN unsorted-table(7).
           MOVE "Flanders" TO last-name IN unsorted-table(7).
           MOVE 34         TO age IN unsorted-table(7).
           MOVE "Barney"   TO first-name IN unsorted-table(8).
           MOVE "Gumble"   TO last-name IN unsorted-table(8).
           MOVE 40         TO age IN unsorted-table(8).
           MOVE "C. Montgomery" TO first-name IN unsorted-table(9).
           MOVE "Burns"    TO last-name IN unsorted-table(9).
           MOVE 99         TO age IN unsorted-table(9).
           MOVE "Waylon"   TO first-name IN unsorted-table(10).
           MOVE "Smithers" TO last-name IN unsorted-table(10).
           MOVE 35         TO age IN unsorted-table(10).

           DISPLAY "[+] Unsorted table: ".
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 10
               DISPLAY unsorted-table(TALLY)
           END-PERFORM.

      *    Read data to sort from an unsorted table.
           SORT buffer-file
               ON DESCENDING KEY age IN buffer-set
               ON ASCENDING KEY last-name IN buffer-set
               INPUT PROCEDURE Get-Unsorted
               OUTPUT PROCEDURE Set-Sorted.
           DISPLAY "[+] Sorting done.".

           DISPLAY "[+] Sorted table: ".
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 10
               DISPLAY sorted-table(TALLY)
           END-PERFORM.

           STOP RUN.

      *    Define pre-/post-processing procedures
       Get-Unsorted.
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 10
               MOVE unsorted-table(TALLY) TO buffer-set
               RELEASE buffer-set
           END-PERFORM.
       End-Get-Unsorted.
           EXIT PARAGRAPH.

       Set-Sorted.
           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY > 10
               RETURN buffer-file INTO sorted-table(TALLY)
                   AT END CONTINUE
           END-PERFORM.
       End-Set-Sorted.
           EXIT PARAGRAPH.
           