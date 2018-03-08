601,100
602,"Export External Factors to SPSS"
562,"VIEW"
586,"ExternalFactors"
585,"ExternalFactors"
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
570,ExportToSPSS
571,
569,0
592,0
599,1000
560,1
pVersion
561,1
2
590,1
pVersion,"Predictive"
637,1
pVersion,"Enter the Version"
577,8
vYear
vMonth
vVersion
vExternalFactors
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,8
2
2
2
2
1
1
2
1
579,8
1
2
3
4
5
0
0
0
580,8
0
0
0
0
0
0
0
0
581,8
0
0
0
0
0
0
0
0
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,
603,0
572,14

#****Begin: Generated Statements***
#****End: Generated Statements****

SubsetDeleteAllElements('Version', 'zExportToSPSS');
SubsetElementInsert('Version', 'zExportToSPSS', pVersion, 1);

v_FileName = CellGetS( 'Calendar', 'SPSS Directory','String')|'ExternalFactorsDataSPSS.csv';

v_Counter =1;
v_ExternalFactor = 0.0;



573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,18

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(vExternalFactors @= 'ActFor');
  ItemSkip;
ENDIF;

IF (v_Counter = 1);
  ASCIIOUTPUT(v_FileName,'Year','Month','Version','ExternalFactor','Value');
ENDIF;

ASCIIOUTPUT(v_FileName,vYear,vMonth,vVersion,vExternalFactors,NumberToString(Value));  

v_Counter = v_Counter + 1;



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
