      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "SORTSTUD.DAT"
                            ORGANIZATION IS LINE SEQUENTIAL.
           SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
       Sales-Cust-ID   PIC X(5).
       Sales-Cust-Name PIC X(20).
       Sales-Oil-ID    PIC X(3).
       Sales-Unit-Size PIC 9(1).
       Sales-Units-Sold    PIC 9(3).

       FD StudentFile.
       01 StudentDetails      PIC X(30).

       WORKING-STORAGE SECTION.
       01  Oils-Table.
           02  Oil-Cost-Values.
               03 FILLER               PIC X(40)
                       VALUE "0041003200450050002910250055003900650075".
               03 FILLER               PIC X(40)
                       VALUE "0080004400500063006500550085004812500065".
               03 FILLER               PIC X(40)
                       VALUE "0060005500670072006501250085006511150105".
           02  FILLER REDEFINES Oil-Cost-VALUES.
               03 OIL-COST           PIC 99V99 OCCURS 30 TIMES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
