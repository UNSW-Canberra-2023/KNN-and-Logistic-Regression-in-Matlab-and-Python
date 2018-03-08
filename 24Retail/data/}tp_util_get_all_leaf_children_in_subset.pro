601,100
602,"}tp_util_get_all_leaf_children_in_subset"
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
pNewSubset
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
pNewSubset,"None"
637,5
pExecutionId,""
pDim,""
pSubset,""
pNode,""
pNewSubset,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,47


#*** Define global variables
StringGlobalVariable('gEscapedId');

#*** Call a TI process.
vReturnValue = ExecuteProcess('}tp_util_escape_id',
	'pExecutionId', pExecutionId, 
	'pNode', pNode, 
	'pControl', 'Y');
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;

vEscapedNode = gEscapedId;

If (SubsetExists(pDim, pSubset) = 0);
	ProcessError;
EndIf;

If (DTYPE(pDim, pNode) @<> 'C');
    ProcessError;
EndIf;

If (SubsetExists(pDim, pNewSubset) <> 0);
	SubsetDestroy(pDim, pNewSubset);
EndIf;

vMDX = '{INTERSECT(TM1FILTERBYLEVEL({DESCENDANTS([' | pDim
	| '].[' | vEscapedNode | ']) }, 0), TM1SUBSETTOSET([' | pDim
	| '], "' | pSubset |'")), ['| pDim | '].[' | vEscapedNode | ']}';

SubsetCreateByMdx(pNewSubset, vMDX);

#*** Call a TI process.
vReturnValue = ExecuteProcess('}tp_util_delete_subset_element',
	'pDim', pDim, 
	'pSubset', pNewSubset, 
	'pNode', pNode);
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
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
