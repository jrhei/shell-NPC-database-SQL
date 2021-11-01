#!/bin/bash

source /home/unixuser/MachineProb/verification.bash
source /home/unixuser/MachineProb/writesql.bash
batchload(){
	clear
	echo -e "\t\t\tBATCH LOADER FILE"
	echo -en "Input file name(use absolute path if not in the same directory): "
	read FILE
	if [ -f $FILE ];then
		loadlog
		LINE=$(wc -l /home/unixuser/MachineProb/$FILE | cut -d" " -f1)
		for INDEX01 in $(seq 1 $LINE);do
			clear
		 	echo "PROCESSING...."
			NPD=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f1)
#		echo "$NPD"
			verification
			POUT=$?
			OUTCOME="Failed to add entry!"
			if [ "$POUT" -eq 1 ];then
				echo "Adding NPC #$NPD...."
				for INDEX02 in $(seq 1 8);do
					CURRENT=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
					echo "CHECKING DATA..."
					echo "$CURRENT"
					if [ "$INDEX02" -eq 1 ];then
						NPD=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						idverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 2 ];then
						NAME=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						nameverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 3 ];then
						AGE=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						ageverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 4 ];then
						RACE=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						raceverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 5 ];then
						GENDER=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						genderverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 6 ];then
						JOB=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						jobverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 7 ];then
						WEAPON=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						weaponverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					elif [ "$INDEX02" -eq 8 ];then
						CLASS=$(sed -n "$INDEX01"p /home/unixuser/MachineProb/$FILE | cut -d: -f"$INDEX02")
						classverif
						POUT="$?"
						if [ "$POUT" -eq 1 ];then
							echo "-----valid-----------"
							OUTCOME="Successfully added entry!"
							check_id
							successloadlog
						elif [ "$POUT" -eq 0 ];then
							echo "----------invalid-----------"
							errorloadinalllog
							break 1
						fi
					fi		
				done
				echo -e "$OUTCOME\n\n"
			elif [ "$POUT" -eq 0 ];then
				echo "NPC ID: $NPD IS INVALID (ENTRY ALREADY PRESENT)"
				errorloadinalllog
			fi
			read -n1 -r -p "Press any key to continue"
		done
	else
		echo "invalid file input!"
		errorloadlog
	fi
}

