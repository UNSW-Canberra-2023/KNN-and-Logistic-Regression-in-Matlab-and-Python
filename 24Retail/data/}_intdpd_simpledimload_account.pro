601,100
602,"}_intDPD_SimpleDimLoad_Account"
562,"CHARACTERDELIMITED"
586,"C:\Temp\TILoad1840393977974065985.csv"
585,"C:\Temp\TILoad1840393977974065985.csv"
564,
565,"vH7VSE9ZUrhMhnA?i00Wzwatoq8kM3Bw^sqnhCN>Bok^vxHq0UnWN^7`g;o;KX>?PI4uzF;ybN6cfC3EqY:p]nbm00;98Qb2OidHk<>>X:imKtY2I_:8Zsxx6uhOKmQA@ckgGh3ffe^rdM80xJ9C1`M_vYlzw20ql\9VR53astxifYJurke`8R@BJ0y>SrOaxd4F1@Wt"
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
577,5
VOp
VParam0
VParam1
VParam2
VCap
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,0
931,1

603,0
572,28
#****Begin: Generated Statements***
#****End: Generated Statements****
If (DimensionExists('Account') <> 0);
  DimensionDeleteAllElements('Account');
Else;
  DimensionCreate('Account');
EndIf;
AttrDelete('Account','signswitch');
AttrInsert('Account','','signswitch','N');
AttrDelete('Account','Forecast Method');
AttrInsert('Account','','Forecast Method','S');
AttrDelete('Account','Format');
AttrInsert('Account','','Format','S');
AttrDelete('Account','Caption_Default');
AttrInsert('Account','','Caption_Default','A');
AttrDelete('Account','Account Description Base');
AttrInsert('Account','','Account Description Base','A');
AttrDelete('Account','calculation');
AttrInsert('Account','','calculation','S');
AttrDelete('Account','Account Description');
AttrInsert('Account','','Account Description','A');
AttrDelete('Account','crossdimcalc');
AttrInsert('Account','','crossdimcalc','S');
AttrDelete('Account','Exchange Rate Type');
AttrInsert('Account','','Exchange Rate Type','S');
AttrDelete('Account','Picklist');
AttrInsert('Account','','Picklist','S');

573,13
#****Begin: Generated Statements***
#****End: Generated Statements****
If (VOp @= 'M');  DimensionElementInsert('Account','',VParam0,VParam2);
  If (VParam1 @<> '');
    DimensionElementComponentAdd('Account',VParam1,VParam0,1);
  EndIf;
ElseIf (VOp @= 'C');
  DimensionElementInsert('Account','',VParam0,VParam2);
  If (VParam1 @<> '');
    DimensionElementComponentAdd('Account',VParam1,VParam0,1);
  EndIf;
EndIf;

574,10
#****Begin: Generated Statements***
#****End: Generated Statements****
If (VOp @= 'A');
  AttrPutS(VParam2,'Account',VParam0,VParam1);
ElseIf (VOp @= 'AN');
  AttrPutN(StringToNumberEx(VParam2,'.',''),'Account',VParam0,VParam1);
ElseIf (VOp @= 'C');
  AttrPutS(VCap,'Account',VParam0,'Caption_Default');
EndIf;

575,3
#****Begin: Generated Statements***
#****End: Generated Statements****

576,
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
