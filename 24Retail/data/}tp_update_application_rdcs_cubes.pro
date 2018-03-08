601,100
602,"}tp_update_application_RDCS_cubes"
562,"NULL"
586,
585,
564,
565,"t5XVH4So8VX^R_p?LG\4a`fpyvq5lIK6cx<Sac9p];LNWK37gHx`DZWvB;TqvN2\=hv_teC3pF7oYZuw`MVc<z5@9j=NfS5M@Y`3uhEE\\Kbi_eTXdL2eVgEWLnH:E:Bb:r`U=fUEQ`vZtajQ_QkW5ErOgR0UR4ZI1i[XYnu;Ae[SFoRiG=d9b>4XxbcnDIJYuAYPjPs"
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
pCubeInfo
pApprovalDim
pVersionDim
pVersionSlicesWrite
pVersionSlicesRead
pNode
pGroup
pRights
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
pAppId,"MyApp"
pCubeInfo,"None"
pApprovalDim,"None"
pVersionDim,"None"
pVersionSlicesWrite,"None"
pVersionSlicesRead,"None"
pNode,"node name"
pGroup,"group name"
pRights,"security rights"
637,10
pExecutionId,""
pAppId,""
pCubeInfo,""
pApprovalDim,""
pVersionDim,""
pVersionSlicesWrite,""
pVersionSlicesRead,""
pNode,""
pGroup,""
pRights,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,135

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
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Parameters:',pExecutionId, pAppId, pCubeInfo,pNode, pGroup, pRights);
EndIf;


#*Update RD cell security cubes
cubeSeparater = '*';
vPosCube = 0;
vStringToScan = pCubeInfo;
vPosCube = SCAN(cubeSeparater, vStringToScan);
vFirstElement = 1;

While (vPosCube >0);
	vCubeName = SUBST(vStringToScan, 1, vPosCube-1);
	vFlagCube = SUBST(vStringToScan, vPosCube+1, 1);
	
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Update RDSC cubes  pAppId=' | pAppId |
			 ' CubeName=' | vCubeName | ' Node Name =' | pNode | ' GroupName= ' | pGroup|  ' Rights=' | pRights );
	EndIf;
	
	If (vFlagCube @= 'A' );

		versionIndex = 0;
		approvalIndex = 0;
		dimensionIndex = 1;
		While (dimensionIndex > 0 ); 
			cCubeDimensionName = TABDIM(vCubeName, dimensionIndex);
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
		endif;


		#***start
		versionSeparater = '|';
		vPosVersion = 0;
		vStringToScan = pVersionSlicesWrite;
		IF (pVersionSlicesWrite @<> '');
			vPosVersion = SCAN(versionSeparater, vStringToScan);
		Else;
			vPosVersion = 1;
		Endif;

		While (vPosVersion >0);
			vVersionSlice  = SUBST(vStringToScan, 1, vPosVersion-1);
			vStringToScan = SUBST(vStringToScan, vPosVersion +1, LONG(vStringToScan)-vPosVersion);
			vPosVersion = SCAN(versionSeparater, vStringToScan);

			#***start
			#cIMAppDim =  '}tp_intermediate_security_applications';
			cIMRDCLSCube = '}tp_intermediate_RDCLS}' | vCubeName;
			#cIMMeasuresDim = '}tp_intermediate_security_measures';
	
			IF (CubeExists(cIMRDCLSCube) >0);
				IF (versionIndex >0 & approvalIndex >0);
					IF (versionFirst @= 'Y');
						CellPutS('', cIMRDCLSCube, vVersionSlice, pNode,pAppId, pGroup,'Rights' );
					Else;
						CellPutS('', cIMRDCLSCube, pNode, vVersionSlice,pAppId, pGroup,'Rights' );
					Endif;
				Elseif (versionIndex >0 & approvalIndex =0);
					CellPutS('', cIMRDCLSCube, vVersionSlice, pAppId, pGroup,'Rights' );
				ElseIf (versionIndex = 0 & approvalIndex >0);
					CellPutS('', cIMRDCLSCube, pNode, pAppId, pGroup,'Rights' );
				Endif;

			Endif;

		End;

	EndIf;
	
	vStringToScan = SUBST(vStringToScan, vPosCube +3, LONG(vStringToScan)-vPosCube);
	vPosCube = SCAN(cubeSeparater, vStringToScan);
End;
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
