#!/bin/bash

# 
# osx-screensaver-profile
# Author: Enrico Cambiaso
# Email: enrico.cambiaso[at]gmail.com
# GitHub project URL: https://github.com/auino/osx-screensaver-profile
# 

# --- --- --- --- ---
# CONFIGURATION BEGIN
# --- --- --- --- ---

# Home profile configuration
HOME_IP="192.168."
HOME_NAME="Flurry"
HOME_PATH="/System/Library/Screen\ Savers/Flurry.saver"
HOME_TYPE=0

# Work profile configuration
WORK_IP="10.16."
WORK_NAME="Aerial"
WORK_PATH="$HOME/Library/Screen Savers/Aerial.saver"
WORK_TYPE=0

# Other configuration
VERBOSE=1
VERBOSE_LOGFILE="/tmp/osxscreensaverprofile.log"

# --- --- --- --- ---
#  CONFIGURATION END 
# --- --- --- --- ---

# returning information of current screensaver
if [ "$1" == "-c" ]; then
	defaults -currentHost read com.apple.screensaver
	exit
fi

# returning a list of available screensaver names
if [ "$1" == "-n" ]; then
	# globally available screensavers
	ls /System/Library/Screen\ Savers/ > /tmp/osxscreensaverprofile.txt
	# screensavers available only for current user
	ls ~/Library/Screen\ Savers/ >> /tmp/osxscreensaverprofile.txt
	# listing retrieved screensavers
	while read L; do
		L=`echo $L|awk -F. '{print $1}'`
		echo $L
	done < /tmp/osxscreensaverprofile.txt
	exit
fi

# returning a list of available screensaver paths
if [ "$1" == "-p" ]; then
	# globally available screensavers
	ls -d -1 /System/Library/Screen\ Savers/*|sed -e 's/\ /\\\ /g'
	# screensavers available only for current user
	ls -d -1 ~/Library/Screen\ Savers/*|sed -e 's/\ /\\\ /g'
	exit
fi

# main screen saver change functionality

# Default/null profile variables
R=""
N=""
P=""
T=""

# retrieving current IP address, if it's the same of Home profile
C=`/sbin/ifconfig|grep "$HOME_IP"|wc -l|awk '{print $1}'`
if [ "$C" != "0" ]; then
	R="Home"
	N=$HOME_NAME
	P=$HOME_PATH
	T=$HOME_TYPE
fi

# retrieving current IP address, if it's the same of Work profile
C=`/sbin/ifconfig|grep "$WORK_IP"|wc -l|awk '{print $1}'`
if [ "$C" != "0" ]; then
	R="Work"
	N=$WORK_NAME
	P=$WORK_PATH
	T=$WORK_TYPE
fi

# checking if a Home or Work profile should be used
if [ "$R" == "" ]; then
	if [ $VERBOSE -gt 0 ]; then
		echo "No profile is assigned to current scenario" >> $VERBOSE_LOGFILE
	fi
	exit
fi

# checking if a change is really needed
CURRENT=`defaults -currentHost read com.apple.screensaver|grep moduleName|awk -F'= ' '{print $2}'|sed -e 's/;//g'`
if [ "$CURRENT" == "$N" ]; then
	if [ $VERBOSE -gt 0 ]; then
		echo "Screen saver change is not needed" >> $VERBOSE_LOGFILE
	fi
	exit
fi

# setting the new screen saver profile
if [ $VERBOSE -gt 0 ]; then
	echo "Setting $R screen saver profile" >> $VERBOSE_LOGFILE
fi
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName "$N" path "$P" type -int $T
