#!/bin/bash
echo 'Running Up Sync Script'
/run/current-system/sw/bin/rclone sync /home/li0nr/GoogleDrive/Knowledge-Vault/ drive-own:/Knowledge-Vault/
/run/current-system/sw/bin/rclone sync /home/li0nr/GoogleDrive/WallPapers/ drive-own:/WallPapers/
/run/current-system/sw/bin/rclone sync /home/li0nr/GoogleDrive/Papers drive-own:/Papers/
/run/current-system/sw/bin/rclone sync /home/li0nr/GoogleDrive/Books drive-own:/Books/

