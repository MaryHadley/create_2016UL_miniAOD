#This code assumes you have already created the necessary CMSSW releases, in this case, the case for 2016, CMSSW_10_6_19_patch3, CMSSW_10_6_17_patch1, CMSSW_8_0_33_UL, CMSSW_10_6_25. IT ALSO ASSUMES THAT YOUR NEW LHE WAS MADE WITH THE SAME FRAGMENT AS THE ONE USED TO MAKE THE FILES IN THIS REPO!!!

#Before running change the LHE name to your LHE in the Y1S3S11_Z_4Mu_HO_SPS_0th_LHE_cfg.py in the Input Source line

#You must also change the number of events in the equivalents of annotation = cms.untracked.string('Configuration/GenProduction/python/standardFragment.py nevts:blah'), line 
#and in the process.maxEvents = cms.untracked.PSet(  input = cms.untracked.int32(blah)) 
to the number of events in your LHE file for EVERY CFG FILE. YOU WILL HAVE TO CHANGE 2 NUMBERS IN EACH CFG!!


#If you wish to change the output file name, change it the Y1S3S11_Z_4Mu_HO_SPS_MiniAOD_cfg.py at or around line 58 in the fileName=cms.untracked.string("blah"), line

#run as source runMeToMakeMiniAOD.sh or . runMeToMakeMiniAOD.sh


