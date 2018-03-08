601,100
602,"Add Product Vision"
562,"NULL"
586,
585,
564,
565,"lBPX`W`sabJlasY\NBnq>tB0ibdh:n9yB[om9^foJ:ue;ox;Rl80olLTRiB6c9H_HjWM^DJc0C2SNaL1iLem3SRj\f@O8q7QFrS^y47<x8DhaFkz_:`^BHVKwiMuyWW[ZS87cW6:8LjJv\8:oTPfUhc22DvVC5NfZ:wo7=I32avTfaBkJ`QojGu:nS`@dv9[bL]cw2Sy"
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
560,13
pParent
pNewNumber
pNewName
pOrg
pChannel
pYear
pVersion
pUnitFcst
pFcstMethod
pProductDriver
pSpread
pUnitPrice
pUnitCost
561,13
2
2
2
2
2
2
2
1
2
2
2
2
2
590,13
pParent,""
pNewNumber,""
pNewName,""
pOrg,""
pChannel,""
pYear,""
pVersion,""
pUnitFcst,0
pFcstMethod,""
pProductDriver,""
pSpread,""
pUnitPrice,"0.000000"
pUnitCost,"0.000000"
637,13
pParent,""
pNewNumber,""
pNewName,""
pOrg,""
pChannel,""
pYear,""
pVersion,""
pUnitFcst,""
pFcstMethod,""
pProductDriver,""
pSpread,""
pUnitPrice,""
pUnitCost,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,81

#****Begin: Generated Statements***
#****End: Generated Statements****


ASCIIOutput('guy.txt', pParent, pNewNumber,pNewName,pOrg,pChannel,pYear );

# Declare Variables
pNewName=TRIM(pNewName);
vNewProduct = '';
vNewProductAlias ='';
i=1;
vDimSize=0;
#Clear old NewProduct Attribute
VIEWZEROOUT('}ElementAttributes_product','OldNewProduct');

#
# Make sure that parent is indeed a parent
#
IF (ELLEV('product', pParent)<>1);
  ProcessError;
ENDIF;
#
# Make sure that you have write access to the cube
#
vUpdateable=CellIsUpdateable ('Revenue', pOrg, pChannel,'22002' ,'Jan',pYear,pVersion,'Units Sold');
IF (vUpdateable=0);
  ProcessError;
ENDIF;
#
vNewProduct=SubsetGetElementName('product', 'New', 1);
vNewProductAlias=ATTRS('product', vNewProduct, 'Caption_Default');
pNewName = TRIM(pNewName);
vProductCode='';
vProductAlias='';
vExistingCode='';
vProductLevel=0;

IF (pNewName @='');
# Add in a random product so that the "New" Subset in the "product" dimension is always populated
   SubsetDeleteAllElements('product', 'New');
   SubsetElementInsert('product', 'New', '22001', 1);
   ProcessQuit;
ENDIF;

vDimSize=DIMSIZ('product');

i=1;
WHILE (i<=vDimSize);
   vProductCode= DIMNM('product', i);
   vProductAlias= ATTRS('product', vProductCode, 'Caption_Default');
   vProductLevel = ELLEV('product', vProductCode);
   IF(vProductLevel >= 1 & pNewName @= vProductAlias);
      ProcessError;
   ENDIF;
   IF(vProductAlias @= pNewName);
      vExistingCode=vProductCode;
   ENDIF;
   i = i + 1;
END;

IF(vExistingCode @= '');
  IF(SubsetExists('Organization', 'zCopyFrom')=0);
    SubsetCreate('Organization', 'zCopyFrom');
  ENDIF;
  IF(SubsetGetSize('Organization','zCopyFrom')>0);
    SubsetDeleteAllElements('Organization','zCopyFrom');
  ENDIF;
  SubsetElementInsert('Organization','zCopyFrom',pOrg,1);
  ExecuteProcess('Add_Product', 'pParent', pParent,'pNewNumber', pNewNumber,'pNewName',pNewName);
ELSE;
   IF(SubsetGetSize('Product','New')>0);
      SubsetDeleteAllElements('Product','New');
   ENDIF;
   SubsetElementInsert('Product','New',vExistingCode,1);
ENDIF;





573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,10

#****Begin: Generated Statements***
#****End: Generated Statements****

#ASCIIOutput('c:\guy2.txt', pParent, pNewNumber,pNewName,pOrg,pChannel,pYear,pVersion,pProductDriver,pSpread,pUnitPrice,pUnitCost );

ExecuteProcess('Update_NewProduct_Fcst', 'pOrg',pOrg,'pChannel',pChannel,'pYear',pYear,'pVersion',pVersion,'pUnitFcst',pUnitFcst,'pFcstMethod',pFcstMethod,'pProductDriver',pProductDriver,'pSpread',pSpread,'pUnitPrice',pUnitPrice,'pUnitCost',pUnitCost);



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
920,0
921,""
922,""
923,0
924,""
925,""
926,""
927,""
