601,100
602,"Dim - Copy Employee Names"
562,"VIEW"
586,"Employee"
585,"Employee"
564,
565,"ossD5z1b[Z9uZlAa_bHpK>X9\]BGV<y6I0J\q9=rEbZ4>mkPn74^=i`6UmufT=11zKI:FJeQ9wzheqnIOBe\\asOMcC9B4=PFlDGcmsEckq6pHr^M9\^oN<x\7K;RQkeIl4bZE^W9mWA9@SzyPR2EHl6E6qC9lmjgeL1bvy9POptn:_M81IbrLst6LK?4BlkDS1;HkEn"
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
570,Name
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,9
organization
EmployeeList
V3
Version
Employee
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,9
2
2
2
2
2
2
1
2
1
579,9
1
2
3
4
5
6
0
0
0
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
582,6
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,8

#****Begin: Generated Statements***
#****End: Generated Statements****

ViewExtractSkipConsolidatedStringsSet ('Employee', 'Name', 1);

VIEWZeroout('}ElementAttributes_Employee Name','Employees');

573,9

#****Begin: Generated Statements***
#****End: Generated Statements****


vdata1=Cellgets('Employee',organization,EmployeeList,V3,Version,'EmpID');

vdata2=Cellgets('Employee',organization,EmployeeList,V3,Version,'Name/Desc')|' '|vdata1;
CELLPUTS(vdata2,'}ElementAttributes_Employee Name', vdata1,'Caption_default');
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
