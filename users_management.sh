#!/usr/bin/env bash
select option in "Users list" "Add user" "Remove user" "Add user to group" "Groups list" "Add group" "Delete group" "Exit"; do
    case $option in
        "Users list") echo; awk -F: '$6 ~ /^\/home/ {print $1}' /etc/passwd;echo ;;
        "Add user") read -p "Enter username: " username;sudo adduser $username ;;
        "Remove user") read -p "Enter username to delete: " userdelete;sudo userdel -r $userdelete ;;
        "Add user to group") read -p "Username: " usrn; read -p "Group name: " gpn; sudo usermod -aG $gpn $usrn ;;
        "Groups list") cat /etc/group ;;
        "Add group") read -p "Group name: " gpname;read -p "Group ID: " gpid; sudo groupadd -g $gpid $gpname ;;
        "Delete group") read -p "Group name: " gpdel; sudo sudo groupdel $gpdel ;;
        "Exit") break ;;
    esac
    
done
echo $users