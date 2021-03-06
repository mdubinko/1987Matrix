10 REM    ---------------------------
20 REM   | MATRIX by Micah Dubinko   |
30 REM    ---------------------------
40 CLS:SCREEN 0:WIDTH 40:KEY OFF
50 OPTION BASE 1
60 DIM C%(4,2),N%(4),B%(4),M$(19)
70 X=1:Y=2:B$=CHR$(219)
80 COLORA=9:COLORB=4:COLORC=7:GOSUB 9000
90 RANDOMIZE TIMER
110 LN$=CHR$(176)+"          "+CHR$(176)
120 LOCATE 2,1:COLOR COLORA
130 FOR Q=1 TO 13
140 PRINT "   ";LN$
150 NEXT Q
160 PRINT "   "LN$;" ";
170 FOR Q=1 TO 8:PRINT CHR$(176);:NEXT Q
180 PRINT:FOR Q=1 TO 5
190 PRINT "   ";LN$;" ";CHR$(176);
200 PRINT "      ";CHR$(176)
210 NEXT Q
220 PRINT "   ";LN$;" ";:COLOR COLORC: PRINT "--NEXT--"
230 COLOR COLORA:PRINT "   ";:FOR Q=1 TO 12
240 PRINT CHR$(176);:NEXT Q
250 GOSUB 4000
260 LOCATE 5,18:PRINT "SCORE: ";INT(SC):GOSUB 5000:GOSUB 4000
270 LOCATE 10,18:PRINT USING "RATE .### SEC";R
280 LOCATE 12,18:PRINT "LINES: ";LNS
1000 T=TIMER
1020 I$=INKEY$:IF I$<>"" THEN I$=RIGHT$(I$,1) ELSE GOTO 1070
1030 IF I$="K" OR I$="M" OR I$="P" OR I$=" " THEN 1050 ELSE 1070
1050 K=ASC(I$)
1060 GOTO 1090
1070 K=0
1090 IF K=75 OR K=77 THEN GOSUB 6000:GOTO 1120
1095 IF K=80 THEN GOSUB 7000
1100 IF K=32 THEN SC=SC+1:GOSUB 8000
1110 IF T>TIMER-R THEN 1020
1120 GOSUB 8000
1130 IF C=0 THEN GOTO 1000
1140 N%(1)=0:N%(2)=0:N%(3)=0:N%(4)=0
1145 S=0
1150 IF S>9 THEN S=0:GOTO 1170
1160 IF SCREEN (3+CY,5+S)=219 THEN S=S+1:GOTO 1150 ELSE S=0:GOTO 1180
1170 N%(1)=CY
1175 IF S>9 THEN S=0:GOTO 1190
1180 IF SCREEN (3+CY-C%(2,Y),5+S)=219 THEN S=S+1:GOTO 1175 ELSE S=0:GOTO 1200
1190 N%(2)=CY-C%(2,Y)
1195 IF S>9 THEN S=0:GOTO 1210
1200 IF SCREEN (3+CY-C%(3,Y),5+S)=219 THEN S=S+1:GOTO 1195 ELSE S=0:GOTO 1220
1210 N%(3)=CY-C%(3,Y)
1215 IF S>9 THEN S=0:GOTO 1230
1220 IF SCREEN (3+CY-C%(4,Y),5+S)=219 THEN S=S+1:GOTO 1215 ELSE S=0:GOTO 1235
1230 N%(4)=CY-C%(4,Y)
1235 IF N%(1)=0 AND N%(2)=0 AND N%(3)=0 AND N%(4)=0 THEN SC=SC+1/R:GOTO 260
1240 FOR Q=1 TO 4
1250 IF N%(Q)>0 AND SCREEN (3+CY-C%(Q,Y),5)=219 THEN LOCATE 3+CY-C%(Q,Y),5:COLOR 0,COLORC:PRINT "          "
1260 NEXT Q
1265 FOR Q=1 TO 19:M$(Q)="":NEXT Q
1270 FOR Q=1 TO 19
1280 FOR LP=0 TO 9
1290 M$(Q)=M$(Q)+CHR$(SCREEN (2+Q,5+LP))
1300 NEXT LP
1310 NEXT Q
1311 FOR Q=4 TO 1 STEP -1
1312 BIG=N%(1):NUM=1
1313 FOR LP=2 TO 4
1314 IF N%(LP)>BIG THEN BIG=N%(LP):NUM=LP
1315 NEXT LP
1316 B%(Q)=N%(NUM)
1317 N%(NUM)=0
1318 NEXT Q
1319 LOCATE 8,18:PRINT B%(1)" "B%(2)" "B%(3)" "B%(4)"  ":LST=0
1320 FOR Q=1 TO 4
1325 IF B%(Q)=LST THEN 1340
1330 IF B%(Q)>2 THEN FOR LP=B%(Q) TO 2 STEP -1:M$(LP+1)=M$(LP):NEXT LP:LST=B%(Q):LNS=LNS+1
1340 NEXT Q
1345 COLOR COLORB,0
1350 FOR Q=1 TO 19
1360 LOCATE 2+Q,5:PRINT M$(Q)
1370 NEXT Q
1375 SS=1/R+4^(SGN(B%(1))+SGN(B%(2))+SGN (B%(3))+SGN (B%(4))):R=R*.95
1377 LOCATE 2,30:PRINT INT(SS):SC=SC+SS
1380 GOTO 260
3999 END
4000 REM  SUBROUTINE #1 - CHOOSE NEXT
4010 REM
4020 RN=INT(RND*7):RN=RN+1
4030 ON RN GOTO 4040,4060,4080,4100,4120,4140,4160
4040 DX=1:EX=2:FX=3
4050 DY=0:EY=0:FY=0:GOTO 4171
4060 DX=0:EX=1:FX=2
4070 DY=-1:EY=0:FY=0:GOTO 4171
4080 DX=0:EX=1:FX=2
4090 DY=-1:EY=-1:FY=-1:GOTO 4171
4100 DX=0:EX=1:FX=1
4110 DY=-1:EY=0:FY=-1:GOTO 4171
4120 DX=1:EX=1:FX=2
4130 DY=0:EY=-1:FY=-1:GOTO 4171
4140 DX=1:EX=1:FX=2
4150 DY=0:EY=1:FY=1:GOTO 4171
4160 DX=1:EX=1:FX=2
4170 DY=0:EY=-1:FY=0
4171 LOCATE 17,19:PRINT "    ";
4172 LOCATE 18,19:PRINT "    ";
4173 LOCATE 19,19:PRINT "    ";
4180 LOCATE 18,19:COLOR COLORB
4190 PRINT B$;
4200 LOCATE 18-DY,19+DX:PRINT B$;
4210 LOCATE 18-EY,19+EX:PRINT B$;
4220 LOCATE 18-FY,19+FX:PRINT B$;
4230 RETURN
4300 REM
4400 REM
5000 REM  SUBROUTINE #2 TRANSFER "NEXT"
5010 REM
5020 CX=3 ' STARTING POSITION AT
5030 CY=1  ' TOP OF PLAYING FIELD
5040 C%(2,X)=DX
5050 C%(2,Y)=DY
5060 C%(3,X)=EX
5070 C%(3,Y)=EY
5080 C%(4,X)=FX
5090 C%(4,Y)=FY
5095 IF SCREEN (4,8)=219 THEN GOTO 9900
5100 LOCATE 3+CY,5+CX
5110 PRINT B$;
5120 FOR Q=2 TO 4
5130 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X)
5140 PRINT B$;
5150 NEXT Q
5260 RETURN
5270 REM
5280 REM
6000 REM SUBROUTINE #3 - MOVE LEFT/RIGHT
6010 REM
6020 IF K=75 THEN DR=-1 ELSE DR=+1
6022 LOCATE 3+CY,5+CX:PRINT " ";
6024 FOR Q=2 TO 4
6026 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT " ";
6028 NEXT Q
6030 CX=CX+DR
6040 IF SCREEN (3+CY,5+CX)=219 THEN 6240
6050 L=2
6060 IF SCREEN (3+CY-C%(L,Y),5+CX+C%(L,X))=219 THEN 6240
6070 L=L+1:IF L<5 THEN 6060
6080 REM
6120 IF CX<0 OR CX>9 THEN 6240
6130 L=2
6140 IF CX+C%(L,X)<0 OR CX+C%(L,X)>9 THEN GOTO 6240
6150 L=L+1
6160 IF L<5 THEN 6140
6170 LOCATE 3+CY,5+CX:PRINT B$;
6180 FOR Q=2 TO 4
6200 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X)
6210 PRINT B$;
6220 NEXT Q:PRINT
6230 RETURN
6240 CX=CX-DR
6250 LOCATE 3+CY,5+CX:PRINT B$;
6260 FOR Q=2 TO 4
6270 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT B$;
6280 NEXT Q
6290 RETURN
6300 REM
6310 REM
7000 REM SUBROUTINE #4 - ROTATE PIECE
7010 REM
7020 FOR Q=2 TO 4
7030 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT " ";
7040 NEXT Q
7050 REM
7060 FOR Q=2 TO 4
7070 SWAP C%(Q,X),C%(Q,Y)
7080 C%(Q,X)=-C%(Q,X)
7090 NEXT Q
7100 REM
7105 IF CX<0 OR CX>10 OR CY>18 THEN 7150
7110 L=2
7120 IF SCREEN (3+CY-C%(L,Y),5+CX+C%(L,X))=219 THEN 7150
7123 IF CX+C%(L,X)<0 THEN 7150
7125 IF CX+C%(L,X)>9 THEN 7150
7127 IF CY-C%(L,Y)>18 THEN 7150
7130 L=L+1
7140 IF L=5 THEN 7220 ELSE 7120
7150 FOR Q=2 TO 4
7160 SWAP C%(Q,Y),C%(Q,X)
7170 C%(Q,Y)=-C%(Q,Y)
7180 LOCATE 3+CY-C(Q,Y),5+CX+C(Q,X):PRINT B$;
7190 NEXT Q
7200 RETURN
7210 REM
7220 FOR Q=2 TO 4
7240 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT B$
7260 NEXT Q:PRINT
7270 RETURN
7280 REM
7290 REM
8000 REM SUBROUTINE #5 - DROP ONE ROW
8010 REM
8020 C=0 'COLLISION FLAG
8022 LOCATE 3+CY,5+CX:PRINT " ";
8024 FOR Q=2 TO 4
8025 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X)
8026 PRINT " ";
8028 NEXT Q
8030 IF SCREEN (4+CY,5+CX)<>32 THEN 8210
8035 IF CY>18 THEN 8210
8040 L=2
8050 IF SCREEN (4+CY-C%(L,Y),5+CX+C%(L,X))=219 THEN 8210
8055 IF 1+CY-C%(L,Y)>18 THEN 8210
8060 L=L+1:IF L<5 THEN 8050
8120 CY=CY+1
8130 LOCATE 3+CY,5+CX:PRINT B$;
8140 FOR Q=2 TO 4
8160 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT B$;
8180 NEXT Q:PRINT
8200 RETURN
8210 C=1
8220 LOCATE 3+CY,5+CX:PRINT B$;
8230 FOR Q=2 TO 4
8240 LOCATE 3+CY-C%(Q,Y),5+CX+C%(Q,X):PRINT B$;
8250 NEXT Q
8260 RETURN
9000 REM INTRO SUBROUTINE
9010 CLS
9030 TITLE$="MATRIX--By  Micah Dubinko"
9040 LOCATE 8,(40-LEN(TITLE$))/2
9050 FOR Q%=1 TO LEN(TITLE$)
9060 IF Q%/2=INT(Q%/2) THEN COLOR COLORA ELSE COLOR COLORB
9070 PRINT MID$(TITLE$,Q%,1);
9080 NEXT Q%
9090 COLOR COLORA+16,COLORB:PRINT "       €€ HIT ANY KEY TO GO!! €€       "
9100 I$=INKEY$:IF I$="" THEN 9100
9110 I$=INKEY$:IF I$<>"" THEN 9110
9120 COLOR 7,0:CLS:LOCATE 10:PRINT "STARTING RATE (IN SECONDS - ":INPUT R$:R=VAL (R$):IF R=0 THEN 9010
9130 CLS:RETURN
9900 FOR Q=1 TO 18
9910 LOCATE 3+Q,5:PRINT "€€€€€€€€€€"
9920 NEXT Q
9930 LOCATE 18,25
9940 INPUT "PLAY AGAIN";PL$
9950 IF PL$="Y" OR PL$="y" THEN RUN
9960 END
