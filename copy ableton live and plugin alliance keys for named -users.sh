#! /bin/bash -e

# (c) public domain

# This just needs to copy the master Ableton and Plugin Alliance authorizations, after authorization
#	into the library and system library for new users

# These programs use machine-based authorizations, sometimes PA works from simply copying the license in the local Library
# 	We do most else in the new User templates & device mdm, and a few things like Desktop images and mount points in user mdm profiles
#	# Templates include fixes like passing an Ableton preferences and database (with userlibrary removed), and Options.txt
#		#and preventing roam on the network for files in the User hierchy for Ableton (not currently needed)
#

#you'll need to create variables or update the Ableton verion names in the folder paths


#variables to make script portable for github
#admin user
auser='$auser1'
#if desired another, pre-existing local user
nonauser='$nonauser1'

#variables for a slight speed improvement
au=/Users//Library/Application\ Support/Ableton/Live\ 9.6.1/Unlock/
pau=/Users/"$auser1"/Library/Application\ Support/Plugin\ Alliance/

stu=/Users/"$nonauser1"/Library/Application\ Support/
tpl=/System/Library/User\ Template/English.lproj/Library/Application\ Support/
sysl=/Library/Application\ Support/

#the directories we need to copy to exist already due to the imaging process

#	#putting this stuff in the dirs for our default backup local user, must be root since not our account
sudo cp -Rf "$pau" "$stu"Plugin\ Alliance/
sudo cp -Rf "$au" "$stu"Ableton/Live\ 9.6.1/Unlock/
	# #and making sure she can access it (see bottom while in sudo section)

	#...and just for safe-keeping, the local library as well, system root access needed sometimes to tranverse here
sudo cp -Rf "$pau" "$sysl"Plugin\ Alliance/
sudo cp -Rf "$au" "$sysl"Ableton/Live\ 9.6.1/Unlock/

        #... and putting this stuff in the template, system root access needed here, as well
sudo cp -Rf "$pau" "$tpl"Plugin\ Alliance/
sudo cp -Rf "$au" "$tpl"Ableton/Live\ 9.6.1/Unlock/

#fixing these permissions for double-sure since copied by root, leaving sudo to make sure still works
sudo chown -R "$nonauser1" "$stu"Plugin\ Alliance/
sudo chown -R "$nonauser1" "$stu"Ableton/Live\ 9.6.1/Unlock/

exit

#double make sure i am no longer root
exit
