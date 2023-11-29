       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Call_Me_Maybe.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  keystroke   PIC X(20).
      ****************************
       PROCEDURE DIVISION.
      
      *    Test several ways of calling "procedures" given by different
      *    section or paragraph names
           DISPLAY "Let's do some 'Procedure' calling...".

           ACCEPT keystroke.
           PERFORM Lonely-Paragraph.      

           ACCEPT keystroke.
           PERFORM Lonely-Paragraph 10 TIMES.

           ACCEPT keystroke.
           PERFORM Proc-Paragraph-1-1.

           ACCEPT keystroke.
           PERFORM Proc-Paragraph-1-1 THROUGH Proc-Paragraph-1-3.

           ACCEPT keystroke.
      *    Uncomment to get an error:
      *    PERFORM Proc-Paragraph-1-1 THROUGH Proc-Paragraph-2-2.
           PERFORM First-Procedure-Section.

           ACCEPT keystroke.
           PERFORM First-Procedure-Section
               THROUGH Second-Procedure-Section.
       
      *    Call an external subprogram
      *    apparently this must be statically linked, otherwise
      *    it does not work with GnuCOBOL; use command line
      *        cobc -x -std=ibm 03-callmemaybe.cob 03-subprogram.cob -o 03-callmemaybe
           ACCEPT keystroke.
           CALL "Sub_Program"
               ON EXCEPTION DISPLAY "[-] Subprogram not found.".
           
           DISPLAY "Enter name for dynamic subprogram call: ".
           ACCEPT keystroke.

      *    Do we have to "trim" the subprogram's name?
           CALL FUNCTION TRIM(keystroke, TRAILING)
               ON EXCEPTION DISPLAY
                   "[-] Apparently you did not enter a valid "
                   "subprogram name. I'm not angry, just disappointed.".

           DISPLAY "[MAIN] Procedure calls done.".
           STOP RUN.
      *    Comment out the STOP RUN on the previous line to run into
      *    the "Procedures" in the course of the linear program flow.
      *     DISPLAY "Let's run the program till the end!".
      *     ACCEPT keystroke.

       Lonely-Paragraph.
           DISPLAY "   [§] Executing code in the Lonely Paragraph".

       First-Procedure-Section SECTION.
           DISPLAY "[S] Starting in the First Section...".

       Proc-Paragraph-1-1.
           DISPLAY "   [§] ...now in Paragraph 1.1".

       Proc-Paragraph-1-2.
           EXIT PARAGRAPH.
           DISPLAY "   [§] ...followed by Paragraph 1.2".

       Proc-Paragraph-1-3.
           DISPLAY "   [§] ...and Paragraph 1.3... will it ever end?!".

       Second-Procedure-Section SECTION.
           DISPLAY "[S] Welcome to another Section!".

       Proc-Paragraph-2-1.
           DISPLAY "   [§] ...where we have Paragraph 2.1".

       Proc-Paragraph-2-2.
           DISPLAY "   [§] ...followed by Paragraph 2.2".
           EXIT SECTION.

       Proc-Paragraph-2-3.
           DISPLAY "   [§] We never reach Paragraph 2.3, or do we?".
