601,100
602,"Load Workflow Info"
562,"VIEW"
586,"}tp_application_state}0f309cd0-4215-4482-8471-80ef000fcbb3"
585,"}tp_application_state}0f309cd0-4215-4482-8471-80ef000fcbb3"
564,
565,"zVL;\KS?dz?RA0mDXH@`YyYJFRa@H]pCXC;^Fc7J^EZ_OzXG5\Bf?SB:v9JtEg@pp\q0c`nVKGE?P9Ovh^Ch>xyCzc:Bv_>c7o><0vC?^D_nOdDf[D`M<5KxyY811OVppHw0m8Z2UCCZ]=Iu2Au?GX;\E\skLVt<VRQq`hI3H3@rh[vD>lDNTu98ldQ[?zWAJ?J38E>a"
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
570,All
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,6
organization
V2
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,6
2
2
2
1
2
1
579,6
1
2
3
0
0
0
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,4
VarType=32ColType=825VarDimension=organizationVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=Workflow InfoVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=826
VarName=V4VarType=32ColType=825VarFormula=V4='1';:VarFormulaDestination=BOTHVarDimension=BI MeasureVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
931,1
0,0,0,0,
603,3
VarDimActionCode=53VarElemTypeCode=33UIDataIndex=0
VarDimActionCode=53VarElemTypeCode=33UIDataIndex=1
VarDimActionCode=53VarElemTypeCode=33UIDataIndex=3
572,18

#****Begin: Generated Statements***
OldCubeLogChanges = CUBEGETLOGCHANGES('Workflow Reporting');
CUBESETLOGCHANGES('Workflow Reporting', 0);
#****End: Generated Statements****

vApplicationGuid=DIMNM('}tp_applications', 1);
vCubeName='}tp_application_state}'|vApplicationGuid;

DatasourceNameForServer=vCubeName;
DatasourceCubeview='All';







573,5

#****Begin: Generated Statements***
V4='1';
#****End: Generated Statements****

574,6

#****Begin: Generated Statements***
V4='1';
if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Workflow Reporting',V4,organization,V2), CellPutN(NVALUE, 'Workflow Reporting', V4,organization,V2));
#****End: Generated Statements****

575,5

#****Begin: Generated Statements***
CUBESETLOGCHANGES('Workflow Reporting', OldCubeLogChanges);
#****End: Generated Statements****

576,CubeAction=1500DataAction=1503CubeName=Workflow ReportingCubeLogChanges=0
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
