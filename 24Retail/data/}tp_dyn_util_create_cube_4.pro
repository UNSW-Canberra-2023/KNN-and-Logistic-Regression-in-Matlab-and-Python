601,100
602,"}tp_dyn_util_create_cube_4"
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
560,5
pExecutionId
pCubeName
pDimensions
pDelete
pDelimiter
561,5
2
2
2
2
2
590,5
pExecutionId,"None"
pCubeName,"None"
pDimensions,"None"
pDelete,"Y"
pDelimiter,"*"
637,5
pExecutionId,""
pCubeName,""
pDimensions,""
pDelete,""
pDelimiter,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,20
#******
#******
#***BEGIN(Prolog): }tp_dyn_util_create_cube_4
#******
If (pDelimiter @= '');
pDelimiter = '*';
EndIf;
If (pDelete @= 'Y');
If (CubeExists(pCubeName) <> 0);
CubeDestroy(pCubeName);
EndIf;
EndIf;
If (CubeExists(pCubeName) = 0);
CubeCreate(pCubeName, 'organization', '}Groups', '}tp_intermediate_security_applications', '}tp_intermediate_security_measures');
CubeSetLogChanges(pCubeName, 1);
EndIf;
#******
#***END(Prolog): }tp_dyn_util_create_cube_4
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
