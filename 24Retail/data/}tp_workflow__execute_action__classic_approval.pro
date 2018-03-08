601,100
602,"}tp_workflow__execute_action__classic_approval"
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
pTime
pAppId
pNode
pAction
561,5
2
2
2
2
2
590,5
pExecutionId,"None"
pTime,"0"
pAppId,"MyApp"
pNode,"NA"
pAction,"NA"
637,5
pExecutionId,""
pTime,""
pAppId,""
pNode,""
pAction,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,206
#******
#******
#***BEGIN(Prolog): }tp_workflow__execute_action__classic_approval
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
		'pNode=' | pNode,
		'pAction=' | pAction);
EndIf;

#****** Action Dispatcher
If (pAction @= 'ENTER');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__enter__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'OWN');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__own__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'CHECKBOUNCEMSG');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__check-bounce-message__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'RELEASE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__release__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'SAVE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__save__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'SUBMIT');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__submit__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'SUBMITCHILDREN');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__submit-leaf-children__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'REJECT');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__reject__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'CHECKREJECTBOUNCE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__check-reject-bounce__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'REJECTOWN');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__reject-own__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'OFFLINE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__offline__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'ONLINE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__online__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
ElseIf (pAction @= 'LEAVE');

	#*** Call TI process
	tReturnValue = ExecuteProcess('}tp_workflow__leave__classic_approval',
		'pExecutionId', pExecutionId, 
		'pTime', pTime, 
		'pAppId', pAppId, 
		'pNode', pNode);
	If (tReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
EndIf;

#*** Write to Log File
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'),
		'The end has been reached.');
EndIf;
#******
#***END(Prolog): }tp_workflow__execute_action__classic_approval
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
