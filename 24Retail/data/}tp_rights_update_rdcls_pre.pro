601,100
602,"}tp_rights_update_RDCLS_pre"
562,"NULL"
586,
585,
564,
565,"qOGyj6T2tMAYemaSRa\wmR[vtv>xXRtsHvZhZTVG>x_O>?HC2`?BHoBmJu0M><1[RS]66c_q`@SenR_V8lRZZq9?Fuz@ivm^TXIs\g?V9orSw^r>h8ciO7^wp<s[FOgv:M97J=;?_ygl7kv@1;AjVZBxR6ang=kY^i0:1gRGxL?G@\hZ]`GMen^K4>PjeW=2hOGU?MaM"
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
560,6
pExecutionId
pAppId
pCube
pUpdateIntermediateSecurity
pIncremental
pMultiThreads
561,6
2
2
2
2
2
2
590,6
pExecutionId,"None"
pAppId,"None"
pCube,"None"
pUpdateIntermediateSecurity,"Y"
pIncremental,"N"
pMultiThreads,"5"
637,6
pExecutionId,""
pAppId,""
pCube,""
pUpdateIntermediateSecurity,""
pIncremental,""
pMultiThreads,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,136


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
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters:',pExecutionId, pAppId, pCube);
EndIf;

#***
cIMRDCLSCube = '}tp_intermediate_RDCLS}' | pCube;
cIMApplicationDim = '}tp_intermediate_security_applications';
cIMMeasures = '}tp_intermediate_security_measures';
cApprovalDim = ATTRS('}tp_applications', pAppId, 'ApprovalDimension');
cVersionDim = ATTRS('}tp_applications', pAppId, 'VersionDimension');
cApprovalSubset = ATTRS('}tp_applications', pAppId, 'ApprovalSubset');

#**
IF (CubeExists(cIMRDCLSCube) >0);

#***Reset "Rights" field on Intermediate cell security cube based for this application only
IF (DIMIX(cIMApplicationDim, pAppId) >0);
	#check application subset that contains this application Id only
	vTempAppSubset = 'temp_app_' | pAppId;
	IF (SubsetExists(cIMApplicationDim, vTempAppSubset)=0);
		#Error;
	Endif;

	IF (pIncremental @<> 'Y');
		vAllView = 'tp_temp_RDCLS_view_' | pExecutionId;
		ViewCreate(cIMRDCLSCube, vAllView);
		ViewTitleDimensionSet(cIMRDCLSCube, vAllView, cIMApplicationDim);
		ViewSubsetAssign(cIMRDCLSCube, vAllView, cIMApplicationDim, vTempAppSubset);
		ViewZeroOut(cIMRDCLSCube, vAllView);
		ViewDestroy(cIMRDCLSCube, vAllView);
	Else;
		#group subset that contains changed groups only
		vTempGroupSubset = 'temp_group_' | pAppId;
		vGroupsControlDim = '}Groups';
		IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)=0);
			#Error;
		Endif;

		vGroupView = 'tp_temp_group_view_'  | pExecutionId;
		ViewCreate(cIMRDCLSCube, vGroupView);
		ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, vGroupsControlDim);
		ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, cIMApplicationDim);
		ViewSubsetAssign(cIMRDCLSCube, vGroupView, vGroupsControlDim, vTempGroupSubset );
		ViewSubsetAssign(cIMRDCLSCube, vGroupView, cIMApplicationDim, vTempAppSubset);
		ViewZeroOut(cIMRDCLSCube, vGroupView);
		ViewDestroy(cIMRDCLSCube, vGroupView);

	Endif;
Endif;


#***Reset StaticRights field on Intermediate cell security cube
#Create a subset that contains StaticRights only
vTempStaticRightsSubset = 'temp_static_rights_' | pAppId;
IF (SubsetExists(cIMMeasures, vTempStaticRightsSubset)=0);
	#Error;
Endif;

#zeroOut all related cell values related to StaticRights and approvalSubset in the intermediate cube
IF (pIncremental @<> 'Y');
	vZerooutView = 'temp_IMCube_zeroout_' | pAppId;
	ViewCreate(cIMRDCLSCube, vZerooutView);
	ViewRowDimensionSet(cIMRDCLSCube, vZerooutView, cIMMeasures,1);
	ViewColumnDimensionSet(cIMRDCLSCube, vZerooutView, cApprovalDim,1);
	ViewSubsetAssign(cIMRDCLSCube, vZerooutView, cIMMeasures, vTempStaticRightsSubset);
	ViewSubsetAssign(cIMRDCLSCube, vZerooutView, cApprovalDim, cApprovalSubset);
	ViewZeroOut(cIMRDCLSCube, vZerooutView);
	ViewDestroy(cIMRDCLSCube, vZerooutView);
Else;
	#create a group subset that contains this group only
	vTempGroupSubset = 'temp_group_' | pAppId;
	vGroupsControlDim = '}Groups';
	IF (SubsetExists(vGroupsControlDim, vTempGroupSubset)=0);
		#Error;
	Endif;

	vGroupView = 'tp_temp_group_view_' | pExecutionId;
	ViewCreate(cIMRDCLSCube, vGroupView);
	ViewTitleDimensionSet(cIMRDCLSCube, vGroupView, vGroupsControlDim);
	ViewSubsetAssign(cIMRDCLSCube, vGroupView, vGroupsControlDim, vTempGroupSubset );
	ViewTitleDimensionSet(cIMRDCLSCube, vGroupView,cIMMeasures);
	ViewSubsetAssign(cIMRDCLSCube, vGroupView, cIMMeasures, vTempStaticRightsSubset );
	ViewZeroOut(cIMRDCLSCube, vGroupView);
	ViewDestroy(cIMRDCLSCube, vGroupView);

Endif;

Endif;
#**



573,1

574,1

575,69


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

IF (CubeExists(cIMRDCLSCube) >0);
versionIndex = 0;
approvalIndex = 0;
dimensionIndex = 1;
While (dimensionIndex > 0 ); 
	cCubeDimensionName = TABDIM(pCube, dimensionIndex);
	If (cCubeDimensionName @= '');
		dimensionIndex = -1;
	Else;
		IF (cCubeDimensionName @=cVersionDim);
			versionIndex = dimensionIndex;
		Endif;
				
		IF (cCubeDimensionName @= cApprovalDim );
			approvalIndex =dimensionIndex ;
		Endif;

	EndIf;

	dimensionIndex = dimensionIndex + 1;
End;

versionFirst = 'N';
IF (versionIndex < approvalIndex);
	versionFirst = 'Y';
Endif;

vGroup = DIMNM('}Groups',1);
vApprovalNode = DIMNM(cApprovalDim, 1);
vApplication = 'all_applications';
IF (versionIndex >0);
	vVersion = DIMNM(cVersionDim,1);
Endif;


IF (versionIndex >0 & approvalIndex >0 & versionFirst @='Y');

	vSecurity = CellGetS( cIMRDCLSCube, vVersion, vApprovalNode, vApplication,  vGroup,'Rights' );

Elseif (versionIndex >0 & approvalIndex >0 & versionFirst @<> 'Y');

	vSecurity = CellGetS( cIMRDCLSCube, vApprovalNode, vVersion, vApplication,  vGroup,'Rights' );

Elseif (versionIndex =0 & approvalIndex >0);

	vSecurity = CellGetS( cIMRDCLSCube, vApprovalNode, vApplication,  vGroup,'Rights' );

Elseif (versionIndex >0 & approvalIndex =0);
	vSecurity = CellGetS( cIMRDCLSCube, vVersion, vApplication,  vGroup,'Rights' );

Endif;

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
