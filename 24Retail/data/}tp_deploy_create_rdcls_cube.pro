601,100
602,"}tp_deploy_create_RDCLS_cube"
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
560,4
pExecutionId
pAppId
pCube
pZeroOut
561,4
2
2
2
2
590,4
pExecutionId,"None"
pAppId,"None"
pCube,"None"
pZeroOut,"Y"
637,4
pExecutionId,""
pAppId,""
pCube,""
pZeroOut,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,209


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
cTM1Process = '}tp_deploy_create_RDCLS_cube';
StringGlobalVariable('gPrologLog');
StringGlobalVariable('gEpilogLog');
StringGlobalVariable('gDataLog');
vReturnValue = ExecuteProcess('}tp_get_log_file_names',
'pExecutionId', pExecutionId, 'pProcess', cTM1Process, 'pControl', 'Y');
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

cConfigDim = '}tp_config';
If (DimensionExists(cConfigDim) = 1);
	cGenerateLog = ATTRS('}tp_config', 'Generate TI Log', 'String Value');
Else;
	cGenerateLog = 'N';
EndIf;


#*** Check if a new version dimension is added.
StringSessionVariable('seIsNewVersionDimensionAdded');
If (seIsNewVersionDimensionAdded @= 'Y');
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Version dimension is added in redeployment');
	EndIf;
EndIf;


#*** Determine the order of approval dimension and version dimension
DatasourceASCIIQuoteCharacter='';
singleQ = char(39);

cApprovalDim =  ATTRS('}tp_applications', pAppId,  'ApprovalDimension');
cVersionDim = ATTRS('}tp_applications', pAppId, 'VersionDimension');

#***
vAppSubset = 'temp_app_' | pAppId;
vAppDim = '}tp_intermediate_security_applications';
IF (SubsetExists(vAppDim, vAppSubset)>0);
	SubsetDestroy(vAppDim, vAppSubset);
EndIf;
SubsetCreate(vAppDim, vAppSubset);
SubsetElementInsert(vAppDim, vAppSubset, pAppId, 1);

#***
versionIndex = 0;
approvalIndex = 0;
vDimIndex =1;
vDimension = TABDIM(pCube, vDimIndex);
vTokenString = '';

While (vDimension @<> '');
	IF (vDimension @= cApprovalDim);
		vSingleToken = '1';
		approvalIndex = vDimIndex;
	ElseIF (vDimension @= cVersionDim);
		vSingleToken = '1';
		versionIndex = vDimIndex;
	Else;
		vSingleToken = '0';
	EndIf;
	IF (vDimIndex > 1);
		vSingleToken = ':' | vSingleToken;
	EndIf;
	vTokenString = vTokenString | vSingleToken;
	vDimIndex = vDimIndex +1;
	vDimension = TABDIM(pCube, vDimIndex);
End;

If (versionIndex < approvalIndex);
versionFirst = 'Y';
EndIf;


#*** Check whether this is the first initial deployed application that gets to use this cube
cApplicationCubesCube = '}tp_application_cubes';

vVersion = '';
vUsedByAnyApp = 'N';
vAppLooper = 1;
vIsOtherAppCube = '';
vAppDimension = '}tp_applications';
vTotalApps = DIMSIZ(vAppDimension);
While (vAppLooper <= vTotalApps);
	vOtherAppId = DIMNM(vAppDimension, vAppLooper);
	vIsOtherAppCube = CellGetS(cApplicationCubesCube, vOtherAppId, pCube);
	vOtherAppApprovalDim = ATTRS( '}tp_applications', vOtherAppId, 'ApprovalDimension'); 
	vAppSecuritySet = ATTRS( '}tp_applications', vOtherAppId, 'SecuritySet'); 
	vVersion = ATTRS( '}tp_applications', vOtherAppId, 'Version');
	
	# It is an upgrade when version string is empty.
    If (vVersion @<> '');
		IF (vIsOtherAppCube @= 'A' & vAppSecuritySet @= 'Y' );
			vUsedByAnyApp = 'Y';
 		ElseIf (vIsOtherAppCube @='Y' & vOtherAppApprovalDim @='');
			vUsedByAnyApp = 'Y';
		EndIf;
	EndIf;

	vAppLooper = vAppLooper +1;
End;


#*** Create intermediate cell security cube
cIMAppDim =  '}tp_intermediate_security_applications';
cIMRDCLSCube = '}tp_intermediate_RDCLS}' | pCube;
cIMMeasuresDim = '}tp_intermediate_security_measures';

If (seIsNewVersionDimensionAdded @= 'Y');
	If (CubeExists(cIMRDCLSCube) > 0);
		CubeDestroy(cIMRDCLSCube);
	EndIf;
EndIf;
	
IF (CubeExists(cIMRDCLSCube) =0);
	IF (versionIndex >0 & approvalIndex >0);
		IF (versionFirst @= 'Y');
			CubeCreate(cIMRDCLSCube, cVersionDim, cApprovalDim,cIMAppDim, '}Groups',cIMMeasuresDim );
		Else;
			CubeCreate(cIMRDCLSCube, cApprovalDim,cVersionDim, cIMAppDim, '}Groups',cIMMeasuresDim );
		EndIf;
	ElseIf (versionIndex >0 & approvalIndex =0);
		CubeCreate(cIMRDCLSCube, cVersionDim, cIMAppDim, '}Groups',cIMMeasuresDim );
	ElseIf (versionIndex = 0 & approvalIndex >0);
		CubeCreate(cIMRDCLSCube, cApprovalDim,cIMAppDim, '}Groups',cIMMeasuresDim );
	EndIf;


	CubeSetLogChanges(cIMRDCLSCube, 1);

EndIf;


#*** Build cube rule for intermediate security cube
vMidString = '';
If (versionIndex >0 & approvalIndex >0);
	If (versionFirst @= 'Y');
		vMidString = ',!' | cVersionDim | ',!' | cApprovalDim;
	Else;
		vMidString = ',!' | cApprovalDim | ',!' | cVersionDim;
	EndIf;
ElseIf (versionIndex >0 & approvalIndex =0);
	vMidString = ',!' | cVersionDim;
ElseIf (versionIndex =0 & approvalIndex >0);
	vMidString = ',!' | cApprovalDim;
EndIf;

vRule = '';
vRule = '[' | singleQ | 'WriteCount' | singleQ | '] =IF(!' | cIMAppDim | '@<>' | singleQ | 'all_applications' | singleQ | ',
 	IF(DB(' | singleQ  | cIMRDCLSCube | singleQ | vMidString | ',!' | cIMAppDim | ', !}Groups, ' | singleQ | 'Rights' | singleQ | ') @= ' | singleQ | 'WRITE' | singleQ | ',1, 0 ),Continue);';
vRule = vRule | char(10) | '[' | singleQ | 'ReadCount' | singleQ | '] =IF(!' | cIMAppDim | '@<>' | singleQ | 'all_applications' | singleQ | ',
 	IF(DB(' | singleQ  | cIMRDCLSCube | singleQ | vMidString |  ',!' | cIMAppDim | ', !}Groups, ' | singleQ | 'Rights' | singleQ | ') @= ' | singleQ | 'READ' | singleQ | ',1, 0 ),Continue);';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'WriteCount' | singleQ  | ']=ConsolidateChildren(' | singleQ |  cIMAppDim | singleQ | ');';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'ReadCount' | singleQ  | ']=ConsolidateChildren(' | singleQ |  cIMAppDim | singleQ | ');';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'Rights' | singleQ | ']=
	S:IF(DB(' | singleQ | cIMRDCLSCube | singleQ | vMidString |  ',!' | cIMAppDim | ', !}Groups,' | singleQ | 'WriteCount' | singleQ | ')>0, ' | singleQ | 'WRITE' | singleQ | ', CONTINUE);';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'Rights' | singleQ | ']=
	S:IF(DB(' | singleQ | cIMRDCLSCube | singleQ | vMidString |  ',!' | cIMAppDim | ', !}Groups,' | singleQ | 'ReadCount' | singleQ | ')>0, ' | singleQ | 'READ' | singleQ | ', ' | singleQ | '' | singleQ | ');';

vIMFile = 'IMRDCLS_rule_' | pCube | '.txt';
SetOutputCharacterSet(vIMFile, 'TM1CS_UTF8');
TextOutput(vIMFile, vRule);

#set default value to "NONE"
vDefaultPropertyCube = '}CubeSecurityProperties';
cTM1Process = GetProcessName();
IF (CubeExists(vDefaultPropertyCube) = 0);

	ExecuteProcess('}tp_error_update_error_cube', 
		'pGuid', pExecutionId, 
		'pProcess', cTM1Process,
		'pErrorCode', 'TI_CUBE_NOT_EXIST',
		'pErrorDetails', vDefaultPropertyCube, 
		'pControl', 'Y');
	ProcessError;
Else;
	CellPutS('NONE', vDefaultPropertyCube, pCube, 'CELLSECURITYDEFAULTVALUE');
EndIf;

#***create RD cell security cube for approval dimension
cRDCLSCube ='}CellSecurity_' | pCube;

IF (CubeExists(cRDCLSCube) =0  );
	IF (SCAN('1', vTokenString) >0);
		CellSecurityCubeCreate (pCube,vTokenString);
		CubeSetLogChanges(cRDCLSCube, 1);
	EndIf;
EndIf;
573,1

574,1

575,23


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

SetInputCharacterSet('TM1CS_UTF8');
RuleLoadFromFile(cIMRDCLSCube, vIMFile);
ASCIIDelete(vIMFile);

IF (SubsetExists(vAppDim, vAppSubset) >0);
	SubsetDestroy(vAppDim, vAppSubset);
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
