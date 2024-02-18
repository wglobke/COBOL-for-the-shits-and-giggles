       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Different_Types.
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT contact-file ASSIGN TO "contacts.dat".
      ****************************
       DATA DIVISION.
       FILE SECTION.
       FD  contact-file.
       01  home-address.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  zip         PIC 99999.
           05  street      PIC X(30).
           05  city        PIC X(30).
       01  email-address.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  email       PIC X(20).
       WORKING-STORAGE SECTION.
       01  switch  PIC X.
      ****************************
       PROCEDURE DIVISION.

      *    Read data for contact-file.           
           DISPLAY "Do you wish to enter a home address (h) or "
                   "an email address (e)? [h/e]".
                   ACCEPT switch.
           OPEN OUTPUT contact-file.

           IF switch = "h" THEN
                 DISPLAY "[+] Enter home address:"
                 DISPLAY "   First name : "
                 ACCEPT first-name IN home-address
                 DISPLAY "   Last name  : "
                 ACCEPT last-name IN home-address
                 DISPLAY "   ZIP code   : "
                 ACCEPT zip IN home-address
                 DISPLAY "   Street     : "
                 ACCEPT street IN home-address
                 DISPLAY "   City       : "
                 ACCEPT city IN home-address
                 WRITE home-address
           ELSE IF switch = "e" THEN
                 DISPLAY "[+] Enter email address:"
                 DISPLAY "   First name : "
                 ACCEPT first-name IN email-address
                 DISPLAY "   Last name  : "
                 ACCEPT last-name IN email-address
                 DISPLAY "   Email      : "
                 ACCEPT email IN email-address
                 WRITE email-address
           ELSE
               DISPLAY "Unknown option '" switch "'."
           END-IF.

           CLOSE contact-file.
           DISPLAY "---".
           
      *    Display entries of contact-file.
           DISPLAY "Are you expecting a home address (h) or "
                   "an email address (e)? [h/e]".
                   ACCEPT switch.
           OPEN INPUT contact-file.

      ***  What would happen if we do not specify the target record in READ?
      *     READ contact-file.

           IF switch = "h" THEN
               READ contact-file INTO home-address          
               DISPLAY "[+] Home address is:"
               DISPLAY "   First name : "
               DISPLAY first-name IN home-address
               DISPLAY "   Last name  : "
               DISPLAY last-name IN home-address
               DISPLAY "   ZIP code   : "
               DISPLAY zip IN home-address
               DISPLAY "   Street     : "
               DISPLAY street IN home-address
               DISPLAY "   City       : "
               DISPLAY city IN home-address
           ELSE IF switch = "e" THEN
               READ contact-file INTO email-address
               DISPLAY "[+] Enter email address:"
               DISPLAY "   First name : "
               DISPLAY first-name IN email-address
               DISPLAY "   Last name  : "
               DISPLAY last-name IN email-address
               DISPLAY "   Email      : "
               DISPLAY email IN email-address
           ELSE
               DISPLAY "Unknown option '" switch "'."
           END-IF.

           CLOSE contact-file.
           STOP RUN.
