#!/bin/bash
source /home/unixuser/MachineProb/verification.bash
source /home/unixuser/MachineProb/viewsql.bash
source /home/unixuser/MachineProb/logger.bash
add_item(){
	OPTION="ADD"
	clear
	echo -e "\t\t\tNPC ADDING MENU"
	while true;do
		CHOICE="NPC ID"
		echo -n "NPC ID: "
		read NPD
		idverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT (NUMBERS ONLY!)"
		continue 1
	done
	while true;do
		CHOICE="Name"
		echo -n "Name: "
		read NAME
		nameverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT (ENGLISH ALPHABETS ONLY!)"
		continue 1
	done
	while true;do
		CHOICE="Age"
		echo -n "Age: "
		read AGE
		ageverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT (NUMBERS ONLY!)"
		continue 1
	done
	while true;do
		CHOICE="Race"
		echo -n "Race: "
		read RACE
		raceverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID RACE (VALID RACES ARE NORD, 
		KHAJIIT, HIGH-ELF, IMPERIAL)"
		continue 1
	done
	while true;do
		CHOICE="Gender"
		echo -n "Gender: "
		read GENDER
		genderverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT (M OR F ONLY!)"
		continue 1
	done
	jobmenu
	while true;do 
		CHOICE="Job"
		echo -n "Job: "
		read JOB
		jobverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT"
		continue 1
	done
	weaponmenu
	while true;do
		CHOICE="Weapon_Of_Choice"
		echo -n "Weapon of choice: "
		read WEAPON
		weaponverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT"
		continue 1
	done
	classmenu
	while true;do
		CHOICE="Class"
		echo -n "Class: "
		read CLASS
		classverif
		POUT="$?"
		poutverif
		echo -e "\t\tINVALID INPUT"
		continue 1
	done
}
check_id(){
	#mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT NPC_ID FROM NPC" | grep -w "$NPID" >> /dev/null
	verification
	OUTCOME="$?"
	if [ "$OUTCOME" -eq 0 ];then
		echo -e "\t\tInvalid input (NPC ID already existing!)"
		echo -e "\t\tEntry not added!"
		return 0
	elif [ "$OUTCOME" -eq 1 ];then
		echo -e "\t\tNPC added successfully! "
		mysql -uroot -pmitunix06 -e "USE SKYRIM_DB;INSERT INTO NPC VALUES
		('$NPD','$NAME','$AGE','$RACE','$GENDER','$JOB','$WEAPON','$CLASS');
		SELECT * FROM NPC"
		addlog
		return 1
	fi

}

edit_item(){
	OPTION="EDIT"
	clear
	view
	while true;do
		echo -e "\t\tEDIT ITEMS"
		echo -n "Input an NPC ID or press 'R' to return: "
		read NPD
		case "$NPD" in
		[rR])
			break 1
			;;
		[0-9]*)
			verification
			POUT="$?"
			if [ "$POUT" -eq 1 ];then
				erroreditlog
				echo "Invalid NPC ID."
				read -n1 -r -p "Press any key to continue"
				continue
			elif [ "$POUT" -eq 0 ];then
				while true;do
					clear
					echo "CHOSEN ITEM:"
					mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC WHERE NPC_ID='$NPD'" 
					echo -e "\t\tCHOOSE WHAT YOU WANT TO EDIT"
					echo -e "\t[1]Name"
					echo -e "\t[2]Age"
					echo -e "\t[3]Race"
					echo -e "\t[4]Job"
					echo -e "\t[5]Weapon"
					echo -e "\t[6]Class"
					echo -e "\t[7]Gender"
					echo -e "\t[R]eturn"
					echo -n "Input here: "
					read INP	
					case "$INP" in
					1)
						while true;do
							CHOICE="Name"
							echo -n "Input change: "
							read KEY
							NAME="$KEY"
							echo "$NAME"
							nameverif
							POUT="$?"
							poutverif
							continue 1
						done
						change
						;;
					2)
						while true;do
							CHOICE="Age"
							echo -n "Intput change: "
							read KEY
							AGE="$KEY"
							ageverif
							POUT="$?"
							poutverif
							continue 1
						done
						change
						;;
					3)
						while true;do
							CHOICE="Race"
							echo -n "Intput change: "
							read KEY
							RACE="$KEY"
							raceverif
							POUT="$?"
							poutverif
							echo -e "\t\tINVALID RACE (VALID RACES ARE NORD, 
							KHAJIIT, HIGH-ELF, IMPERIAL)"
							continue 1
						done
						change
						;;
					4)
						while true;do
							CHOICE="Job"
							jobmenu
							echo -n "Intput change: "
							read KEY
							JOB="$KEY"
							jobverif
							POUT="$?"
							poutverif
							continue 1
						done
						KEY="$JOB"
						change
						;;
					5)
						while true;do
							CHOICE="Weapon_Of_Choice"
							weaponmenu
							echo -n "Intput change: "
							read KEY
							WEAPON="$KEY"
							weaponverif
							POUT="$?"
							poutverif
							continue 1
						done
						KEY="$WEAPON"
						change
						;;
					6)
						while true;do
							CHOICE="Class"
							classmenu
							echo -n "Intput change: "
							read KEY
							CLASS="$KEY"
							classverif
							POUT="$?"
							poutverif
							continue 1
						done
						KEY="$CLASS"
						change
						;;
					7)
						while true;do
							CHOICE="Gender"
							echo -n "Intput change: "
							read KEY
							GENDER="$KEY"
							genderverif
							POUT="$?"
							poutverif
							continue 1
						done
						KEY="$GENDER"
						change
						;;
					[rR])
						break 1
						;;
					esac
				done
				
			fi
			break 1
			;;
		"")
			echo "invalid input try again"
			erroreditlog
			read -n1 -r -p "Press any key to continue"
			continue 1
			;;
		*)
			echo "invalid input try again"
			erroreditlog
			read -n1 -r -p "Press any key to continue"
			continue 1
			;;
		esac
	done
}
change(){
	
	mysql -uroot -pmitunix06 -e "USE SKYRIM_DB;UPDATE NPC SET "$CHOICE"='$KEY' WHERE NPC_ID='$NPD'"
	echo "Successfully changed!"
	editlog
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC WHERE NPC_ID='$NPD'" 
}
delete(){
	while true;do
		clear
		echo -e "\t\tDELETE ITEMS"
		view	
		echo -en "\tInput NPC ID of the Item you want to delete or 'r' to return: "
		read NPD
		case "$NPD" in 
		[0-9]*)
			verification
			POUT="$?"
			if [ "$POUT" -eq 1 ];then
				echo "Invalid NPC ID."
				errordeletelog
				read -n1 -r -p "Press any key to continue"
				continue 1
			elif [ "$POUT" -eq 0 ];then
				while true;do
					echo -n "Are you sure you want to delete this item? (Y/N):"
					read DES
					case "$DES" in
					[yY])
						mysql -uroot -pmitunix06 -e "USE SKYRIM_DB;DELETE FROM NPC WHERE NPC_ID='$NPD'"
						echo "Item successfully deleted!"
						deletelog
						read -n1 -r -p "Press any key to continue"
						break 1
						;;
					[nN])
						echo "Deletion aborted"
						attemptdeletelog
						read -n1 -r -p "Press any key to continue"
						break 1
						;;
					*)
						echo "invalid input" 
						errordeletelog
						continue 1
					esac
				done
			fi
			;;
		[rR])
			break 1
			;;
		*)
			echo "invalid input try again"
			read -n1 -r -p "Press any key to continue"
			continue 1
			;;
		esac
	#mysql -uroot -pmitunix06 -e "USE SKYRIM_DB;DELETE FROM NPC WHERE NPC_ID='$NPD'"
	done
}
jobmenu(){
	echo -e "\t\tChoose Job option"
	echo -e "\t\t[1]OUTLAW"
	echo -e "\t\t[2]JARL"
	echo -e "\t\t[3]ARCHAEOLOGIST"
	echo -e "\t\t[4]MERCHANT"
	echo -e "\t\t[5]COURIER"
	echo -e "\t\t[6]N/A"
	echo -e "\t\t[7]ENGINEER"
	echo -e "\t\t[8]GUARD"
	echo -e "\t\t[9]FARMHAND"
}
weaponmenu(){
	echo -e "\t\tChoose Weapon"
	echo -e "\t\t[1]Dagger"
	echo -e "\t\t[2]Shortsword"
	echo -e "\t\t[3]Staff"
	echo -e "\t\t[4]Bow"
	echo -e "\t\t[5]Longsword"
}
classmenu(){
	echo -e "\t\tChoose Class"
	echo -e "\t\t[1]Rogue"
	echo -e "\t\t[2]Warrior"
	echo -e "\t\t[3]Necromancer"
	echo -e "\t\t[4]Bard"
	echo -e "\t\t[5]Mage"
}
