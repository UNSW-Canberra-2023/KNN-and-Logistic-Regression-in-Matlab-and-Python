601,100
602,"}tp_delete_approval_security_cube"
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
560,3
pExecutionId
pApproval
pControl
561,3
2
2
2
590,3
pExecutionId,"None"
pApproval,"None"
pControl,"Y"
637,3
pExecutionId,""
pApproval,""
pControl,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,70
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
	TextOutput(cTM1Log, 'Parameters:', TIMST(NOW, '\Y-\m-\d \h:\i:\s'), pExecutionId, pApproval, pControl);
EndIf;

cSecurityCube = '}ElementSecurity_' | pApproval;
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, 'Checking for security cube:', TIMST(NOW, '\Y-\m-\d \h:\i:\s'), cSecurityCube);
EndIf;

If (CubeExists(cSecurityCube) = 1);
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, 'Security cube exists, calling CubeDestroy:', TIMST(NOW, '\Y-\m-\d \h:\i:\s'), cSecurityCube);
	EndIf;
	CubeDestroy(cSecurityCube);
Else;
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, 'Security cube does not exist:', TIMST(NOW, '\Y-\m-\d \h:\i:\s'), cSecurityCube);
	EndIf;
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
