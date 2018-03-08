601,100
602,"Reset Concert"
562,"NULL"
586,
585,
564,
565,"lTIjW6vlzb^5aI[9`A5MSv^n]YkbiHWvn=\v]QSVAObcm8GQ:;A8TsP=?m=f2S>sPHEv<EFKy2RAI;DRGVjvqSV7qHr73>gGpesx<b>lwtz]zf`Ufn900;aRWHUj8ypr55E3`su04OvofJ7PiSXNHe1se]?3;RGxQ`Utj137IuaPG[eDlhX>6mV[XA7eamttk\0WfmG]"
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
572,21

#****Begin: Generated Statements***
#****End: Generated Statements****


vDate='';
vMessageSQL1 = '';
vMessageSQL2 = '';
vMessageSQL3 = '';

vDate=cellgetS('Calendar','Concert Reset Date','String');
vMessageSQL1 = 'delete MessageLikes where MessageID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL2 = 'delete MessageMentions where MessageID in (select ID from Message where CreationDate > '''|vDate|''')';
vMessageSQL3 =  'delete Message where CreationDate > '''|vDate|'''';

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
