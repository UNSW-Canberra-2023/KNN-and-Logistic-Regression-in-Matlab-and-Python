601,100
602,"copy_version"
562,"VIEW"
586,"Revenue"
585,"Revenue"
564,
565,"k?1=_ho[`IqaRJr=VQBTTSzI=HT<TO^u]i>Hnv;UbxAr0VI8Kp^z0LuvuBsC:@Ykq;C1CGA@G@V\Tad29lDTeW<aX_W6KakheQZd6bHqVA2m@C=EbU]zELKH6HrKQHnNY2<p=]lMAUGDo1^wlswI_;T?;y`gS;U9m[Z?=RBKdAe;u\m`=>Asyacmq:Ac0RbE`3;buG\7"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,zCopyFrom
571,
569,0
592,0
599,1000
560,7
pFromVersion
pToVersion
pCubeName
pNumberDims
pVersionDimLoc
pStringDimName
pStringDimLoc
561,7
2
2
2
1
1
2
1
590,7
pFromVersion,"Budget"
pToVersion,"Budget 2"
pCubeName,"Revenue"
pNumberDims,7
pVersionDimLoc,6
pStringDimName,"Month"
pStringDimLoc,4
637,7
pFromVersion,"Copy From Version"
pToVersion,"Copy To Version"
pCubeName,"CubeName"
pNumberDims,"Number of Dimensions"
pVersionDimLoc,"Location of Version Dimension"
pStringDimName,"Name of Dimension Containing Strings"
pStringDimLoc,"Location of Dimension Containing Strings"
577,11
V1
V2
V3
V4
V5
V6
V7
V8
NVALUE
SVALUE
VALUE_IS_STRING
578,11
2
2
2
2
2
2
2
2
1
2
1
579,11
1
2
3
4
5
6
7
8
9
10
11
580,11
0
0
0
0
0
0
0
0
0
0
0
581,11
0
0
0
0
0
0
0
0
0
0
0
582,10
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarName=V9VarType=32ColType=827VarFormulaDestination=BOTH
VarName=V10VarType=32ColType=827VarFormulaDestination=BOTH
931,1
0,0,0,0,0,0,0,0,0,0,
603,0
572,36

#****Begin: Generated Statements***
#****End: Generated Statements****

StartTime=Time;

DatasourceNameForServer=pCubeName;
DatasourceCubeview='zCopyFrom';
V1='';
V2='';
V3='';
V4='';
V5='';
V6='';
V7='';
V8='';
V9='';
V10='';
W1='';
W2='';
W3='';
W4='';
W5='';
W6='';
W7='';
W8='';
W9='';
W10='';
N1=0;
S1='';






573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,115

#****Begin: Generated Statements***
#****End: Generated Statements****



IF(pStringDimLoc=4);vStringDimValue=V4;
ELSEIF(pStringDimLoc=5);vStringDimValue=V5;
ELSEIF(pStringDimLoc=6);vStringDimValue=V6;
ELSEIF(pStringDimLoc=7);vStringDimValue=V7;
ELSEIF(pStringDimLoc=8);vStringDimValue=V8;
ELSEIF(pStringDimLoc=9);vStringDimValue=V9;
ELSEIF(pStringDimLoc=10);vStringDimValue=V10;
ELSEIF(pStringDimLoc=1);vStringDimValue=V1;
ELSEIF(pStringDimLoc=2);vStringDimValue=V2;
ELSEIF(pStringDimLoc=3);vStringDimValue=V3;
ENDIF;

W1=V1;
W2=V2;
W3=V3;
W4=V4;
W5=V5;
W6=V6;
W7=V7;
W8=V8;
W9=V9;
W10=V10;

IF (pVersionDimLoc = 5);W5=pToVersion;
ELSEIF (pVersionDimLoc = 6);W6=pToVersion;
ELSEIF (pVersionDimLoc = 7);W7=pToVersion;
ELSEIF (pVersionDimLoc = 8);W8=pToVersion;
ELSEIF (pVersionDimLoc = 9);W9=pToVersion;
ELSEIF (pVersionDimLoc = 10);W10=pToVersion;
ELSEIF (pVersionDimLoc = 1);W1=pToVersion;
ELSEIF (pVersionDimLoc = 2);W2=pToVersion;
ELSEIF (pVersionDimLoc = 3);W3=pToVersion;
ELSEIF (pVersionDimLoc = 4);W4=pToVersion;
ENDIF;

IF (pNumberDims = 5);
  IF (CellIsUpdateable (pCubeName,W1,W2,W3,W4,W5) = 1);
    IF (DTYPE(pStringDimName, vStringDimValue) @= 'S');
        S1=V6;
         CellPutS(S1, pCubeName,W1,W2,W3,W4,W5);
     ELSE;
         N1=StringToNumber(V6);
         CellPutN(N1,pCubeName,W1,W2,W3,W4,W5);
    ENDIF;
  ELSE;
    ItemSkip;
  ENDIF;
ENDIF;

IF (pNumberDims = 6);
  IF (CellIsUpdateable (pCubeName,W1,W2,W3,W4,W5,W6) = 1);
    IF (DTYPE(pStringDimName, vStringDimValue) @= 'S');
         S1=V7;
         CellPutS(S1, pCubeName,W1,W2,W3,W4,W5,W6);
     ELSE;
          N1=StringToNumber(V7);
          CellPutN(N1,pCubeName,W1,W2,W3,W4,W5,W6);
    ENDIF;
  ELSE;
    ItemSkip;
  ENDIF;

ELSEIF (pNumberDims = 7);
  IF (CellIsUpdateable (pCubeName,W1,W2,W3,W4,W5,W6,W7) = 1);
    IF (DTYPE(pStringDimName, vStringDimValue) @= 'S');
         S1=V8;
          CellPutS(S1, pCubeName,W1,W2,W3,W4,W5,W6,W7);
     ELSE;
         N1=StringToNumber(V8);
          CellPutN(N1,pCubeName,W1,W2,W3,W4,W5,W6,W7);
    ENDIF;
  ELSE;
    ItemSkip;
  ENDIF;


ELSEIF (pNumberDims = 3);
  IF (CellIsUpdateable (pCubeName,W1,W2,W3) = 1);
    IF (DTYPE(pStringDimName, vStringDimValue) @= 'S');
         S1=V4;
         CellPutS(S1, pCubeName,W1,W2,W3);
     ELSE;
           N1=StringToNumber(V4);
           CellPutN(N1,pCubeName,W1,W2,W3);
    ENDIF;
  ELSE;
    ItemSkip;
  ENDIF;

ELSEIF (pNumberDims = 4);
  IF (CellIsUpdateable (pCubeName,W1,W2,W3,W4) = 1);
    IF (DTYPE(pStringDimName, vStringDimValue) @= 'S');
         S1=V5;
         CellPutS(S1, pCubeName,W1,W2,W3,W4);
     ELSE;
          N1=StringToNumber(V5);
          CellPutN(N1,pCubeName,W1,W2,W3,W4);
    ENDIF;
  ELSE;
    ItemSkip;
  ENDIF;
ENDIF;


# ASCIIOUTPUT('copydebug.txt','V',V1,V2,V3,V4,V5,V6,V7);
# ASCIIOUTPUT('copydebug.txt','W',W1,W2,W3,W4,W5,W6,W7);



575,6

#****Begin: Generated Statements***
#****End: Generated Statements****

ENDTime=Time;
 #TextOUTPUT('copydebug.txt',pCubeName,StartTime,EndTime);
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,1
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
