#!/usr/bin/env bash
if [[ $EUID -ne 0 ]]; then
    echo "🚨This script has to be executed as root!🚨"
    exit 1
fi
while true; do
    echo "====================================="
    echo "  🔹 Users and groups management 🔹"
    echo "====================================="
    select option in "Users list" "Add user" "Remove user" "Add user to group" "Groups list" "Add group" "Delete group" "Exit"; do
        case $option in
            "Users list") echo; awk -F: '$6 ~ /^\/home/ {print $1}' /etc/passwd;echo ;break ;;
            "Add user") read -p "Enter username: " username;sudo adduser $username; break;;
            "Remove user") read -p "Enter username to delete: " userdelete;sudo userdel -r $userdelete; break;;
            "Add user to group") read -p "Username: " usrn; read -p "Group name: " gpn; sudo usermod -aG $gpn $usrn; break;;
            "Groups list") cat /etc/group; break;;
            "Add group") read -p "Group name: " gpname;read -p "Group ID: " gpid; sudo groupadd -g $gpid $gpname; break;;
            "Delete group") read -p "Group name: " gpdel; sudo groupdel $gpdel; break;;
            "Exit") echo "exiting...";exit 0 ;;
            *) echo "Please enter a valid option!" ;;
        esac
    done
done