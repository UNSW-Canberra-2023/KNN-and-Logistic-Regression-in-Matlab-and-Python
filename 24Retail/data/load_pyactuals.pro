601,100
602,"Load_PYActuals"
562,"VIEW"
586,"Income Statement"
585,"Income Statement"
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
570,BudgetFrom
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,10
cCurrency
organization
vYear
vMonth
Account
Version
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,10
2
2
2
2
2
2
1
1
2
1
579,10
1
2
3
4
5
6
7
8
9
10
580,10
0
0
0
0
0
0
0
0
0
0
581,10
0
0
0
0
0
0
0
0
0
0
582,10
VarType=32ColType=825VarDimension=Currency CalcVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=organizationVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=827
VarType=32ColType=825VarDimension=MonthVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=AccountVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=827
VarType=33ColType=827
VarName=tVersionVarType=32ColType=825VarFormula=tVersion='Actual';:VarFormulaDestination=BOTHVarDimension=VersionVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarName=vValueVarType=33ColType=826VarFormula=vValue=IF(Account@='6600',value,:IF(Account@='6610',value,:value*(.97+RAND*(.06))));:VarFormulaDestination=BOTH
VarName=vYr2011VarType=32ColType=825VarFormula=vYr2011='Y1';:VarFormulaDestination=BOTHVarDimension=YearVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
931,1
0,0,0,0,0,0,0,0,0,0,
603,0
572,8

#****Begin: Generated Statements***
OldCubeLogChanges = CUBEGETLOGCHANGES('Income Statement');
CUBESETLOGCHANGES('Income Statement', 0);
#****End: Generated Statements****


CubeDataReservationAcquire('Income Statement', TM1User(), 0, '|||||') ;
573,10

#****Begin: Generated Statements***
tVersion='Actual';
vValue=IF(Account@='6600',value,
IF(Account@='6610',value,
value*(.97+RAND*(.06))));
vYr2011='Y1';
#****End: Generated Statements****


574,13

#****Begin: Generated Statements***
tVersion='Actual';
vValue=IF(Account@='6600',value,
IF(Account@='6610',value,
value*(.97+RAND*(.06))));
vYr2011='Y1';
CellPutN(vValue,'Income Statement',cCurrency,organization,vYr2011,vMonth,Account,tVersion);
#****End: Generated Statements****




575,5

#****Begin: Generated Statements***
CUBESETLOGCHANGES('Income Statement', OldCubeLogChanges);
#****End: Generated Statements****

576,CubeAction=1500DataAction=1503CubeName=Income StatementCubeLogChanges=0
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
