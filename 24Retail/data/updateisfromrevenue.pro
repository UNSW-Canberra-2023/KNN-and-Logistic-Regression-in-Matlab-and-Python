601,100
602,"UpdateISFromRevenue"
562,"VIEW"
586,"Revenue"
585,"Revenue"
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
570,zUpdateIS
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,11
vOrganization
vChannel
vProduct
vMonth
vYear
vVersion
vMeasures
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,11
2
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
579,11
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
11
580,11
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
0
581,11
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
0
582,8
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,0,0,0,
603,0
572,3

#****Begin: Generated Statements***
#****End: Generated Statements****
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,12

#****Begin: Generated Statements***
#****End: Generated Statements****

IF (vMeasures @='Gross Revenue');
     vISMeasure = '4999';
ELSE;
     vISMeasure = '5999';
ENDIF;

cellputn(vValue,'Income Statement','Local',vOrganization,vYear,vMonth,vISMeasure,vVersion);

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
