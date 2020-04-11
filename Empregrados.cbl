       IDENTIFICATION DIVISION. 
       PROGRAM-ID. Empregados-ST.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 EMPREGADOS.
               05 EMPREGADO 
               OCCURS 20 TIMES
               ASCENDING KEY IS IDT
               INDEXED BY I-EMP.
                   10 IDT PIC 9(5).
                   10 NOME PIC X(30).
                   10 NASCIMENTO PIC X(10).
                   10 CATEGORIA PIC X(10).
                   10 SECAO PIC X(10).
                   10 HORA-ALMOCO PIC X(5).
                   10 HORA-ENTRADA PIC X(5).
                   10 HORA-SAIDA PIC X(5).
                   10 HORAS-SEMANAIS PIC 9(2).
                   10 SALARIO PIC S9(6)V9(2).
            77 I PIC 9(2).
            77 TMP-i PIC 9(5).
            77 IND PIC S9(8).
            77 MENU-OP PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           SET I-EMP TO 1.
           GO TO MENU-PROCEDURE.
           PAR-EXT.
           STOP RUN.
       ADD-EMPREGADO-PROCEDURE.
           CALL "SYSTEM" USING "clear".
           IF I-EMP > 21
               DISPLAY "BASE CHEIA!"
           ELSE
               DISPLAY "ENTRE O ID: "
               ACCEPT IDT (I-EMP)
               DISPLAY "ENTRE O NOME: "
               ACCEPT NOME (I-EMP)
               DISPLAY "ENTRE O NASCIMENTO: "
               ACCEPT NASCIMENTO (I-EMP)
               DISPLAY "ENTRE A CATEGORIA: "
               ACCEPT CATEGORIA (I-EMP)
               DISPLAY "ENTRE A SECAO: "
               ACCEPT SECAO (I-EMP)
               DISPLAY "ENTRE O HORARIO DE ALMOCO: "
               ACCEPT HORA-ALMOCO (I-EMP)
               DISPLAY "ENTRE O HORARIO DE ENTRADA: "
               ACCEPT HORA-ENTRADA (I-EMP)
               DISPLAY "ENTRE O HORARIO DE SAIDA: "
               ACCEPT HORA-SAIDA (I-EMP)
               DISPLAY "ENTRE A QUANTIDADE DE HORAS SEMANAIS: "
               ACCEPT HORAS-SEMANAIS (I-EMP)
               DISPLAY "ENTRE O SALARIO: "
               ACCEPT SALARIO (I-EMP)
               DISPLAY "FUNCIONARIO " NOME (I-EMP) WITH NO ADVANCING
               DISPLAY "ADICIONADO COM ID " IDT(I-EMP)
           END-IF.
           ACCEPT  TMP-i.
           SET I-EMP UP BY 1.
           GO TO MENU-PROCEDURE.
       SHOW-EMPREGADO-PROCEDURE.
           CALL "SYSTEM" USING "clear".
           MOVE ZERO TO TMP-i.
           DISPLAY "ENTRE O ID DO FUNCIONARIO: " WITH NO ADVANCING.
           ACCEPT TMP-i.
           MOVE I-EMP TO IND.
           SET I-EMP TO 1.
           SEARCH EMPREGADO
               END DISPLAY "FUNCIONARIO NAO ENCONTRADO"
               WHEN IDT(I-EMP) = TMP-i
               DISPLAY "NOME: " NOME (I-EMP)
               DISPLAY "NASCIMENTO: " NASCIMENTO (I-EMP)
               DISPLAY "CATEGORIA: " CATEGORIA (I-EMP)
               DISPLAY "SECAO: " SECAO (I-EMP)
               DISPLAY "HORARIO DE ALMOCO: " HORA-ALMOCO (I-EMP)
               DISPLAY "HORARIO DE ENTRADA: " HORA-ENTRADA (I-EMP)
               DISPLAY "HORARIO DE SAIDA: " HORA-SAIDA (I-EMP)
               DISPLAY "HORAS DE TRAB. SEMANAIS: " 
                   HORAS-SEMANAIS (I-EMP)
               DISPLAY "SALARIO: " SALARIO (I-EMP)
           END-SEARCH.
           SET IND TO I-EMP.
           ACCEPT TMP-i.
           GO TO MENU-PROCEDURE.
       MENU-PROCEDURE.
           CALL "SYSTEM" USING "clear".
           DISPLAY "1. ADICIONAR EMPREGADO".
           DISPLAY "2. EXIBIR DADOS DO EMPREGADO".
           DISPLAY "3. SAIR".
           ACCEPT MENU-OP.
           EVALUATE MENU-OP
               WHEN 1
                   GO TO ADD-EMPREGADO-PROCEDURE
               WHEN 2
                   GO TO SHOW-EMPREGADO-PROCEDURE
               WHEN 3
                   GO TO PAR-EXT
               WHEN OTHER
                   DISPLAY "OPCAO INVALIDA!"
           END-EVALUATE.
       END PROGRAM Empregados-ST.
