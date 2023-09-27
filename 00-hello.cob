       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Hello_World.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   July, 2023.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  greeting PIC X(20).
      ****************************
       PROCEDURE DIVISION.

           MOVE "Hello World!" TO greeting.
           DISPLAY greeting.
           STOP RUN.                                             
