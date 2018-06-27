#!/bin/bash


#   Post-installation bash script for Ubuntu


tabs 4


TITLE="Ubuntu Post-Install Script"


function main {
    echo_message header "Starting 'main' function"
    # Draw window
    MAIN=$(eval `resize` && whiptail \
        --notags \
        --title "$TITLE" \
        --menu "\nWhat would you like to do?" \
        --cancel-button "Quit" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        'system_update'         'Perform system updates' \
        'install_favs'          'Install preferred applications' \
        'install_favs_dev'      'Install preferred development tools' \
        'install_favs_utils'    'Install preferred utilities' \
        'install_gnome'         'Install preferred GNOME software' \
        'install_codecs'        'Install multimedia codecs' \
        'install_fonts'         'Install additional fonts' \
        'install_snap_apps'     'Install Snap applications' \
        'install_flatpak_apps'  'Install Flatpak applications' \
        'install_thirdparty'    'Install third-party applications' \
        'setup_dotfiles'        'Configure dotfiles' \
        'system_configure'      'Configure system' \
        'system_cleanup'        'Cleanup the system' \
        3>&1 1>&2 2>&3)
    # check exit status
    if [ $? = 0 ]; then
        echo_message header "Starting '$MAIN' function"
        $MAIN
    else
        # Quit
        quit
    fi
}

# Quit
function quit {
    echo_message header "Starting 'quit' function"
    echo_message title "Exiting $TITLE..."
    # Draw window
    if (whiptail --title "Quit" --yesno "Are you sure you want quit?" 8 56) then
        echo_message welcome 'Thanks for using!'
        exit 99
    else
        main
    fi
}

# Import Functions
function import_functions {
    DIR="functions"
    # iterate through the files in the 'functions' folder
    for FUNCTION in $(dirname "$0")/$DIR/*; do
        # skip directories
        if [[ -d $FUNCTION ]]; then
            continue
        # exclude markdown readmes
        elif [[ $FUNCTION == *.md ]]; then
            continue
        elif [[ -f $FUNCTION ]]; then
            # source the function file
            . $FUNCTION
        fi
    done
}

# Import main functions
import_functions
# Welcome message
echo_message welcome "$TITLE"
# Run system checks
system_checks
# main
while :
do
    main
done

