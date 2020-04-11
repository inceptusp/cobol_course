       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOCADORA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY FCARQCLIENTES.
       COPY FCFILME.
       DATA DIVISION.
       FILE SECTION.
       COPY FDARQCLIENTES.
       COPY FDFILME.
       WORKING-STORAGE SECTION.
           COPY WS-SEC.
        SCREEN SECTION.
           COPY BLANK-SCREEN.
           COPY MENUU.
           COPY ALUGAR.
           COPY ALUGAR2.
           COPY DEVOLVER.
           COPY DEVOLVER2.
           COPY RELATORIOS.
           COPY DADOSFILME.
           COPY DADOSCLIENTE.
           COPY ALUGADO.
           COPY GERENCIAR.
           COPY CADCLIENTE.
           COPY CADFILME.
           COPY ERROSCREEN.
           COPY FILEERROSCREEN.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY MENUU.
           ACCEPT MENUU.
           EVALUATE OP
               WHEN 1
                   GO TO ALUGAR-PROCEDURE
               WHEN 2
                   GO TO DEVOLVER-PROCEDURE
               WHEN 3
                   GO TO RELATORIOS-PROCEDURE
               WHEN 4
                   GO TO GERENCIAR-PROCEDURE
               WHEN 5
                   STOP RUN
               WHEN OTHER
                   DISPLAY ERROSCREEN
                   ACCEPT INUTIL AT LINE 04 COL 01
                   GO TO MAIN-PROCEDURE
           END-EVALUATE.
       ALUGAR-PROCEDURE.
           DISPLAY ALUGAR.
           ACCEPT ALUGAR.
           OPEN I-O ARQ-FILMES.
           IF WS-FS <> 0
               DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
               CLOSE ARQ-FILMES
               DISPLAY FILEERROSCREEN
               ACCEPT INUTIL AT LINE 04 COL 01
               GO TO MAIN-PROCEDURE
           END-IF
           MOVE SFILME TO FCOD.
           START ARQ-FILMES KEY IS EQUAL TO FCOD
               INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
           END-START
           READ ARQ-FILMES.
           MOVE FCOD TO WS-FCOD.
           MOVE FNOME TO WS-FNOME.
           MOVE FSIN TO WS-FSIN.
           DISPLAY DADOSFILME.
           ACCEPT INUTIL AT LINE 07 COL 03.
           DISPLAY ALUGAR2.
           ACCEPT ALUGAR2.
           MOVE SCLIENTE TO FACPF.
           REWRITE REG-FILMES.
           CLOSE ARQ-FILMES.
           GO TO MAIN-PROCEDURE.
       DEVOLVER-PROCEDURE.
           DISPLAY DEVOLVER.
           ACCEPT DEVOLVER.
           OPEN I-O ARQ-FILMES.
           IF WS-FS <> 0
               DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
               CLOSE ARQ-FILMES
               DISPLAY FILEERROSCREEN
               ACCEPT INUTIL AT LINE 04 COL 01
               GO TO MAIN-PROCEDURE
           END-IF
           MOVE SFILME TO FCOD.
           START ARQ-FILMES KEY IS EQUAL TO FCOD
               INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
           END-START
           READ ARQ-FILMES.
           MOVE FCOD TO WS-FCOD.
           MOVE FNOME TO WS-FNOME.
           MOVE FSIN TO WS-FSIN.
           MOVE FACPF TO WS-FACPF.
           MOVE FACPF TO CCPF.
           OPEN INPUT ARQ-CLIENTES.
           IF WS-FS <> 0
               DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
               CLOSE ARQ-CLIENTES
               DISPLAY FILEERROSCREEN
               ACCEPT INUTIL AT LINE 04 COL 01
               GO TO MAIN-PROCEDURE
           END-IF
           START ARQ-CLIENTES KEY IS EQUAL TO CCPF
               INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
           END-START
           READ ARQ-CLIENTES.
           MOVE CNOME TO WS-CNOME.
           DISPLAY DEVOLVER2.
           ACCEPT DEVOLVER2.
           IF DCONF = "S"
               MOVE ZEROES TO FACPF
               REWRITE REG-FILMES
           ELSE
               DISPLAY BLANK-SCREEN
               DISPLAY "DEVOLUÇÃO CANCELADA"
               ACCEPT INUTIL AT LINE 04 COL 01
           END-IF
           CLOSE ARQ-CLIENTES.
           CLOSE ARQ-FILMES.
           GO TO MAIN-PROCEDURE.
       RELATORIOS-PROCEDURE.
           DISPLAY RELATORIOS.
           ACCEPT RELATORIOS.
           EVALUATE OP
               WHEN 1
                   OPEN INPUT ARQ-FILMES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-FILMES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   MOVE ZEROES TO FCOD
                   START ARQ-FILMES KEY IS GREATER THAN FCOD
                       INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
                   END-START
                   READ ARQ-FILMES NEXT RECORD
                       AT END MOVE "Y" TO WS-EOF
                       NOT AT END MOVE "N" TO WS-EOF
                   END-READ
                   PERFORM UNTIL WS-EOF = "Y"
                       MOVE FCOD TO WS-FCOD
                       MOVE FNOME TO WS-FNOME
                       MOVE FSIN TO WS-FSIN
                       DISPLAY DADOSFILME
                       ACCEPT INUTIL AT LINE 07 COL 03
                       READ ARQ-FILMES NEXT RECORD
                           AT END MOVE "Y" TO WS-EOF
                       END-READ
                   END-PERFORM
                   CLOSE ARQ-FILMES
               WHEN 2
                   OPEN INPUT ARQ-CLIENTES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-CLIENTES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   MOVE ZEROES TO CCPF
                   START ARQ-CLIENTES KEY IS GREATER THAN CCPF
                       INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
                   END-START
                   READ ARQ-CLIENTES NEXT RECORD
                           AT END MOVE "Y" TO WS-EOF
                           NOT AT END MOVE "N" TO WS-EOF
                   END-READ
                   PERFORM UNTIL WS-EOF = "Y"
                       MOVE CCPF TO WS-CCPF
                       MOVE CNOME TO WS-CNOME
                       MOVE CCEP TO WS-CCEP
                       MOVE CRUA TO WS-CRUA
                       MOVE CNUM TO WS-CNUM
                       MOVE CBAI TO WS-CBAI
                       MOVE CCID TO WS-CCID
                       MOVE CUF TO WS-CUF
                       DISPLAY DADOSCLIENTE
                       ACCEPT INUTIL AT LINE 12 COL 03
                       READ ARQ-CLIENTES NEXT RECORD
                           AT END MOVE "Y" TO WS-EOF
                       END-READ
                   END-PERFORM
                   CLOSE ARQ-CLIENTES
               WHEN 3
                   OPEN INPUT ARQ-FILMES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-FILMES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   OPEN INPUT ARQ-CLIENTES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-CLIENTES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   MOVE ZEROES TO FCOD
                   START ARQ-FILMES KEY IS GREATER THAN FCOD
                       INVALID KEY DISPLAY "ERRO" AT LINE 20 COL 01
                   END-START
                   READ ARQ-FILMES NEXT RECORD
                       AT END MOVE "Y" TO WS-EOF
                       NOT AT END MOVE "N" TO WS-EOF
                   END-READ
                   PERFORM UNTIL WS-EOF = "Y"
                       MOVE FCOD TO WS-FCOD
                       MOVE FNOME TO WS-FNOME
                       MOVE FSIN TO WS-FSIN
                       MOVE FACPF TO WS-FACPF
                       MOVE FACPF TO CCPF
                       IF FACPF <> ZEROES
                           START ARQ-CLIENTES KEY IS EQUAL TO CCPF
                               NOT INVALID KEY READ ARQ-CLIENTES
                           END-START
                           MOVE CNOME TO WS-CNOME
                           DISPLAY ALUGADO
                           ACCEPT INUTIL AT LINE 09 COL 03
                       END-IF
                       READ ARQ-FILMES NEXT RECORD
                           AT END MOVE "Y" TO WS-EOF
                       END-READ
                   END-PERFORM
                   DISPLAY BLANK-SCREEN
                   DISPLAY "NÃO HÁ MAIS FILMES ALUGADOS"
                   ACCEPT INUTIL AT LINE 04 COL 01
                   CLOSE ARQ-FILMES
                   CLOSE ARQ-CLIENTES
               WHEN 4
                   GO TO MAIN-PROCEDURE
               WHEN OTHER
                   DISPLAY ERROSCREEN
                   ACCEPT INUTIL AT LINE 04 COL 01
                   GO TO RELATORIOS-PROCEDURE
           END-EVALUATE.
           GO TO MAIN-PROCEDURE.
       GERENCIAR-PROCEDURE.
           DISPLAY GERENCIAR.
           ACCEPT GERENCIAR.
           EVALUATE OP
               WHEN 1
                   OPEN EXTEND ARQ-CLIENTES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-CLIENTES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   DISPLAY CADCLIENTE
                   ACCEPT CADCLIENTE
                   MOVE WS-CLIENTES TO REG-CLIENTES
                   WRITE REG-CLIENTES
                   CLOSE ARQ-CLIENTES
                   GO TO MAIN-PROCEDURE
               WHEN 2
                   OPEN EXTEND ARQ-FILMES
                   IF WS-FS <> 0
                       DISPLAY "ERRO NA ABERTURA WS-FS: " WS-FS
                       CLOSE ARQ-FILMES
                       DISPLAY FILEERROSCREEN
                       ACCEPT INUTIL AT LINE 04 COL 01
                       GO TO MAIN-PROCEDURE
                   END-IF
                   DISPLAY CADFILME
                   ACCEPT CADFILME
                   MOVE ZEROES TO WS-FACPF
                   MOVE WS-FILMES TO REG-FILMES
                   WRITE REG-FILMES
                   CLOSE ARQ-FILMES
                   GO TO MAIN-PROCEDURE
               WHEN 3
                   GO TO MAIN-PROCEDURE
               WHEN OTHER
                   DISPLAY ERROSCREEN
                   ACCEPT INUTIL AT LINE 04 COL 01
                   GO TO GERENCIAR-PROCEDURE
           END-EVALUATE.
           GO TO MAIN-PROCEDURE.
       END PROGRAM LOCADORA.
