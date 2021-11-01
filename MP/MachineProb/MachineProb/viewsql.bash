#!/bin/bash
source /home/unixuser/MachineProb/logger.bash
view(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC"
	viewlog
}
sorted_name(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Name"
	namesortedlog
}
sorted_age(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Age"
	agesortedlog
}
sorted_race(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Race"
	racesortedlog
}
sorted_job(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Job"
	jobsortedlog
}
sorted_weapon(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Weapon_Of_Choice"
	weaponsortedlog
}
sorted_class(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Class"
	classsortedlog
}
sorted_npcid(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY NPC_ID"
	npcidsortedlog
}
sorted_gender(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC ORDER BY Gender"
	gendersortedlog
}
search(){
	while true;do
		clear
		echo -e "\t\tSEARCH VIEW, CHOOSE YOUR OPTION"
		echo -e "\t[1]By NPC ID"
		echo -e "\t[2]By Name"
		echo -e "\t[3]By Age"
		echo -e "\t[4]By Race"
		echo -e "\t[5]By Job"
		echo -e "\t[6]By Weapon of choice"
		echo -e "\t[7]By Class"
		echo -e "\t[8]By Gender"
		echo -e "\t[R]eturn"
		read KEYWORD
		case "$KEYWORD" in
		[rR])
			break 1
			;;
		1)
			CHOICE="NPC_ID"
			echo -e "\t\tBy NPC ID chosen"
			verify
			continue
			;;
		2)
			CHOICE="Name"
			echo -e "\t\tBy Name chosen"
			verify
			continue
			;;
		3)
			CHOICE="Age"
			echo -e "\t\tBy age chosen"
			verify
			continue
			;;
		4)
			CHOICE="Race"
			echo -e "\t\tBy Race chosen"
			verify
			continue
			;;
		5)
			CHOICE="Job"
			echo -e "\t\tBy Job chosen"
			verify
			continue
			;;
		6)
			CHOICE="Weapon_Of_Choice"
			echo -e "\t\tBy weapon"
			verify
			continue
			;;
		7)
			CHOICE="Class"
			echo -e "\t\tBy Class"
			verify
			continue
			;;
		8)
			CHOICE="Gender"
			echo -e "\t\tBy Gender"
			verify
			continue
			;;
		*)
			echo "invalid"
			continue 
			;;
		esac
	done
}
verify(){
		#	mysql -u root -pmitunix06 -e "USE SKYRIM_DB; SELECT * FROM NPC" | grep "$KEY" >> /dev/null
		echo -n "Input keyword: "
		read KEY
		mysql -u root -pmitunix06 -e "USE SKYRIM_DB; SELECT * FROM NPC WHERE "$CHOICE"='$KEY'" >> /dev/null
		OUTCOME="$?"
		if [ "$OUTCOME" -eq 1 ];then
			echo -e "\t\tKEYWORD NOT FOUND!"
			return 0
		elif [ "$OUTCOME" -eq 0 ];then
		#	mysql -u root -pmitunix06 -e "USE SKYRIM_DB; SELECT * FROM NPC" | grep "$KEY" 
			mysql -u root -pmitunix06 -e "USE SKYRIM_DB; SELECT * FROM NPC WHERE "$CHOICE"='$KEY'" 
			searchlog
			read -n1 -r -p "Press any key to continue"
			return 1
		fi
			continue 
}
