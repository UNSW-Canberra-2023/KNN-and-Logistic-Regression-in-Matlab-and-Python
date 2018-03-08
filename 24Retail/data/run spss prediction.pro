601,100
602,"Run SPSS Prediction"
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
560,2
pVersion
pMonth
561,2
2
2
590,2
pVersion,"Predictive"
pMonth,"Apr"
637,2
pVersion,"Version"
pMonth,"Forecast Month"
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,32

#****Begin: Generated Statements***
#****End: Generated Statements****

#
# Update the Forecast Month on Version Dimension so that we can refer back to it
#
AttrPutS(pMonth, 'Version', pVersion, 'FcstMonth');

#
# Export Data Required by SPSS - Dimension Files, Units for Actuals and External Factors from Predictive Version
#
ExecuteProcess('Export UnitsSold to SPSS');
ExecuteProcess('Export External Factors to SPSS','pVersion',pVersion);

#
# Run the SPSS Model
#
SPSSCmd = '"'|CellGetS( 'Calendar', 'SPSS Directory','String')|'ExecuteStreamExternal.bat"';
ExecuteCommand(SPSSCmd,1);

#
# Load Data From SPSS Back into TM1
#
ExecuteProcess('Load UnitsSold from SPSS','pVersion',pVersion);
#
# The End
#




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
