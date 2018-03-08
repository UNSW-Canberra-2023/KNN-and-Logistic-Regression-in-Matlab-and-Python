601,100
602,"ResetRevenueData"
562,"CHARACTERDELIMITED"
586,"C:\IBM Demos\SmartCo\Files\RevenueDataToResetDemo.cma"
585,"C:\IBM Demos\SmartCo\Files\RevenueDataToResetDemo.cma"
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
589,","
568,""""
570,
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,9
vCubeName
vOrganization
vChannel
vProduct
vMonth
vYear
vVersion
vMeasures
vValue
578,9
2
2
2
2
2
2
2
2
2
579,9
1
2
3
4
5
6
7
8
9
580,9
0
0
0
0
0
0
0
0
0
581,9
0
0
0
0
0
0
0
0
0
582,9
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
931,1
0,0,0,0,0,0,0,0,0,
603,0
572,13

#****Begin: Generated Statements***
#****End: Generated Statements****

DataSourceType='CHARACTERDELIMITED';
DatasourceASCIIDelimiter=',';
DatasourceASCIIQuoteCharacter='"';
DatasourceASCIIDecimalSeparator='.';
DatasourceASCIIThousandSeparator=',';
DatasourceNameForServer=CellGetS( 'Calendar', 'Base Directory','String')|'Files'|CellGetS( 'Calendar', 'Directory Separator','String')|'RevenueDataToResetDemo.cma';
DatasourceNameForClient=DatasourceNameForServer;


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,12

#****Begin: Generated Statements***
#****End: Generated Statements****


IF (DIMIX('product', vProduct)> 0);
     vNumber = ROUNDP(StringToNumber(vValue), 2);
     CellPutN(vNumber,'Revenue',vOrganization,vChannel,vProduct,vMonth,vYear,vVersion,vMeasures);
ENDIF;



575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
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
