       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT.
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT INPUTASSO ASSIGN TO "Aludados.dat".
               SELECT OUTPUTASSO ASSIGN TO "SortAlu.dat".
               SELECT WORK ASSIGN TO "Arqtemp.dat".
       DATA DIVISION.
       FILE SECTION.
           FD INPUTASSO.
               01 INPUT-STUDENT.
                   05 STUDENT-ID-I PIC 9(3).
                   05 STUDENT-NAME-I PIC A(25).
            FD OUTPUTASSO.
               01 OUTPUT-STUDENT.
                   05 STUDENT-ID-O PIC 9(3).
                   05 STUDENT-NAME-O PIC A(25).
            SD WORK.
               01 WORK-STUDENT.
                   05 STUDENT-ID-W PIC 9(3).
                   05 STUDENT-NAME-W PIC A(25).
       PROCEDURE DIVISION.
           SORT WORK ON ASCENDING KEY STUDENT-ID-O
           USING INPUTASSO GIVING OUTPUTASSO.
           DISPLAY 'Sort Successful'.
       STOP RUN.
