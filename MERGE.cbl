       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT.
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT INPUTASSO ASSIGN TO "Aludados.dat".
               SELECT INPUTASSO2 ASSIGN TO "Aludados2.dat".
               SELECT OUTPUTASSO ASSIGN TO "MergeAlu.dat".
               SELECT WORK ASSIGN TO "Arqtemp.dat".
       DATA DIVISION.
       FILE SECTION.
           FD INPUTASSO.
               01 INPUT-STUDENT.
                   05 STUDENT-ID-I PIC 9(3).
                   05 STUDENT-NAME-I PIC A(25).
            FD INPUTASSO2.
               01 INPUT2-STUDENT.
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
           MERGE WORK ON ASCENDING KEY STUDENT-ID-O
           USING INPUTASSO, INPUTASSO2 GIVING OUTPUTASSO.
           DISPLAY 'Merge Successful'.
       STOP RUN.
