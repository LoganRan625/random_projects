#!/bin/bash

#colors
y='\033[1;33m'
none='\033[0m'
black_red='\033[41;30m'
blue='\033[1;34m'


# COMMANDS
# who
# whoami
# who -all
# htop
# screenfetch
# uname --m   (bitarch)
# uname -o    (os)
# lshw -s    (hardware)
# lscpu      (cpu)
# cat /proc/cpuinfo    (cpu)
# free -m     (memory)
# lsusb -tv  (usb}
# ifconfig
# telnet host  (list open ports)
# cat .bashrc | less
# finger pi
# ps | less (processes)
# grep psk=/etc/NetworkManager/system-connections/*        (wifi passwords)
#

# MENU FUCTION

mainmenu () {
    x=0
    while [ $x != 1 ]
    do
    clear
    printf "${y} _______________________________________________________________________________________________________________\n"
    printf "|                                                                                                               |\n"
    printf "|    DDDDDDDD DD    DD DDDDDDDD DDDDDDDD DDDDDDDD  DDD    DDD  D  DD   D  DDDDDDDD DDD  DD DDDDDDDD DDDDDDDD    |\n"
    printf "|    DD        DD  DD  DD          DD    DD        DDDD  DDDD     DD         DD    DDDD DD DD       DD    DD    |\n"
    printf "|    DDDDDDDD    DD    DDDDDDDD    DD    DDDDDDDD  DD DDDD DD  DDDDDDDD      DD    DD DDDD DDDDD    DD    DD    |\n"
    printf "|          DD    DD          DD    DD    DD        DD  DD  DD     DD         DD    DD  DDD DD       DD    DD    |\n"
    printf "|    DDDDDDDD    DD    DDDDDDDD    DD    DDDDDDDD  DD      DD  D  DD   D  DDDDDDDD DD   DD DD       DDDDDDDD    |\n"
    printf "|       - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -       |\n"
    printf "|                                                                                                               |\n"
    printf "|         1. PI LOGO AND INFO     2. User name         3. PROCESSES      4. sytem harware                       |\n"
    printf "|                                                                                                               |\n"
    printf "|         5. bit architecture     6. operating system  7. CPU            8. Hard Drive                          |\n"
    printf "|                                                                                                               |\n"
    printf "|         9. Memory               10. USB DEVICES      11. ifconfig      12. unknown (fix)                      |\n"
    printf "|                                                                                                               |\n"
    printf "|       -------------------------------------------------------------------------------------------------       |\n"
    printf "|                                                                                                               |\n"
    printf "|                                                                                                               |\n"
    printf "|         20. list open ports     30. Stored Aliases   40. Pi user info  50. running processes                  |\n"
    printf "|                                                                                                               |\n"
    printf "|         60. Wifi Passwords                                                                                    |\n"
    printf "|                                                                                                               |\n"
    printf "|                                                                                                               |\n"
    printf "|                                                                                                               |\n"
    printf "|                                                                                                               |\n"
    printf "|        to return to MENU type menu                                                                            |\n"
    printf "|                                                                                                               |\n"
    printf " _______________________________________________________________________________________________________________\033[0m\n"
    read choice
    if [ $choice == 1 ]
    then
    screenfetch
    read ending

    elif [ $choice == 2 ]
    then
    whoami
    sleep 3
    who -all
    read ending

    elif [ $choice == 3 ]
    then
    htop
    read ending

    elif [ $choice == 4 ]
    then
    lshw -short
    read ending

    elif [ $choice == 5 ]
    then
    uname --n
    read ending

    elif [ $choice == 6 ]
    then
    uname -o
    read ending

    elif [ $choice == 7 ]
    then
    lscpu
    sleep 3
    cat /proc/cpuinfo
    read ending

    elif [ $choice == 8 ]
    then
    echo this option is not available yet
    read ending

    elif [ $choice == 9 ]
    then
    free -m
    read ending

    elif [ $choice == 10 ]
    then
    lsusb -tv
    read ending

    elif [ $choice == 11 ]
    then
    ifconfig
    sleep 4
    iwconfig
    read ending

    elif [ $choice == 12 ]
    then
    echo this option is not available yet
    read ending

    elif [ $choice == 20 ]
    then
    echo this option is not available yet
    read ending

    elif [ $choice == 30 ]
    then
    echo issues with this process
    read ending

    elif [ $choice == 40 ]
    then
    finger pi
    read ending

    elif [ $choice == 50 ]
    then
    ps
    read ending

    elif [ $choice == 60 ]
    then
    echo " issues with finding try again later"
    ls
    sleep 2
    grep psk=*
    read ending

    elif [ "$choice" == "menu" ]
    then
    bash /MainMenu.sh

    else
    printf "${black_red}Error; $choice is not an option ${none}\n"
    sleep 1
    read nothing
    clear
    fi

    done
    }

mainmenu
