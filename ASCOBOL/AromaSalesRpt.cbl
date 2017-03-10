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
       SELECT Aroma-Sales ASSIGN TO "SALES.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       SELECT Aroma-Work ASSIGN TO "SORT.TMP".

       SELECT Aroma-Report ASSIGN TO "AROMASALES.RPT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       SELECT Aroma-Sorted ASSIGN TO "SORTSALE.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD Aroma-Sales.
           01  Sales-Rec.
               88 End-Of-Sales-File    VALUE HIGH-VALUES.
               02  AS-Customer-ID             PIC X(5).
               02  AS-Customer-Name            PIC X(20).
               02  AS-Oil-Id.
                   03  FILLER              PIC X.
                       88 Essential-Oil   VALUE "E".
                   03  AS-Oil-Name         PIC 99.
               02 AS-Unit-Size             PIC 99.
               02 AS-Units-Sold            PIC 999.

       SD Aroma-Work.
           01 Work-Rec.
              88 End-Of-Work-File VALUE HIGH-VALUES.
               02  AW-Customer-Id              PIC X(5).
               02  AW-Customer-Name            PIC X(20).
               02  AW-Oil-Id.
                   03 FILLER               PIC X.
                   03 AW-Oil-Number           PIC 99.
               02 AW-Unit-Size             PIC 99.
               02 AW-Units-Sold            PIC 999.

       FD Aroma-Report.
           01 Print-Line                   PIC X(64).

       FD Aroma-Sorted.
           01 Sorted-Record                   PIC X(33).

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

       01  Report-Main-Title         PIC X(44)
            VALUE "              AROMAMORA SUMMARY SALES REPORT".

       01  Report-Title-Underline.
           02  FILLER                  PIC X(13) VALUE SPACES.
           02  FILLER                  PIC X(32) VALUE ALL "-".

       01  Report-Subtitles.
           02  FILLER                  PIC BX(13) VALUE
           " CUSTOMER NAME".
           02  FILLER                  PIC X(8) VALUE SPACES.
           02  FILLER                  PIC X(10) VALUE "CUST-ID   ".
           02  FILLER                  PIC X(8) VALUE "SALES   ".
           02  FILLER                  PIC X(11) VALUE "QTY SOLD   ".
           02  FILLER                  PIC X(11) VALUE "SALES VALUE".

       01  Customer-Sales-Line.
           02  Prn-Cust-Name           PIC X(20).
           02  Prn-Cust-Id             PIC BBB9(5).
           02  Prn-Cust-Sales          PIC BBBBBZZ9.
           02  Prn-Qty-Sold            PIC BBBBBZZ,ZZ9.
           02  Prn-Sales-Value         PIC BBBB$$$,$$9.99.

       01  Total-Sales-Line.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER                  PIC X(19) VALUE
           "TOTAL SALES       :".
           02  Prn-Total-Sales         PIC BBBBBBZZ,ZZ9.


       01  Total-Qty-Sold-Line.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER                  PIC X(19) VALUE
           "TOTAL QTY SOLD    :".
           02  Prn-Total-Qty-Sold      PIC BBBBBZZZ,ZZ9.

       01  Total-Sales-Value-Line.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER                  PIC X(19) VALUE
           "TOTAL SALES VALUE :".
           02  Prn-Total-Sales-Value   PIC B$$$$,$$9.99.

       01  Cust-Totals.
           02  Cust-Sales              PIC 999.
           02  Cust-Qty-Sold           PIC 9(5).
           02  Cust-Sales-Value        PIC 9(5)V99.

       01  Final-Totals.
           02  Total-Sales             PIC 9(5)    VALUE ZEROS.
           02  Total-Qty-Sold          PIC 9(6)    VALUE ZEROS.
           02  Total-Sales-Value       PIC 9(6)V99 VALUE ZEROS.

       01  Temp-Variables.
           02  Sale-Qty-Sold           PIC 99999.
           02  Value-Of-Sale           PIC 999999V99.
           02  Prev-Cust-Id            PIC X(5).

       PROCEDURE DIVISION.
       Produce-Summary-Report.
           SORT Aroma-Work ON ASCENDING AW-Customer-Name
                INPUT PROCEDURE IS Select-Essential-Oils
                OUTPUT PROCEDURE IS Print-Summary-Report.
           STOP RUN.

       Select-Essential-Oils.
           OPEN INPUT Aroma-Sales.
           READ Aroma-Sales
               AT END SET End-Of-Sales-File TO TRUE
           END-READ.

           PERFORM UNTIL End-Of-Sales-File
               IF Essential-Oil
                   RELEASE Work-Rec FROM Sales-Rec
               END-IF
           READ Aroma-Sales
               AT END SET End-Of-Sales-File TO TRUE
           END-READ
           END-PERFORM.

           CLOSE Aroma-Sales.

       Print-Summary-Report.
           OPEN OUTPUT Aroma-Report.
           OPEN OUTPUT Aroma-Sorted.
           WRITE Print-Line FROM Report-Main-Title AFTER
           ADVANCING 1 LINE.
           WRITE Print-Line FROM Report-Title-Underline AFTER
           ADVANCING 1 LINE.
           WRITE Print-Line FROM Report-Subtitles AFTER
           ADVANCING 3 LINES.

           RETURN Aroma-Work
               AT END SET End-Of-Work-File TO TRUE
           END-RETURN.

           PERFORM Print-Customer-Lines UNTIL End-Of-Work-File


           MOVE Total-Sales TO Prn-Total-Sales.
           WRITE Print-Line FROM Total-Sales-Line AFTER ADVANCING 3 LINES.

           MOVE Total-Qty-Sold TO Prn-Total-Qty-Sold.
           WRITE Print-Line FROM Total-Qty-Sold-Line AFTER
           ADVANCING 2 LINES.

           MOVE Total-Sales-Value TO Prn-Total-Sales-Value.
           WRITE Print-Line FROM Total-Sales-Value-Line AFTER
           ADVANCING 2 LINES.

           CLOSE Aroma-Report, Aroma-Sorted.

       Print-Customer-Lines.
           MOVE ZEROS TO Cust-Totals.
           MOVE AW-Customer-Id TO Prn-Cust-Id, Prev-Cust-Id.
           MOVE AW-Customer-Name TO Prn-Cust-Name.

           PERFORM UNTIL AW-Customer-Id NOT = Prev-Cust-Id
               WRITE Sorted-Record FROM Work-Rec
               ADD 1 TO Cust-Sales, Total-Sales

               COMPUTE Sale-Qty-Sold = AW-Unit-Size * AW-Units-Sold
               ADD Sale-Qty-Sold TO Cust-Qty-Sold, Total-Qty-Sold

               COMPUTE Value-Of-Sale = Sale-Qty-Sold *
               Oil-Cost(AW-Oil-Number)
               ADD Value-Of-Sale TO Cust-Sales-Value,
               Total-Sales-Value

               RETURN Aroma-Work
                   AT END SET End-Of-Work-File TO TRUE
               END-RETURN
           END-PERFORM.

           MOVE Cust-Sales TO Prn-Cust-Sales.
           MOVE Cust-Qty-Sold TO Prn-Qty-Sold.
           MOVE Cust-Sales-Value TO Prn-Sales-Value.

           WRITE Print-Line FROM Customer-Sales-Line AFTER
           ADVANCING 2 LINES.
