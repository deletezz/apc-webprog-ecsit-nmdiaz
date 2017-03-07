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
       SELECT Graduate-Info ASSIGN TO "GradInfo.Dat"
                  ORGANIZATION IS LINE SEQUENTIAL.

       SELECT Country-Codes ASSIGN TO "CountryCodes.Dat"
                  ORGANIZATION IS LINE SEQUENTIAL.

       SELECT Email-Domain-File ASSIGN TO "SORTEDDOMAIN.Dat".

       DATA DIVISION.
       FILE SECTION.
       FD Graduate-Info.
           01  Graduate-Rec.
               88  End-Of-Grad-Rec VALUE HIGH-VALUE.
               02  GI-Stud-Name        PIC X(25).
               02  GI-Grad-Year        PIC 9(4).
               02  GI-Course-Code      PIC 9(1).
               02  GI-Email-Addr       PIC X(28).
               02  GI-Email-Domain-Name    PIC X(20).
               02  GI-Country-Code     PIC X(2).

       SD Email-Domain-File.
           01  Email-Domain-Info.
               88  End-Of-Email-Domain-Rec  VALUE HIGH-VALUE.
               02  EDF-Email-Domain-Name   PIC X(20).
               02  EDF-Stud-Name           PIC X(25).
               02  EDF-Grad-Year           PIC 9(4).
               02  EDF-Course-Name         PIC X(25).
               02  EDF-Country-Name        PIC X(26).

       FD Country-Codes.
           01  Country-Code-Info.
               88  End-Of-Country-Code-Rec VALUE HIGH-VALUE.
               02  CCI-Country-Code    PIC X(2).
               02  CCI-Country-Name    PIC X(26).

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
