           01 DADOSFILME.
               02 BLANK SCREEN.
               02 LINE 01 COL 01 VALUE "************DADOS************".
               02 LINE 02 COL 03 VALUE "FILME ".
               02 LINE 02 COL 09 PIC 9(4) FROM WS-FCOD.
               02 LINE 03 COL 03 VALUE "TÍTULO: ".
               02 LINE 03 COL 11 PIC X(50) FROM WS-FNOME.
               02 LINE 04 COL 03 VALUE "SINOPSE: ".
               02 LINE 04 COL 12 PIC X(256) FROM WS-FSIN.
               02 LINE 05 COL 03 VALUE "PRESSIONE ENTER...".
