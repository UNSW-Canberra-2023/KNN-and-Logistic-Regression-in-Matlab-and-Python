601,100
602,"}tp_util_convert_dynamic_subset_to_static"
562,"NULL"
586,
585,
564,
565,"fCWHoaaDWRNE?\z[=m62bHS9x_o;lz3k0DsW3sC67wz?zcEO9gx:>2]hXx9DLy_eXHVTN[9fSM8LuNtTIgRN;OD\0qOVuu^]G]FxIvLVn8l\wxwH6]JIX6G]g=FIw7db\@a=DYxPLBs?_osMUCh:?SWuoe]?oVIFgXstcbUHu5nTs?F>LnxogwefjKEzPGtt\UwrfyAX"
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
pDim
pSubset
561,3
2
2
2
590,3
pExecutionId,"None"
pDim,"None"
pSubset,"None"
637,3
pExecutionId,""
pDim,""
pSubset,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,43


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################



# Make sure dimension and subset exist
If (DimensionExists(pDim) = 0);
ProcessError;
EndIf;

If (SubsetExists(pDim, pSubset) = 0);
ProcessError;
EndIf;
 
If (SubsetGetSize(pDim, pSubset) = 0);

#do nothing
else;

# Get the first element from subset
cFirstElem = SubsetGetElementName(pDim, pSubset, 1);

# Insert this element back to the subset at the end
SubsetElementInsert(pDim, pSubset, cFirstElem, SubsetGetSize(pDim, pSubset) + 1);

# Remove this inserted element
SubsetElementDelete(pDim, pSubset, SubsetGetSize(pDim, pSubset));

ENdIf;

573,1

574,1

575,1

576,
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
