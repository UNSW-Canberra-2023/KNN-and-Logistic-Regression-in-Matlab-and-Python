601,100
602,"Export Dimensions to SPSS"
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
pDimension
pIncludeParent
561,2
2
2
590,2
pDimension,"product"
pIncludeParent,"Y"
637,2
pDimension,"Enter the Dimension Name"
pIncludeParent,"Include Parent?"
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,43

#****Begin: Generated Statements***
#****End: Generated Statements****

vItem = 1;
vCode = '';
vAlias = '';
vParentCode = '';
vParentAlias = '';
vDimWithServer = pDimension;
vFileName = CellGetS( 'Calendar', 'SPSS Directory','String')|pDimension|'SPSS.csv';
vDimSize = DIMSIZ(vDimWithServer);

WHILE (vItem <= vDimSize);
  IF(vItem=1);
    IF(pIncludeParent @= 'Y');
       ASCIIOUTPUT(vFileName,'Code','Alias','ParentCode','ParentAlias');
    ELSE;  
       ASCIIOUTPUT(vFileName,'Code','Alias');
    ENDIF;
  ENDIF;

  vCode = DIMNM(vDimWithServer, vItem);
  vCode = DimensionElementPrincipalName( pDimension, vCode);
  IF (ELLEV(pDimension,vCode) = 0);
    vAlias=ATTRS(pDimension,vCode,'Caption_Default');
    IF(pIncludeParent @= 'Y');
       vParentCode = DimensionElementPrincipalName( pDimension, ELPAR(pDimension, vCode, 1));
       vParentAlias = ATTRS(pDimension,vParentCode,'Caption_Default');
    ENDIF;
    IF(pIncludeParent @= 'Y');
       ASCIIOUTPUT(vFileName,vCode,vAlias,vParentCode,vParentAlias);
    ELSE;  
       ASCIIOUTPUT(vFileName,vCode,vAlias);
    ENDIF;
  ENDIF;
  vItem = vItem + 1;
END;





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
