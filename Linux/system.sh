#!/bin/bash

# Prints amount of free memory on the system and saves to a text file
free -h > $HOME/backups/freemem/free_mem.txt

# Prints disk usage and saves to a text file
du -hc > $HOME/backups/diskuse/disk_usage.txt

# Prints all open files and save to a text file
lsof > $HOME/backups/openlist/open_files.txt

# Prints all disk space statistics and saves to a text file
df -h > $HOME/backups/freedisk/free_disk.txt