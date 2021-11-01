#!/bin/bash

verification(){
	mysql -u root -pmitunix06 -e "USE SKYRIM_DB;SELECT * FROM NPC WHERE NPC_ID='$NPD'" | grep "$NPD" >> /dev/null
	OUTCOME="$?"
	if [ "$OUTCOME" -eq 1 ];then
		return 1
	elif [ "$OUTCOME" -eq 0 ];then
		return 0
	fi

}
idverif(){
	case "$NPD" in 
	[0-9]*)
		return 1
		;;
	*)
		return 0
		;;
	esac
}
nameverif(){
	case "$NAME" in
	[a-zA-Z]*)
		return 1
		;;
	*)
		return 0
		;;
	esac
}

ageverif(){
	case "$AGE" in 
	[0-9]*)
		return 1
		;;
	*)
		return 0
		;;
	esac
}
raceverif(){
	case "$RACE" in
	[nN][oO][rR][dD])
		return 1
		;;
	[kK][hH][aA][jJ][iI][iI][tT])
		return 1
		;;
	[hH][iI][gG][hH]-[eE][lL][fF])
		return 1
		;;
	[iI][mM][pP][eE][rR][iI][aA][lL])
		return 1
		;;
	*)
		return 0
		;;
	esac
}
genderverif(){
	case "$GENDER" in
	[mM])
		GENDER="M"
		return 1
		;;
	[fF])
		GENDER="F"
		return 1
		;;
	*)
		return 0
		;;
	esac
}
jobverif(){
	case "$JOB" in
	1)
		JOB="Outlaw"
		return 1
		;;
	2)
		JOB="Jarl"
		return 1
		;;
	3)
		JOB="Archaeologist"
		return 1
		;;
	4)
		JOB="Merchant"
		return 1
		;;
	5)
		JOB="Courier"
		return 1
		;;
	6)
		JOB="N/A"
		return 1
		;;
	7)
		JOB="Engineer"
		return 1
		;;
	8)
		JOB="Guard"
		return 1
		;;
	9)
		JOB="Farmhand"
		return 1
		;;
	*)
		return 0
		;;
	esac
}
weaponverif(){
	case "$WEAPON" in
	1)
		WEAPON="Dagger"
		return 1
		;;
	2)
		WEAPON="Shortsword"
		return 1
		;;
	3)
		WEAPON="Staff"
		return 1
		;;
	4)
		WEAPON="Bow"
		return 1
		;;
	5)
		WEAPON="LONGSWORD"
		return 1
		;;
	*)
		return 0
		;;
	esac
}
classverif(){
	case "$CLASS" in
	1)
		CLASS="Rogue"
		return 1
		;;
	2)
		CLASS="Warrior"
		return 1
		;;
	3)
		CLASS="Necromancer"
		return 1
		;;
	4)
		CLASS="Bard"
		return 1
		;;
	5)
		CLASS="Mage"
		return 1
		;;
	*)
		return 0
		;;
	esac
}
poutverif(){
	if [ "$POUT" -eq 1 ];then
		break 1
	elif [ "$POUT" -eq 0 ];then
		if [ "$OPTION" == "ADD" ];then
			erroraddlog
		elif [ "$OPTION" == "EDIT" ];then
			echo -e "INVALID INPUT"
			erroreditlog
			read -n1 -r -p "Press any key to continue"
		fi
	fi
}
