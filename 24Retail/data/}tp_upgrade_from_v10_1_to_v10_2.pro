601,100
602,"}tp_upgrade_from_v10_1_to_v10_2"
562,"NULL"
586,
585,
564,
565,"t5XVH4So8VX^R_p?LG\4a`fpyvq5lIK6cx<Sac9p];LNWK37gHx`DZWvB;TqvN2\=hv_teC3pF7oYZuw`MVc<z5@9j=NfS5M@Y`3uhEE\\Kbi_eTXdL2eVgEWLnH:E:Bb:r`U=fUEQ`vZtajQ_QkW5ErOgR0UR4ZI1i[XYnu;Ae[SFoRiG=d9b>4XxbcnDIJYuAYPjPs"
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
pAppId
pVersion
pSubsetAlias
pControl
561,5
2
2
2
2
2
590,5
pExecutionId,"None"
pAppId,"MyApp"
pVersion,"10.1"
pSubsetAlias,"None"
pControl,"N"
637,5
pExecutionId,""
pAppId,""
pVersion,""
pSubsetAlias,""
pControl,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,351

#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2012
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
##################################################################


cControlPrefix = '';
If (pControl @= 'Y');
	cControlPrefix = '}';
EndIf;

#*** Log File Name
cConfigDim = cControlPrefix | 'tp_config';
If (DimensionExists(cConfigDim) = 1);
	cGenerateLog = ATTRS(cConfigDim, 'Generate TI Log', 'String Value');
Else;
	cGenerateLog = 'N';
EndIf;

cTM1Process = GetProcessName();
StringGlobalVariable('gPrologLog');
StringGlobalVariable('gEpilogLog');
StringGlobalVariable('gDataLog');

IF (cGenerateLog @= 'Y' % cGenerateLog @= 'T');
	vReturnValue = ExecuteProcess(cControlPrefix | 'tp_get_log_file_names', 'pExecutionId', pExecutionId,
		'pProcess', cTM1Process, 'pControl', pControl);
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;



#*** Add element: Offline to node info dimension

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Add element: Offline to node info dimension');
EndIf;

cNodeInfoDim = cControlPrefix | 'tp_node_info';
If (DimensionExists(cNodeInfoDim) = 0);
	ProcessError;
EndIf;

cOffline = 'Offline';
cCurrentOwner = 'CurrentOwner';
If (DIMIX(cNodeInfoDim, cOffline) = 0);
	DimensionElementInsert(cNodeInfoDim, cCurrentOwner, cOffline, 'S');
EndIf;



#*** Get approval dimension, approval subset and isActive

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Get approval dimension, approval subset and isActive');
EndIf;

StringGlobalVariable('gApprovalDim');
StringGlobalVariable('gApprovalSubset');
StringGlobalVariable('gIsActive');

vReturnValue = ExecuteProcess(cControlPrefix | 'tp_get_application_attributes', 'pExecutionId', pExecutionId,
	'pAppId', pAppId, 'pControl',  pControl);
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, 'get application attributes', gApprovalDim, gApprovalSubset, gIsActive);
EndIf;



#*** Insert new attributes into applications dimension

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Insert new attributes into applications dimension');
EndIf;

cApplicationsDim = cControlPrefix | 'tp_applications';
cAppAttrDim = '}ElementAttributes_' | cApplicationsDim;

cApprovalShadowDimAttr = 'ApprovalShadowDimension';
cVersionDimension = 'VersionDimension';
cMaintenanceAttr = 'IsRunningMaintenance';
cVersionSlicesWrite = 'VersionSlicesWrite';
cVersionSlicesRead = 'VersionSlicesRead';
cApplicationType = 'ApplicationType';

If (DimensionExists(cApplicationsDim) > 0);
	
	If (DIMIX(cAppAttrDim, cMaintenanceAttr) = 0);
		AttrInsert(cApplicationsDim, '', cMaintenanceAttr, 'S');
	EndIf;

	If (DIMIX(cAppAttrDim, cApprovalShadowDimAttr) = 0);
		AttrInsert(cApplicationsDim, '', cApprovalShadowDimAttr, 'S');
	EndIf;

	If (DIMIX(cAppAttrDim, cVersionSlicesWrite) = 0);
		AttrInsert(cApplicationsDim, '', cVersionSlicesWrite, 'S');
	EndIf;

	If (DIMIX(cAppAttrDim, cVersionSlicesRead) = 0);
		AttrInsert(cApplicationsDim, '', cVersionSlicesRead, 'S');
	EndIf;

	If (DIMIX(cAppAttrDim,  cVersionDimension) = 0);
		AttrInsert(cApplicationsDim, '',  cVersionDimension, 'S');
	EndIf;

	If (DIMIX(cAppAttrDim, cApplicationType) = 0);
		AttrInsert(cApplicationsDim, '', cApplicationType, 'S');
	EndIf;
	
	If (subsetExists(cApplicationsDim, 'Default') = 0);
		SubsetCreate(cApplicationsDim, 'Default');
	EndIf;
	
	SubsetIsAllSet(cApplicationsDim, 'Default', 1);
Else;
	ProcessError;
EndIf;


#*** Create shadow dimension 

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Create the shadow dimension of' | gApprovalDim);
EndIf;
	
vReturnValue = ExecuteProcess('}tp_deploy_create_shadow_dimension', 'pExecutionId', pExecutionId,
	'pAppId', pAppId, 'pApprovalDim', gApprovalDim, 'pApprovalSubset', gApprovalSubset, 'pSubsetAlias', pSubsetAlias);
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;

SaveDataAll;


#*** Insert application ID to intermediate applications dim

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Insert current application id: ' | pAppId);
EndIf;

cIntermediateApplicationsDim =  '}tp_intermediate_security_applications';
cParent = 'all_applications';

If (DIMIX(cIntermediateApplicationsDim, pAppId) = 0);	
	DimensionElementInsert(cIntermediateApplicationsDim, '', pAppId, 'N');
	DimensionElementComponentAdd(cIntermediateApplicationsDim, cParent, pAppId, 1);
EndIf;


#*** Export control cubes and delete application control cubes 

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Export control cubes and delete application control cubes');
EndIf;

cShadowApprovalDim = '}tp_tasks}' | pAppId;
cPermissionsDim = cControlPrefix | 'tp_permissions';
cNodeInfoDim = cControlPrefix | 'tp_node_info';

cPermissionCube = cControlPrefix | 'tp_application_permission}' | pAppId;
cCellSecurityCube = '}CellSecurity_' | cPermissionCube;
cStateCube = cControlPrefix | 'tp_application_state}' | pAppId;

cDefaultView = 'Default';
cAllView = 'All';

If (CubeExists(cCellSecurityCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_export_cube', 'pExecutionId', pExecutionId | cCellSecurityCube,
		'pCube', cCellSecurityCube, 'pBlob', cCellSecurityCube, 'pAlt', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Destroy permission cell security cube: ' | cCellSecurityCube);
	EndIf;
	
	CubeDestroy(cCellSecurityCube);
EndIf;

If (CubeExists(cPermissionCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_export_cube', 'pExecutionId', pExecutionId | cPermissionCube,
		'pCube', cPermissionCube, 'pBlob', cPermissionCube, 'pAlt', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Destroy permission cube: ' | cPermissionCube);
	EndIf;
	
	CubeDestroy(cPermissionCube);
EndIf;

If (CubeExists(cStateCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_export_cube', 'pExecutionId', pExecutionId | cStateCube,
		'pCube', cStateCube, 'pBlob', cStateCube, 'pAlt', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Destroy state cube: ' | cStateCube);
	EndIf;
	
	CubeDestroy(cStateCube);
EndIf;


#*** Recreate application control cubes

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Recreate application control cubes');
EndIf;

If (CubeExists(cPermissionCube) = 0);
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create permission cube: ' | cPermissionCube);
	EndIf;
	
	CubeCreate(cPermissionCube, cShadowApprovalDim, cPermissionsDim);
	CubeSetLogChanges(cPermissionCube, 1);
EndIf;

If (CubeExists(cCellSecurityCube) = 0);
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create permission cell security cube: ' | cCellSecurityCube);
	EndIf;
	
	CubeCreate(cCellSecurityCube, cShadowApprovalDim, cPermissionsDim, '}Groups');
	CubeSetLogChanges(cCellSecurityCube, 1);
EndIf;

	
If (CubeExists(cStateCube) = 0);		
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create state cube: ' | cStateCube);
	EndIf;
	
	CubeCreate(cStateCube, cShadowApprovalDim, cNodeInfoDim);
	CubeSetLogChanges(cStateCube, 1);
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create default view');
	EndIf;
	
	ViewCreate(cStateCube, cDefaultView);
	ViewColumnDimensionSet(cStateCube, cDefaultView, cNodeInfoDim, 1);
	ViewRowDimensionSet(cStateCube, cDefaultView, cShadowApprovalDim, 1);
	ViewSubsetAssign(cStateCube, cDefaultView, cShadowApprovalDim, gApprovalSubset);
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create All view');
	EndIf;
	
	ViewCreate(cStateCube, cAllView);
	ViewColumnDimensionSet(cStateCube, cAllView, cNodeInfoDim, 1);
	ViewRowDimensionSet(cStateCube, cAllView, cShadowApprovalDim, 1);	
EndIf;


#*** Export element security cube of approval dimension and destroy element security cube

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Export element security cube of approval dimension and destroy element security cube');
EndIf;

cElementSecurityCube = '}ElementSecurity_' | gApprovalDim;

If (CubeExists(cElementSecurityCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_export_cube', 'pExecutionId', pExecutionId | cElementSecurityCube,
		'pCube', cElementSecurityCube, 'pBlob', cElementSecurityCube, 'pAlt', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Destroy element security cube: ' | cElementSecurityCube);
	EndIf;
	
	CubeDestroy(cElementSecurityCube);
Else;
    If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Element security cube does not exist: ' | cElementSecurityCube);
	EndIf;
	
	ProcessError;
EndIf;


#*** Create shadow dimensions element security cube

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Create shadow dimensions element security cube');
EndIf;

sGroupsDim = '}Groups';
cShadowElementSecurityCube = '}ElementSecurity_' | cShadowApprovalDim;
If (CubeExists(cShadowElementSecurityCube) = 0);	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Create element security cube for Shadow approval hierarchy');
	EndIf;
	
	CubeCreate(cShadowElementSecurityCube, cShadowApprovalDim, sGroupsDim);
	CubeSetLogChanges(cShadowElementSecurityCube, 1);
EndIf;






















573,1

574,1

575,234

#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
##################################################################


cTM1Log = cEpilogLog;

#*** Set applications dimension attribute values

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Set applications dimension attribute values');
EndIf;

If (DIMIX(cApplicationsDim, pAppId) = 0);
	ProcessError;
EndIf;

AttrPutS('}tp_tasks}' | pAppId, cApplicationsDim, pAppId, cApprovalShadowDimAttr);
AttrPutS('N', cApplicationsDim, pAppId, cMaintenanceAttr);

#*** Remove version

cVersionAttr = 'Version';
AttrPutS('', cApplicationsDim, pAppId, cVersionAttr);


#*** Create RDCLS cubes

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Create RDCLS cubes');
EndIf;

cApplicationCubesCube = cControlPrefix | 'tp_application_cubes';
sCubesDim = '}Cubes';
cCubesDimSize = DIMSIZ(sCubesDim);
vIndex = 1;

While (vIndex <= cCubesDimSize);
	vCubeName = DIMNM(sCubesDim, vIndex);
	vFlagCube = CellGetS(cApplicationCubesCube, pAppId, vCubeName);
	
	If (vFlagCube @= 'A' );
		vReturnValue = ExecuteProcess( '}tp_deploy_create_RDCLS_cube','pExecutionId', pExecutionId,
			'pAppId', pAppId, 'pCube', vCubeName, 'pZeroOut', 'Y');
		If (vReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;
	EndIf;
	
	vIndex = vIndex + 1;
End;


#*** Import state, permission, and permission cell security control data

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Import state, permission, and permission cell security control data');
EndIf;

If (CubeExists(cPermissionCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_import_cube', 'pExecutionId', pExecutionId | cPermissionCube,
		'pCube', cPermissionCube, 'pSourceFile', cPermissionCube | '.blb');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

If (CubeExists(cCellSecurityCube) <> 0);
	vReturnValue = ExecuteProcess('}tp_util_import_cube', 'pExecutionId', pExecutionId | cCellSecurityCube,
		'pCube', cCellSecurityCube, 'pSourceFile', cCellSecurityCube | '.blb');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

	
If (CubeExists(cStateCube) <> 0);		
	vReturnValue = ExecuteProcess('}tp_util_import_cube', 'pExecutionId', pExecutionId | cStateCube,
		'pCube', cStateCube, 'pSourceFile', cStateCube | '.blb');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

SaveDataAll;


#*** Import element security data into intermediate cell security cubes

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Import element security data into intermediate cell security cubes');
EndIf;

cIntermediateCellSecurityPrefix = '}tp_intermediate_RDCLS}';

vIndex = 1;
While (vIndex <= cCubesDimSize);
	vCubeName = DIMNM(sCubesDim, vIndex);
	vFlagCube = CellGetS(cApplicationCubesCube, pAppId, vCubeName);
	
	If (vFlagCube @= 'A' );
		vReturnValue = ExecuteProcess( '}tp_util_import_cube','pExecutionId', pExecutionId | vCubeName,
			'pCube', cIntermediateCellSecurityPrefix | vCubeName, 'pSourceFile', cElementSecurityCube | '.blb', 'pSlicer', '*|' | pAppId | '|*|Rights|');
		If (vReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;
	EndIf;
	
	vIndex = vIndex + 1;
End;

SaveDataAll;


#*** Import element security data into shadow element security cube

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Import element security data into shadow element security cube');
EndIf;

vReturnValue = ExecuteProcess( '}tp_util_import_cube','pExecutionId', pExecutionId | cShadowElementSecurityCube,
	'pCube', cShadowElementSecurityCube, 'pSourceFile', cElementSecurityCube | '.blb');
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;

SaveDataAll;


#*** Move data from intermediate cell security cubes to cell security cubes

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Move data from intermediate cell security cubes to cell security cubes');
EndIf;

vIndex = 1;
While (vIndex <= cCubesDimSize);
	vCubeName = DIMNM(sCubesDim, vIndex);
	vFlagCube = CellGetS(cApplicationCubesCube, pAppId, vCubeName);
	
	If (vFlagCube @= 'A' );
		vReturnValue = ExecuteProcess( '}tp_rights_update_RDCLS_cube_by_permission','pExecutionId', pExecutionId | vCubeName,
			'pAppId', pAppId, 'pCube', vCubeName, 'pApprovalDim', gApprovalDim, 'pApprovalSubset', gApprovalSubset, 
			'pVersionDim', '', 'pVersionSlicesWrite', '', 'pVersionSlicesRead', '', 'pUpdateIntermediateSecurity','N','pIncremental','N');
		If (vReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;
		
		SaveDataAll;
	EndIf;
	
	vIndex = vIndex + 1;
End;


#*** Insert Version

AttrPutS(pVersion, cApplicationsDim, pAppId, cVersionAttr);


#*** Set security for non-admin users

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Set security for non-admin users');
EndIf;

cCognosEveryoneGroup = 'CAMID("::Everyone")';
cTpEveryoneGroup = cControlPrefix | 'tp_Everyone';

cEveryoneGroup = cTpEveryoneGroup;
If (DIMIX('}Groups', cEveryoneGroup) = 0);
	If (DIMIX('}Groups', cCognosEveryoneGroup) <> 0);
		cEveryoneGroup = cCognosEveryoneGroup;
	Else;
		ProcessError;
	EndIf;
EndIf;

sDimensionSecurityCube = '}DimensionSecurity';
If (CubeExists(sDimensionSecurityCube) = 1);
	CellPutS('Read', sDimensionSecurityCube, cShadowApprovalDim, cEveryoneGroup);
EndIf;

sCubeSecurityCube = '}CubeSecurity';
If (CubeExists(sCubeSecurityCube) = 1);
	CellPutS('Read', sCubeSecurityCube, cPermissionCube, cEveryoneGroup);
	CellPutS('Read', sCubeSecurityCube, cCellSecurityCube, cEveryoneGroup);
	CellPutS('Read', sCubeSecurityCube, cStateCube, cEveryoneGroup);
EndIf;


#*** Delete obsolete application artifacts

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), '****** Delete obsolete application artifacts');
EndIf;

cApplicationSecurityCube = '}tp_application_security}' | pAppId;
cApplicationSecurityUpdateCube = '}tp_application_security_update}' | pAppId;
cSecurityMeasuresDim = '}tp_security_measures';
cSecurityUpdateMeasuresDim = '}tp_security_update_measures';

If (CubeExists(cApplicationSecurityCube) <> 0);
	CubeDestroy(cApplicationSecurityCube);
EndIf;

If (CubeExists(cApplicationSecurityUpdateCube) <> 0);
	CubeDestroy(cApplicationSecurityUpdateCube);
EndIf;

If (DimensionExists(cSecurityMeasuresDim) <> 0);
	DimensionDestroy(cSecurityMeasuresDim);
EndIf;

If (DimensionExists(cSecurityUpdateMeasuresDim) <> 0);
	DimensionDestroy(cSecurityUpdateMeasuresDim);
EndIf;






576,
930,0
638,1
804,0
1217,0
900,
901,
902,
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
