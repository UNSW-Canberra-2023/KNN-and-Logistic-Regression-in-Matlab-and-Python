601,100
602,"Export UnitsSold to SPSS"
562,"VIEW"
586,"Revenue"
585,"Revenue"
564,
565,"m<xULVra=xpIBaQ:x4zpQ^MyQrgY_^GDPQq_xo7c0L0J>PkjB1pavXF?VoPTBZahhE;Z\88FeyorPiYJYO2GriG3;UkCnzt2lWwcOBg9?RFNw`ffyoLz=>ABhT^SKx[ez;Rzz`wadbjvDwzGn<T_aEhir<_gs7PJCXcKH[H:X[H8>6hFeOu9?V_Nh6`?0z0\sx15>w2h"
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
570,zExportUnitsSoldSPSS
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,11
vOrganization
vChannel
vproduct
vMonth
vYear
vVersion
vRevenue
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,11
2
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
579,11
1
2
3
4
5
6
7
8
0
0
0
580,11
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
0
581,11
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
0
582,8
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,0,0,0,
603,0
572,25

#****Begin: Generated Statements***
#****End: Generated Statements****

ExecuteProcess('Export Dimensions to SPSS','pDimension','product','pIncludeParent','Y');
ExecuteProcess('Export Dimensions to SPSS','pDimension','organization','pIncludeParent','Y');
ExecuteProcess('Export Dimensions to SPSS','pDimension','Channel','pIncludeParent','N');
ExecuteProcess('Export Dimensions to SPSS','pDimension','Year','pIncludeParent','N');
ExecuteProcess('Export Dimensions to SPSS','pDimension','Month','pIncludeParent','N');
ExecuteProcess('Export Dimensions to SPSS','pDimension','ExternalFactors','pIncludeParent','N');


v_FileName = CellGetS( 'Calendar', 'SPSS Directory','String')|'UnitsSoldSPSS.csv';
v_Counter =1;
vUnits=0;
vCurrentYear = CellGetS('Calendar', 'Current Year','String');
vCurrentYearIndex=ATTRN('Year',vCurrentYear,'Index');
vForecastMonth = CellGetS('Calendar', 'Fcst Month','String');
vForecastMonthIndex = ATTRN('Month',vForecastMonth,'Number');






573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,54

#****Begin: Generated Statements***
#****End: Generated Statements****

# Get the Member Names
vOrganizationCode = DimensionElementPrincipalName( 'Organization', vOrganization);
vProductCode = DimensionElementPrincipalName( 'Product', vProduct);
vProductGroupCode = DimensionElementPrincipalName( 'Product', ELPAR('Product', vproduct, 1));
vChannelCode = DimensionElementPrincipalName( 'Channel', vChannel);
vYearCode = DimensionElementPrincipalName( 'Year', vYear);
vMonthCode = DimensionElementPrincipalName( 'Month', vMonth);

# Get the Member Aliases
vOrganizationAlias=ATTRS('Organization',vOrganization,'Caption_Default');
vProductAlias=ATTRS('Product',vProduct,'Caption_Default');
vProductGroupAlias = ATTRS('Product',vProductGroupCode,'Caption_Default');
vChannelAlias=ATTRS('Channel',vChannel,'Caption_Default');
vYearAlias=ATTRS('Year',vYear,'Caption_Default');
vMonthAlias=ATTRS('Month',vMonth,'Caption_Default');

IF (v_Counter = 1);
  ASCIIOUTPUT(v_FileName,'Cube','OrganizationCode','ChannelCode','ProductCode','MonthCode','YearCode','ActFor','Units');
ENDIF;

vYearIndex = ATTRN('Year',vYear,'Index');
vMonthIndex = ATTRN('Month',vMonth,'Number');
vUnits = 0;
vActfor='';

IF (vYearIndex < vCurrentYearIndex);
  vUnits = Value;
  vActFor = 'A';
ENDIF;

IF (vYearIndex = vCurrentYearIndex);
   IF (vMonthIndex < vForecastMonthIndex);
    vUnits = Value;
    vActFor = 'A';
   ELSE;
     vUnits = 0;
    vActFor = 'F';  
   ENDIF;
ENDIF;

IF (vYearIndex > vCurrentYearIndex);
  vUnits = 0;
  vActFor = 'F';
ENDIF;

IF (vActFor @='A');
  ASCIIOUTPUT(v_FileName,'Smartco:Revenue',vOrganizationCode,vChannelCode,vProductCode,vMonthCode,vYearCode,vActFor,NumberToString(vUnits));
ENDIF;
v_Counter = v_Counter + 1;

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
