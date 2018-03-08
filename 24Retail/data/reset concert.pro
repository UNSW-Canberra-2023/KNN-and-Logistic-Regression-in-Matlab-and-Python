601,100
602,"Reset Concert"
562,"NULL"
586,
585,
564,
565,"qiwlQgK7yvD]_d:gMaWYI2WdPg^]d2RgxB>KMhdYEgG17CCdmFZ71EizB]Xz:;bTNm;Mb@u;q`@=^8p2RVCWGiWk\QyCzwlr<B>f9[B\?FEKJ5ytG5VrycI:pTMRdy]?o`l6gaCqNc\H\G3`RN33=6@Qdj<EQD5yp:5gmmUM3ayTGlx[3USEl_?9O@d_Wj04_ijEu4KW"
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
603,0
572,33

#****Begin: Generated Statements***
#****End: Generated Statements****


vDate='';
vMessageSQL1 = '';
vMessageSQL2 = '';
vMessageSQL3 = '';
vMessageSQL4 = '';
vMessageSQL5 = '';

vDate=cellgetS('Calendar','Concert Reset Date','String');
vMessageSQL1 = 'delete MessageLikes where MessageID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL2 = 'delete MessageMentions where MessageID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL3 = 'delete PollResult where ID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL4 = 'delete Poll where ID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL5 =  'delete Message where CreationDate > '''|vDate|'''';

ODBCOpen('Concert', 'sa', 'IBMDem0s');
ODBCOutput('Concert', vMessageSQL1);
ODBCOutput('Concert', vMessageSQL2);
ODBCOutput('Concert', vMessageSQL3);
ODBCOutput('Concert', vMessageSQL4);
ODBCOutput('Concert', vMessageSQL5);
ODBCClose('Concert');

# For testing purposes
#asciioutput('c:\guy.txt',vMessageSQL1,vMessageSQL2,vMessageSQL3);




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
