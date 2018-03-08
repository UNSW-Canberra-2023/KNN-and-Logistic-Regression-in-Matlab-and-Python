601,100
602,"reset_demo_FOPMImage"
562,"NULL"
586,
585,
564,
565,"tVzGz=JI9z0EiYhhZo4fa\\Ii1HTdRubZl3BHirhE5;m:XB<k9C;ar4DGalP6BYb6:6XNN[snhOFcI8eovwmuSB>LbQb[;dZXdaODn3U=`ty3]TbDRi7oidEs:j6v^N@YF_g3?oy<0wR2?A:I7xUwfyAs3oAL7@Uxc;bLOcfDlbzJMb_ka4qk>xC9tHNGja1Tv[E`_<V"
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
572,45

#****Begin: Generated Statements***
#****End: Generated Statements****

#
# Delete all products that do not have the system version set
#;
vSubsetSize=0;
vSubsetSize=SubsetGetSize('product', 'All Members');
vElementName='';
I=1;
WHILE(I <= vSubsetSize);
  vElementName=SubsetGetElementName('product', 'All Members', I);
  IF (ATTRS('product', vElementName, 'System Version')@= 'Y');
    I=I+1;
  ELSE;
    DimensionElementDelete('product',vElementName);
    I=I+1;   
  ENDIF;
  vSubsetSize=SubsetGetSize('product', 'All Members');
END;

#
# Add in a random product so that the "New" Subset in the "product" dimension is always populated
#
SubsetDeleteAllElements('product', 'New');
SubsetElementInsert('product', 'New', '22001', 1);
AttrPutS('Y','Product','22001','NewProduct');
#
# Add in a random product so that the "Compare" Subset in the "product" dimension is always populated
#
SubsetDeleteAllElements('product', 'Compare');
SubsetElementInsert('product', 'Compare', '21001', 1);

#
# Make sure that the Income Statement correctly reflects what is in the revenue cube
#
ExecuteProcess('UpdateISFromRevenue');

#
# Recreate the default Subsets
#
ExecuteProcess('create_default_subset', 'pSubsetName','Current');
ExecuteProcess('create_default_subset', 'pSubsetName','Analysis');

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

SaveDataAll;
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
