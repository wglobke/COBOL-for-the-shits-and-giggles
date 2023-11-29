       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Accept_Display.
      ****************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CONSOLE IS CRT.
      ****************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  black       CONSTANT    0.
       01  blue        CONSTANT    1.
       01  green       CONSTANT    2.
       01  turquoise   CONSTANT    3.
       01  red         CONSTANT    4.
       01  violet      CONSTANT    5.
       01  brown       CONSTANT    6.
       01  white       CONSTANT    7.

       01  century     CONSTANT    20.

       01  personnel-record.
           05  first-name  PIC X(20).
           05  last-name   PIC X(20).
           05  street      PIC X(20).
           05  city        PIC X(20).
           05  department  PIC X(20).
           05  salary      PIC Z(6)9.9(2) USAGE DISPLAY.

       01  today.
           02  yy  PIC 99.
           02  mm  PIC 99.
           02  dd  PIC 99.
       01  day-of-year.
           02  yy  PIC 99.
           02  doy PIC 999.
       01  weekday PIC 9.
       01  now.
           02  hr  PIC 99.
           02  min PIC 99.
           02  sec PIC 99.
           02  ds  PIC 99.

       01  week-table.
           02  weekdays    PIC X(9) OCCURS 7.
      ****************************
       PROCEDURE DIVISION.
      *    Set weekdays
           MOVE "Monday" TO weekdays(1).
           MOVE "Tuesday" TO weekdays(2).
           MOVE "Wednesday" TO weekdays(3).
           MOVE "Thursday" TO weekdays(4).
           MOVE "Friday" TO weekdays(5).
           MOVE "Saturday" TO weekdays(6).
           MOVE "Sunday" TO weekdays(7).

      *    Get date and time
           ACCEPT today FROM DATE.
           ACCEPT day-of-year FROM DAY.
           ACCEPT weekday FROM DAY-OF-WEEK.
           ACCEPT now FROM TIME.

      *    Format the input mask
           DISPLAY " ~ Enter Personnel Record ~ "
               AT LINE 1 COLUMN 30
               WITH FOREGROUND-COLOR red
               WITH BACKGROUND-COLOR white.
           DISPLAY "Date: " AT LINE 1 COLUMN 70
               weekdays(weekday)
               " " century
               yy IN today
               "-" mm IN today
               "-" dd IN today.
           DISPLAY "First name: "
               AT LINE 4 COLUMN 2.
           DISPLAY "Last name : "
               AT LINE 6 COLUMN 2.
           DISPLAY "Street    : "
               AT LINE 8 COLUMN 2.
           DISPLAY "City      : "
               AT LINE 10 COLUMN 2.
           DISPLAY "Department: "
               AT LINE 12 COLUMN 2.
           DISPLAY "Salary    : "
               AT LINE 14 COLUMN 2.

      *    Read values for personnel record.
           ACCEPT first-name IN personnel-record
               WITH REVERSE-VIDEO
               WITH FOREGROUND-COLOR green
               WITH SIZE 80
               WITH BELL
               WITH BLINK
               AT LINE 4 COLUMN 14.
           ACCEPT last-name IN personnel-record
               AT LINE 6 COLUMN 14.
           ACCEPT street IN personnel-record
               AT LINE 8 COLUMN 14.
           ACCEPT city IN personnel-record
               AT LINE 10 COLUMN 14.
           ACCEPT department IN personnel-record
               AT LINE 12 COLUMN 14.
           ACCEPT salary IN personnel-record
               AT LINE 14 COLUMN 14.  

      *    Display the newly-filled personel record.
           DISPLAY " ~ View Personnel Record ~ "
               AT LINE 20 COLUMN 30
               WITH FOREGROUND-COLOR green
               WITH BACKGROUND-COLOR violet
               WITH BELL WITH BLINK.
           DISPLAY "First name: " AT LINE 23 COLUMN 2
               first-name IN personnel-record.
           DISPLAY "Last name : " AT LINE 25 COLUMN 2
               last-name IN personnel-record.
           DISPLAY "Street    : " AT LINE 27 COLUMN 2
               street IN personnel-record.
           DISPLAY "City      : " AT LINE 29 COLUMN 2
               city IN personnel-record.
           DISPLAY "Department: " AT LINE 31 COLUMN 2
               department IN personnel-record.
           DISPLAY "Salary    : " AT LINE 33 COLUMN 2
               salary IN personnel-record.

           STOP RUN.
           