       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Renames.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  personnel-record.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  street      PIC X(20).
           05  city        PIC X(20).
           05  department  PIC X(20).
           05  salary      PIC 9(7)v9(2).

       66  full-name RENAMES first-name THROUGH last-name.
       66  contact RENAMES first-name THROUGH city.
       66  org RENAMES department.
      ****************************
       PROCEDURE DIVISION.

           MOVE "Homer" TO first-name.
           MOVE "Simpsons" TO last-name.                               
           MOVE "742 Evergreen Tce" TO street.
           MOVE "Springfield" TO city.
           MOVE 362.19 TO salary.
           MOVE "Safety" TO department.

           DISPLAY "Personnel record: "
           DISPLAY personnel-record.
           DISPLAY "Full name: "
           DISPLAY full-name.
           DISPLAY "Contact info: "
           DISPLAY contact.
           DISPLAY "Organisation: "
           DISPLAY org.

           STOP RUN.                                             
