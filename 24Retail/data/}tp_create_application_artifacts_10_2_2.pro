601,100
602,"}tp_create_application_artifacts_10_2_2"
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
pAppId,"None"
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
572,62


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################


#*** Create element security cube of approval dimension

cApprovalDim = ATTRS('}tp_applications', pAppId, 'ApprovalDimension');

If (cApprovalDim @<> '');
	If (DimensionExists(cApprovalDim) = 0);
		ProcessError;
	EndIf;

	cElementSecurityCube = '}ElementSecurity_' | cApprovalDim;
	cIM_ElementSecurityCube = '}tp_intermediate_ElementSecurity}' | cApprovalDim;
	If (CubeExists(cElementSecurityCube) = 0);
		CubeCreate(cElementSecurityCube, cApprovalDim, '}Groups');
	EndIf;

	If (CubeExists(cIM_ElementSecurityCube) <> 0);
		CubeDestroy(cIM_ElementSecurityCube);
	EndIf;
	
	cIntermediateSecurityMeasuresDim = '}tp_intermediate_security_measures';
	cIntermediateApplicationsDim =  '}tp_intermediate_security_applications';
	
	CubeCreate(cIM_ElementSecurityCube, cApprovalDim, '}Groups', cIntermediateApplicationsDim, cIntermediateSecurityMeasuresDim);
	
	
	#***Create task navigation dimension
	cTaskNavDimension = '}tp_task_navigations';
	cNavElemField = 'NavigationElement';
	IF (DimensionExists( cTaskNavDimension) = 0);
		DimensionCreate( cTaskNavDimension);
		DimensionElementInsert( cTaskNavDimension, '',cNavElemField , 'S');
	EndIf;
	
	cTaskNavigationDim = '}tp_task_navigation_dims}' | pAppId;
	IF (DimensionExists(cTaskNavigationDim)=0);
	DimensionCreate(cTaskNavigationDim);
	EndIf;
	
	cApprovalDim = ATTRS('}tp_applications', pAppId, 'ApprovalDimension');
	DimensionElementInsert(cTaskNavigationDim, '', cApprovalDim, 'N');
EndIf;




573,1

574,1

575,47


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################

If (cApprovalDim @<> '');
	cTaskNavigationCube = '}tp_task_navigations}' | pAppId;
	cTaskDimension = '}tp_tasks}' | pAppId;
	cTaskNavigationMeasureDim = '}tp_task_navigations';
	IF (cubeExists(cTaskNavigationCube) =0);
		CubeCreate(cTaskNavigationCube, cTaskDimension, cTaskNavigationDim, cTaskNavigationMeasureDim);
	EndIf;
	
	#*** Fill task navigation cube
	vTotalTasks = DIMSIZ(cTaskDimension);
	looper = 1;
	While (looper <= vTotalTasks);
		vNavigationElem = DIMNM(cTaskDimension, looper);
		CellPutS(vNavigationElem, cTaskNavigationCube, vNavigationElem, cApprovalDim, cNavElemField);
		looper = looper +1;
	End;
EndIf;

#*** Set offline permission to READ
cCognosEveryoneGroup = 'CAMID("::Everyone")';
cTpEveryoneGroup = '}tp_Everyone';
cOfflinePermissionElement = 'OFFLINE';
cAppPermSecurityCube = '}CellSecurity_}tp_application_root_permissions';
If (DIMIX('}Groups', cTpEveryoneGroup) > 0);
	CellPutS('READ', cAppPermSecurityCube, pAppId, cOfflinePermissionElement, cTpEveryoneGroup);
EndIf;

If (DIMIX('}Groups', cCognosEveryoneGroup) > 0);
	CellPutS('READ', cAppPermSecurityCube, pAppId, cOfflinePermissionElement, cCognosEveryoneGroup);
EndIf;

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
