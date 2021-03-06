#!/bin/bash
####################### END MENU
source libs/mess_mac.sh
source libs/misc_mac.sh

source libs/p12.sh
source libs/opensslconfig.sh
source libs/certgen.sh
source libs/sign.sh
source libs/rca.sh
source libs/caadd.sh
source gen.cfg
#====================== Main programm

function exit1
{
	echo "Exiting"
	exit
}

function topmenu
{
activeIndex=$1
activate=$2

TopMenu=("Create ROOT CA" "Create/Sign Cert(s)" "Create p12" "Settings" "Exit")
TopMenuActions=("menu1" "menu2" "menu3" "menu5" "exit")

RcaMenu=("Generate ROOT CA" "Back")
RcaMenuActions=("execrca" "back")

ClientCertsMenu=("Create One" "Create Multiple." "Sign Certificates" "Back")
ClientCertsMenuActions=("exec_crt_gen_one" "exec_crt_gen_multiple" "menu4" "back")

SignCertsMenu=("Choose CA for sign." "Sign One" "Sign Multiple" "Add CA." "Back")
SignCertsMenuActions=("choose-ca" "sign-one" "sign-multiple" "add-ca" "back")

P12Menu=("Set Password." "Create one p12" "Create multiple p12" "Back")
P12MenuActions=("p12-setpass" "p12-create-one" "p12-create-multiple" "back")

SettingsMenu=("RCA/CA validity [$(grep rca_days gen.cfg|awk -F '=' '{print $2}')]" "RCA/CA subject [$(grep rca_subj gen.cfg|awk -F '"' '{print $2}'|cut -c 1-5)...]" "Cert Subject [$(grep cert_subj gen.cfg|awk -F '"' '{print $2}'|cut -c 1-5)...]" "RCA key size [$(grep rca_len gen.cfg|awk -F '=' '{print $2}')]" "RCA certs root folder [$(grep rca_root gen.cfg|awk -F '=' '{print $2}')]" "Certs root folder [$(grep cert_root gen.cfg|awk -F '=' '{print $2}')]" "Certs Validity [$(grep cert_validity gen.cfg|awk -F '=' '{print $2}') year(s)]" "CA for signing [$(grep sig_ca_choosen gen.cfg|awk -F '=' '{print $2}')]" "Certs Domain [$(grep domain= gen.cfg|awk -F '=' '{print $2}')]" "CA/RCA domain prefix [$(grep ca_tpl gen.cfg|awk -F '=' '{print $2}')]" "Back")
SettingsMenuActions=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "back")

# check if enter has been pressed
if [ "x$activate" == "xtrue" ];then
	if [ "x${Actions[$activeIndex]}" == "xmenu1" ];then
		PreviousMenu=( "${TopMenu[@]}" )
		PreviousMenuActions=( "${Actions[@]}" )
		Menu=( "${RcaMenu[@]}" )
		Actions=( "${RcaMenuActions[@]}" )
		activeIndex=0
		maxIndex=${#Menu[@]}
		currentMenu="menu1"
	elif [ "x${Actions[$activeIndex]}" == "xmenu2" ];then
		PreviousMenu=( "${TopMenu[@]}" )
		PreviousMenuActions=( "${Actions[@]}" )
		Menu=( "${ClientCertsMenu[@]}" )
		Actions=( "${ClientCertsMenuActions[@]}" )
		activeIndex=0
		maxIndex=${#Menu[@]}
		currentMenu="menu2"
	elif [ "x${Actions[$activeIndex]}" == "xmenu3" ];then
		PreviousMenu=( "${TopMenu[@]}" )
		PreviousMenuActions=( "${Actions[@]}" )
		Menu=( "${P12Menu[@]}" )
		Actions=( "${P12MenuActions[@]}"  )
		activeIndex=0
		maxIndex=${#Menu[@]}
		currentMenu="menu3"
	elif [ "x${Actions[$activeIndex]}" == "xmenu4" ];then
		PreviousMenu=( "${ClientCertsMenu[@]}" )
		PreviousMenuActions=( "${Actions[@]}" )
		Menu=( "${SignCertsMenu[@]}" )
		Actions=( "${SignCertsMenuActions[@]}" )
		activeIndex=0
		maxIndex=${#Menu[@]}
		currentMenu="menu4"
	elif [ "x${Actions[$activeIndex]}" == "xmenu5" ];then
		PreviousMenu=( "${TopMenu[@]}" )
		PreviousMenuActions=( "${Actions[@]}" )
		Menu=( "${SettingsMenu[@]}" )
		Actions=( "${SettingsMenuActions[@]}" )
		activeIndex=0
		maxIndex=${#Menu[@]}
		currentMenu="menu5"
	elif [ "${Actions[$activeIndex]}" == "back" ];then
		Menu=( "${PreviousMenu[@]}" )
		Actions=( "${PreviousMenuActions[@]}" )
		activeIndex=0
		maxIndex=${#Menu[@]}
		if [ $currentMenu == "menu4" ];then
			PreviousMenu=( "${TopMenu[@]}" )
			PreviousMenuActions=( "${TopMenuActions[@]}" )
		fi
	elif [ "${Actions[$activeIndex]}" == "execrca" ];then
		text 0
		read rca_name
		rootca $rca_name
		text 1
		read some
	elif [ "${Actions[$activeIndex]}" == "exec_crt_gen_one" ];then
		text 2
		read cname
		generate_clients $cname
		text 1
		read some
	elif [ "${Actions[$activeIndex]}" == "exec_crt_gen_multiple" ];then
		while true;do
			text 3
			read cnum
			if [ "$cnum" -eq "$cnum" ] 2>/dev/null; then
				break
			else
				text 4
			fi
		done
		text 5
		read cname1
		for (( i=$multmin; i<=$multmin+$cnum; i++ ))
		do
			generate_clients $cname1$i
		done
		text 1
		read some
	elif [ "${Actions[$activeIndex]}" == "choose-ca" ];then
		while true; do
			ca_list
			text 6
			read cadef
			if [ -f $rca_root/$cadef ]; then
				sig_ca_choosen=$cadef
				break
			else
				text 7
			fi
		done
	elif [ "${Actions[$activeIndex]}" == "sign-one" ];then
		certs_list CSR
		retval=$?
		if [ "$sig_ca_choosen" == "NONE"  ]; then
			text 8
			read some
		elif [ $retval -eq 12 ]; then
			text 9
			read some
		else
			while true; do
				text 10
				read cername
				if [ -f $cert_root/$cername$domain.CSR.pem ]; then
					echo "CCC"$cername
					sign $cername
					break
				else
					text 11
				fi
			done
			text 12
			read some
		fi
	elif [ "${Actions[$activeIndex]}" == "sign-multiple" ];then
		certs_list CSR
		retval=$?
		if [ "$sig_ca_choosen" == "NONE"  ]; then
			text 8
			read some
		elif [ $retval -eq 12 ]; then
			text 9
			read some
		else 
			while true; do
				text 3
				read cnum1
				if [ "$cnum1" -eq "$cnum1" ] 2>/dev/null; then
					break
				else
					text 4
				fi
			done
			certs_list CSR
			while true; do
				text 13
				read cname1
				if [ -f $cert_root/$cname1$multmin$domain.CSR.pem ]; then
					for (( i1=$multmin; i1<=$multmin+$cnum1; i1++ )); do
						sign $cname1$i1
					done
					break
				else
					text 14
				fi
			done
		fi
	elif [ "${Actions[$activeIndex]}" == "add-ca" ];then
		text 15
		text 16
		read capath
		if [ -f $capath ];then
			caadd $capath
		else
			text 17
			read some
		fi
	elif [ "${Actions[$activeIndex]}" == "p12-setpass" ];then
		text 18
		read p12pass
	elif [ "${Actions[$activeIndex]}" == "p12-create-one" ];then
		certs_list CRT
		if [ $? == 12 ]; then
			text 19
			read some
		else
			text 20
			read p12crt
			if [ -f $cert_root/$p12crt$domain.CRT.pem ]; then
				p12 $p12crt$domain
				echo "Done. Press any key"
				read some
			else
				text 21
				read some
			fi
		fi
	elif [ "${Actions[$activeIndex]}" == "p12-create-multiple" ];then
		certs_list CRT
		if [ $? == 12 ]; then
			text 19
			read some
		else
			text 3
			read p12count
			text 13
			read p12crt
			if [ -f $cert_root/$p12crt$multmin$domain.CRT.pem ]; then
				for (( p12i=$multmin; p12i<=$multmin+$p12count; p12i++ ))
				do
					 p12 $p12crt$p12i$domain
				 done
				 echo "Done. Press any key"
				 read some
			 else
				 text 21
				 read some
			fi
		fi
	elif [ "${Actions[$activeIndex]}" == "exit" ];then
		exit1

	fi
elif [ "x$activate" == "xinit" ];then
	Menu=( "${TopMenu[@]}" )
	Actions=("${TopMenuActions[@]}")
	maxIndex=${#TopMenu[@]}
fi

# check if index in range
if [ $activeIndex -eq $maxIndex ];then
	activeIndex=0
elif [ $activeIndex -lt 0 ];then
	activeIndex=$((maxIndex-1))
fi
currentIndex=0

# START MENU
clear
# menu params
bordersize=50
titlesize=$(((bordersize-12)/2))
leftoffset=40
# Text Color Settings
bg="\e[1;44m"
color="\e[1;36m"
end="\e[1;0m"

printf "\n\n\n\n\n\n%-${leftoffset}s$bg$color%-${titlesize}s%-14s%-${titlesize}s${end}\n" "" "" "SSL GENERATION" ""

for m in "${Menu[@]}"
do
	if [ "x${currentIndex}" == "x${activeIndex}" ];then
		B="\e[1;44m\e[1;35m"
		E="\e[1;0m"
	else
		B="\e[1;0m"
		E="\e[1;0m"
	fi
	textsize=${#m}
	lrmargin=$(((50-textsize)/2))
	if [ $((textsize%2)) -ne 0 ];then
		textsize=$((textsize+1))	
	fi
	printf "%-${leftoffset}s|%${lrmargin}s$B%-${textsize}s$E%-${lrmargin}s|\n"  "" "" "${m}" "";
	currentIndex=$((currentIndex+1))

done	
printf "%-${leftoffset}s$bg$color%-$((bordersize+2))s${end}\n" "" " Enter=Select, Navigate via UP/DOWN Arrows"
}

activeIndex=0
topmenu $activeIndex "init"
while true 
do
	read -r -sn1 t
	case $t in 
		A) activeIndex=$((activeIndex-1)); topmenu $activeIndex;;
		B) activeIndex=$((activeIndex+1)); topmenu $activeIndex;;
		"") topmenu $activeIndex "true" ;;
	esac
done
