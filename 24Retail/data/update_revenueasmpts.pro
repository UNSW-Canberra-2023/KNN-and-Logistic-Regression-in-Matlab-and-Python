601,100
602,"Update_RevenueAsmpts"
562,"VIEW"
586,"Revenue Assumptions"
585,"Revenue Assumptions"
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
570,zUpdate
571,
569,0
592,0
599,1000
560,3
pUnitPrice
pUnitCost
pChannel
561,3
1
1
2
590,3
pUnitPrice,0
pUnitCost,0
pChannel,""
637,3
pUnitPrice,""
pUnitCost,""
pChannel,""
577,10
product
Channel
vMonth
vYear
Version
RevenueAsmpt
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
VarType=33ColType=826
931,1
0,0,0,0,0,0,0,
603,0
572,4

#****Begin: Generated Statements***
#****End: Generated Statements****

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,32

#****Begin: Generated Statements***
#****End: Generated Statements****




#if (VALUE_IS_STRING=1, CellPutS(SVALUE,'Revenue Assumptions',product,Channel,vMonth,vYear,Version,RevenueAsmpt), CellPutN(NVALUE, 'Revenue Assumptions', product,Channel,vMonth,vYear,Version,RevenueAsmpt));



IF(ELLEV('Channel',pChannel)=1);
Members=ELCOMPN('Channel',pChannel);
ELSE;
Members=1;
ENDIF;

m=1;
While(m<=Members);
Member=ELCOMP('Channel',pChannel,m);

IF('Revenue Assumptions'@='Unit Price');
PUTVAL=pUnitPrice;
ELSEIF('Revenue Assumptions'@='Unit Cost');
PUTVAL=pUnitCost;
ENDIF;

CellPutN(PUTVAL, 'Revenue Assumptions', product,Channel,vMonth,vYear,Version,RevenueAsmpt);

m=m+1;
END;

575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
