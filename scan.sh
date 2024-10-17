#!/bin/bash

echo -e "\033[91m  _   _ _______  __      _       _ _    ___       _     ____                       _ _         \033[0m"
echo -e "\033[91m | | | |___ /\ \/ /_ __ | | ___ (_) |_ / _ \__  _/ |   / ___|  ___  ___ _   _ _ __(_) |_ _   _ \033[0m"
echo -e "\033[91m | |_| | |_ \ \  /| '_ \| |/ _ \| | __| | | \ \/ / |   \___ \ / _ \/ __| | | | '__| | __| | | | \033[0m"
echo -e "\033[91m |  _  |___) |/  \| |_) | | (_) | | |_| |_| |>  <| |    ___) |  __/ (__| |_| | |  | | |_| |_| | \033[0m"
echo -e "\033[91m |_| |_|____//_/\_\ .__/|_|\___/|_|\__|\___//_/\_\_|___|____/ \___|\___|\__,_|_|  |_|\__|\__, | \033[0m"
echo -e "\033[91m                  |_|                             |_____|                                |___/ \033[0m"
echo -e "\033[92m               URL Gatherer By H3Xploit0x1\033[0m"
echo ""
echo ""


# Get input from user
read -p "Enter a URL or domain: " INPUT

# Use waybackurls to gather historical URLs
WAYBACK_URLS=$(waybackurls $INPUT)

# Use getallurls to gather URLs from various sources
GETALL_URLS=$(getallurls $INPUT)

# Combine the results
ALL_URLS=$(echo -e "$WAYBACK_URLS\n$GETALL_URLS" | sort -u)

# Output the results
echo "Gathered URLs:"
echo "$ALL_URLS"
