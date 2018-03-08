601,100
602,"}tp_rights_update_RDCLS_cube_by_permission"
562,"NULL"
586,
585,
564,
565,"b_aRl_=5PS2L8:8RE:O58d_M^WAjvy\LE7`yefLEDvhD5:>gv?FGbgv7oV`h_4=D[9MQQFtA49u_E:z=Xg9]8uAr[J<]H@:`\jg4f>;28aSIk>CyvmNzStuHUX1cu;:@=FGNuwGVBxiXVjGsyC`sOi>z6c`TeO^08=@LA`crR<V9[^EH]wf^E_rANdl:y:5K8kvdGuy0"
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
560,10
pExecutionId
pAppId
pCube
pApprovalDim
pApprovalSubset
pVersionDim
pVersionSlicesWrite
pVersionSlicesRead
pUpdateIntermediateSecurity
pIncremental
561,10
2
2
2
2
2
2
2
2
2
2
590,10
pExecutionId,"None"
pAppId,"None"
pCube,"None"
pApprovalDim,"None"
pApprovalSubset,"None"
pVersionDim,"None"
pVersionSlicesWrite,"None"
pVersionSlicesRead,"None"
pUpdateIntermediateSecurity,"Y"
pIncremental,"N"
637,10
pExecutionId,""
pAppId,""
pCube,""
pApprovalDim,""
pApprovalSubset,""
pVersionDim,""
pVersionSlicesWrite,""
pVersionSlicesRead,""
pUpdateIntermediateSecurity,""
pIncremental,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,269


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

#*** Log File Name
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

IF (cGenerateLog @= 'Y' % cGenerateLog @= 'T');
vReturnValue = ExecuteProcess('}tp_get_log_file_names', 'pExecutionId', pExecutionId,
'pProcess', cTM1Process, 'pControl', 'Y');
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
Endif;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#*** Log Parameters

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters:',pExecutionId, pAppId, pCube,pApprovalDim, pApprovalSubset, pVersionDim, pVersionSlicesWrite, pVersionSlicesRead);
EndIf;

#***
vCellSecurityPermissionCube = '}CellSecurity_}tp_application_permission}' | pAppId;
cIMRDCLSCube = '}tp_intermediate_RDCLS}' | pCube;
cCellSecurityCube = '}CellSecurity_' | pCube;
cAllApplications = 'all_applications';
cIMApplicationDim = '}tp_intermediate_security_applications';
cIMMeasures = '}tp_intermediate_security_measures';
vIncrGroupDim = 'tp_incr_temp_groups_' | pAppId;

#***
cGroupsDim = '}Groups';
IF (pIncremental @= 'Y');
	cGroupsDim = vIncrGroupDim;
Endif;

#***
versionIndex = 0;
approvalIndex = 0;
dimensionIndex = 1;
While (dimensionIndex > 0 ); 
	cCubeDimensionName = TABDIM(pCube, dimensionIndex);
	If (cCubeDimensionName @= '');
		dimensionIndex = -1;
	Else;
		IF (cCubeDimensionName @=pVersionDim);
			versionIndex = dimensionIndex;
		Endif;
				
		IF (cCubeDimensionName @= pApprovalDim );
			approvalIndex =dimensionIndex ;
		Endif;

	EndIf;

	dimensionIndex = dimensionIndex + 1;
End;

IF (versionIndex < approvalIndex);
	versionFirst = 'Y';
Endif;

#*Update Intermediate cell security cube
IF (pUpdateIntermediateSecurity @= 'Y');
	#create an application subset that contains this application Id only
	vTempAppSubset = 'temp_app_' | pAppId;
	IF (SubsetExists(cIMApplicationDim, vTempAppSubset)>0);
		SubsetDestroy(cIMApplicationDim, vTempAppSubset);
	Endif;
	SubsetCreate(cIMApplicationDim, vTempAppSubset);
	SubsetElementInsert(cIMApplicationDim, vTempAppSubset, pAppId, 1);

	IF (pIncremental @<> 'Y');
		vAllView = 'tp_temp_RDCLS_view_' | pExecutionId;
		ViewCreate(cIMRDCLSCube, vAllView);
		ViewTitleDimensionSet(cIMRDCLSCube, vAllView, cIMApplicationDim);
		ViewSubsetAssign(cIMRDCLSCube, vAllView, cIMApplicationDim, vTempAppSubset);
		ViewZeroOut(cIMRDCLSCube, vAllView);
		ViewDestroy(cIMRDCLSCube, vAllView);
	Endif;

	vTotalGroups = DIMSIZ(cGroupsDim);
	vGroupLooper = 1;
	While (vGroupLooper <= vTotalGroups);
		vGroup = DIMNM(cGroupsDim, vGroupLooper);

		#zero out cell security cube based on this group and this application only
		IF (pIncremental @= 'Y');
			#create a group subset that contains this group only
			vTempGroupSubset = 'temp_group_' | pAppId;
			vGroupsControlDim = '}Groups';
			IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)>0);
				SubsetDestroy(vGroupsControlDim, vTempGroupSubset);
			Endif;
			SubsetCreate(vGroupsControlDim, vTempGroupSubset);
			SubsetElementInsert(vGroupsControlDim, vTempGroupSubset, vGroup, 1);

			vGroupView = 'tp_temp_group_view_'  | pExecutionId;
			ViewCreate(cIMRDCLSCube, vGroupView);
			ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, vGroupsControlDim);
			ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, cIMApplicationDim);
			ViewSubsetAssign(cIMRDCLSCube, vGroupView, vGroupsControlDim, vTempGroupSubset );
			ViewSubsetAssign(cIMRDCLSCube, vGroupView, cIMApplicationDim, vTempAppSubset);
			ViewZeroOut(cIMRDCLSCube, vGroupView);
			ViewDestroy(cIMRDCLSCube, vGroupView);

			IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)>0);
				SubsetDestroy(vGroupsControlDim, vTempGroupSubset);
			Endif;
		Endif;

		vTotalNodes = SubsetGetSize(pApprovalDim, pApprovalSubset);
		vNodeLooper = 1;
		While (vNodeLooper <= vTotalNodes);
			vApprovalNode = SubsetGetElementName(pApprovalDim, pApprovalSubset, vNodeLooper);
			vView = CellGetS(vCellSecurityPermissionCube, vApprovalNode, 'VIEW', vGroup);
			vEdit = CellGetS(vCellSecurityPermissionCube, vApprovalNode, 'EDIT', vGroup);
			vNodeSecurity = '';
			vVersionSecurity = '';
			vFinalSecurity = '';
			IF (vView @= 'READ');
				IF (DType(pApprovalDim, vApprovalNode) @='C');
					vNodeSecurity = 'WRITE';
				Else;
					vNodeSecurity = 'READ';
				Endif;
			Endif;

			IF (vEdit @= 'READ');
				vNodeSecurity = 'WRITE';
			Endif;
							
			IF (vNodeSecurity @<> '');

			#***readable version slices
			versionSeparater = '|';
			vPosVersion = 0;
			vStringToScan = pVersionSlicesRead;
			IF (pVersionSlicesRead @<> '');
				vPosVersion = SCAN(versionSeparater, vStringToScan);
			Else;
				#Even no readable version slices are defined, we still need to apply security
				#based on approval dimension
				vPosVersion = 1;
			Endif;

			While (vPosVersion >0);
				vVersionSlice  = SUBST(vStringToScan, 1, vPosVersion-1);
				vStringToScan = SUBST(vStringToScan, vPosVersion +1, LONG(vStringToScan)-vPosVersion);
				vPosVersion = SCAN(versionSeparater, vStringToScan);

				IF (versionIndex >0);
					IF (vVersionSlice @<> '' );
						IF (DIMIX(pVersionDim, vVersionSlice)=0);
							vReturnValue = ExecuteProcess('}tp_error_update_error_cube',
								'pGuid', pExecutionId,
								'pProcess', cTM1Process,
								'pErrorCode', 'TI_READABLE_SLICE_NOT_EXISTS',
								'pErrorDetails', pVersionDim  | '.' | vVersionSlice | ', ' |  pAppId,
								'pControl', 'Y');
	
								ProcessError;
						Endif;

						IF (approvalIndex >0);
							IF (versionFirst @= 'Y');
								CellPutS('READ', cIMRDCLSCube, vVersionSlice, vApprovalNode,pAppId, vGroup,'Rights' );
							Else;
								CellPutS('READ', cIMRDCLSCube, vApprovalNode, vVersionSlice,pAppId, vGroup,'Rights' );
							Endif;
						Else;
							CellPutS('READ', cIMRDCLSCube, vVersionSlice, pAppId, vGroup,'Rights' );	
						Endif;
					Endif;

				ElseIf (versionIndex = 0 & approvalIndex >0);
					CellPutS('READ', cIMRDCLSCube, vApprovalNode, pAppId, vGroup,'Rights' );
				Endif;

			End;

			#***writable version slices
			versionSeparater = '|';
			vPosVersion = 0;
			vStringToScan = pVersionSlicesWrite;
			IF (pVersionSlicesWrite @<> '');
				vPosVersion = SCAN(versionSeparater, vStringToScan);
			Else;
				#Even no writable version slices are defined, we still need to apply security
				#based on approval dimension
				vPosVersion = 1;
			Endif;

			While (vPosVersion >0);
				vVersionSlice  = SUBST(vStringToScan, 1, vPosVersion-1);
				vStringToScan = SUBST(vStringToScan, vPosVersion +1, LONG(vStringToScan)-vPosVersion);
				vPosVersion = SCAN(versionSeparater, vStringToScan);
				IF (vNodeSecurity @= 'READ');
					vFinalSecurity = 'READ';
				Elseif (vNodeSecurity @= 'WRITE');
					vFinalSecurity = 'WRITE';
				Endif;
	
				IF (versionIndex >0);
					IF (vVersionSlice @<>'');
						IF (DIMIX(pVersionDim, vVersionSlice)=0);
							vReturnValue = ExecuteProcess('}tp_error_update_error_cube',
								'pGuid', pExecutionId,
								'pProcess', cTM1Process,
								'pErrorCode', 'TI_WRITABLE_SLICE_NOT_EXISTS',
								'pErrorDetails', pVersionDim  | '.' | vVersionSlice | ', ' |  pAppId,
								'pControl', 'Y');
	
								ProcessError;
						Endif;

						IF (approvalIndex >0);
							IF (versionFirst @= 'Y');
								CellPutS(vFinalSecurity, cIMRDCLSCube, vVersionSlice, vApprovalNode,pAppId, vGroup,'Rights' );
							Else;
								CellPutS(vFinalSecurity, cIMRDCLSCube, vApprovalNode, vVersionSlice,pAppId, vGroup,'Rights' );
							Endif;
						Else;
							CellPutS(vFinalSecurity, cIMRDCLSCube, vVersionSlice, pAppId, vGroup,'Rights' );
						Endif;
					Endif;

				ElseIf (versionIndex = 0 & approvalIndex >0);
					CellPutS(vFinalSecurity, cIMRDCLSCube, vApprovalNode, pAppId, vGroup,'Rights' );
				Endif;
			End;
			Endif;

			vNodeLooper = vNodeLooper  +1;
		End;
		vGroupLooper = vGroupLooper +1;
	End;

	IF (SubsetExists(cIMApplicationDim, vTempAppSubset)>0);
		SubsetDestroy(cIMApplicationDim, vTempAppSubset);
	Endif;
Endif;
573,1

574,1

575,119


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

#*Update RD cell security cubes

#Create a subset that contains StaticRights only
vTempStaticRightsSubset = 'temp_static_rights_' | pAppId;
IF (SubsetExists(cIMMeasures, vTempStaticRightsSubset)>0);
	SubsetDestroy(cIMMeasures, vTempStaticRightsSubset);
Endif;
SubsetCreate(cIMMeasures, vTempStaticRightsSubset);
SubsetElementInsert(cIMMeasures, vTempStaticRightsSubset, 'StaticRights', 1);

#zeroOut all related cell values related to StaticRights in the intermediate cube
IF (pIncremental @<> 'Y');

	vZerooutView = 'temp_IMCube_zeroout_' | pAppId;
	ViewCreate(cIMRDCLSCube, vZerooutView);
	ViewTitleDimensionSet(cIMRDCLSCube, vZerooutView, cIMMeasures);
	ViewSubsetAssign(cIMRDCLSCube, vZerooutView, cIMMeasures, vTempStaticRightsSubset);
	ViewZeroOut(cIMRDCLSCube, vZerooutView);
	ViewDestroy(cIMRDCLSCube, vZerooutView);
Endif;

vTotalGroups = DIMSIZ(cGroupsDim);
vGroupLooper = 1;
While (vGroupLooper <= vTotalGroups);
	vGroup = DIMNM(cGroupsDim, vGroupLooper);
	
	#zero out intermediate cell security cube based on this group and StaticRights fields only
	IF (pIncremental @= 'Y');
		#create a group subset that contains this group only
		vTempGroupSubset = 'temp_group_' | pAppId;
		vGroupsControlDim = '}Groups';
		IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)>0);
			SubsetDestroy(vGroupsControlDim, vTempGroupSubset);
		Endif;
		SubsetCreate(vGroupsControlDim, vTempGroupSubset);
		SubsetElementInsert(vGroupsControlDim, vTempGroupSubset, vGroup, 1);

		vGroupView = 'tp_temp_group_view_' | pExecutionId;
		ViewCreate(cIMRDCLSCube, vGroupView);
		ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, vGroupsControlDim);
		ViewSubsetAssign(cIMRDCLSCube, vGroupView, vGroupsControlDim, vTempGroupSubset );
		ViewTitleDimensionSet(cIMRDCLSCube, vGroupView,cIMMeasures);
		ViewSubsetAssign(cIMRDCLSCube, vGroupView, cIMMeasures, vTempStaticRightsSubset );
		ViewZeroOut(cIMRDCLSCube, vGroupView);
		ViewDestroy(cIMRDCLSCube, vGroupView);

		IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)>0);
			SubsetDestroy(vGroupsControlDim, vTempGroupSubset);
		Endif;
	Endif;

	vTotalNodes = DIMSIZ(pApprovalDim);
	vNodeLooper = 1;
	While (vNodeLooper <= vTotalNodes);
		vApprovalNode = DIMNM(pApprovalDim, vNodeLooper);
		vFinalCellSecurity ='NONE';

		IF (versionIndex >0);
			vTotalVersions = DIMSIZ(pVersionDim);
			vVersionLooper = 1;
			While (vVersionLooper <= vTotalVersions);
				vVersion = DIMNM(pVersionDim, vVersionLooper);
				IF (approvalIndex >0)	;	
					IF (versionFirst @= 'Y');
						vFinalCellSecurity=CellGetS(cIMRDCLSCube, vVersion, vApprovalNode,cAllApplications, vGroup,'Rights' );
						vCurrentCellSecurity = CellGetS(cIMRDCLSCube, vVersion, vApprovalNode,cAllApplications, vGroup,'StaticRights');
						IF (vFinalCellSecurity @<> vCurrentCellSecurity);
							CellPutS(vFinalCellSecurity, cIMRDCLSCube, vVersion, vApprovalNode,cAllApplications, vGroup,'StaticRights');
						Endif;
						
					Else;
						vFinalCellSecurity=CellGetS(cIMRDCLSCube, vApprovalNode, vVersion,cAllApplications, vGroup,'Rights' );
						vCurrentCellSecurity = CellGetS(cIMRDCLSCube, vApprovalNode, vVersion,cAllApplications, vGroup,'StaticRights');
						IF (vFinalCellSecurity @<> vCurrentCellSecurity);
							CellPutS(vFinalCellSecurity, cIMRDCLSCube, vApprovalNode, vVersion,cAllApplications, vGroup,'StaticRights');
						Endif;
					Endif;
				Else;
					vFinalCellSecurity=CellGetS(cIMRDCLSCube,vVersion, cAllApplications, vGroup,'Rights' );
					vCurrentCellSecurity = CellGetS(cIMRDCLSCube,vVersion, cAllApplications, vGroup,'StaticRights' );
					IF (vFinalCellSecurity @<>vCurrentCellSecurity);
						CellPutS(vFinalCellSecurity, cIMRDCLSCube,vVersion, cAllApplications, vGroup,'StaticRights');
					Endif;
				Endif;
				vVersionLooper = vVersionLooper +1;
			End;

		ElseIf (versionIndex = 0 & approvalIndex >0);
				vFinalCellSecurity=CellGetS(cIMRDCLSCube,vApprovalNode, cAllApplications, vGroup,'Rights' );
				vCurrentCellSecurity = CellGetS(cIMRDCLSCube,vApprovalNode, cAllApplications, vGroup,'StaticRights');
				IF (vFinalCellSecurity @<>vCurrentCellSecurity);
					CellPutS(vFinalCellSecurity, cIMRDCLSCube,vApprovalNode, cAllApplications, vGroup,'StaticRights');
				Endif;
		Endif;
		vNodeLooper = vNodeLooper  +1;		
	End;
	vGroupLooper = vGroupLooper +1;
End;


IF (SubsetExists(cIMMeasures, vTempStaticRightsSubset)>0);
	SubsetDestroy(cIMMeasures, vTempStaticRightsSubset);
Endif;
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
