601,100
602,"}tp_dyn_util_import_slice_4"
562,"CHARACTERDELIMITED"
586,"dummy.txt"
585,"dummy.txt"
564,
565,"w4uOy;HIG_jsqiFiRcUToIuab?xQhWYP?i>dSc>IJ]iqw?T<g[FMSO0yFj?Cr^yS;1q@Gy9:veDQCi8xwsFCgvbmAvLDciSuUVhdtkoHSJeJiS\Skq=6N>wfDbjfvCkKQJHiNByI8FWiqsc<e_l_ovEPL3ej0mxXYojj1qtt>z<5@ygQbj?]woO3WW7fxP7CEd0O:=Yb"
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
570,
571,
569,0
592,0
599,1000
560,7
pExecutionId
pCube
pSourceFile
pSlicer
pAlt
pDelimiter
pQuote
561,7
2
2
2
2
2
2
2
590,7
pExecutionId,"None"
pCube,"None"
pSourceFile,"None"
pSlicer,"*1|*2|*3|*4|..."
pAlt,"Y"
pDelimiter,"9"
pQuote,"0"
637,7
pExecutionId,""
pCube,""
pSourceFile,""
pSlicer,""
pAlt,""
pDelimiter,""
pQuote,""
577,3
varValue
varElement1
varElement2
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,0
603,0
572,28
#******
#******
#***BEGIN(Prolog): }tp_dyn_util_import_slice_4
#******
DataSourceType = 'CHARACTERDELIMITED';
DatasourceASCIIDelimiter = CHAR(StringToNumber(pDelimiter));
DatasourceASCIIQuoteCharacter = char(StringToNumber(pQuote));
DatasourceASCIIHeaderRecords = 0;
DatasourceNameForServer = pSourceFile;
SetInputCharacterSet('TM1CS_UTF8');
If (CubeExists(pCube) = 0);
ProcessError;
EndIf;
If (FileExists(pSourceFile) = 0);
ProcessError;
EndIf;
cDim1 = TABDIM(pCube, 1);
cDimSize1= DIMSIZ(cDim1);
cDim2 = TABDIM(pCube, 2);
cDimSize2= DIMSIZ(cDim2);
cDim3 = TABDIM(pCube, 3);
cDimSize3= DIMSIZ(cDim3);
cDim4 = TABDIM(pCube, 4);
cDimSize4= DIMSIZ(cDim4);
#******
#***END(Prolog): }tp_dyn_util_import_slice_4
#******

573,1

574,17
#******
#******
#***BEGIN(Data): }tp_dyn_util_import_slice_4
#******
vElement1 = varElement1;
vElement2 = varElement2;
vElement3 = 'all_applications';
vElement4 = 'StaticRights';
If (DTYPE(cDim4, vElement4) @= 'S');
CellPutS(varValue, pCube, vElement1, vElement2, vElement3, vElement4);
Else;
CellPutN(StringToNumber(varValue), pCube, vElement1, vElement2, vElement3, vElement4);
EndIf;
#******
#***END(Data): }tp_dyn_util_import_slice_4
#******

575,1

576,
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
