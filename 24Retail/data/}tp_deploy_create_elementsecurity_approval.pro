601,100
602,"}tp_deploy_create_ElementSecurity_approval"
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
560,3
pExecutionId
pAppId
pApprovalDim
561,3
2
2
2
590,3
pExecutionId,"None"
pAppId,"None"
pApprovalDim,"None"
637,3
pExecutionId,""
pAppId,""
pApprovalDim,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,60
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

DatasourceASCIIQuoteCharacter='';
singleQ = char(39);

#***create intermediate element security cube for approval dimension
cIMAppDim =  '}tp_intermediate_security_applications';
cIMElemSecurityCube = '}tp_intermediate_ElementSecurity}' | pApprovalDim;
cIMMeasuresDim = '}tp_intermediate_security_measures';
	
IF (CubeExists(cIMElemSecurityCube) =0);
	CubeCreate(cIMElemSecurityCube, pApprovalDim,cIMAppDim, '}Groups',cIMMeasuresDim );
	CubeSetLogChanges(cIMElemSecurityCube, 1);
Else;
	#zero out old security values on this application


Endif;

#***build cube rule for intermediate security cube
vRule = '';
vRule = '[' | singleQ | 'WriteCount' | singleQ | '] =IF(!' | cIMAppDim | '@<>' | singleQ | 'all_applications' | singleQ | ',
 	IF(DB(' | singleQ  | cIMElemSecurityCube | singleQ | ',!' | pApprovalDim | ',!' | cIMAppDim | ', !}Groups, ' | singleQ | 'Rights' | singleQ | ') @= ' | singleQ | 'WRITE' | singleQ | ',1, 0 ),Continue);';
vRule = vRule | char(10) | '[' | singleQ | 'ReadCount' | singleQ | '] =IF(!' | cIMAppDim | '@<>' | singleQ | 'all_applications' | singleQ | ',
 	IF(DB(' | singleQ  | cIMElemSecurityCube | singleQ | ',!' | pApprovalDim | ',!' | cIMAppDim | ', !}Groups, ' | singleQ | 'Rights' | singleQ | ') @= ' | singleQ | 'READ' | singleQ | ',1, 0 ),Continue);';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'WriteCount' | singleQ  | ']=ConsolidateChildren(' | singleQ |  cIMAppDim | singleQ | ');';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'ReadCount' | singleQ  | ']=ConsolidateChildren(' | singleQ |  cIMAppDim | singleQ | ');';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'Rights' | singleQ | ']=
	S:IF(DB(' | singleQ | cIMElemSecurityCube | singleQ | ',!' | pApprovalDim | ',!' | cIMAppDim | ', !}Groups,' | singleQ | 'WriteCount' | singleQ | ')>0, ' | singleQ | 'WRITE' | singleQ | ', CONTINUE);';
vRule = vRule | char(10) | '[' | singleQ | 'all_applications' | singleQ | ',' | singleQ | 'Rights' | singleQ | ']=
	S:IF(DB(' | singleQ | cIMElemSecurityCube | singleQ | ',!' | pApprovalDim | ',!' | cIMAppDim | ', !}Groups,' | singleQ | 'ReadCount' | singleQ | ')>0, ' | singleQ | 'READ' | singleQ | ', CONTINUE);';

vIMFile = 'IMElementSecurityRule' | pApprovalDim | '.txt';
TextOutput(vIMFile, vRule);

#***create element security cube for approval dimension
cElementSecurityCube = '}ElementSecurity_' | pApprovalDim;
cElementSecurityRule = '';
IF (CubeExists(cElementSecurityCube) =0);
	CubeCreate(cElementSecurityCube, pApprovalDim, '}Groups' );
	CubeSetLogChanges(cElementSecurityCube, 1);
Endif;

#***build cube rule for element security cube
vRule = '';
vRule = '[] = S:DB(' | singleQ | cIMElemSecurityCube | singleQ | ',!' | pApprovalDim | ',' | singleQ | 'all_applications' | singleQ | ', !}Groups,' | singleQ | 'Rights' | singleQ | ');';
vFile = 'ElementSecurityRule' | pApprovalDim | '.txt';
TextOutput(vFile, vRule);
573,1

574,1

575,19
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

RuleLoadFromFile(cIMElemSecurityCube, vIMFile);
ASCIIDelete(vIMFile);

RuleLoadFromFile(cElementSecurityCube, vFile);
ASCIIDelete(vFile);
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
