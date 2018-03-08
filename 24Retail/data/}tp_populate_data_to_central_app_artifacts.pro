601,100
602,"}tp_populate_data_to_central_app_artifacts"
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
560,2
pExecutionId
pAppId
561,2
2
2
590,2
pExecutionId,"None"
pAppId,"MyApp"
637,2
pExecutionId,""
pAppId,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,34
cOwnPermissionElement = 'OWN';
cAppSecurityCube = '}ElementSecurity_}tp_applications';
cAppPermSecurityCube = '}CellSecurity_}tp_application_root_permissions';
	
cGroupsDimSize = DIMSIZ('}Groups');
vIndexI = 1;
While (vIndexI <= cGroupsDimSize);
	vGroup = DIMNM('}Groups', vIndexI);
	If (vGroup @<> 'Admin' & vGroup @<> 'DataAdmin' & vGroup @<> 'SecurityAdmin');
		vPerm = CellGetS(cAppSecurityCube, pAppId, vGroup);
		If (vPerm @= 'READ');
			CellPutS('READ', cAppPermSecurityCube, pAppId, cOwnPermissionElement, vGroup);
		Else;
			CellPutS('NONE', cAppPermSecurityCube, pAppId, cOwnPermissionElement, vGroup);
		EndIf;
	EndIf;
	
	vIndexI = vIndexI + 1;
End;

#*** Copy old annotations to new location
cOldAnnotationCube = '}ElementAnnotations_}Dimensions';
cOldElement = '}Annotation_ApplicationID';
cNewAnnotationCube = '}ElementAnnotations_}tp_workflow_actions';
cNewElement = 'ANNOTATE';
cAnnotationData = 'Annotations';
If (CubeExists(cOldAnnotationCube) = 0);
	CellPutS('', cNewAnnotationCube, pAppId, cNewElement, cAnnotationData);
Else;
	vAnnotations = CellGetS(cOldAnnotationCube, pAppId, cOldElement, cAnnotationData);
	CellPutS(vAnnotations, cNewAnnotationCube, pAppId, cNewElement, cAnnotationData);
	CellPutS('', cOldAnnotationCube, pAppId, cOldElement, cAnnotationData);
EndIf;

573,1

574,1

575,1

576,
930,0
638,1
804,0
1217,0
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
