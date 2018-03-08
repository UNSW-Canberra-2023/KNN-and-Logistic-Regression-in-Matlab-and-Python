601,100
602,"}tp_util_is_in_subset"
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
560,5
pExecutionId
pDim
pSubset
pNode
pControl
561,5
2
2
2
2
2
590,5
pExecutionId,"None"
pDim,"None"
pSubset,"None"
pNode,"None"
pControl,"Y"
637,5
pExecutionId,""
pDim,""
pSubset,""
pNode,""
pControl,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,159


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
EndIf;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#***

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters: ', pDim, pSubset, pNode, pControl);
EndIf;

#***

StringGlobalVariable('gIsInSubset');

If (DimensionExists(pDim) = 0);
	ProcessError;
EndIf;

If (SubsetExists(pDim, pSubset) = 0);
	ProcessError;
EndIf;

gIsInSubset = 'N';
#IF(1)
If (DIMIX(pDim, pNode) <> 0);

	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Node is in dimension', pNode, pDim);
	EndIf;

	cNodePName = DimensionElementPrincipalName(pDim, pNode);	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Node name: ' | cNodePName);
	EndIf;

	cSubsetSize = SubsetGetSize(pDim, pSubset);
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Subset size: ' | NumberToString(cSubsetSize));
	EndIf;

	#IF(1.1)
	If (cSubsetSize > 1);
	
		#*** Escape the node to ensure valid MDX
		StringGlobalVariable('gEscapedId');
		vReturnValue = ExecuteProcess(cControlPrefix | 'tp_util_escape_id', 
			'pExecutionId', pExecutionId, 'pNode', cNodePName, 'pControl', pControl);
		If (vReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;
		If (cGenerateLog @= 'Y');
			TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Escaped Node name: ' | gEscapedId);
		EndIf;				

		If (CubeExists(pDim) = 0);
			vMDX = 'EXCEPT(TM1SubsetToSet([' | pDim | '], "' | pSubset | '"), {[' | pDim | '].[' | gEscapedId | ']})';
		Else;
			vMDX = 'EXCEPT(TM1SubsetToSet([' | pDim | '].[' | pDim | '] , "' | pSubset | '"), {[' | pDim | '].[' | gEscapedId | ']})';
		EndIf;
		
		If (cGenerateLog @= 'Y');
			TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'MDX: ', vMDX);
		EndIf;

		cSubsetLess = 'tp_temp_less_' | pExecutionId;
		SubsetDestroy(pDim, cSubsetLess);
		SubsetCreateByMdx(cSubsetLess, vMDX);

		If (cSubsetSize > SubsetGetSize(pDim, cSubsetLess));
			If (cGenerateLog @= 'Y');
				TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Node is in subset(0)');
			EndIf;
			gIsInSubset = 'Y';
		Else;
			gIsInSubset = 'N';
		EndIf;

		SubsetDestroy(pDim, cSubsetLess);

	#IF(1.1)
	ElseIf (cSubsetSize = 1);

		cOnlyMember = SubsetGetElementName(pDim, pSubset, 1);
		If (cGenerateLog @= 'Y');
			TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Only member: ' | cOnlyMember);
		EndIf;
		
		cOnlyMemberPName = DimensionElementPrincipalName(pDim, cOnlyMember);
		If (cOnlyMemberPName @= cNodePName);
			If (cGenerateLog @= 'Y');
				TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Node is in subset(1)');
			EndIf;
			gIsInSubset = 'Y';
		Else;
			gIsInSubset = 'N';
		EndIf;

	#IF(1.1)
	Else;
		gIsInSubset = 'N';
	EndIf;

EndIf;

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'gIsInSubset: ' | gIsInSubset);
EndIf;

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
