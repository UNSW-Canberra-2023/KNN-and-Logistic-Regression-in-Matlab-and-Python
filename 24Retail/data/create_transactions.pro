601,100
602,"create_transactions"
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
570,zActualForTrx
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,10
v_Year
v_Organization
v_Currency_Calc
v_Version
v_Account
v_Month
v_Value
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
3
2
1
6
5
4
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
582,7
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,0,0,
603,0
572,40

#****Begin: Generated Statements***
#****End: Generated Statements****

# 
# Clear down the transaction attributes
#
I=1;

WHILE (I <= 3000);
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'TrxDate');
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Type');
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Source'); 
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Desc');
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Reference');
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Organization');
  AttrPutS('', 'TrxID', NUMBERTOSTRING(I), 'Account');
  I=I+1;
END;


#;
#Set Counters
#;
I=1;
vDay=1;

#
# Clear down the transaction data
#
ViewZeroOut('GLTransactions', 'zDelete');









573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,43

#****Begin: Generated Header****
# Double NVALUE
# String SVALUE
# Double VALUE_IS_STRING
#
# TextOutput('Example.csv', NumberToString(NVALUE), SVALUE, NumberToString(VALUE_IS_STRING));
#****End: Generated Header****

#****Begin: Generated Statements***
#****End: Generated Statements****

IF( I > 3000 );
  ITEMSKIP;
ENDIF;

vTransactionAmount=v_Value\5;

IF(vTransactionAmount = 0);
  ITEMSKIP;
ENDIF;

vDay=1;

WHILE (vDay <= 5);
  vTrxDate=ATTRS('Year',v_Year,'Caption_Default')|'-'|v_Month|'-'|NUMBERTOSTRING(vDay);
  vReference='Ref : '|NUMBERTOSTRING(I);
  vDesc='Description : '|NUMBERTOSTRING(I);
  v_Organization_Alias = ATTRS('Organization',v_Organization,'Caption_Default');
  v_Account_Alias = ATTRS('Account',v_Account,'Caption_Default');
  AttrPutS(vTrxDate, 'TrxID', NUMBERTOSTRING(I), 'TrxDate');
  AttrPutS('INV', 'TrxID', NUMBERTOSTRING(I), 'Type');
  AttrPutS('AP', 'TrxID', NUMBERTOSTRING(I), 'Source'); 
  AttrPutS(vDesc, 'TrxID', NUMBERTOSTRING(I), 'Desc');
  AttrPutS(vReference, 'TrxID', NUMBERTOSTRING(I), 'Reference');
  AttrPutS(v_Organization_Alias, 'TrxID', NUMBERTOSTRING(I), 'Organization');
  AttrPutS(v_Account_Alias, 'TrxID', NUMBERTOSTRING(I), 'Account');
  CellPutN(vTransactionAmount, 'GLTransactions', NUMBERTOSTRING(I),v_Organization,v_Year,v_Month,v_Account,'Amount');
  vDay=vDay+1;
  I=I+1;
END;


575,4

#****Begin: Generated Statements***
#****End: Generated Statements****

576,CubeAction=1511DataAction=1503CubeLogChanges=0_DeployParams={&quotdataAction&quot:&quotACCUMULATE&quot&#044&quotclass&quot:&quotDeployParams&quot&#044&quotdimensionConflictResolutions&quot:{}}_ParseParams={&quotmeasures&quot:[]&#044&quothasHeader&quot:&quottrue&quot&#044&quotnumColumns&quot:&quot7&quot&#044&quotskipRows&quot:&quot0&quot&#044&quotlocale&quot:{&quotlanguange&quot:&quoten&quot&#044&quotvariant&quot:&quot&quot&#044&quotcountry&quot:&quotUS&quot}&#044&quotdimensions&quot:[]}
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
