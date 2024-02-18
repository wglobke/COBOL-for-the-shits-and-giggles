       IDENTIFICATION DIVISION.
       PROGRAM-ID.     fread_cob.
      ****************************
      * Arguments:
      *    buffer      : buffer of size 4096 bytes contains the
      *                  bytes read from the file
      *    n-bytes     : number of bytes to be read, advances the
      *                  position in the file by as many steps
      *    source-file : system name of the file to be read
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      * copy next line into CALLing program
           SELECT stream-file ASSIGN TO DYNAMIC source-file.
      ****************************
       DATA DIVISION.
       
       FILE SECTION.
      * copy next two lines into CALLing program
       FD  stream-file EXTERNAL.
       01  stream-byte PIC X.

       LINKAGE SECTION.
      * copy next line into CALLing program's WORKING STORAGE SECTION
       01  source-file PIC X(255).
       01  n-bytes     PIC 9(10) USAGE BINARY.
       01  buffer.
           02 buffer-byte PIC X OCCURS 4096.
      ****************************
       PROCEDURE DIVISION USING buffer, n-bytes, source-file.
           
      *    DISPLAY "[fread_cob] Reading " n-bytes " bytes from "
      *             "'" FUNCTION TRIM(source-file, TRAILING) "'".

           IF n-bytes > 4096 THEN
               DISPLAY "[fread_cob] "
                       "Error: Can read at most 4096 bytes at a time."
               EXIT PROGRAM
           END-IF.

           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY = n-bytes + 1
               READ stream-file
                   AT END
      *                DISPLAY "[fread_cob] Reached end of file."
                       EXIT PROGRAM
                   NOT AT END
                       MOVE stream-byte TO buffer-byte(TALLY)
           END-PERFORM.

       END PROGRAM fread_cob.
           