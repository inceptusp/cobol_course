           01 DADOSCLIENTE.
               02 BLANK SCREEN.
               02 LINE 01 COL 01 VALUE "************DADOS************".
               02 LINE 02 COL 03 VALUE "NOME: ".
               02 LINE 02 COL 09 PIC X(50) FROM WS-CNOME.
               02 LINE 03 COL 03 VALUE "CPF: ".
               02 LINE 03 COL 08 PIC 9(11) FROM WS-CCPF.
               02 LINE 04 COL 03 VALUE "CEP: ".
               02 LINE 04 COL 08 PIC 9(8) FROM WS-CCEP.
               02 LINE 05 COL 03 VALUE "RUA: ".
               02 LINE 05 COL 08 PIC X(50) FROM WS-CRUA.
               02 LINE 06 COL 03 VALUE "NUMERO: ".
               02 LINE 06 COL 11 PIC 9(5) FROM WS-CNUM.
               02 LINE 07 COL 03 VALUE "BAIRRO: ".
               02 LINE 07 COL 11 PIC X(50) FROM WS-CBAI.
               02 LINE 08 COL 03 VALUE "CIDADE: ".
               02 LINE 08 COL 11 PIC X(50) FROM WS-CCID.
               02 LINE 09 COL 03 VALUE "UF: ".
               02 LINE 09 COL 07 PIC X(2) FROM WS-CUF.
               02 LINE 10 COL 03 VALUE "PRESSIONE ENTER...".
