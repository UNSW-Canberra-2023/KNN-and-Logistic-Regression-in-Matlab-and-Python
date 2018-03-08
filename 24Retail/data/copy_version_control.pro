601,100
602,"copy_version_control"
562,"VIEW"
586,"Version Copy Control"
585,"Version Copy Control"
564,
565,"eAni7a0nh;gbSPi2>\k1]j0cyyoo[ZazRSavPBd:y0q@Yil@Jx8XGWzHx7e5A`M44^uXvf:PgzwNeeN@?F5<PMcComDVuBS_hYAju1klz6FQfsF2n<mfs@p=k]hJrVEZ0_yB_Yr6FbwsvZff^q\f7GxRywASAcJM>X[MSpQ;`00D:B1tZgsdh\mr\KOk_AG<dKlXOSRa"
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
570,zVersionCopy
571,
569,0
592,0
599,1000
560,2
pFromVersion
pToVersion
561,2
2
2
590,2
pFromVersion,"Version 1"
pToVersion,"Version 2"
637,2
pFromVersion,"From Version"
pToVersion,"To Version"
577,6
LineItemList
VersionCopyMeasures
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
4
5
6
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
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
931,1
0,0,0,
603,0
572,39

#****Begin: Generated Statements***
#****End: Generated Statements****

IF ((pFromVersion @= '') % (pToVersion @=''));
  ProcessError;
ENDIF;

IF(DIMIX('Version', pFromVersion) <= 0);
  ProcessError;
ENDIF;
IF(DIMIX('Version', pToVersion) <= 0);
  ProcessError;
ENDIF;

vLinkVersion=ATTRS('Version',pToVersion,'LinkVersion');


IF(SubsetGetSize('Version', 'zCopyFrom')>=1);
SubsetDeleteAllElements('Version', 'zCopyFrom');
ENDIF;

SubsetElementInsert('Version', 'zCopyFrom', pFromVersion, 1);


vUser=TM1User();
vAddress='';












573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,52

#****Begin: Generated Statements***
#****End: Generated Statements****



vCubeName = Value;
vNumberDims=CELLGETN('Version Copy Control',LineItemList,'NumberDims');
vVersionDimLoc=CELLGETN('Version Copy Control',LineItemList,'VersionDimLoc');
vStringDimName=CELLGETS('Version Copy Control',LineItemList,'StringDimName');
vStringDimLoc=CELLGETN('Version Copy Control',LineItemList,'StringDimLoc');
vCopyWhenNoDrivers=CELLGETS('Version Copy Control',LineItemList,'CopyWhenNoDrivers');
vAcquireReservation=CELLGETS('Version Copy Control',LineItemList,'AcquireReservation');


IF(vCubeName@='');
  ItemSkip;
ENDIF;

IF (vLinkVersion @='' & vCopyWhenNoDrivers @= 'N');
  x=1;
ELSE;
  IF (vAcquireReservation @= 'Y');
    I = 1;
    vAddress='';
    WHILE (I<=  vNumberDims);
         IF (I = vVersionDimLoc);
             vAddress=vAddress|pToVersion;
         ENDIF;
         IF(I<>vNumberDims);
           vAddress=vAddress|'|';
         ENDIF;
       I=I+1;
    END;
    CubeDataReservationAcquire(vCubeName, vUser, 0, vAddress) ;
  ENDIF;
#vStartTime=Now;
  ExecuteProcess('copy_version', 'pFromVersion',pFromVersion,'pToVersion',pToVersion,'pCubeName',vCubeName,'pNumberDims',vNumberDims,'pVersionDimLoc',vVersionDimLoc,'pStringDimName',vStringDimName,'pStringDimLoc',vStringDimLoc);
#vEndTime=Now;
 #ASCIIOUTPUT('c:\copydebug.txt',pToVersion,vCubeName,TIMST(vStartTime,'\i:\s'),TIMST(vEndTime,'\i:\s'));
  IF (vAcquireReservation @= 'Y');
    CubeDataReservationRelease(vCubeName, vUser, vAddress) ;
  ENDIF;
ENDIF;








575,7

#****Begin: Generated Statements***
#****End: Generated Statements****




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
