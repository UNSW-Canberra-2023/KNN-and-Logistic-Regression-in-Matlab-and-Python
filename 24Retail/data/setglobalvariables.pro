601,100
602,"SetGlobalVariables"
562,"NULL"
586,
585,
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
570,
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,61

#****Begin: Generated Statements***
#****End: Generated Statements****

# Setup Global Variables
Length=0;
DirectorySeparator='\';
BaseDir='';
SPSSDir='';
DataDir='';
LogDir='';

#
# Get TM1 Logging Directory 
#
LogDir=GetProcessErrorFileDirectory;
#
# Get the Directory separator to deliniate between Unix and Windows
#
DirectorySeparator=CellGetS( 'Calendar', 'Directory Separator','String');
#
# Get the Base Directory
#
Length=LONG(LogDir);
BaseDir=SUBST(LogDir,1,Length-5);
SPSSDir=BaseDir|'spss'|DirectorySeparator;
DataDir=BaseDir|'data'|DirectorySeparator;

#
# Write Parameters away to Calendar cube which is used to store system parameters
#
CellPutS(LogDir, 'Calendar', 'Log Directory','String');
CellPutS(BaseDir, 'Calendar', 'Base Directory','String');
CellPutS(SPSSDir, 'Calendar', 'SPSS Directory','String');
CellPutS(DataDir, 'Calendar', 'Data Directory','String');


#
# Now create the batch files required to run the SPSS Integration
# These need to be updated so that the smartco base directory can be changed
#
vFileName=SPSSDir|'ExecuteStream.bat';
vFileNameExternal=SPSSDir|'ExecuteStreamExternal.bat';

DatasourceASCIIQuoteCharacter='';
vText = 'CD "'|CellGetS( 'Calendar', 'SPSS Modeler Install Directory','String')|'"';
ASCIIOUTPUT(vFileName,vText);
ASCIIOUTPUT(vFileNameExternal,vText);
vText = 'clemb -stream "'|SPSSDir|'Create Model.str" -execute -log "'|SPSSDir|'Create Model.str.log"';
ASCIIOUTPUT(vFileName,vText);

vText = 'clemb -stream "'|SPSSDir|'Create Model External.str" -execute -log "'|SPSSDir|'Create Model External.str.log"';
ASCIIOUTPUT(vFileNameExternal,vText);
vText = 'clemb -stream "'|SPSSDir|'Charts and Graphs2.str" -execute -log "'|SPSSDir|'Charts and Graphs2.str.log"';
ASCIIOUTPUT(vFileNameExternal,vText);






573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
