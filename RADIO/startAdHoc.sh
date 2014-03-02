#!/usr/bin/env sh
#
# startAdHoc Radio Link
#
#
# FREQ CHANNEL
# 5180 [36]
# 5190 [38]
# 5200 [40]
# 5210 [42]
# 5220 [44]
# 5230 [46]
# 5240 [48]
# 5250 [50]
# 5260 [52]
# 5270 [54]
# 5280 [56]
# 5290 [58]
# 5300 [60]
# 5310 [62]
# 5320 [64]
# 5500 [100]
# 5510 [102]
# 5520 [104]
# 5530 [106]
# 5540 [108]
# 5550 [110]
# 5560 [112]
# 5570 [114]
# 5580 [116]
# 5590 [118]
# 5600 [120]
# 5610 [122]
# 5620 [124]
# 5630 [126]
# 5640 [128]
# 5650 [130]
# 5660 [132]
# 5670 [134]
# 5680 [136]
# 5690 [138]
# 5700 [140]
# 5745 [149]
# 5755 [151]
# 5765 [153]
# 5775 [155]
# 5785 [157]
# 5795 [159]
# 5805 [161]
# 5825 [165]
# 4920 [-16]
# 4940 [-12]
# 4960 [-8]
# 4980 [-4]
# -----------------------
# FREQ		CHANNEL
# 2412 MHz	[1]
# 2417 MHz	[2]
# 2422 MHz	[3]
# 2427 MHz	[4]
# 2432 MHz	[5]
# 2437 MHz	[6]
# 2442 MHz	[7]
# 2447 MHz	[8]
# 2452 MHz	[9]
# 2457 MHz	[10]
# 2462 MHz	[11]
# 2467 MHz	[12]
# 2472 MHz	[13]
# 2484 MHz	[14]
#
# NON OVERLAPPING in 802.11b with DSSS @ 22Mhz:
# Channel 1,6,11
# Freq 2412,2437,2462
#
# NON OVERLAPPING in 802.11g with OFDM @ 20Mhz:
# Channel 1,5,9,13
# Freq 2412,2432,2452,2472
# OR
# dist from center freq > 25Mhz
#
# start Ad Hoc radio link
#
# leave IBSS
# iw $RADIO ibss leave
#
[ -z $1 ] && echo "uso: "$0" DEVICE RADIO [i.e wlan0]" && exit 1

[ -z $2 ] && ESSID=MeshNet

[ -z $3 ] && FREQ=2462

RADIO=$1
ESSID=$2
FREQ=$3

# radio info
iw dev $RADIO link 
wait


iw $RADIO set type ibss
wait

ifconfig $RADIO up
wait

iw $RADIO ibss join $ESSID $FREQ
wait

####

#iw phy $PHY interface add wlan0 type ad-hoc
#ifconfig wlan0 up
# iw dev wlan0 ibss join SuperMeshNet 2412
