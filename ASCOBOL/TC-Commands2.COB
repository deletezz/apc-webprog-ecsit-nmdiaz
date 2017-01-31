      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  CASH PIC 999 VALUES 123.
       01  TOTAL PIC 9999 VALUES 1000.
       01  CHEQUES PIC 9999 VALUES 1533.

       01  TAX PIC 999 VALUES 250.
       01  GROSSPAY PIC 999 VALUES 750.
       01  TOTAL1 PIC 9999 VALUES 2554.

       01  SIZEE PIC 9999 VALUES 250.
       01  MAGNITUDE PIC 9(4)V99 VALUES 123.45.

       01  AMOUNT1 PIC 9999 VALUES 2544.
       01  AMOUNT2 PIC 999 VALUES 354.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ADDITION"
            DISPLAY "CASH IS = "CASH.
            DISPLAY "TOTAL IS = "TOTAL.
            ADD CASH,CHEQUES GIVING TOTAL.
            DISPLAY "TOTAL + CASH + CHEQUES= "TOTAL "," CHEQUES.

           DISPLAY "SUBTRACTION".
           DISPLAY "TAX = "TAX.
           DISPLAY "GROSSPAY = "GROSSPAY.
           DISPLAY "TOTAL = "TOTAL1.
           SUBTRACT TAX FROM GROSSPAY, TOTAL1.
           DISPLAY "TOTAL = "TOTAL1 "," GROSSPAY.

           DISPLAY "MULTIPLICATIONS".
           DISPLAY "SIZEE = "SIZEE.
           DISPLAY "MAGNITUDE = "MAGNITUDE.
           MULTIPLY 10 BY SIZEE, MAGNITUDE.
           DISPLAY "10 * SIZEE * MAGNITUDE = "MAGNITUDE "," SIZEE.

           DISPLAY "DIVISION".
           DISPLAY "AMOUNT1 = "AMOUNT1.
           DISPLAY "AMOUNT2 = "AMOUNT2.
           DIVIDE 15 INTO AMOUNT1 ROUNDED, AMOUNT2.
           DISPLAY "AMOUNT1/15 = "AMOUNT1.
           DISPLAY "AMOUNT2/15 = "AMOUNT2.


            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
