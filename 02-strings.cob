       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Strings.
      ****************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  string1     PIC X(20) VALUE "Hello World!".
       01  string2     PIC X(20) VALUE "Goodbye World!".
       01  longstring  PIC X(60) VALUE "..............................".
       01  splitme     PIC X(60)
           VALUE "The Tragedy of Hamlet, Prince of Denmark".
       01  split1      PIC X(10).
       01  split2      PIC X(10).
       01  split3      PIC X(10).
       01  split4      PIC X(10).
       01  split5      PIC X(10).
       01  split6      PIC X(10).

       01  uppercase   PIC X(26) VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
       01  lowercase   PIC X(26) VALUE "abcdefghijklmnopqrstuvwxyz".
       01  rot13       PIC X(26) VALUE "nopqrstuvwxyzabcdefghijklm".

       01  counter     PIC 99999 VALUE 0.                             
      ****************************
       PROCEDURE DIVISION.
           
           DISPLAY " --- Counting --- "

           INSPECT string1 TALLYING counter FOR CHARACTERS.                
           DISPLAY "[+] Total number of characters: " counter.

           MOVE 0 TO counter.
           INSPECT string1 TALLYING counter FOR ALL "o".                                              
           DISPLAY "[+] Occurrences of the letter 'o': " counter.

           MOVE 0 TO counter.
           INSPECT string1 TALLYING counter FOR LEADING "H".
           DISPLAY "[+] Characters if first letter is 'H': " counter.
           MOVE 0 TO counter.
           INSPECT string1 TALLYING counter FOR LEADING "X".
           DISPLAY "[+] Characters if first letter is 'X': " counter.

           MOVE 0 TO counter.
           INSPECT string1 TALLYING counter
               FOR CHARACTERS AFTER "Hello".                  
           DISPLAY "[+] Characters following 'Hello': " counter.

           DISPLAY " --- Replacing --- "

           INSPECT string1 REPLACING ALL "Hello" BY "Hallo".
           INSPECT string1 REPLACING ALL "World" BY " Welt".
           DISPLAY "[+] German 'Hello World' = " string1.
           
           INSPECT string1 REPLACING CHARACTERS BY "#".
           DISPLAY "[+] Ultimate censorship = " string1.

           DISPLAY " --- Converting --- "

           INSPECT string2 CONVERTING lowercase TO uppercase.
           DISPLAY "[+] Uppercased: " string2.
           INSPECT string2 CONVERTING uppercase TO lowercase.           
           DISPLAY "[+] Lowercased: " string2.
           INSPECT string2 CONVERTING lowercase TO rot13.
           DISPLAY "[+] Rot13: " string2.

           DISPLAY " --- Concatenating --- "

           MOVE 20 TO counter.
           STRING string1 string2 INTO longstring WITH POINTER counter.
           DISPLAY "[+] Concatenated+offset: " longstring.

           MOVE " " TO longstring.
           STRING string1 string2 DELIMITED BY " " INTO longstring.
           DISPLAY "[+] Partially concatenated: " longstring.

           DISPLAY " --- Splitting --- "
           
           UNSTRING splitme DELIMITED BY "," OR " "
               INTO split1 split2 split3 split4 split5 split6.
           DISPLAY "[+] Split parts: " split1 split2 split3 split4
               split5 split6.

           DISPLAY " --- Indexing substrings --- "

           MOVE 8 TO counter.
           MOVE splitme(4:counter) TO string1.
           DISPLAY "[+] Indices 4 to 4+" counter ": " string1.                                            

           STOP RUN.
