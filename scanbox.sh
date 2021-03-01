#!/bin/bash 

endColour="\033[0m\e[0m"
Negro="\e[0;30m"
Grisoscuro="\e[1;30m"
Azul="\e[0;34m"
Azulresaltado="\e[1;34m"
Verde="\e[0;32m"
Verderesaltado="\e[1;32m"
Cian="\e[0;36m"
Cyanresaltado="\e[1;36m"
Rojo="\e[0;31m"
Rojoresaltado="\e[1;31m"
Purpura="\e[0;35m"
Purpuraresaltado="\e[1;35m"
Cafe="\e[0;33m"
Amarillo="\e[1;33m"
Gris="\e[0;37m"
Blanco="\e[1;37m"
Colorinverso="\e[7;32m"

ROJO="$(printf '\033[31m')" VERDE="$(printf '\033[32m')" NARANJA="$(printf '\033[33m')" AZUL="$(printf '\033[34m ') "
MAGENTA="$(printf '\033[35m')" CYAN="$(printf '\033[36m')" BLANCO="$(printf '\033[37m')" NEGRO="$(printf '\ 033[30m ') "
REDBG="$(printf '\033[41m')" GREENBG="$(printf '\033[42m')" ORANGEBG="$(printf '\033[43m')" BLUEBG="$(printf '\033[44m') "
MAGENTABG="$(printf '\033[45m')" CYANBG="$(printf '\033[46m')" WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m ') "
RESETBG="$(printf '\e[0m\n')"

trap ctrl_c INT 

function ctrl_c(){
    echo -e "\nSaliendo\n"
    tput cnorm; exit 0
}

function panel(){
    clear
cat <<- EOF
	    ${SLINEA}
	    ${ROJO}        Help Panel
            ----------
            ${BLANCO}[*] Use:${VERDE} ./scanbox.sh ${MAGENTA}-t ${BLANCO}[TARGET_IP] ${MAGENTA}-s ${BLANCO}Nmap ${MAGENTA}-e ${BLANCO}exploit

            ${MAGENTA}${TAB}	    -t ${BLANCO}| ${BLANCO}[IP] of the machine HackTheBox 
    	    ${MAGENTA}${TAB}	    -s ${BLANCO}| ${BLANCO}Scan machine 
            ${MAGENTA}${TAB}	    -e ${BLANCO}| Exploit search [Archive: XML]

            ${BLANCO}--------------------------------------------------------
            Author: WEIK (WackyHacker)
	EOF

exit 0
}

function startAttack(){
    mkdir HTB/ 2>/dev/null
    clear
    echo -e "\n${Blanco}>>${Verderesaltado} \e[5mTOOL CREATED BY WACKYHACKER${endColour}${Blanco} <<${endColour}"
    sleep 2.5
    clear
    echo -e "${Rojoresaltado}"
    figlet -s scanbox
    sleep 2
    echo -e "${Blanco}Starting scan [${Verderesaltado}Nmap${Blanco}]...\n"
    nmap -sC -sV -sS -vvv -n --min-rate 5000 $targetIP -oX nmap.xml -o nmap.txt > /dev/null 2>&1
    echo -e "${Verderesaltado}[âœ”]${Blanco} Scan completed\n"
    echo -e "${Blanco}---------------------------------------\n"
    echo -e "${Cafe}[?]${Blanco}looking for exploits...\n"
    sleep 2
    searchsploit --nmap nmap.xml > exploit.txt 
    searchsploit --nmap nmap.xml 
    echo -e "\n${Blanco}----------------------------------------------------------${endColour}\n"
    echo -e "\n${Blanco}[${Verderesaltado}âœ”${Blanco}] Exploit search completed\n"
    mv nmap.txt exploit.txt HTB/ > /dev/null 2>&1
    rm -rf nmap.xml 
    echo -e "\n${Blanco}\e[4;32mSaved in ${Cafe}\e[5mHTB/\n"
    tput cnorm
    exit 1  
}

function dependecies(){
    tput civis 
    clear; dependencies=(searchsploit nmap)
    echo -e "\n${Amarillo}[*]${Blanco} Checking dependencies...\n"
    sleep 2

    for program in "${dependencies[@]}"; do 
        echo -e "Tool: ${Rojoresaltado}$program"
	sleep 1.5
	test -f /usr/bin/$program
	if [ $(echo $?) == "0" ]; then 
		echo -e "\n${Verderesaltado}[âœ”]${Blanco} Program installed\n"
		sleep 2
	else 
		echo -e "\n${Rojoresaltado}[x]${Blanco} Program not installed\n"
		sleep 2
		clear 
		echo -e "\n${Amarillo}[*]${Blanco} Installing programs necesaries...\n"
		apt install nmap -y > /dev/null 2>&1 
		apt install exploitdb -y > /dev/null 2>&1
		clear
		test -f /usr/bin/$program 
		case $(echo $?) in 
			0)
				echo -e "\n${Verderesaltado}[âœ”] ${Blanco}Programs installed correctly\n"
			;;
			*)
				echo "\n${Rojoresaltado}[x] Error installing programs"
				exit 1
			;;
		esac 	
	fi	
    done 
}

# Main function 

if [ "$(id -u)" == "0" ]; then 
    declare -i parameter_counter=0; while getopts ":t:s:e:h:" arg; do 
        case $arg in 
            t) targetIP=$OPTARG; let parameter_counter+=1 ;;
            s) scan=$OPTARG; let parameter_counter+=1 ;;
            e) exploit=$OPTARG; let parameter_counter+=1 ;;
            h) help;;
        esac 
    done 

    if [ $parameter_counter -ne 3 ]; then   
        panel   
    else
	dependecies 
	startAttack
    fi
else 
    echo "[*] No root"
fi
