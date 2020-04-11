       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CPF_Verify.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
              77 CPF PIC X(11).
              77 NCPF REDEFINES CPF PIC 9(1) OCCURS 11.
              77 ACC PIC 9(3) VALUE ZERO.
              77 I PIC 9(2) VALUE 1.
              77 DV1 PIC 9(1).
              77 DV2 PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
              DISPLAY "Digite seu CPF: ".
              ACCEPT CPF.
              PERFORM VARYING I FROM 1 BY 1 UNTIL I=10
                     COMPUTE ACC = ACC + (NCPF(I) * (11 - I))
              END-PERFORM.
              COMPUTE ACC = FUNCTION MOD(ACC, 11).
              COMPUTE ACC = ACC - 11.
              IF ACC > 9
                     MOVE ZERO TO DV1
              ELSE
                     MOVE ACC TO DV1
              END-IF.
              MOVE ZERO TO ACC.
              PERFORM VARYING I FROM 1 BY 1 UNTIL I=10
                     COMPUTE ACC = ACC + (NCPF(I) * (12 - I))
              END-PERFORM.
              COMPUTE ACC = ACC + (DV1 * 2).
              COMPUTE ACC = FUNCTION MOD(ACC, 11)
              COMPUTE ACC = ACC - 11.
              IF ACC > 9
                     MOVE ZERO TO DV2
              ELSE
                     MOVE ACC TO DV2
              END-IF.
              IF NCPF(10) = DV1 AND NCPF(11) = DV2
                     DISPLAY "CPF Válido!"
              ELSE
                     DISPLAY "CPF Inválido!"
              END-IF.
              STOP RUN.
       END PROGRAM CPF_Verify.