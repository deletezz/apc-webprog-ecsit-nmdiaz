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
           SELECT StudentFile ASSIGN TO "STUDENTS.DAT"
                    ORGANIZATION IS LINE SEQUENTIAL.

           SELECT InsertionsFile ASSIGN TO "TRANSINS.DAT"
                    ORGANIZATION IS LINE SEQUENTIAL.

           SELECT NewStudentFile    ASSIGN TO "STUDENTS.NEW"
                    ORGANIZATION IS LINE SEQUENTIAL.

           SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
       FD  StudentFile.
           01  StudentRec             PIC X(30).

       FD  InsertionsFile.
           01  InsertionRec           PIC X(30).

       FD  NewStudentFile.
           01  NewStudentRec          PIC X(30).

       SD  WorkFile.
       01  WorkRec.
           02 WStudentId          PIC 9(7).
           02 FILLER              PIC X(23).

       PROCEDURE DIVISION.
       Begin.
           MERGE WorkFile
              ON ASCENDING KEY WStudentId
              USING InsertionsFile,  StudentFile
              GIVING NewStudentFile.
       STOP RUN.
