601,100
602,"update_organization"
562,"CHARACTERDELIMITED"
586,"C:\Temp\TILoad4969076987167133641.csv"
585,"C:\Temp\TILoad4969076987167133641.csv"
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
589,","
568,""""
570,
571,
569,1
592,0
599,1000
560,2
param_destroy
param_createIfNotExist
561,2
1
1
590,2
param_destroy,0
param_createIfNotExist,1
637,2
param_destroy,"Destroy dimensions"
param_createIfNotExist,"Create dimensions if they do not exist"
577,3
v_Number_0
v_Parent_1
v_Label_2
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,4
_DimCaption=Organization_DimType=HIERARCHYVarType=32ColType=825VarDimension=organizationVarDimOrder=1VarDimAction=UpdateVarElemType=NumericVarDimElemSortType=ByNameVarDimElemSortSense=ASCENDING_LevelCaption=Number_UserVisible=v_Number_0_UILabel=Number_DataType=STRING_SourceIndex=0
VarType=32ColType=858ConsolidationDim=organizationConsolidationChildVar=v_Number_0ConsolidationChildWeight=1.0ComponentSortType=ByNameComponentSortSense=ASCENDING_LevelCaption=Parent_UserVisible=v_Parent_1_UILabel=Parent_DataType=STRING_SourceIndex=1
VarType=32ColType=841AttributeDim=organizationAttributeElemVar=v_Number_0AttributeAction=UpdateAttributeName=LabelAttributeType=Alias_UserVisible=v_Label_2_UILabel=Label_DataType=STRING_SourceIndex=2
VarType=32ColType=858ConsolidationDim=organizationConsolidationChildVar=v_Parent_1ConsolidationChildWeight=1.0ComponentSortType=ByNameComponentSortSense=ASCENDING_LevelCaption=Total _TotalMember=Total of OrganizationVarName=v_Total_of_OrganizationVarFormula=v_Total_of_Organization='Total of Organization';VarFormulaDestination=DATA
931,1
0,0,0,0,
603,0
572,23

#****Begin: Generated Header****
if (param_destroy = 1);
   DimensionDestroy('organization');
endif;
if (param_createIfNotExist = 1);
   if (0 = DimensionExists('organization'));
      DimensionCreate('organization');
      AttrInsert('organization', '', 'Caption_Default', 'A');
      CellPutS('HIERARCHY', '}DimensionAttributes', 'organization', 'DIMENSION_TYPE');
      SubsetCreateByMDX('All Members', '[organization].MEMBERS', 'organization');
      SubsetAliasSet('organization', 'All Members', 'Caption_Default');
   endif;
   ATTRINSERT('organization', '', 'Label', 'A');
endif;
CellPutS('Organization', '}DimensionAttributes', 'organization', 'Caption_Default');
#****End: Generated Header****

#****Begin: Generated Statements***
DimensionTopElementInsertDirect('organization', '', 'Total of Organization');
DimensionSortOrder('organization', 'ByName', 'ASCENDING', 'ByName', 'ASCENDING');
#****End: Generated Statements****

573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,10



#****Begin: Generated Statements***
DimensionElementInsertDirect('organization', '', v_Number_0, 'n');
DimensionElementInsertDirect('organization', '', v_Parent_1, 'c');
DimensionElementComponentAddDirect('organization', v_Parent_1, v_Number_0, 1.0);
ATTRPUTS(v_Label_2, 'organization', v_Number_0, 'Label');
#****End: Generated Statements****

575,14

#****Begin: Generated Statements***
if (DNLEV('organization') = 3);
   CellPutS('Total ', '}HierarchyProperties', 'organization', 'hierarchy0', 'level000');
   CellPutS('Parent', '}HierarchyProperties', 'organization', 'hierarchy0', 'level001');
   CellPutS('Number', '}HierarchyProperties', 'organization', 'hierarchy0', 'level002');
elseif (DNLEV('organization') = 2);
   CellPutS('Parent', '}HierarchyProperties', 'organization', 'hierarchy0', 'level000');
   CellPutS('Number', '}HierarchyProperties', 'organization', 'hierarchy0', 'level001');
else; itemReject('The resulting hierarchy for the dimension "organization" does not align with the level structure defined in the mapping.  When parent-child dimensions are being treated as level based or when level based dimensions are being constructed using source data containing non-unique member identifiers, unexpected hierarchy structures may result. For the case when non-unique member identifiers exist in the source data, turn on the "Qualify member names" dimension property in the mapping page.');
endif;
RefreshMDXHierarchy('organization');
#****End: Generated Statements****

576,_ParseParams={&quotmeasures&quot:[{&quotcolumnType&quot:&quotINT&quot&#044&quotsourceColumn&quot:-2&#044&quotcolumnName&quot:&quotCount&quot&#044&quotlabel&quot:&quotCount&quot&#044&quotmeasureType&quot:&quotEMPTY&quot&#044&quotexpression&quot:null&#044&quotlocale&quot:&quoten&quot&#044&quotexists&quot:false}]&#044&quothasHeader&quot:&quottrue&quot&#044&quotnumColumns&quot:&quot3&quot&#044&quotskipRows&quot:&quot0&quot&#044&quotlocale&quot:{&quotlanguange&quot:&quoten&quot&#044&quotvariant&quot:&quot&quot&#044&quotcountry&quot:&quot&quot}&#044&quotdimensions&quot:[{&quotdimensionType&quot:&quotHIERARCHY&quot&#044&quotleafSortDirection&quot:&quotASCENDING&quot&#044&quotconsolidatedSortDirection&quot:&quotASCENDING&quot&#044&quotqualifyHierarchy&quot:false&#044&quotcreateTotalRoot&quot:true&#044&quotinvariantName&quot:&quotorganization&quot&#044&quotlevels&quot:[{&quotcolumnType&quot:&quotSTRING&quot&#044&quotsourceColumn&quot:1&#044&quotcolumnName&quot:&quotParent&quot&#044&quotelementWeight&quot:&quot1&quot&#044&quotlabel&quot:&quotParent&quot&#044&quotexpression&quot:null&#044&quotexists&quot:true}&#044{&quotcolumnType&quot:&quotSTRING&quot&#044&quotsourceColumn&quot:0&#044&quotcolumnName&quot:&quotNumber&quot&#044&quotelementWeight&quot:&quot1&quot&#044&quotlabel&quot:&quotNumber&quot&#044&quotattributes&quot:[{&quotcolumnType&quot:&quotSTRING&quot&#044&quotsourceColumn&quot:2&#044&quotcolumnName&quot:&quotLabel&quot&#044&quotlabel&quot:&quotLabel&quot&#044&quotisAlias&quot:&quottrue&quot&#044&quotexpression&quot:null&#044&quotinvariantName&quot:&quot&quot&#044&quotexists&quot:true}]&#044&quotexpression&quot:null&#044&quotexists&quot:true}]&#044&quotisMeasureDimension&quot:false&#044&quotparentChild&quot:false&#044&quotstrategy&quot:&quotMERGE&quot&#044&quotconsolidatedSortType&quot:&quotBY_NAME&quot&#044&quotlabel&quot:&quotOrganization&quot&#044&quotisMemberUpdateStrategyChanged&quot:false&#044&quotleafSortType&quot:&quotBY_NAME&quot&#044&quotqualifySeparator&quot:&quot&#044 &quot&#044&quotexists&quot:true}]}_DeployParams={&quotdataAction&quot:&quotACCUMULATE&quot&#044&quotclass&quot:&quotDeployParams&quot&#044&quotdimensionConflictResolutions&quot:{}}_ExcelSource={"filePath":"C:\\TM1Models\\Guyco\\Files\\Organization.xlsx","sheetName":"Organization","type":"EXCELXML","cellRange":{"r2":"-1","c1":"0","c2":"-1","r1":"0"}}
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
