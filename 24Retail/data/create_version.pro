601,100
602,"create_version"
562,"NULL"
586,
585,
564,
565,"eAni7a0nh;gbSPi2>\k1]j0cyyoo[ZazRSavPBd:y0q@Yil@Jx8XGWzHx7e5A`M44^uXvf:PgzwNeeN@?F5<PMcComDVuBS_hYAju1klz6FQfsF2n<mfs@p=k]hJrVEZ0_yB_Yr6FbwsvZff^q\f7GxRywASAcJM>X[MSpQ;`00D:B1tZgsdh\mr\KOk_AG<dKlXOSRa"
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
560,2
pNewVersion
pLinkToDrivers
561,2
2
2
590,2
pNewVersion,""
pLinkToDrivers,"Y"
637,2
pNewVersion,"New Version"
pLinkToDrivers,"Link to Drivers ?"
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,11

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(pNewVersion @='');
  ProcessError;
ENDIF;

DimensionElementInsert('Version','',pNewVersion,'N');


573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,23

#****Begin: Generated Statements***
#****End: Generated Statements****

VersionType='';

IF( pLinkToDrivers@='Y');
  VersionType= 'B';
  AttrPuts(VersionType, 'Version',pNewVersion, 'Version Type');
  AttrPuts(pNewVersion, 'Version',pNewVersion, 'LinkVersion');
#ASCIIOUTPUT('C:\guy.txt',pNewVersion);
ENDIF;
  AttrPutn(1, 'Version',pNewVersion, 'VarianceFactor');

AttrPuts('b:#,##0;(#,##0)CO|0|Y', 'Version',pNewVersion, 'Format');


ExecuteProcess('Set_Default_Version','pDefaultVersion',pNewVersion);

ExecuteProcess('create_default_subset','pSubsetName','Current');



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
