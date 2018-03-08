601,100
602,"Copy_Revenue_Compare_Units"
562,"VIEW"
586,"Revenue"
585,"Revenue"
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
570,zCopyProduct
571,
569,0
592,0
599,1000
560,3
pCurrentProduct
pUnitFcst
pChannel
561,3
2
1
2
590,3
pCurrentProduct,""
pUnitFcst,0
pChannel,""
637,3
pCurrentProduct,""
pUnitFcst,""
pChannel,""
577,11
organization
Channel
product
vMonth
vYear
Version
Revenue
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
9
10
11
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
582,9
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
VarName=vProductVarType=32ColType=827VarFormula=vProduct=pCurrentProduct;:VarFormulaDestination=BOTH
931,1
0,0,0,0,0,0,0,0,0,
603,0
572,10

#****Begin: Generated Statements***
#****End: Generated Statements****

#OldCubeLogChanges = CUBEGETLOGCHANGES('Revenue');
#CUBESETLOGCHANGES('Revenue', 0);

pCurrentProduct=SubsetGetElementName('Product', 'New', 1);

#pCurrentProduct='22006';
573,5

#****Begin: Generated Statements***
vProduct=pCurrentProduct;
#****End: Generated Statements****

574,33

#****Begin: Generated Statements***
vProduct=pCurrentProduct;
#****End: Generated Statements****

#Active=GetUseActiveSandboxProperty();
SetUseActiveSandboxProperty(1);

vProduct=pCurrentProduct;
#if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',organization,Channel,vProduct,vMonth,vYear,Version,Revenue), CellPutN(NVALUE, 'Revenue', organization,Channel,vProduct,vMonth,vYear,Version,Revenue));

IF(ELLEV('Channel',pChannel)=1);
Members=ELCOMPN('Channel',pChannel);
Members=1;
m=1;
While(m<=Members);
Member=ELCOMP('Channel',pChannel,m);
if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',organization,Member,vProduct,vMonth,vYear,Version,Revenue), CellPutN(NVALUE, 'Revenue', organization,Member,vProduct,vMonth,vYear,Version,Revenue));
#if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',vOrg,Member,vProduct,vMonth,vYear,Version,vRevenue), CellPutN(NVALUE, 'Revenue', vOrg,Member,vProduct,vMonth,vYear,Version,vRevenue));
m=m+1;
END;
ENDIF;

IF(ELLEV('Channel',pChannel)=0);

#TextOutput('C:\TM1Models\SmartCo\Files\ProcessCheck.txt', NumberToString(NVALUE),organization,pChannel,vProduct,vMonth,vYear,Version,Revenue);

if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',organization,pChannel,vProduct,vMonth,vYear,Version,Revenue), CellPutN(NVALUE, 'Revenue', organization,pChannel,vProduct,vMonth,vYear,Version,Revenue));
#if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',vOrg,pChannel,vProduct,vMonth,vYear,Version,vRevenue), CellPutN(NVALUE, 'Revenue', vOrg,pChannel,vProduct,vMonth,vYear,Version,vRevenue));
ENDIF;


#CellPutProportionalSpread( pUnitFcst, 'Revenue',organization,Channel,vProduct,'Year',vYear,Version,Revenue);
575,8

#****Begin: Generated Statements***
#****End: Generated Statements****

#CUBESETLOGCHANGES('Revenue', OldCubeLogChanges);


CellPutProportionalSpread( pUnitFcst, 'Revenue',organization,pChannel,vProduct,'Year',vYear,Version,Revenue);
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
