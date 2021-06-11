#!/bin/bash

#This code assumes you have already created the four needed CMSSW releases:
# CMSSW_10_6_17_patch1 #For SIM, DIGIPremix, AOD steps 
#CMSSW_10_6_19_patch3 #For both LHE steps
#CMSSW_10_6_25 #for miniAOD step
#CMSSW_8_0_33_UL #For HLT step

#All the steps use SCRAM_ARCH=slc7_amd64_gcc700 except for HLT step,
# which uses SCRAM_ARCH=slc7_amd64_gcc530

#Order of steps is
#LHE 0 --> LHE 1 --> SIM --> DIGIPremix --> HLT --> AOD --> miniAOD


echo BEGINNING CREATION OF MINIAOD FROM LHE...

#Prepare for LHE steps
export SCRAM_ARCH=slc7_amd64_gcc700 #this SCRAM_ARCH is good for everything but the HLT step

source /cvmfs/cms.cern.ch/cmsset_default.sh # do this once

# cd CMSSW_10_6_19_patch3/src
# eval `scram runtime -sh` #this is cmsenv
# scram b
# cd -
# 
# #LHE 0 Step
# cmsRun Y1S3S11_Z_4Mu_HO_SPS_0th_LHE_cfg.py #Both LHE steps use CMSSW_10_6_19_patch3
# 
# #LHE 1 Step
# cmsRun Y1S3S11_Z_4Mu_HO_SPS_1st_LHE_cfg.py

#Prepare for SIM step, DIGIPremix
cd CMSSW_10_6_17_patch1/src
eval `scram runtime -sh` #this is cmsenv
scram b
cd -

#SIM Step
cmsRun Y1S3S11_Z_4Mu_HO_SPS_SIM_cfg.py
# 
## DIGIPremix step
cmsRun Y1S3S11_Z_4Mu_HO_SPS_DIGIPremix_cfg.py
# 
## Prepare for HLT Step
# export SCRAM_ARCH=slc7_amd64_gcc530
# cd CMSSW_8_0_33_UL/src
# eval `scram runtime -sh` #this is cmsenv
# scram b
# cd -
# 
# HLT Step
# cmsRun Y1S3S11_Z_4Mu_HO_SPS_HLT_cfg.py
# 
# Prepare for AOD Step
# export SCRAM_ARCH=slc7_amd64_gcc700
# cd CMSSW_10_6_17_patch1/src
# eval `scram runtime -sh` #this is cmsenv
# scram b
# cd -
# 
# AOD Step
# cmsRun Y1S3S11_Z_4Mu_HO_SPS_AOD_cfg.py
# 
# Prepare for miniAOD step
# cd CMSSW_10_6_25/src
# eval `scram runtime -sh`
# scram b
# cd -
# 
# miniAOD Step 
# cmsRun Y1S3S11_Z_4Mu_HO_SPS_MiniAOD_cfg.py
# 
# echo FINISHED CREATION OF MINIAOD FROM LHE. YOUR OUTPUT FILE IS Y1S3S11_Z_4Mu_HO_SPS_MiniAOD.root.