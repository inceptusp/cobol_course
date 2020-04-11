       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULADORA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           77 op PIC 9(1) VALUE 0.
           77 num PIC 9(5).
           77 ndois PIC 9(5).
        SCREEN SECTION.
           01 menuu.
               02 BLANK SCREEN.
               02 LINE 01 COL 01 VALUE "******************************".
               02 LINE 02 COL 13 VALUE "MENU".
               02 LINE 03 COL 03 VALUE "(1) SOMA".
               02 LINE 04 COL 03 VALUE "(2) SUBTRACAO".
               02 LINE 05 COL 03 VALUE "(3) MULTIPLICACAO".
               02 LINE 06 COL 03 VALUE "(4) DIVISAO".
               02 LINE 07 COL 03 VALUE "(5) SAIR".
               02 LINE 08 COL 03 op PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY menuu.
           ACCEPT menuu.
           DISPLAY op.
           ACCEPT num.
           STOP RUN.
       END PROGRAM CALCULADORA.
