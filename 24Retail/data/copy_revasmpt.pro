601,100
602,"Copy_RevAsmpt"
562,"VIEW"
586,"Revenue Assumptions"
585,"Revenue Assumptions"
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
570,zCopyAsmpt
571,
569,0
592,0
599,1000
560,2
pParent
pNewNumber
561,2
2
2
590,2
pParent,""
pNewNumber,""
637,2
pParent,""
pNewNumber,""
577,10
product
Channel
V3
V4
Version
RevenueAsmpt
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
582,8
VarType=32ColType=827
VarType=32ColType=825VarDimension=ChannelVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=MonthVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=YearVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=VersionVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=RevenueAsmptVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=33ColType=826
VarName=vTargetVarType=32ColType=825VarFormula=vTarget=pNewNumber;:VarFormulaDestination=BOTHVarDimension=productVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
931,1
0,0,0,0,0,0,0,0,
603,0
572,13

#****Begin: Generated Statements***
OldCubeLogChanges = CUBEGETLOGCHANGES('Revenue Assumptions');
CUBESETLOGCHANGES('Revenue Assumptions', 0);
#****End: Generated Statements****


Driver=DNEXT('Product',pParent);

IF(SubsetGetSize('Product','zCopyFrom')>0);
SubsetDeleteAllElements('Product','zCopyFrom');
ENDIF;
SubsetElementInsert('Product','zCopyFrom',Driver,1);
573,4

#****Begin: Generated Statements***
vTarget=pNewNumber;
#****End: Generated Statements****
574,6

#****Begin: Generated Statements***
vTarget=pNewNumber;
if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue Assumptions',vTarget,Channel,V3,V4,Version,RevenueAsmpt), CellPutN(NVALUE, 'Revenue Assumptions', vTarget,Channel,V3,V4,Version,RevenueAsmpt));
#****End: Generated Statements****

575,4

#****Begin: Generated Statements***
CUBESETLOGCHANGES('Revenue Assumptions', OldCubeLogChanges);
#****End: Generated Statements****
576,CubeAction=1500DataAction=1503CubeName=Revenue AssumptionsCubeLogChanges=0
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
