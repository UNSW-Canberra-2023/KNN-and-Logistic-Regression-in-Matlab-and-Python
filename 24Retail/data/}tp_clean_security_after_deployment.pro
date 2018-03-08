601,100
602,"}tp_clean_security_after_deployment"
562,"NULL"
586,
585,
564,
565,"fJJ6E=alqG7=UldUwsX=;W5u4bj?`ZAMPzVrwHvup\ma29iMfRisDf<\zIaG\\a9>kHdD2[\GM8YCS6XEbMg05rAGSgFwyUXQJ4SAd?lovcI0i6B8Gr<x9tpaL4I0mQD_Zzi5yRPPfosme4GvGqGpIG0bc75fJn3\wjq`_7AmFgI`[KHeG_WP@Kl8UldZ<xwCHk;ufZ5"
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
560,3
pExecutionId
pAppId
pControl
561,3
2
2
2
590,3
pExecutionId,"None"
pAppId,"MyApp"
pControl,"Y"
637,3
pExecutionId,""
pAppId,""
pControl,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,185
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
Endif;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#*** Log Parameters

If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters:',
pExecutionId, pAppId, pControl);
EndIf;

#***
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, 'Get Approval dimension and subset');
EndIf;

StringGlobalVariable('gApprovalDim');
StringGlobalVariable('gApprovalSubset');
StringGlobalVariable('gSecuritySet');
StringGlobalVariable('gApprovalSubsetComplementMdx');

vReturnValue = ExecuteProcess(cControlPrefix | 'tp_get_application_attributes',
'pExecutionId', pExecutionId, 'pAppId', pAppId, 'pControl', pControl);
If (vReturnValue <> ProcessExitNormal());
ProcessError;
EndIf;

cApprovalDim = gApprovalDim;
cApprovalSubset = gApprovalSubset;
cSecuritySet = gSecuritySet;
cApprovalSubsetComplementMdx = gApprovalSubsetComplementMdx;
#cApprovalDimSize = DIMSIZ(cApprovalDim);
#cApprovalSubsetSize = SubsetGetSize(cApprovalDim, cApprovalSubset);

#*** Zero out the values in cubes that are not in the approval subset
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Zero out the values in cubes that are not in the approval subset');
EndIf;

cApplicationsDim = cControlPrefix | 'tp_applications';
cAppElementSecurityCube = '}ElementSecurity_' | cApplicationsDim;
cElementSecurityCube = '}ElementSecurity_' | cApprovalDim;
cPermissionsDim = cControlPrefix | 'tp_permissions';
cPermissionCube = cControlPrefix | 'tp_application_permission}' | pAppId;
cCellSecurityCube = '}CellSecurity_' | cPermissionCube;

If (cApprovalSubsetComplementMdx @<> '');

vApprovalSubsetComplement = 'tp_temp_approval_subset_complement_' | pExecutionId;
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, 'approval subset complement: ' | vApprovalSubsetComplement);
EndIf;

SubsetDestroy(cApprovalDim, vApprovalSubsetComplement);
SubsetCreateByMdx(vApprovalSubsetComplement, cApprovalSubsetComplementMdx);

#* Zero out cell security cube
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Zero out cell security cube');
EndIf;

vComplementView = 'tp_temp_cell_security_view_' | pExecutionId;
ViewCreate(cCellSecurityCube, vComplementView);
ViewColumnDimensionSet(cCellSecurityCube, vComplementView, '}Groups', 1);
ViewRowDimensionSet(cCellSecurityCube, vComplementView, cApprovalDim, 1);
ViewSubsetAssign(cCellSecurityCube, vComplementView, cApprovalDim, vApprovalSubsetComplement);
ViewTitleDimensionSet(cCellSecurityCube, vComplementView, cPermissionsDim);

ViewZeroOut(cCellSecurityCube, vComplementView);
ViewDestroy(cCellSecurityCube, vComplementView);

#* Zero out element security cube
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Zero out element security cube');
EndIf;

vComplementView = 'tp_temp_element_security_view_' | pExecutionId;
ViewCreate(cElementSecurityCube, vComplementView);
ViewColumnDimensionSet(cElementSecurityCube, vComplementView, '}Groups', 1);
ViewRowDimensionSet(cElementSecurityCube, vComplementView, cApprovalDim, 1);
ViewSubsetAssign(cElementSecurityCube, vComplementView, cApprovalDim, vApprovalSubsetComplement);

ViewZeroOut(cElementSecurityCube, vComplementView);
ViewDestroy(cElementSecurityCube, vComplementView);

#***Zero out element properties cube
cElementPropertiesCube = '}ElementProperties_' | cApprovalDim;
cElementPropertiesDim = '}ElementProperties';	
vComplementView = 'tp_temp_view_' | pExecutionId;
ViewCreate(cElementPropertiesCube, vComplementView);
ViewColumnDimensionSet(cElementPropertiesCube, vComplementView, cElementPropertiesDim, 1);
ViewRowDimensionSet(cElementPropertiesCube, vComplementView, cApprovalDim, 1);
ViewSubsetAssign(cElementPropertiesCube, vComplementView, cApprovalDim, vApprovalSubsetComplement);
		
ViewZeroOut(cElementPropertiesCube, vComplementView);
ViewDestroy(cElementPropertiesCube, vComplementView);

SubsetDestroy(cApprovalDim, vApprovalSubsetComplement);

EndIf;


#* Zero out application element security cube
If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Zero out application element security cube');
EndIf;

cGroupsDimSize = DIMSIZ('}Groups');
cApprovalDimSize = DIMSIZ(cApprovalDim);
vIndexI = 1;
While (vIndexI <= cGroupsDimSize);
vGroup = DIMNM('}Groups', vIndexI);

vRight = 'NONE';
vIndexJ = 1;
While (vIndexJ <= cApprovalDimSize);
vNode = DIMNM(cApprovalDim, vIndexJ);
vRight = ElementSecurityGet(cApprovalDim, vNode, vGroup);
If (vRight @<> 'NONE');
vIndexJ = cApprovalDimSize;
EndIf;
vIndexJ = vIndexJ + 1;
End;

If (vRight @= 'NONE');

If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Remove element security', cApplicationsDim,  pAppId, vGroup);
EndIf;

ElementSecurityPut('NONE', cApplicationsDim, pAppId, vGroup);
EndIf;

vIndexI = vIndexI + 1;
End;

CubeSetLogChanges(cCellSecurityCube, 1);

#*** No error

If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'The end has been reached.');
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
