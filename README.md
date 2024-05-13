# Bash File Synchronisation
This is the repo containing the two bash scripts I use to push data between devices

>There is also a .bashrc file containing the aliases to simplify running the synchronisation

### Dependencies
- rsync
- pulseaudio/pipewire-pulse
- libnotify
- ocean-sound-theme 

`Any sound theme can be used for this script, as long as the script can find the sounds you want to use.`

### Exclusion and Inclusion for File Push/Pull
> The Inclusion version will require the user to manually state which files and folders to back up in the current directory.

> The Exclusion version will let the user state which folders to exclude from backing up

Use the right version for the situation. For example: If you backing up your pictures and videos from your home folder, you should use the inclusion version as there are a lot of hidden files and folders that will end up getting copied over, some of which are numerous GBs big.