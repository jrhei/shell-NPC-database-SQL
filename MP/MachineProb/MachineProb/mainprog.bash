#!/bin/bash
clear
source /home/unixuser/MachineProb/viewsql.bash
source /home/unixuser/MachineProb/writesql.bash
source /home/unixuser/MachineProb/verification.bash
source /home/unixuser/MachineProb/loader.bash
while true;do
	clear
	echo -e "\tTHE ELDER SCROLLS V: SKYRIM NPC DATABASE"	
	echo -e "\t\t\tChoose An Option"
	echo -e "\t\t[1]Add" 
	echo -e "\t\t[2]Edit"
	echo -e "\t\t[3]Delete"
	echo -e "\t\t[4]View"
	echo -e "\t\t[5]Load via batch file"
	echo -e "\t\t[6]Logs (after viewing press 'Q' to return to menu)"	
	echo -e "\t\t[7]Exit"
	echo -n "Input here: "
	read OPTION
	case "$OPTION" in 
	1)
		add_item
		check_id
		read -n1 -r -p "Press any key to continue"
		;;
	2)
		echo "2"
		edit_item
		read -n1 -r -p "Press any key to continue"
		;;
	3)
		echo "3"
		delete
		read -n1 -r -p "Press any key to continue"
		;;
	4)	
		while true;do	
			clear
			echo -e "\t\t\tChoose Sort Type or type 's' to search specifically"
			echo -e "\t\t[S]Search"
			echo -e "\t\t[1]NPC_ID"
			echo -e "\t\t[2]Name"
			echo -e "\t\t[3]Age"
			echo -e "\t\t[4]Race"
			echo -e "\t\t[5]Job"
			echo -e "\t\t[6]Weapon Of Choice"
			echo -e "\t\t[7]Class"
			echo -e "\t\t[8]Gender"
			echo -e "\t\t[R]eturn"
			echo -n "Input here(if left blank will output be default): "
			read FIELD
			case "$FIELD" in
			[sS])
				echo "test search"
				search
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			1)
				echo -e "\t\t\tSorted by NPC ID"
				sorted_npcid
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			2)
				echo -e "\t\t\tSorted by name"
				sorted_name				
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			3)
				echo -e "\t\t\tSorted by age"
				sorted_age
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			4)
				echo -e "\t\t\tSorted by race"
				sorted_race
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			5)
				echo -e "\t\t\tSorted by job"
				sorted_job
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			6)
				echo -e "\t\t\tSorted by weapon of choice"
				sorted_weapon
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			7)
				echo -e "\t\t\tSorted by class"
				sorted_class
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			8)
				echo -e "\t\t\tSorted by Gender"
				sorted_gender
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			[rR])
				read -n1 -r -p "Press any key to continue"
				break 1
				;;
			"")	
				echo -e "\t\t\tDefault"
				view
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			*)
				
				echo "invalid option please try again"
				read -n1 -r -p "Press any key to continue"
				continue 1
				;;
			esac
	
		done
		;;
	5)
		echo "5"
		batchload
		read -n1 -r -p "Press any key to continue"
		;;
	6)
		echo "After viewing press 'Q' to return"
		cat logs.txt | less 
		read -n1 -r -p "Press any key to continue"
		;;
	7)
		echo "Exiting Program"
		exit 0
		break
		;;
	*)
		echo "invalid option please try again"
		read -n1 -r -p "Press any key to continue"
		continue
		;;
	esac
done

