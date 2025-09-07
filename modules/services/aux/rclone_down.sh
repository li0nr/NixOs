#!/bin/bash
echo 'Running Down sync script'
/run/current-system/sw/bin/rclone sync drive-own:/Knowledge-Vault/ /home/li0nr/GoogleDrive/Knowledge-Vault/
/run/current-system/sw/bin/rclone sync drive-own:/WallPapers/ /home/li0nr/GoogleDrive/WallPapers
/run/current-system/sw/bin/rclone sync drive-own:/Papers/ /home/li0nr/GoogleDrive/Papers
/run/current-system/sw/bin/rclone sync drive-own:/Books/ /home/li0nr/GoogleDrive/Books

