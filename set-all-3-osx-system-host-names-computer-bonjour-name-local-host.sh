#! /bin/bash

# (c) GNU v3, by @cherokeejb_

# This script is used in deployment, it saves time to keep the machine names simple and ensuring that all 3 osx/unix names are the same, and no old names remain
#		#DO NOT RUN THIS ON A FILESERVER or ANY other server proving an Open Directory-type service, as it needs host names to match FQDN
#			#Use a name simple enough it meets requirements for HostName, so no underscore, as well as the Apple names (could add a check to the script to improve this, and help and usage data to improve this)

#
# 	#--usage namefix (name)
#

neu=$1
places='HostName LocalHostName ComputerName'

for x in $places #variable not quoted since we know input
do 
sudo scutil --set "$x" "$neu"
done

#confirmation
echo 'confirmation:  '
for y in $places
do
scutil --get "$y"
done
sync
exit

#double make sure not root anymore
exit
