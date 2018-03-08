601,100
602,"Add_Product"
562,"NULL"
586,
585,
564,
565,"x;>0fx@@KK^KgKcy8m`6a^YSa76EjYv?9EkZn[]:\43\M=o3LlO9wouZ_TNsMp:<>Gwl\x7JM5FbQ0A:bZ[BidS^MFypQZ<@E\0:rilD@2lYps@B?>QShCjR41wgR611<Sh`b_5nY`r:]0[r?2[]\3>pl1:<i=H7p@<bXulCbZv3hm96Nyl6z4ts1a:vcmG;XzGiT`c3"
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
560,3
pParent
pNewNumber
pNewName
561,3
2
2
2
590,3
pParent,""
pNewNumber,""
pNewName,""
637,3
pParent,""
pNewNumber,""
pNewName,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,25

#****Begin: Generated Statements***
#****End: Generated Statements****

pParent=DimensionElementPrincipalName('Product',pParent);


DimensionElementInsert('Product','',pNewNumber,'N');

DimensionElementComponentAdd('Product',pParent,pNewNumber,1);

###Check for Required Subsets###

IF(SubsetExists('Product', 'New')=0);
SubsetCreate('Product', 'New');
ENDIF;

IF(SubsetExists('Product', 'Compare')=0);
SubsetCreate('Product', 'Compare');
ENDIF;





573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,72

#****Begin: Generated Statements***
#****End: Generated Statements****


AttrPutS(pNewName, 'Product',pNewNumber,'Caption_Default');
AttrPutS('Y','Product',pNewNumber,'NewProduct');


IF(SubsetGetSize('Product','New')>0);
SubsetDeleteAllElements('Product','New');
ENDIF;
SubsetElementInsert('Product','New',pNewNumber,1);


###Update Price and Cost Assumptions###
ExecuteProcess('Copy_RevAsmpt','pParent',pParent,'pNewNumber',pNewNumber);

pFromSKU=SubsetGetElementName('Product', 'Compare', 1);

ExecuteProcess('Copy_SKU_detail_BOM','pFromSKU',pFromSKU,'pToSKU',pNewNumber);
ExecuteProcess('Copy_Product_SupplyChain','pCopyFrom',pFromSKU,'pCopyTo',pNewNumber);

###Update Subsets###

ProdSize=DimSiz('Product');
IF(SubsetGetSize('Product','Gaming')>0);
SubsetDeleteAllElements('Product','Gaming');
ENDIF;
SubsetElementInsert('Product','Gaming','Gaming',1);
n=1;
While(n<=ProdSize);
Current=DIMNM('Product',n);
IF(ELISANC('Product','Gaming',Current)=1);
SubsetElementInsert('Product','Gaming',Current,0);
ENDIF;
n=n+1;
END;

ProdSize=DimSiz('Product');
IF(SubsetGetSize('Product','Phones')>0);
SubsetDeleteAllElements('Product','Phones');
ENDIF;
SubsetElementInsert('Product','Phones','Phones',1);
n=1;
While(n<=ProdSize);
Current=DIMNM('Product',n);
IF(ELISANC('Product','Phones',Current)=1);
SubsetElementInsert('Product','Phones',Current,0);
ENDIF;
n=n+1;
END;

ProdSize=DimSiz('Product');
IF(SubsetGetSize('Product','Tablets')>0);
SubsetDeleteAllElements('Product','Tablets');
ENDIF;
SubsetElementInsert('Product','Tablets','Tablets',1);
n=1;
While(n<=ProdSize);
Current=DIMNM('Product',n);
IF(ELISANC('Product','Tablets',Current)=1);
SubsetElementInsert('Product','Tablets',Current,0);
ENDIF;
n=n+1;
END;






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
