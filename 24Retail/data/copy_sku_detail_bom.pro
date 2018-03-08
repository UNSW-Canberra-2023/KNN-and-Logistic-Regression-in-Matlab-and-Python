601,100
602,"Copy_SKU_detail_BOM"
562,"VIEW"
586,"Rate BOM"
585,"Rate BOM"
564,
565,"qEDaGueeMQ6vzyfG^at6qUrrZKqXFYq3S3kTTdeZfF\EFSo^xGmH:Fx6LH1w4qdJqwaK>a>@P2zq`qx?fDnqisj>H<lTQrI4@7Vhb8KM0xxqr7@LonDbze_DULe0r>2aCimNTlH^2s4fy6q\_zCguJ^6rvIYRVA=apu@ZP7LSQnr`2YtFqIr2VWdIMK0vA:Ji0Fqmbfl"
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
570,zCopySKU_BOM
571,
569,0
592,0
599,1000
560,2
pFromSKU
pToSKU
561,2
2
2
590,2
pFromSKU,"22003"
pToSKU,"21003"
637,2
pFromSKU,""
pToSKU,""
577,10
vYear
vPlant
vProduct
vRateMeasure
vVersion
vMonth
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,10
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
579,10
5
2
3
4
6
1
7
0
0
0
580,10
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
581,10
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
582,7
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
931,1
0,0,0,0,0,0,0,
603,0
572,7

#****Begin: Generated Statements***
#****End: Generated Statements****

pFromSKU=SubsetGetElementName('Product', 'Compare', 1);
pToSKU=SubsetGetElementName('Product', 'New', 1);

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,15

#****Begin: Generated Statements***
#****End: Generated Statements****

pToSKU=SubsetGetElementName('Product', 'New', 1);

X = CellGetN('Rate BOM',vMonth,vPlant, pFromSKU, vRateMeasure,vYear,vVersion);
CellPutN(X,'Rate BOM',vMonth,vPlant, pToSKU, vRateMeasure,vYear, vVersion);



#pFormat=CellGetS('}ElementAttributes_Product',pFromSKU,'Format');

#AttrPutS(pFormat, 'Product', pToSKU, 'Format');

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
