601,100
602,"set_compare_version"
562,"NULL"
586,
585,
564,
565,"kQLH^@HY^rsaREG<L_As\s5VjTgWzcQrKmhmCpH3QMuU<dtK\04ZL2eUC8X`]viWJ[s;=qI5pZ;=^H6nPoF6U4xjr<^^ZJ[w0JoE2nQQrwirIDoxeRj_hxjQDdfGYLAhJ3x7h7bEXf;^7svdXyMt;G0mzBW1chu2Dc8?GSh]6f0ov:W8nt`nlvvxXkXNR6bu8BjC5n70"
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
pCompareVersion
561,1
2
590,1
pCompareVersion,""
637,1
pCompareVersion,"Default Version"
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,22

#****Begin: Generated Statements***
#****End: Generated Statements****

vCompareVersionAlias='';

IF(DIMIX('Version', pCompareVersion) <=0);
 ProcessError;
ENDIF;

CellPutS(pCompareVersion, 'Calendar','Compare Against','String');

vCompareVersionAlias=ATTRS('Version', pCompareVersion, 'Caption_Default');
IF(vCompareVersionAlias @='');
    vCompareVersionAlias = pCompareVersion;
ENDIF;
AttrPutS(vCompareVersionAlias|'.', 'Version', 'DashboardCA', 'Caption_Default');

ExecuteProcess('create_default_subset', 'pSubsetName','Current');
ExecuteProcess('create_default_subset', 'pSubsetName','Analysis');


573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,4

#****Begin: Generated Statements***
#****End: Generated Statements****

576,CubeAction=1511DataAction=1503CubeLogChanges=0_DeployParams={&quotdataAction&quot:&quotACCUMULATE&quot&#044&quotclass&quot:&quotDeployParams&quot&#044&quotdimensionConflictResolutions&quot:{}}_ParseParams={&quotmeasures&quot:[]&#044&quothasHeader&quot:&quotfalse&quot&#044&quotnumColumns&quot:&quot0&quot&#044&quotskipRows&quot:&quot0&quot&#044&quotlocale&quot:{&quotlanguange&quot:&quoten&quot&#044&quotvariant&quot:&quot&quot&#044&quotcountry&quot:&quotUS&quot}&#044&quotdimensions&quot:[]}
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
