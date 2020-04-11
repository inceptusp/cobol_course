           01 ALUGADO.
               02 BLANK SCREEN.
               02 LINE 01 COL 01 VALUE "*********FILME ALUGADO********".
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
