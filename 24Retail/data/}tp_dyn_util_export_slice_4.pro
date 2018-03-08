601,100
602,"}tp_dyn_util_export_slice_4"
562,"NULL"
586,
585,
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
pBlob
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
pBlob,"None"
pSlicer,"*|*|*|*|..."
pAlt,"Y"
pDelimiter,"9"
pQuote,"0"
637,7
pExecutionId,""
pCube,""
pBlob,""
pSlicer,""
pAlt,""
pDelimiter,""
pQuote,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,49
#******
#******
#***BEGIN(Prolog): }tp_dyn_util_export_slice_4
#******
DatasourceASCIIDelimiter = char(StringToNumber(pDelimiter));
DatasourceASCIIQuoteCharacter = char(StringToNumber(pQuote));
SetOutputCharacterSet(pBlob | '.blb', 'TM1CS_UTF8');
If (CubeExists(pCube) = 0);
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
vIndex1= 1;
While (vIndex1 <= cDimSize1);
vElement1 = DIMNM(cDim1, vIndex1);
vElement2 = '1627d785-433f-4e5a-89bd-26f39a90e7af';
vIndex3= 1;
While (vIndex3 <= cDimSize3);
vElement3 = DIMNM(cDim3, vIndex3);
vElement4 = 'Rights';
If (DTYPE(cDim4, vElement4) @= 'S');
vValue = CellGetS(pCube, vElement1, vElement2, vElement3, vElement4);
Else;
vValue = NumberToString(CellGetN(pCube, vElement1, vElement2, vElement3, vElement4));
EndIf;
If (SCAN('.blb', pBlob) = 0);
pBlob = pBlob | '.blb';
EndIf;
If (vValue @<> '');
If (pAlt @= 'Y');
TextOutput(pBlob, vValue, vElement1, vElement3);
Else;
TextOutput(pBlob, vElement1, vElement3, vValue);
EndIf;
EndIf;
vIndex3 = vIndex3 + 1;
End;
vIndex1 = vIndex1 + 1;
End;
#******
#***END(Prolog): }tp_dyn_util_export_slice_4
#******

573,1

574,1

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
