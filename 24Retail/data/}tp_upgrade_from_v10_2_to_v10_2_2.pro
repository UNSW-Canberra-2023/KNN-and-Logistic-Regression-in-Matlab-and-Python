601,100
602,"}tp_upgrade_from_v10_2_to_v10_2_2"
562,"NULL"
586,
585,
564,
565,"w4uOy;HIG_jsqiFiRcUToIuab?xQhWYP?i>dSc>IJ]iqw?T<g[FMSO0yFj?Cr^yS;1q@Gy9:veDQCi8xwsFCgvbmAvLDciSuUVhdtkoHSJeJiS\Skq=6N>wfDbjfvCkKQJHiNByI8FWiqsc<e_l_ovEPL3ej0mxXYojj1qtt>z<5@ygQbj?]woO3WW7fxP7CEd0O:=Yb"
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
560,1
pExecutionId
561,1
2
590,1
pExecutionId,"None"
637,1
pExecutionId,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,126


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2014
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################


#*** Add element 'EnableElementSecurityOnApproval' to dimension '}tp_config'

cConfigDim = '}tp_config';
If (DimensionExists(cConfigDim) = 0);
	ProcessError;
EndIf;

cEnableElementSecurity = 'EnableElementSecurityOnApproval';
If (DIMIX(cConfigDim, cEnableElementSecurity)=0);
	DimensionElementInsert(cConfigDim, '', cEnableElementSecurity,'S');
EndIf;


#*** Add attribute 'SecurityMethod' to dimension '}tp_applications'

cApplicationsDim = '}tp_applications';
If (DimensionExists(cApplicationsDim) = 0);
	ProcessError;
EndIf;

cApplicationsAttributesDim = 'ElementAttributes_}' | cApplicationsDim;
cSecurityMethod = 'SecurityMethod';
If (DIMIX(cApplicationsAttributesDim, cSecurityMethod)=0);
	AttrInsert(cApplicationsDim, '', cSecurityMethod,'S');
EndIf;


#*** Add jobs dimension

cJobsDim = '}tp_jobs';

If (DimensionExists(cJobsDim) = 0);
	DimensionCreate(cJobsDim);
EndIf;

#*** Add jobs info dimension

cJobInfoDim = '}tp_job_info';

cJobAppId = 'ApplicationId';
cJobAppName = 'ApplicationName';
cJobType = 'JobType';
cJobOwner = 'Owner';
cJobOwnerId = 'OwnerId';
cJobStartDate = 'StartDate';
cJobEndDate = 'EndDate';
cJobStatus = 'JobStatus';

If (DimensionExists(cJobInfoDim) = 0);

	DimensionCreate(cJobInfoDim);
	
	DimensionElementInsert(cJobInfoDim, '', cJobAppId, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobAppName, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobType, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobOwner, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobOwnerId, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobStartDate, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobEndDate, 'S');
	DimensionElementInsert(cJobInfoDim, '', cJobStatus, 'S');
EndIf;

#*** create cube to store application jobs 

cApplicationJobCube = '}tp_application_jobs';
If (CubeExists(cApplicationJobCube) = 0);
	CubeCreate(cApplicationJobCube, cJobsDim, cJobInfoDim);
	CubeSetLogChanges(cApplicationJobCube, 1);
EndIf;


#*** Create task navigation dimension
cTaskNavDimension = '}tp_task_navigations';
cNavElemField = 'NavigationElement';
If (DimensionExists(cTaskNavDimension) = 0);
	DimensionCreate(cTaskNavDimension);
	DimensionElementInsert(cTaskNavDimension, '',cNavElemField , 'S');
EndIf;


#*** Create artifacts for central applications

cRootPermissionsDim = '}tp_root_permissions';

cOffline = 'OFFLINE';
cOwnership = 'OWN';

If (DimensionExists(cRootPermissionsDim) = 0);
	DimensionCreate(cRootPermissionsDim);
	
	DimensionElementInsert(cRootPermissionsDim, '',cOffline,'S');
	DimensionElementInsert(cRootPermissionsDim, '', cOwnership, 'S');
	SubsetCreate(cRootPermissionsDim, 'Default');
	SubsetIsAllSet(cRootPermissionsDim, 'Default', 1);
EndIf;

cRootPermissionsCube = '}tp_application_root_permissions';
cCellSecurityRootPermissionsCube = '}CellSecurity_' | cRootPermissionsCube;

If (CubeExists(cRootPermissionsCube) = 0);
	CubeCreate(cRootPermissionsCube, cApplicationsDim, cRootPermissionsDim);
	CubeSetLogChanges(cRootPermissionsCube, 1);	
EndIf;

If (CubeExists(cCellSecurityRootPermissionsCube) = 0);
	CubeCreate(cCellSecurityRootPermissionsCube, cApplicationsDim, cRootPermissionsDim, '}Groups');
	CubeSetLogChanges(cCellSecurityRootPermissionsCube, 1);
EndIf;

573,1

574,1

575,22


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2014
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################


#*** Do not enforce element security on approval dimension for upgrade
If (ATTRS(cConfigDim, cEnableElementSecurity, 'String Value') @= '');
	AttrPutS('Y', cConfigDim, cEnableElementSecurity, 'String Value');
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
