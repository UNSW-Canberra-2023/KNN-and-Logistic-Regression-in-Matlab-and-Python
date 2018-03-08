601,100
602,"}tp_deploy_shadow_dim_add_direct_children"
562,"NULL"
586,
585,
564,
565,"b_aRl_=5PS2L8:8RE:O58d_M^WAjvy\LE7`yefLEDvhD5:>gv?FGbgv7oV`h_4=D[9MQQFtA49u_E:z=Xg9]8uAr[J<]H@:`\jg4f>;28aSIk>CyvmNzStuHUX1cu;:@=FGNuwGVBxiXVjGsyC`sOi>z6c`TeO^08=@LA`crR<V9[^EH]wf^E_rANdl:y:5K8kvdGuy0"
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
560,5
pExecutionId
pAppId
pApprovalDim
pApprovalSubset
pParent
561,5
2
2
2
2
2
590,5
pExecutionId,"None"
pAppId,"MyApp"
pApprovalDim,"TestElist"
pApprovalSubset,"TestElist"
pParent,"ParentNode"
637,5
pExecutionId,""
pAppId,""
pApprovalDim,""
pApprovalSubset,""
pParent,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,33


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################



cShadowApprovalDim = '}tp_tasks}' | pAppId;
vTotalChildren = ELCOMPN(pApprovalDim, pParent);

looper = 1;

While (looper <=vTotalChildren);
vChild = ELCOMP(pApprovalDim, pParent, looper);

IF (DIMIX(cShadowApprovalDim, vChild) >0);
vWeight = ELWEIGHT(pApprovalDim, pParent, vChild);
DimensionElementComponentAdd(cShadowApprovalDim, pParent, vChild, vWeight);
Endif;

looper = looper +1;
end;
573,1

574,1

575,41


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################

vTotalChildren = ELCOMPN(pApprovalDim, pParent);

looper = 1;

While (looper <=vTotalChildren);
vChild = ELCOMP(pApprovalDim, pParent, looper);

IF (DIMIX(cShadowApprovalDim, vChild) >0);
SubsetElementInsert(cShadowApprovalDim, pApprovalSubset, vChild, 0);
vTotal = ELCOMPN(pApprovalDim, vChild);
IF (vTotal >=1);
vReturnValue = ExecuteProcess('}tp_deploy_shadow_dim_add_direct_children', 'pExecutionId', pExecutionId,'pAppId', pAppId,
'pApprovalDim', pApprovalDim, 'pApprovalSubset', pApprovalSubset, 'pParent', vChild);
#textoutput('c:\temp\addchild.txt', pParent, vChild);
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
Endif;


Endif;

looper = looper +1;
end;

576,
930,0
638,1
804,0
1217,0
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
