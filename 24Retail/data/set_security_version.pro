601,100
602,"Set_Security_Version"
562,"SUBSET"
586,"}Groups"
585,"}Groups"
564,
565,"glpvLDPaYfKVmnUS<G>1tqTbNEf_q>UW><gaJWJP21gG8D^[nu4>7\RIRgxCuGJ2_v6Y`>q3qtot6kMkcgFk3\VpVibxuo@Fs;QEaemg3swGaMGU<JeH480^dDQyT_AGs770qUIDAWN7=\3@IMBs?BtzFaHoJhmy@KR7Z6KhPW8YuRKq9t:isyQ5l]wnpqZGN0gG2S@Z"
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
571,All
569,0
592,0
599,1000
560,2
pSecurityVersion
pSecurityVersionState
561,2
2
2
590,2
pSecurityVersion,""
pSecurityVersionState,""
637,2
pSecurityVersion,""
pSecurityVersionState,""
577,1
v_Group
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
931,1
0,
603,0
572,3

#****Begin: Generated Statements***
#****End: Generated Statements****
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,9

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(v_Group@<>'ADMIN' & v_Group@<>'DataAdmin' & v_Group@<>'SecurityAdmin');

CellPutS(pSecurityVersionState,'}ElementSecurity_Version',pSecurityVersion,v_Group);

ENDIF;
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

SecurityRefresh;
576,CubeAction=1511DataAction=1503CubeLogChanges=0
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
