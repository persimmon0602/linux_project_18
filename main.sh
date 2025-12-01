#!/bin/bash
chmod +x *.sh 2>/dev/null
while true; do
    echo "1.Mover 2.Archivist 3.Cleaner 4.Report 5.Exit"
    read choice
    case $choice in
        1) ./image_mover.sh ;;
        2) ./code_archivist.sh ;;
        3) ./cleaner.sh ;;
        4) ./report.sh ;;
        5) exit 0 ;;
        *) echo "Error" ;;
    esac
done
