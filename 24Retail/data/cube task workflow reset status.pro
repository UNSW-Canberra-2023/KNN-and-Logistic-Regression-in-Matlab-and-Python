601,100
602,"cube Task Workflow reset Status"
562,"VIEW"
586,"Task Workflow"
585,"Task Workflow"
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
570,z_TI_cube Task Workflow reset Status
571,
569,0
592,0
599,1000
560,2
pDueDate
pClearCube
561,2
2
2
590,2
pDueDate,"12/15/2013"
pClearCube,"Y"
637,2
pDueDate,"Due date to spread? DD/MM/YYYY"
pClearCube,"Clear Cube? Y or N"
577,7
vTask
vOrg
vMeasure
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,7
2
2
2
2
1
2
1
579,7
1
2
3
4
0
0
0
580,7
0
0
0
0
0
0
0
581,7
0
0
0
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
931,1
0,0,0,0,
603,0
572,110

#****Begin: Generated Statements***
#****End: Generated Statements****


ProcessName = GetProcessName();


#~~~~~~~~~~~~~~~~~
# Initialise
#~~~~~~~~~~~~~~~~~


CubeName = 'Task Workflow';


ViewName = 'z_TI_' | ProcessName;
SubName = 'z_TI_' | ProcessName;
CubeSetLogChanges(CubeName,0);


# If the view exist, destroy then create the view and subsets
# otherwise, create the view and subsets
IF(ViewExists(CubeName, ViewName) = 1);
    ViewDestroy(CubeName, ViewName);
ENDIF;


   ViewCreate(Cubename,ViewName);

# View settings
ViewSetSkipCalcs(Cubename, Viewname, 1);
ViewSetSkipRuleValues(cubename, Viewname,1);
ViewSetSkipZeroes(Cubename, Viewname, 1);

#~~~~~~~~~~~~~~~~~
# Trans type
#~~~~~~~~~~~~~~~~~
DimName =  'Task Workflow Measure';
IF(SubsetExists(DimName, SubName)=1, SubsetDeleteAllElements(DimName, SubName), SubsetCreate(DimName, SubName));
# Assigns the subset to the dimension
ViewSubsetAssign(CubeName, Viewname, DimName, SubName);
SubsetElementInsert(DimName, SubName, 'Active', SubsetGetSize(DimName, SubName) + 1);
SubsetElementInsert(DimName, SubName, 'Status', SubsetGetSize(DimName, SubName) + 1);
SubsetElementInsert(DimName, SubName, 'Due Date', SubsetGetSize(DimName, SubName) + 1);
SubsetElementInsert(DimName, SubName, 'Date Completed', SubsetGetSize(DimName, SubName) + 1);




IF( pClearCube @= 'Y' );
ViewZeroOut(CubeName,ViewName);
ENDIF;



# View settings
ViewSetSkipCalcs(Cubename, Viewname, 0);
ViewSetSkipRuleValues(cubename, Viewname,1);
ViewSetSkipZeroes(Cubename, Viewname, 0);


#~~~~~~~~~~~~~~~~~
# Measure
#~~~~~~~~~~~~~~~~~
DimName =  'Task Workflow Measure';
IF(SubsetExists(DimName, SubName)=1, SubsetDeleteAllElements(DimName, SubName), SubsetCreate(DimName, SubName));
# Assigns the subset to the dimension
ViewSubsetAssign(CubeName, Viewname, DimName, SubName);
SubsetElementInsert(DimName, SubName, 'Active', SubsetGetSize(DimName, SubName) + 1);


#~~~~~~~~~~~~~~~~~
# Task
#~~~~~~~~~~~~~~~~~
DimName =  'Task';
IF(SubsetExists(DimName, SubName)=1, SubsetDeleteAllElements(DimName, SubName), SubsetCreate(DimName, SubName));
# Assigns the subset to the dimension
ViewSubsetAssign(CubeName, Viewname, DimName, SubName);
nMax = DIMSIZ( DimName );
nCount = 1;
WHILE( nCount <= nMax );
element = DIMNM( DimName, nCount);
IF( ELLEV( DimName, element) = 0);
SubsetElementInsert(DimName, SubName, element, SubsetGetSize(DimName, SubName) + 1);
ENDIF;
nCount = nCount + 1;
END;


#~~~~~~~~~~~~~~~~~
# ORg
#~~~~~~~~~~~~~~~~~
DimName =  'Organization';
IF(SubsetExists(DimName, SubName)=1, SubsetDeleteAllElements(DimName, SubName), SubsetCreate(DimName, SubName));
# Assigns the subset to the dimension
ViewSubsetAssign(CubeName, Viewname, DimName, SubName);
nMax = DIMSIZ( DimName );
nCount = 1;
WHILE( nCount <= nMax );
element = DIMNM( DimName, nCount);
IF( ELLEV( DimName, element) = 0);
SubsetElementInsert(DimName, SubName, element, SubsetGetSize(DimName, SubName) + 1);
ENDIF;
nCount = nCount + 1;
END;

DataSourceName = ViewName;


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,10

#****Begin: Generated Statements***
#****End: Generated Statements****

CellPutN( 1, CubeName, vTask, vOrg, 'Active');

CellPutS( 'Not Started', CubeName, vTask, vOrg, 'Status');

CellPutS( pDueDate, CubeName, vTask, vOrg, 'Due Date');

575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

CubeSetLogChanges(CubeName,1);
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
