#!/bin/bash

# Zombie Harold - Script to retrieve and play Audiophiler links, and set volume low come quiet hours
# @created 1/30/2018
# @author Zedoax

# Temporary storage of ibutton data
# python -c 'from ibutton2uid import ibutton2uid; ibutton2uid("ibutton#number")'

AUDIOPHILER_KEY="AUTH_KEY"
AUDIOPHILER_BASE_URL="https://audiophiler.csh.rit.edu/get_harold"

HAROLD_LOG_FILE=".bringbackharold.log"

HAROLD_QH_VOL=10
HAROLD_VOL=60

# while true; do
	#if [ibutton read]; then
		# Declare and Initialize Variables
		# USERNAME= getuser(default value)
		WEEKDAY= date +"%u" # Weekday 0-4 - Monday to Thursday; 5-6 - Friday to Sunday; 7 - Sunday
		declare -i WEEKDAY
		TIME= date +"%H" # Hour 23 - 9 Sunday to Thurday; 1 - 9 Friday to Saturday 
		declare -i TIME

		if [ $WEEKDAY > 4 ] && [ $WEEKDAY < 7 ]; then
			if [ $TIME > 0 ] && [ $TIME < 10 ]; then
				echo "Setting Volume to $HAROLD_QH_VOL" > $HAROLD_lOG_FILE
			else
				echo "Setting Volume to $HAROLD_VOL" > $HAROLD_LOG_FILE
			fi
		else
			if [ $TIME > 22 ] && [ $TIME < 10 ]; then
				echo "Setting Volume to $HAROLD_QH_VOL" > $HAROLD_LOG_FILE
			else
				echo "Setting Volume to $HAROLD_VOL" > $HAROLD_LOG_FILE
			fi 
		fi

		

		HAROLD_URL= curl -H "Content-Type: application/json" -X POST -d '{"auth_key":"$AUDIOPHILER_KEY"}' "$AUDIOPHILER_BASE_URL/zedoax"
		mpg123 --timeout 30 "$HAROLD_URL"
	# }
# done
