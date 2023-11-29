       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Search.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  s-name  PIC X(20).
       01  simpsons OCCURS 5 INDEXED BY idx.
           05 first-name   PIC X(20).
           05 age          PIC 99.
      ****************************
       PROCEDURE DIVISION.

      *    Search for a Simpsons character.    
           MOVE "Homer" TO first-name(1).
           MOVE 36 TO age(1).
           MOVE "Marge" TO first-name(2).
           MOVE 34 TO age(2).
           MOVE "Bart" TO first-name(3).
           MOVE 10 TO age(3).
           MOVE "Lisa" TO first-name(4).
           MOVE 8 TO age(4).
           MOVE "Maggie" TO first-name(5).
           MOVE 1 TO age(5).

           DISPLAY "[+] Enter a search name: ". ACCEPT s-name.

           SET idx TO 1.
           SEARCH simpsons
               AT END DISPLAY "[-] Name '" s-name "' not found"
               WHEN s-name = first-name(idx)
                   DISPLAY "[+] Found '" s-name "' at entry " idx
                   DISPLAY "[+] The age is " age(idx)
           END-SEARCH.

           STOP RUN.
           