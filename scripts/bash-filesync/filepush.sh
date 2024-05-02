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
        rsync -Pruv $SOURCE/'folder1' $DEST/ 
        rsync -Pruv $SOURCE/'folder2' $DEST/ 
        rsync -Pruv $SOURCE/'folder2' $DEST/
        rsync -Pruv $SOURCE/'file1' $DEST/'file1'
        rsync -Pruv $SOURCE/'file2' $DEST/'file2'
        rsync -Pruv $SOURCE/'file3' $DEST/'file3'
    
        notify-send -a 'File Synchroniser' 'Synchronisation Completed'
        paplay '/usr/share/sounds/ocean/stereo/completion-success.oga' &
    
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
