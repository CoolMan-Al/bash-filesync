#!/bin/bash
time {

    DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    touch $DIRECTORY/ext-drive.txt
    SOURCE=$(<$DIRECTORY/int-drive.txt)
    DEST=$(<$DIRECTORY/ext-drive.txt)
    
    if [ -z "$DEST" ]; then
        echo "Input complete path to backup location"
        read DEST
        echo $DEST > $DIRECTORY/ext-drive.txt
    fi
    
    if [ -d $DEST ]; then
        echo -e "\n Pushing Files to Sync Drive/\n=====================================" 
        #Insert folder name here
        rsync -Pruv $SOURCE/Documents $DEST/
        rsync -Pruv $SOURCE/Downloads $DEST/
        rsync -Pruv $SOURCE/Music $DEST/
        rsync -Pruv $SOURCE/Pictures $DEST/
        rsync -Pruv $SOURCE/Videos $DEST/
        rsync -Pruv $SOURCE/.bashrc $DEST/.bashrc
        
    
        notify-send -a 'File Synchroniser' 'Synchronisation Completed'
        pw-play '/usr/share/sounds/ocean/stereo/completion-success.oga' &
    
    else
        echo "Folder not found"
        read -p "Would you like to remove the destination path? [Y/n]" -n 1 -r reply
        
        if [ ${reply^} == "Y" ]; then
            echo -e "\nClearing Saved Destination"
            echo "" > $DIRECTORY/ext-drive.txt
            echo "You will be prompted for the destination path upon next run"
        else
            echo ""
        fi
    fi
}
