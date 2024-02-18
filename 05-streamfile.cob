       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Stream_File.
      ****************************
      *    Program to test the function "fread_cob".
      ****************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      * next line copied from fread.cob
           SELECT stream-file ASSIGN TO DYNAMIC source-file.
      ****************************
       DATA DIVISION.

       FILE SECTION.
      * next two lines copied from fread.cob
       FD  stream-file EXTERNAL.
       01  stream-byte PIC X.

       WORKING-STORAGE SECTION.
      * next line copied from fread.cob
       01  source-file PIC X(255).
       01  n           PIC 9(10) USAGE BINARY.
       01  rounds      PIC 9(10) USAGE BINARY.
       01  remaining   PIC 9(10) USAGE BINARY.
       01  idx         PIC 9(10) USAGE BINARY.
       01  max-len     PIC 9(10) USAGE BINARY VALUE 4096.
       01  my-buffer.
           02 my-buffer-byte PIC X OCCURS 10000.
       01  max-buffer PIC X(4096).
      ****************************
       PROCEDURE DIVISION.

           DISPLAY "[+] Which file do you wish to read?".
           ACCEPT source-file.
           DISPLAY "[+] How many bytes do you wish to read?".
           ACCEPT n.
           IF n > FUNCTION LENGTH(my-buffer) THEN
               DISPLAY "[-] Buffer too short : " n " bytes requested, "
                       "but only " FUNCTION LENGTH(my-buffer)
                       " bytes available."
               STOP RUN
           END-IF.
           DISPLAY "---".

           OPEN INPUT stream-file.

           COMPUTE rounds = n / max-len.
           COMPUTE remaining = FUNCTION MOD(n, max-len).

           PERFORM VARYING TALLY FROM 1 BY 1 UNTIL TALLY = rounds + 1
               CALL "fread_cob" USING
                   max-buffer,
                   max-len,
                   source-file
               COMPUTE idx = max-len * (TALLY - 1) + 1
               MOVE max-buffer TO my-buffer(idx:max-len)
           END-PERFORM.
           IF remaining > 0 THEN
               CALL "fread_cob" USING
                   max-buffer,
                   remaining,
                   source-file
               COMPUTE idx = max-len * rounds + 1
               MOVE max-buffer TO my-buffer(idx:remaining)
           END-IF.

           CLOSE stream-file.

           DISPLAY "[+] The first " n " bytes of file '"
               FUNCTION TRIM(source-file, TRAILING)
               "' are: ".
           DISPLAY my-buffer.

           STOP RUN.
