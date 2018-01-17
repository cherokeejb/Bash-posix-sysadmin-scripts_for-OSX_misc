#! /bin/bash
# (c) public domain

#  This copies the Ableton license (Unlock.cfg), for example on login using a
#+ 	LaunchAgent, to avoid users having issues working across multiple machines or
#+	sharing a single machine with other users.
#  'dp' is our manually created location to store our legal, master license.
#  This script runs natively on bash (darwin), needs not to launch Finder, etc., and
#+	at this time bash is the default shell & compiler on OSX (Yosemite, 10.10.5).
#  This is to be used only on legal accounts that have been already authorized, or have
#+  	never opened Live before; you could of course check this in the script,
#+	which is beyond our scope.

# you could launch this the slow apple way, see https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html for example, or find a simple .plist file online,
#+    ...or use crontab, bashrc, rc or any other startup script method allowed on your current OS

# In development run the script as /bin/bash -Ev to watch for errors

#	This was updated in 2016 winter updates to optimize Ableton for network environments

# First, manually authorize Ableton once, set up, clear user library in database.cfg, and run the script ~/copyauth [also examples are at https://github.com/cherokeejb/Bash-posix-sysadmin-scripts_for-OSX_misc/], or our build-specific variation for this to work
#	note also that further, duplicative measuers have been taken at the new users template and local levels, and that the roaming database is disabled in roaming homes

# you must also launch a max plugin e.g. convolution reverb pro, in 9.5 once, to initial max 64 bit, then re-open 9.2.1
#+	to make sure it is the ReWire default, as admin


#variables to make script portable for github
#admin user
auser='$auser1'
#if desired another, pre-existing local user
nonauser='$nonauser1'

# setting paths into variables and using the user constant, for speed
dp=/Library/Application\ Support/Ableton/Unlock/
#         #note that "dp" is your ableton unlock key, which you either can first put in this folder, /Library/Application\ Support/Ableton/Unlock/
#         #or ...license Ableton first as your admin user, and then replace this path, with the locaal unlock key (e.g. /Users/youradminuser/Library/Application\ Support/Ableton/[version]/Unlock/)

da3=/Users/"$USER"/Library/Application\ Support/Ableton/Live\ 9.2.1/Unlock/
da2=/Users/"$USER"/Library/Application\ Support/Ableton/Live\ 9.2.1
da1=/Users/"$USER"/Library/Application\ Support/Ableton
da3new=/Users/"$USER"/Library/Application\ Support/Ableton/Live\ 9.5/Unlock/
da2new=/Users/"$USER"/Library/Application\ Support/Ableton/Live\ 9.5
music2=/Users/"$USER"/Music/Ableton/User\ Library/
pref92=/Users/"$USER"/Library/Preferences/Ableton/Live\ 9.2.1/
pref95=/Users/"$USER"/Library/Preferences/Ableton/Live\ 9.5/



# these are for a simultaneous fix on some plugins at the same time, is reduntant at least once either way, and probably not needed in your deployment
al1=/Library/Application\ Support/Plugin\ Alliance/
al2=/Users/"$USER"/Library/Application\ Support/Plugin\ Alliance/


# If destination dir. doesn't exist, it is created; output left alone (runs in background)
# This prevents creation of directories that are already there
# In development run the script as /bin/bash -Ev to watch for errors, in production this may slow things slightly, or flash errors

if [ ! -d "$da2" ]; then
	mkdir "$da1"
	mkdir "$da2"
fi

if [ ! -d "$da2new" ]; then
        mkdir "$da2new"
fi

# Copies the license file, even if it is there already (In the past, Ableton was known
#+	to sometimes overwrite the Unlock file during use, this ensures the correct
#+	file is copied on each login, otherwise the cp would go in the loop, above).
cp -Rf "$dp" "$da3"
cp -Rf "$dp" "$da3new"

# fix for plugins, mentioned earlier
cp -Rf "$al1" "$al2"



# further Ableton optimizations, creates Prefs Options.txt, and a fix for providing no User local library in the default config
#+	note also that the roaming profile database has been disabled for network homes in the profile manager or simliar service
#+ 	this is designed to not overwrite existing user library if it exists, also this makes no preference changes to existing users
#+ 	for similar reasons

#+	# Options.txt, has a very useful Roaming disable option for Windows, as well this is used as a hidden option folder to hack around on
#+	  there are some common options found online in forums, including one that disables indexing and fixes a bug with older versions of OSX running high cpu
#+	  *this indexing off option has saved heartache of many hard-working DJs!


# Forcing default Preferences:
#
#+ this is assuming that you have already setup the ideal default user, or for a manual update,  have copied in a standard Preferences folder first manually or with another script

if [ ! -d "$pref95" ]; then
mkdir /Users/"$USER"/Library/Preferences/Ableton/
mkdir /Users/"$USER"/Library/Preferences/Ableton/Live\ 9.5/
cp -Rf /Library/Preferences/Ableton/Live\ 9.5/ /Users/"$USER"/Library/Preferences/Ableton/Live\ 9.5/
fi

if [ ! -d "$pref92" ]; then
mkdir /Users/"$USER"/Library/Preferences/Ableton/Live\ 9.2.1/
cp -Rf /Library/Preferences/Ableton/Live\ 9.2.1/ /Users/"$USER"/Library/Preferences/Ableton/Live\ 9.2.1/
fi
#+	note that if this last statement fails, then it means they had never used Ableton and it will get created by the default profiles anyhow

if [ ! -d "$music2" ]; then
mkdir /Users/"$USER"/Music/Ableton/
cp -Rf /Users/Shared/sample-auser-lib/ /Users/"$USER"/Music/Ableton/
fi

#	Makes sure Options.txt is there, see the comment above or online forums
cp -Rf /Users/Shared/Options.txt /User/"$USER"/Library/Preferences/Ableton/Live\ 9.2.1/
cp -Rf /Users/Shared/Options.txt /User/"$USER"/Library/Preferences/Ableton/Live\ 9.5/



# Script exits as success, other debugging, etc. could be added.
exit
