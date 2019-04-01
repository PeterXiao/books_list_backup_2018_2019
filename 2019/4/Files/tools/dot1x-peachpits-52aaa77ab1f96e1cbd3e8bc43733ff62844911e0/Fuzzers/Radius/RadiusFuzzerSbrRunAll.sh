#!/bin/bash
#
# /RadiusFuzzerAcsRunAll.sh - Wrapper script around Peach to run
#   all tests and all strategies but random
#   
#   Brad.Antoniewicz@foundstone.com
# 


MONO_BIN=mono
#PEACH_DIR="/root/peach-3.1.53-linux-x86-release"
PEACH_DIR="/root/peach-3.1.53-source/output/linux_x86_debug/bin"
PEACH_BIN="peach.exe"
PEACHPIT_DIR="/root/PeachPits"
APPEND=""
APPEND="--debug -1"

FUZZER_DIR="/root/PeachPits/Fuzzers/Radius"
FUZZER="$FUZZER_DIR/Radius_Fuzzer_Sbr.xml"
FUZZER_CONF="$FUZZER_DIR/Radius_Fuzzer_Config.xml"
#FUZZER_TESTS=("GEN-RESIDENT" "GEN-RESIDENT-Blob" "GEN-RESIDENT-BadChk")
FUZZER_TESTS=("ACS-PAP")
#FUZZER_TESTS=("GEN-RESIDENT" "GEN-RESIDENT-Blob" "GEN-RESIDENT-BadChk" "ACS-PEAP-ClientHello" "ACS-LEAP" "ACS-MD5" "ACS-PAP")
#FUZZER_TESTS=("ACS-LEAP" "ACS-MD5" "ACS-PAP")
#FUZZER_TESTS=("ACS-STATE")
#FUZZER_STRATS=("Sequential" "RandomDeterministic")
FUZZER_STRATS=("Random")

cd $FUZZER_DIR/

for strat in "${FUZZER_STRATS[@]}"
do
    for test in "${FUZZER_TESTS[@]}"
    do
        echo "Running $test with $strat strategy"
        $MONO_BIN $PEACH_DIR/$PEACH_BIN -DSTRAT=$strat --definedvalues=$FUZZER_CONF $FUZZER $test $APPEND
    done
done 

echo "All done - Not that the Random strategy was not run because it will run forever"

