601,100
602,"}tp_custom_TI_update_error_code_alias"
562,"NULL"
586,
585,
564,
565,"eJpKgaztwjWlNjxWAo0l4ju7vnTzv6Uu0f=UwPF;QoDU<y1ZcBgSiiG<>5o\rl3zfO]PUMu>ua_GBVGXxHVGTEI?irG`rr9\^b7><FFF<Vn42Y][H8njb[jp\vEN`^edYRvUq3aB5ofo`>>^>P=5LyEyNTYQBtrVbBSLxm9yhd4<_OLNtJYZKpnb[U@G`kMpsjs@XZ=0"
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
pErrorCode
pAliasName
pAliasValue
561,4
2
2
2
2
590,4
pExecutionId,"None"
pErrorCode,"None"
pAliasName,"None"
pAliasValue,"None"
637,4
pExecutionId,""
pErrorCode,""
pAliasName,""
pAliasValue,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,79

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

cControlPrefix = '}';

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
'pProcess', cTM1Process, 'pControl', 'Y');
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
Endif;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;


If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), pErrorCode, pAliasName, pAliasValue);
EndIf;

#***
vErrorDim = '}tp_process_errors_localization';
vAttrCube = '}ElementAttributes_' | vErrorDim;
vAttrDim = vAttrCube;


IF (DIMIX(vErrorDim, pErrorCode) >0);
	IF (DIMIX(vAttrDim, pAliasName) =0);
		AttrInsert(vErrorDim, '', pAliasName, 'A');
		If (cGenerateLog @= 'Y');
			TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Alias: ' | pAliasName | ' is added.');
		EndIf;
	Endif;

Else;

	vReturnValue = ExecuteProcess(cControlPrefix | 'tp_error_update_error_cube',
		'pGuid', pExecutionId,
		'pProcess', cTM1Process,
		'pErrorCode', 'TI_NODE_NOT_EXIST',
		'pErrorDetails', vErrorDim | ', ' | pErrorCode,
		'pControl', 'Y');

Endif;

#*** No error

If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, 'The end has been reached.');
EndIf;

573,1

574,1

575,41

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

#***
cTM1Log = cPrologLog;

#Set caption support
vCaptionCube = '}ElementCaptionsByDimension';
vCaptionDim = '}Cultures';
IF (DIMIX(vCaptionDim, pAliasName)>0);
	vCurrentCaption = CellGetS(vCaptionCube, vErrorDim, pAliasName, 'Input');
	IF (vCurrentCaption @<> pAliasName);
		CellPutS(pAliasName, vCaptionCube, vErrorDim, pAliasName, 'Input');
	Endif;
Endif;


#***
AttrPutS(pAliasValue, vErrorDim, pErrorCode, pAliasName);
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'ErrorCode: ' | pErrorCode |  ' Alias: ' | pAliasName | ' is updated with ' | pAliasValue);
EndIf;

#*** No error

If (cGenerateLog @= 'Y');
TextOutput(cTM1Log, 'The end has been reached.');
EndIf;

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
