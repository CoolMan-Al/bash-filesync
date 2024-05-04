# Bash File Synchronisation
This is the repo containing the two bash scripts I use to push data between devices

>There is also a .bashrc file containing the aliases to simplify running the synchronisation

### Dependencies
- rsync
- pulseaudio/pipewire-pulse
- libnotify
- ocean-sound-theme 

`Any sound theme can be used for this script, as long as the script can find the sounds you want to use.`

### Reason for operating filepull by exclusion and filepush by inclusion
> I push files from /home, which contains a lot of hidden files/directory. Some of these files are several GiB in size, which would slow down the operation. Using inclusion would filter out the files that do not need to be synced, which is around 75% of /home.
```
You can still exclude something in filepull if it is inside a directory you are transferring. As seen in filepull, just add the following parameter to the relevant line (After the -Pruv and before the $SOURCE):
--exclude 'foldername'
 ```

>Additionally, the directory that the files are being pushed to and pulled from has no other files in there (If they do then it is most likely something that needs to be synced into my desktop). Using exclusion would allow pinpointing the single file/directory that does not need to be transferred instead of using inclusion to select 90% of the data in that directory that need to be transferred.