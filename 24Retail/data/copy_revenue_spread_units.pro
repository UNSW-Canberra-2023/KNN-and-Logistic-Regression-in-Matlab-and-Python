601,100
602,"Copy_Revenue_Spread_Units"
562,"VIEW"
586,"Spread Methods"
585,"Spread Methods"
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
560,5
pOrg
pChannel
pCurrentProduct
pYear
pUnitFcst
561,5
2
2
2
2
1
590,5
pOrg,""
pChannel,""
pCurrentProduct,""
pYear,""
pUnitFcst,0
637,5
pOrg,""
pChannel,""
pCurrentProduct,""
pYear,""
pUnitFcst,""
577,7
vSpread
vMonth
Version
Value
NVALUE
SVALUE
VALUE_IS_STRING
578,7
2
2
2
1
1
2
1
579,7
1
2
3
4
5
6
7
580,7
0
0
0
0
0
0
0
581,7
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
VarType=33ColType=827
VarName=vOrgVarType=32ColType=827VarFormula=vOrg=pOrg;:VarFormulaDestination=BOTH
VarName=vChannelVarType=32ColType=827VarFormula=vChannel=pChannel;:VarFormulaDestination=BOTH
VarName=vProductVarType=32ColType=827VarFormula=vProduct=pCurrentProduct;:VarFormulaDestination=BOTH
VarName=vRevenueVarType=32ColType=827VarFormula=vRevenue='Units Sold';:VarFormulaDestination=BOTH
VarName=vYearVarType=32ColType=827VarFormula=vYear=pYear;:VarFormulaDestination=BOTH
931,1
0,0,0,0,0,0,0,0,0,
603,0
572,6

#****Begin: Generated Statements***
#****End: Generated Statements****

OldCubeLogChanges = CUBEGETLOGCHANGES('Revenue');
CUBESETLOGCHANGES('Revenue', 0);
573,14

#****Begin: Generated Statements***
vOrg=pOrg;
vChannel=pChannel;
vProduct=pCurrentProduct;
vRevenue='Units Sold';
vYear=pYear;
#****End: Generated Statements****

vOrg=pOrg;
vChannel=pChannel;
vProduct=pCurrentProduct;
vRevenue='Units Sold';
vYear=pYear;
574,29

#****Begin: Generated Statements***
vOrg=pOrg;
vChannel=pChannel;
vProduct=pCurrentProduct;
vRevenue='Units Sold';
vYear=pYear;
#****End: Generated Statements****

SetUseActiveSandboxProperty(1);

vOrg=pOrg;
vChannel=pChannel;
vProduct=pCurrentProduct;
vRevenue='Units Sold';
vYear=pYear;
##OLD##if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',vOrg,vChannel,vProduct,vMonth,vYear,Version,vRevenue), CellPutN(NVALUE, 'Revenue', vOrg,vChannel,vProduct,vMonth,vYear,Version,vRevenue));

IF(ELLEV('Channel',pChannel)=1);
Members=ELCOMPN('Channel',pChannel);
m=1;
While(m<=Members);
Member=ELCOMP('Channel',pChannel,m);
if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',vOrg,Member,vProduct,vMonth,vYear,Version,vRevenue), CellPutN(NVALUE, 'Revenue', vOrg,Member,vProduct,vMonth,vYear,Version,vRevenue));
m=m+1;
END;
ELSE;
if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue',vOrg,pChannel,vProduct,vMonth,vYear,Version,vRevenue), CellPutN(NVALUE, 'Revenue', vOrg,pChannel,vProduct,vMonth,vYear,Version,vRevenue));
ENDIF;
575,7

#****Begin: Generated Statements***
#****End: Generated Statements****

CUBESETLOGCHANGES('Revenue', OldCubeLogChanges);

CellPutProportionalSpread( pUnitFcst, 'Revenue',pOrg,pChannel,pCurrentProduct,'Year',pYear,Version,vRevenue);
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
