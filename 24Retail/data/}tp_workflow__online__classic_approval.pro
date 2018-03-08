601,100
602,"}tp_workflow__online__classic_approval"
562,"NULL"
586,
585,
564,
565,"fCWHoaaDWRNE?\z[=m62bHS9x_o;lz3k0DsW3sC67wz?zcEO9gx:>2]hXx9DLy_eXHVTN[9fSM8LuNtTIgRN;OD\0qOVuu^]G]FxIvLVn8l\wxwH6]JIX6G]g=FIw7db\@a=DYxPLBs?_osMUCh:?SWuoe]?oVIFgXstcbUHu5nTs?F>LnxogwefjKEzPGtt\UwrfyAX"
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
560,4
pExecutionId
pTime
pAppId
pNode
561,4
2
2
2
2
590,4
pExecutionId,"None"
pTime,"0"
pAppId,"MyApp"
pNode,"NA"
637,4
pExecutionId,""
pTime,""
pAppId,""
pNode,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,296
#******
#******
#***BEGIN(Prolog): }tp_workflow__online__classic_approval
#******

#****** Initiate prolog

#*** Initiate Log File
cConfigDim = '}tp_config';
If (DimensionExists(cConfigDim) = 1);
	cGenerateLog = ATTRS(cConfigDim, 'Generate TI Log', 'String Value');
Else;
	cGenerateLog = 'N';
EndIf;

cTM1Process = GetProcessName();
StringGlobalVariable('gPrologLog');
StringGlobalVariable('gEpilogLog');
StringGlobalVariable('gDataLog');
StringGlobalVariable('gMetadataLog');

If (cGenerateLog @= 'Y' % cGenerateLog @= 'T');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_get_log_file_names',
		'pExecutionId', pExecutionId, 
		'pProcess', cTM1Process, 
		'pControl', 'Y');
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cMetadataLog = gMetadataLog;

#*** Set Log File
cTM1Log = cPrologLog;

#*** Write to Log File
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'),
		'pExecutionId=' | pExecutionId,
		'pTime=' | pTime,
		'pAppId=' | pAppId,
		'pNode=' | pNode);
EndIf;

#*** Get user display name
cUserDisplayName = ATTRS('}Clients', TM1User, '}TM1_DefaultDisplayValue');
If (cUserDisplayName @= '');
	cUserDisplayName = TM1User;
EndIf;

#*** Get Application Attributes
cApprovalDimension = ATTRS('}tp_applications', pAppId,  'ApprovalDimension');
cApprovalSubset = ATTRS('}tp_applications', pAppId,  'ApprovalSubset');
cIsActive = ATTRS('}tp_applications', pAppId,  'IsActive');
cApprovalShadowDimension = ATTRS('}tp_applications', pAppId,  'ApprovalShadowDimension');
cVersion = ATTRS('}tp_applications', pAppId,  'Version');
cSecurityMethod = ATTRS('}tp_applications', pAppId,  'SecurityMethod');
cVersionDimension = ATTRS('}tp_applications', pAppId,  'VersionDimension');
cCubeViews = ATTRS('}tp_applications', pAppId,  'CubeViews');
cBounceMode = ATTRS('}tp_applications', pAppId,  'BounceMode');

#*** Write to Log File
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'),
		cApprovalDimension,
		cApprovalSubset,
		cIsActive,
		cApprovalShadowDimension,
		cVersion,
		cSecurityMethod,
		cVersionDimension,
		cCubeViews,
		cBounceMode);
EndIf;

#*** Get User Permissions

#*** Define global variables
StringGlobalVariable('gView');
StringGlobalVariable('gAnnotate');
StringGlobalVariable('gEdit');
StringGlobalVariable('gReject');
StringGlobalVariable('gSubmit');

#*** Call TI process
tReturnValue = ExecuteProcess('}tp_get_user_permissions',
	'pGuid', pExecutionId, 
	'pApplication', pAppId, 
	'pNode', pNode, 
	'pUser', TM1User, 
	'pControl', 'Y');
If (tReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;

cgView = gView;
cgAnnotate = gAnnotate;
cgEdit = gEdit;
cgReject = gReject;
cgSubmit = gSubmit;

cDimension = cApprovalShadowDimension;
pNode = DimensionElementPrincipalName(cApprovalShadowDimension, pNode);
cNode = pNode;

#*** Get node type.

#*** Write to Error Cube
If (DIMIX(cDimension, cNode) = 0);

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_error_update_error_cube',
		'pGuid', pExecutionId, 
		'pProcess', GetProcessName(), 
		'pErrorCode', 'TI_NODE_NOT_EXIST', 
		'pErrorDetails', cDimension| ', ' |cNode, 
		'pControl', 'Y');
	ProcessError;
EndIf;

cNodeType = DTYPE(cDimension, cNode);

#*** Get State Cube and Member
cStateCube = '}tp_application_state}' | pAppId;
cStateMember = DimensionElementPrincipalName(cApprovalShadowDimension, pNode);

#*** Get State Member Info
cState = CellGetS(cStateCube, cStateMember, 'State');
cViewed = CellGetS(cStateCube, cStateMember, 'Viewed');
cSaved = CellGetS(cStateCube, cStateMember, 'Saved');
cReviewed = CellGetS(cStateCube, cStateMember, 'Reviewed');
cBeingEdited = CellGetS(cStateCube, cStateMember, 'BeingEdited');
cOffline = CellGetS(cStateCube, cStateMember, 'Offline');
cCurrentOwner = CellGetS(cStateCube, cStateMember, 'CurrentOwner');
cCurrentOwnerId = CellGetS(cStateCube, cStateMember, 'CurrentOwnerId');
cReviewer = CellGetS(cStateCube, cStateMember, 'Reviewer');
cTakeOwnershipNode = CellGetS(cStateCube, cStateMember, 'TakeOwnershipNode');
cStartEditingDate = CellGetS(cStateCube, cStateMember, 'StartEditingDate');
cStateChangeUser = CellGetS(cStateCube, cStateMember, 'StateChangeUser');
cStateChangeDate = CellGetS(cStateCube, cStateMember, 'StateChangeDate');
cDataChangeUser = CellGetS(cStateCube, cStateMember, 'DataChangeUser');
cDataChangeDate = CellGetS(cStateCube, cStateMember, 'DataChangeDate');

#****** Start workflow business logic

vVisitCount = 0;

If (cNodeType @= 'N');
	If ((cState @= '0' % cState @= '' % cState @= '4' % cState @= '2') & (cgView @= 'T'));
		vVisitCount = vVisitCount + 1;

		#*** Set State Member Info
		CellPutS('', cStateCube, cStateMember, 'Offline');
	EndIf;

	If ((cState @= '2') & (cgEdit @= 'T'));
		vVisitCount = vVisitCount + 1;
		If (TM1User @= cCurrentOwnerId);

			#*** Set State Member Info
			CellPutS('Y', cStateCube, cStateMember, 'BeingEdited');

			#*** Set State Member Info
			CellPutS(pTime, cStateCube, cStateMember, 'StartEditingDate');
		EndIf;
	EndIf;


ElseIf (cNodeType @= 'C');
	If ((cState @= '1' % cState @= '3' % cState @= '0' % cState @= '' % cState @= '4' % cState @= '2') & (cgView @= 'T'));
		vVisitCount = vVisitCount + 1;
		vSubset = 'online_ALL_LEAF_CHILDREN' | pTime;

		#*** Create a new subset with all leaf nodes under the consolidated node in the subset.

		#*** Call TI process
		tReturnValue = ExecuteProcess('}tp_util_get_all_leaf_children_in_subset',
			'pExecutionId', pExecutionId, 
			'pDim', cApprovalShadowDimension, 
			'pSubset', cApprovalSubset, 
			'pNode', pNode, 
			'pNewSubset', vSubset);
		If (tReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;

		vSubsetSize = SubsetGetSize(cApprovalShadowDimension, vSubset);
		vTempIndex = 1;
		while (vTempIndex <= vSubsetSize);
			vNode = SubsetGetElementName(cApprovalShadowDimension, vSubset, vTempIndex);
			vNode = DimensionElementPrincipalName(cApprovalShadowDimension, vNode);

			#*** Get State Cube and Member
			vStateCube = '}tp_application_state}' | pAppId;
			vStateMember = DimensionElementPrincipalName(cApprovalShadowDimension, vNode);

			#*** Get State Member Info
			vState = CellGetS(vStateCube, vStateMember, 'State');
			vViewed = CellGetS(vStateCube, vStateMember, 'Viewed');
			vSaved = CellGetS(vStateCube, vStateMember, 'Saved');
			vReviewed = CellGetS(vStateCube, vStateMember, 'Reviewed');
			vBeingEdited = CellGetS(vStateCube, vStateMember, 'BeingEdited');
			vOffline = CellGetS(vStateCube, vStateMember, 'Offline');
			vCurrentOwner = CellGetS(vStateCube, vStateMember, 'CurrentOwner');
			vCurrentOwnerId = CellGetS(vStateCube, vStateMember, 'CurrentOwnerId');
			vReviewer = CellGetS(vStateCube, vStateMember, 'Reviewer');
			vTakeOwnershipNode = CellGetS(vStateCube, vStateMember, 'TakeOwnershipNode');
			vStartEditingDate = CellGetS(vStateCube, vStateMember, 'StartEditingDate');
			vStateChangeUser = CellGetS(vStateCube, vStateMember, 'StateChangeUser');
			vStateChangeDate = CellGetS(vStateCube, vStateMember, 'StateChangeDate');
			vDataChangeUser = CellGetS(vStateCube, vStateMember, 'DataChangeUser');
			vDataChangeDate = CellGetS(vStateCube, vStateMember, 'DataChangeDate');

			#*** Get User Permissions

			#*** Define global variables
			StringGlobalVariable('gView');
			StringGlobalVariable('gAnnotate');
			StringGlobalVariable('gEdit');
			StringGlobalVariable('gReject');
			StringGlobalVariable('gSubmit');

			#*** Call TI process
			tReturnValue = ExecuteProcess('}tp_get_user_permissions',
				'pGuid', pExecutionId, 
				'pApplication', pAppId, 
				'pNode', vNode, 
				'pUser', TM1User, 
				'pControl', 'Y');
			If (tReturnValue <> ProcessExitNormal());
				ProcessError;
			EndIf;

			vgView = gView;
			vgAnnotate = gAnnotate;
			vgEdit = gEdit;
			vgReject = gReject;
			vgSubmit = gSubmit;
			If ((vState @= '0' % vState @= '' % vState @= '4' % vState @= '2') & (vgView @= 'T'));

				#*** Set State Member Info
				CellPutS('', vStateCube, vStateMember, 'Offline');
			EndIf;

			If ((vState @= '2') & (vgEdit @= 'T'));
				If (TM1User @= vCurrentOwnerId);

					#*** Set State Member Info
					CellPutS('Y', vStateCube, vStateMember, 'BeingEdited');

					#*** Set State Member Info
					CellPutS(pTime, vStateCube, vStateMember, 'StartEditingDate');
				EndIf;
			EndIf;


			vTempIndex = vTempIndex + 1;
		End;


		If (SubsetExists(cApprovalShadowDimension, vSubset) <> 0);
			SubsetDestroy(cApprovalShadowDimension, vSubset);
		EndIf;
	EndIf;


EndIf;

#*** Write to Error Cube
If (vVisitCount = 0);

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_error_update_error_cube',
		'pGuid', pExecutionId, 
		'pProcess', GetProcessName(), 
		'pErrorCode', 'TI_NO_PERMISSION', 
		'pErrorDetails', 'Node=' | cNode |',' | 'State=' | cState |',' | 'VIEW=' | cgView |',' | 'EDIT=' | cgEdit |',' | 'SUBMIT=' | cgSubmit |',' | 'REJECT=' | cgReject, 
		'pControl', 'Y');
	ProcessError;
EndIf;

#*** Write to Log File
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'),
		'The end has been reached.');
EndIf;
#******
#***END(Prolog): }tp_workflow__online__classic_approval
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
