#!/bin/bash
DATE=$(date)
viewlog(){
	echo -e "---User: $USER, has viewed the records at: $DATE---\n" >> logs.txt
}
namesortedlog(){
	echo -e "---User: $USER, has sorted the records by name and viewed them at: $DATE---\n" >> logs.txt
}
agesortedlog(){
	echo -e "---User: $USER, has sorted the records by age and viewed them at:  $DATE---\n" >> logs.txt
}
agesortedlog(){
	echo -e "---User: $USER, has sorted the records by age and viewed them at:  $DATE---\n" >> logs.txt
}
racesortedlog(){
	echo -e "---User: $USER, has sorted the records by race and viewed them at:  $DATE---\n" >> logs.txt
}
jobsortedlog(){
	echo -e "---User: $USER, has sorted the records by job and viewed them at:  $DATE---\n" >> logs.txt
}
weaponsortedlog(){
	echo -e "---User: $USER, has sorted the records by weapon and viewed them at:  $DATE---\n" >> logs.txt
}
classsortedlog(){
	echo -e "---User: $USER, has sorted the records by class and viewed them at:  $DATE---\n" >> logs.txt
}
npcidsortedlog(){
	echo -e "---User: $USER, has sorted the records by NPC ID and viewed them at:  $DATE---\n" >> logs.txt
}
gendersortedlog(){
	echo -e "---User: $USER, has sorted the records by gender and viewed them at:  $DATE---\n" >> logs.txt
}
searchlog(){
	echo -e "---User: $USER, has searched for $CHOICE '$KEY' at:  $DATE---\n" >> logs.txt
}
addlog(){
	echo -e "---User: $USER, has added an NPC with a number of '$NPD' and name of '$NAME' at: $DATE---\n" >> logs.txt
}
erroraddlog(){
	echo -e "---User: $USER, tried to add an NPC and failed due to an error with an input at $CHOICE  at: $DATE---\n" >> logs.txt
}
deletelog(){
	echo -e "---User: $USER, has deleted an NPC with a number of '$NPD' at: $DATE---\n" >> logs.txt
}
errordeletelog(){
	echo -e "---User: $USER, attempted to delete an NPC with a number of '$NPD' but failed due to invalid input at: $DATE---\n" >> logs.txt
}
attemptdeletelog(){
	echo -e "---USER: $USER, attempted to delete an NPC with a number of '$NPD' but canceled at: $DATE---\n" >> logs.txt
}
editlog(){
	echo -e "---USER: $USER, has edited the $CHOICE of NPC ID '$NPD' to '$KEY' at: $DATE---\n" >> logs.txt
}
erroreditlog(){
	echo -e "---USER: $USER, has attempted to edit an NPC but had an invalid input at: $DATE---\n" >> logs.txt 
}
loadlog(){
	echo -e "---USER: $USER, has loaded file named '$FILE' at: $DATE---\n" >> logs.txt
}
errorloadlog(){
	echo -e "---USER: $USER has loaded file named '$FILE' but has failed due to the file not existing at: $DATE---\n" >> logs.txt
}
#errorloadinlog(){
#	echo -e "---USER: $USER has failed to load data from file '$FILE' due to it being an invalid data entry at: $DATE---\n" >> logs.txt
#}
errorloadinalllog(){
	echo -e "---USER: $USER has failed to load all data from file '$FILE' due to it having an invalid data entry at: $DATE---\n" >> logs.txt
}
successloadlog(){
	echo -e "---USER: $USER has successfully loaded an NPC from file '$FILE' with an NPC ID of '$NPD' and name of '$NAME' at $DATE---\n" >> logs.txt
}
loglog(){
	echo -e "---USER: $USER has viewed log files at: $DATE---\n" >> logs.txt
}
