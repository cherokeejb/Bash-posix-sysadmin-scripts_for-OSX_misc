#! /bin/sh

#
# this script keeps your desktop clean on OSX, handy for schools or other enviornments where on some systems several users share the same unprivledged login
#license = public domain

# probably best to run it as a cron job each morning, as root, or an administrator if your desktop permissions allow this, setup wth 'crontab -e' and see man crontab for syntax

#you can speed this up slightly as well, by saving the paths below as variables, especially if you use this to delete other directories as well
#


#add your unix-style all lowercase username here instead of the string user1
#setting variable
user1='user1'

mv /Users/"$user1"/Desktop/* /Users/"$user1"/Documents/session-files-left-on-desktop/



#this creates a link back, to the new location of the files, on the desktop
ln -s /Users/"$user1"/Documents/session-files-left-on-desktop/ /Users/"$user1"/Desktop/Session\ Files

#cleans the old system-link out of the new location
rm -Rf /Users/"$user1"/Documents/session-files-left-on-desktop/Session\ Files



#alternatively you could comment out above, and just delte the things that are on the desktop, uncomment the single line below if desired
#rm -Rf /Users/"$user1"/Desktop/*

#ensures the files made in the new location have friendly permissions, in case you were root
chmod -R 0777 /Users/"$user1"/Documents/session-files-left-on-desktop/

exit

#exit again in case you are root
exit