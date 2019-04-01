#!/bin/bash
#
#   RadiusFuzzerBridgeRunAll.sh - Wrapper script around Peach to run
#       all tests and all strategies but random
#   
#   Brad.Antoniewicz@foundstone.com
# 


MONO_BIN=mono
#PEACH_DIR="/root/peach-3.1.53-linux-x86-release"
PEACH_DIR="/root/peach-3.1.53-source/output/linux_x86_debug/bin"
PEACH_BIN="peach.exe"
PEACHPIT_DIR="/root/PeachPits"
FUZZER_DIR="/root/PeachPits/Fuzzers/Radius"

APPEND=""
#APPEND="--skipto 1000"
#APPEND="--debug"

BRIDGE_BIN="eapol_test"
BRIDGE_CMD="/root/hostap_modded/wpa_supplicant/eapol_test -c /root/hostap_modded/wpa_supplicant/peap.conf -a 192.168.1.1 -s key -p 1645"
#BRIDGE_CMD="/root/hostap_modded/wpa_supplicant/eapol_test -c /root/hostap_modded/wpa_supplicant/eap-fast-test.conf -a 192.168.1.1 -s key"

FUZZER="$FUZZER_DIR/Radius_Fuzzer_Bridge.xml"
FUZZER_CONF="$FUZZER_DIR/Radius_Fuzzer_Config.xml"
#FUZZER_TESTS=("Bridge-MSCHAPv2")
FUZZER_TESTS=("Bridge-GTC" "Bridge-IDENT" "Bridge-MSCHAPv2")
#FUZZER_STRATS=("Sequential" "RandomDeterministic")
FUZZER_STRATS=("Random")

DELAY="1" # Enable to reset eap_bridge
START=1
END=1000
SKIP=1
cd $FUZZER_DIR


killall $BRIDGE_BIN 
echo "Launching Bridge"
$BRIDGE_CMD &

for strat in "${FUZZER_STRATS[@]}"
do
    for test in "${FUZZER_TESTS[@]}"
    do
        if [ ${DELAY} ];
        then 
            for ((i=$START; i<=$END; i+=$SKIP))
            do
                echo "Running $test with $strat strategy with delay"
                $MONO_BIN $PEACH_DIR/$PEACH_BIN -DSTRAT=$strat --definedvalues=$FUZZER_CONF $FUZZER --range $i,`expr $i + $SKIP` $test $APPEND
                echo "Killing bridge to reset sockets"
                killall $BRIDGE_BIN 
                echo "Sleeping for 15 seconds while the kernel catches up"
                sleep 2
                echo "Restarting bridge"
                $BRIDGE_CMD &
            done
        else
            echo "Running $test with $strat strategy"
            $MONO_BIN $PEACH_DIR/$PEACH_BIN -DSTRAT=$strat --definedvalues=$FUZZER_CONF $FUZZER $test $APPEND
        fi
    done
done 

echo "All done - Not that the Random strategy was not run because it will run forever"

