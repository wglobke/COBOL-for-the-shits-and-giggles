# COBOL for the shits and giggles

Sample code for my online course "<a href="https://tinyurl.com/bdeafea5">COBOL for the shits and giggles</a>" on YouTube.
The numbers at the beginning of each filename indicate which chapter of the course they belong to.

I use the <a href="https://gnucobol.sourceforge.io">GnuCOBOL</a> compiler to test the examples in this course, set to the IBM COBOL dialect with the <tt>std=ibm</tt> flag.
To compile a file, say <tt>example.cob</tt>, use the command

<tt>cobc -x -std=ibm example.cob</tt>

which will generate an executable <tt>example</tt> in the current directory.

Under the hood, GnuCOBOL is a transpiler that translates COBOL into C code, which is then compiled into binary. To create the intermediate C code instead of the
binary, use the command

<tt>cobc -C -std=ibm example.cob</tt>

This should create three files, <tt>example.c</tt> (the program code), <tt>example.c.h</tt> (constants and auxiliary functions) and <tt>example.c.l.h</tt> ("local" variables from the Working Storage Section).

To compile and link multiple files, say a subprogram <tt>sub.cob</tt> and a main program <tt>main.cob</tt> into an executable <tt>execfile</tt>, use the command

<tt>cobc -x -std=ibm main.cob sub.cob -o execfile</tt>

Note that here you have to explicitely state the name of the produced executable with the <tt>-o</tt> flag.
