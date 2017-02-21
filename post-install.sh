#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Joao Berardo
#
# Description:
#   A post-installation bash script for Ubuntu/Xubuntu
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# tab width
tabs 4
clear

#----- Import Functions -----#

dir="$(dirname "$0")"

. $dir/functions/check
#. $dir/functions/cleanup
#. $dir/functions/configure
#. $dir/functions/development
#. $dir/functions/favs
. $dir/functions/thirdparty
. $dir/functions/update
#. $dir/functions/utilities
. $dir/functions/server
#. $dir/functions/basic

#----- Fancy Messages -----#
RED='\033[0;41;30m'
STD='\033[0;0;39m'

show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}
pause(){
    read -p "Press [Enter] key to continue..." #fackEnterKey
}

show_menus() {
    clear
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1.    Perform system update"
	echo "2.    Install preferred applications"
	echo "3.    Install preferred system utilities"
	echo "4.    Install preferred development tools"
	echo "5.    Install third-party applications"
	echo "6.    Configure system"
	echo "7.    Cleanup the system"
	echo "8.    Configure Server"
	echo "9.    Basic test"
	echo "10.   Exit"
}

# Main
function main {


    # read input from the keyboard and take a action
    read_options(){
	    local choice
	    read -p "Enter choice [ 1 - 10] " choice
	    case $choice in
		    1) update ;;
		    2) favs ;;
            4) utilities ;;
            5) thirdparty ;;
            6) configure ;;
            7) cleanup ;;
            8) config_server ;;
            9) basic ;;
		    10) quit ;;
		    *) echo -e "${RED}Error...${STD}" && sleep 2
	    esac
    }

    #trap '' SIGINT SIGQUIT SIGTSTP

    while true
    do

	    show_menus
	    read_options
    done
}

# Quit
function quit {
    echo "Exiting..."
    show_info 'Thanks for using!'
    exit 99
}

#RUN
check_dependencies
while :
do
  main
done

#END OF SCRIPT
