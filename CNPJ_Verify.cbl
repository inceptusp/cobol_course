       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CNPJ_Verify.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
              77 CNPJ PIC X(14).
              77 NCNPJ REDEFINES CNPJ PIC 9(1) OCCURS 14.
              77 PESO PIC 9(12) VALUE 543298765432.
              77 NPESO REDEFINES PESO PIC 9(1) OCCURS 12.
              77 ACC PIC 9(3) VALUE ZERO.
              77 I PIC 9(2) VALUE 1.
              77 DV1 PIC 9(1).
              77 DV2 PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
              DISPLAY "Digite seu CNPJ: ".
              ACCEPT CNPJ.
              PERFORM VARYING I FROM 1 BY 1 UNTIL I=13
                     COMPUTE ACC = ACC + (NCNPJ(I) * NPESO(I))
              END-PERFORM.
              COMPUTE ACC = FUNCTION MOD(ACC, 11).
              IF ACC < 2
                     MOVE ZERO TO DV1
              ELSE
                     COMPUTE ACC = ACC - 11
                     MOVE ACC TO DV1
              END-IF.
              MOVE ZERO TO ACC.
              COMPUTE ACC = NCNPJ(1) * 6.
              PERFORM VARYING I FROM 1 BY 1 UNTIL I=13
                     COMPUTE ACC = ACC + (NCNPJ((I + 1)) * NPESO(I))
              END-PERFORM.
              COMPUTE ACC = FUNCTION MOD(ACC, 11).
              IF ACC < 2
                     MOVE ZERO TO DV2
              ELSE
                     COMPUTE ACC = ACC - 11
                     MOVE ACC TO DV2
              END-IF.
              IF NCNPJ(13) = DV1 AND NCNPJ(14) = DV2
                     DISPLAY "CNPJ Válido!"
              ELSE
                     DISPLAY "CNPJ Inválido!"
              END-IF.
              STOP RUN.
       END PROGRAM CNPJ_Verify.