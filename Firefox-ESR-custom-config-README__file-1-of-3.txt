Basically, anything in the firefox built-in webpage "about:config" can be automated in this way,
to create a custom Firefox for your organization.

My example among other default or minor settings, ***configured the home pages, disables all plugins/add-ons, and prevented "update" pop-ups, remove "full screen confirm annoying pop-up", great for conference rooms.***

The implimentation of this changes a lot, from Mozilla, so please test your builds thouroghouly!
For a summary, see first https://www.mozilla.org/en-US/firefox/organizations/


Pleae follow  the instructions at:
https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment
Instrucdtions are provided for Windows, there, as well
*Note the download links in that document are misleading, see below*

But in a nutshell:

1)**IMPORTANT**
First, download the ESR code as an OSX, ".app" file; don't download the ESR installer, from the Firefox normal "download" page, download the editable package file, honestly I can't find it right now, ask on the e-mail list, or it is somewhere here https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Source_Code/Downloading_Source_Archives#Download

2) You will then have a "Firefox.app" which you can navigate into using Terminal (or using Finder, by right-clicking and chosing navigate package files)


3) File 2 should be moved to
/Applications/Firefox.app/Contents/Resources/defaults/prefs/

4)  The file 3 of 3 should be renamed CONFIG.cfg, (or as you desire, see reference in file 2 of 3), and moved to /Applications/Firefox.app/Contents/Resources/

Customize file 3 as desired! There are a lot of examples and a mailing list, online.