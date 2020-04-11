           77 WS-FS PIC 99.
           77 OP PIC 9 VALUE 0.
           77 WS-EOF PIC A(1).
           77 SFILME PIC 9(4).
           77 SCLIENTE PIC 9(11).
           77 DCONF PIC X(1).
           77 INUTIL PIC 9.
           01 WS-CLIENTES.
               05 WS-CNOME PIC X(50).
               05 WS-CCPF PIC 9(11).
               05 WS-CCEP PIC 9(8).
               05 WS-CRUA PIC X(50).
               05 WS-CNUM PIC 9(5).
               05 WS-CBAI PIC X(50).
               05 WS-CCID PIC X(50).
               05 WS-CUF PIC X(2).
           01 WS-FILMES.
               05 WS-FNOME PIC X(50).
               05 WS-FCOD PIC 9(4).
               05 WS-FSIN PIC X(256).
               05 WS-FACPF PIC 9(11).
