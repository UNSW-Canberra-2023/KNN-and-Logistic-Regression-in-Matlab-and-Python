601,100
602,"Update_NewProduct_Fcst"
562,"NULL"
586,
585,
564,
565,"cG[a?=k7E@UFFrR0JBBt`ct1P7tTrSHXB0Sw^MrBH9S4pzxjG]JIj?WpmqaP>ymsaGgxq=Lq`P[lSB7GKMUeJBR?Y:pxHVQHxdohZoOJCW4^oqqedJ]j^DVjqDzU5jZ<<``wo]j]=Uxw22d5fDGa8GbO5b<A=[Raf]dPcK:PJlM0??de2:HK9xCxIdoTLY<`yGG;^asX"
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
560,10
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
561,10
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
590,10
pOrg,""
pChannel,""
pYear,""
pVersion,""
pUnitFcst,0
pFcstMethod,""
pProductDriver,""
pSpread,""
pUnitPrice,""
pUnitCost,""
637,10
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
572,42

#****Begin: Generated Statements***
#****End: Generated Statements****

pProductDriver=DimensionElementPrincipalName('Product',pProductDriver);
pChannel=DimensionElementPrincipalName('Channel',pChannel);
pVersion=DimensionElementPrincipalName('Version',pVersion);
pYear=DimensionElementPrincipalName('Year',pYear);

###Check for Required Subsets###

pCurrentProduct=SubsetGetElementName('Product', 'New', 1);


IF(SubsetExists('Product', 'Compare')=0);
SubsetCreate('Product', 'Compare');
ENDIF;

IF(SubsetExists('Organization', 'zCopyFrom')=0);
SubsetCreate('Organization', 'zCopyFrom');
ENDIF;

IF(SubsetExists('Channel', 'zCopyFrom')=0);
SubsetCreate('Channel', 'zCopyFrom');
ENDIF;

IF(SubsetExists('Year', 'zCopyFrom')=0);
SubsetCreate('Year', 'zCopyFrom');
ENDIF;

IF(SubsetExists('Version', 'zCopyFrom')=0);
SubsetCreate('Version', 'zCopyFrom');
ENDIF;

IF(SubsetExists('Spread Methods', 'zCopyFrom')=0);
SubsetCreate('Spread Methods', 'zCopyFrom');
ENDIF;





573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,60

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(SubsetGetSize('Product','Compare')>0);
SubsetDeleteAllElements('Product','Compare');
ENDIF;
SubsetElementInsert('Product','Compare',pProductDriver,1);


IF(SubsetGetSize('Organization','zCopyFrom')>0);
SubsetDeleteAllElements('Organization','zCopyFrom');
ENDIF;
SubsetElementInsert('Organization','zCopyFrom',pOrg,1);

IF(SubsetGetSize('Year','zCopyFrom')>0);
SubsetDeleteAllElements('Year','zCopyFrom');
ENDIF;
SubsetElementInsert('Year','zCopyFrom',pYear,1);

IF(SubsetGetSize('Version','zCopyFrom')>0);
SubsetDeleteAllElements('Version','zCopyFrom');
ENDIF;
SubsetElementInsert('Version','zCopyFrom',pVersion,1);

IF(SubsetGetSize('Spread Methods','zCopyFrom')>0);
SubsetDeleteAllElements('Spread Methods','zCopyFrom');
ENDIF;
SubsetElementInsert('Spread Methods','zCopyFrom',pSpread,1);

IF(SubsetGetSize('Channel','zCopyFrom')>0);
SubsetDeleteAllElements('Channel','zCopyFrom');
ENDIF;
IF(ELLEV('Channel',pChannel)=1);
Members=ELCOMPN('Channel',pChannel);
m=1;
While(m<=Members);
Member=ELCOMP('Channel',pChannel,m);
SubsetElementInsert('Channel','zCopyFrom',Member,m);
m=m+1;
END;
ELSE;
SubsetElementInsert('Channel','zCopyFrom',pChannel,1);
ENDIF;




IF(pFcstMethod@='Specific Product');
ExecuteProcess('Copy_Revenue_Compare_Units','pCurrentProduct',pCurrentProduct,'pUnitFcst',pUnitFcst,'pChannel',pChannel);
#ExecuteProcess('Copy_Revenue_Compare_Units','pUnitFcst',pUnitFcst,'pChannel',pChannel);
ENDIF;

IF(pFcstMethod@='Generic Spread');
ExecuteProcess('Copy_Revenue_Spread_Units','pOrg',pOrg,'pChannel',pChannel,'pYear',pYear,'pCurrentProduct',pCurrentProduct,'pUnitFcst',pUnitFcst);
ENDIF;

##Not Working##
#ExecuteProcess('Update_RevenueAsmpts','pUnitPrice',pUnitprice,'pUnitCost',pUnitCost,'pChannel',pChannel);

576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,1
900,
901,
902,
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
