601,100
602,"}tp_deploy_create_shadow_dimension"
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
560,6
pExecutionId
pAppId
pApprovalDim
pApprovalSubset
pSubsetAlias
pIncrShadowDimUpdate
561,6
2
2
2
2
2
2
590,6
pExecutionId,"None"
pAppId,"MyApp"
pApprovalDim,"TestElist"
pApprovalSubset,"TestElist"
pSubsetAlias,"None"
pIncrShadowDimUpdate,"N"
637,6
pExecutionId,""
pAppId,""
pApprovalDim,""
pApprovalSubset,""
pSubsetAlias,""
pIncrShadowDimUpdate,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,146


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010, 2013
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

If (cGenerateLog @= 'Y' % cGenerateLog @= 'T');
	vReturnValue = ExecuteProcess('}tp_get_log_file_names', 'pExecutionId', pExecutionId,
		'pProcess', cTM1Process, 'pControl', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#*** Log Parameters

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters:',
	pExecutionId, pAppId, pApprovalDim, pApprovalSubset);
EndIf;


#*** Define constants
cShadowApprovalDim = '}tp_tasks}' | pAppId;
cAttributeCube = '}ElementAttributes_' | cShadowApprovalDim;
cAttributeDim = cAttributeCube;
cApprovalAttributeCube = '}ElementAttributes_' | pApprovalDim;
cApprovalAttributeDim = cApprovalAttributeCube;


#*** Create Shadow Dimension
If (pIncrShadowDimUpdate @= 'Y');
	vCopyApprovalHierarchyContents = 'N';
Else;
	vCopyApprovalHierarchyContents = 'Y';
EndIf;

If (DimensionExists(cShadowApprovalDim) = 0);
	DimensionCreate(cShadowApprovalDim);
	vCopyApprovalHierarchyContents = 'Y';
EndIf;

IF (SubsetExists(cShadowApprovalDim, pApprovalSubset) = 0);
	SubsetCreate(cShadowApprovalDim, pApprovalSubset);
EndIf;

# The subset we create on the Shadow Approval Dim will always comprise the whole
# contents of cShadowApprovalDim, so we can just set it to use the whole dimension
SubsetIsAllSet(cShadowApprovalDim, pApprovalSubset,1);

#*** copy all aliases from approval dimension to the shadow dimension
vTotalAttributes = DIMSIZ(cApprovalAttributeDim);
vAttrLooper = vTotalAttributes;

While (vAttrLooper >=1);
	vAttribute = DIMNM(cApprovalAttributeDim, vAttrLooper);
	insertAlias = 'N';
	If (CubeExists(cAttributeCube) =0);
		insertAlias = 'Y';
	ElseIf (DIMIX(cAttributeDim, vAttribute) = 0);
		insertAlias = 'Y';
	Else;
		insertAlias = 'N';
	EndIf;
	
	IF (insertAlias @= 'Y');
		vAttributeType = DType(cApprovalAttributeDim, vAttribute);
		IF (vAttributeType @= 'AA');
			AttrInsert(cShadowApprovalDim, '', vAttribute, 'A');
		EndIf;
	EndIf;
	vAttrLooper = vAttrLooper -1;
End;


#*** Use the same alias
If (pSubsetAlias @<>'' & DIMIX(cAttributeDim, pSubsetAlias) >0);
	SubsetAliasSet(cShadowApprovalDim, pApprovalSubset, pSubsetAlias);
EndIf;

#*** Delete all elements in Shadow Approval Dimension and copy all elements from approval hierarchy
If (vCopyApprovalHierarchyContents @= 'Y');
	DimensionDeleteAllElements(cShadowApprovalDim);

	vTotalNodes = SubsetGetSize(pApprovalDim, pApprovalSubset);
	looper = 1;
	While (looper <= vTotalNodes);
		vElem = SubsetGetElementName(pApprovalDim,  pApprovalSubset, looper);
		vType = DType(pApprovalDim, vElem);
		DimensionElementInsert(cShadowApprovalDim, '', vElem, vType);
		looper = looper +1;
	End;
EndIf;

#  re-build the hierarchy in cShadowApprovalDim
vTotalNodes = SubsetGetSize(pApprovalDim, pApprovalSubset);
looper = 1;

While (looper <=vTotalNodes);
	vElem = SubsetGetElementName(pApprovalDim,  pApprovalSubset, looper);
	# Need to handle dimensions with multiple roll-ups...so when we look to find the shadow dimension element's parent in the original
	# pApprovalDim, we need to ensure that the parent is also in cShadowApprovalDim....if it's not, then
	# keep looking until you find it. We know we only have to look a maximum of ELPARN times.
	vElemParentCount = ELPARN(pApprovalDim, vElem);
	rolluplooper = 1;
	While (rolluplooper <= vElemParentCount);
		vOriginalParent = ELPAR(pApprovalDim, vElem, rolluplooper);
		# Check that parent of selected node exists in the shadow a/h...if it doesn't, then keep looking
		If (DIMIX(cShadowApprovalDim, vOriginalParent)<>0);
			vWeight = ELWEIGHT(pApprovalDim, vOriginalParent, vElem);
			DimensionElementComponentAdd(cShadowApprovalDim, vOriginalParent, vElem, vWeight);
		EndIf;
		rolluplooper = rolluplooper + 1;
	End;
	
	looper = looper +1;
End;

573,1

574,1

575,40


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010, 2013
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################

#*** Add alias for each node on shadow dimension
vTotalNodes = SubsetGetSize(pApprovalDim, pApprovalSubset);
looper = 1;
While (looper <=vTotalNodes);
	vElem = SubsetGetElementName(pApprovalDim,  pApprovalSubset, looper);

	vTotalAttributes = DIMSIZ(cApprovalAttributeDim);
	vAttrLooper = vTotalAttributes;

	While (vAttrLooper >=1);
		vAttribute = DIMNM(cApprovalAttributeDim, vAttrLooper);
		vAttributeType = DType(cApprovalAttributeDim, vAttribute);
		IF (vAttributeType @= 'AA');
			vApprovalElemAlias = AttrS(pApprovalDim, vElem, vAttribute);
			vShadowElemAlias = AttrS(cShadowApprovalDim, vElem, vAttribute);
			IF (vApprovalElemAlias @<> vShadowElemAlias);
				AttrPutS(vApprovalElemAlias, cShadowApprovalDim, vElem, vAttribute);
			EndIf;
		EndIf;
		vAttrLooper = vAttrLooper -1;
	End;
	looper = looper +1;
End;

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
