           01 DEVOLVER2.
               02 BLANK SCREEN.
               02 LINE 01 COL 01 VALUE "*********DEVOLUÇÃO*********".
               02 LINE 02 COL 03 VALUE "FILME ".
               02 LINE 02 COL 09 PIC 9(4) FROM WS-FCOD.
               02 LINE 03 COL 03 VALUE "TÍTULO: ".
               02 LINE 03 COL 11 PIC X(50) FROM WS-FNOME.
               02 LINE 04 COL 03 VALUE "SINOPSE: ".
               02 LINE 04 COL 12 PIC X(256) FROM WS-FSIN.
               02 LINE 06 COL 03 VALUE "ALUGADO PARA: ".
               02 LINE 07 COL 03 VALUE "CLIENTE: ".
               02 LINE 07 COL 12 PIC X(50) FROM WS-CNOME.
               02 LINE 08 COL 03 VALUE "CPF: ".
               02 LINE 08 COL 08 PIC 9(11) FROM WS-FACPF.
               02 LINE 09 COL 03 VALUE "CONFIRMAR DEVOLUÇÃO?".
               02 LINE 10 COL 03 VALUE "S -> CONFIRMA".
               02 LINE 11 COL 03 PIC X(1) TO DCONF.
