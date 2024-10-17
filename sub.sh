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
read -p "Enter a domain: " INPUT

# Find subdomains using subfinder
SUBDOMAINS=$(subfinder -d $INPUT)

# Output subdomains
echo "Found subdomains:"
echo "$SUBDOMAINS"

# Save subdomains to file
echo "$SUBDOMAINS" > SubDomains.txt
echo -e "\033[92mSubdomains saved to SubDomains.txt\033[0m"

# Use waybackurls and getallurls to gather URLs from all subdomains
ALL_URLS=""
for SUBDOMAIN in $SUBDOMAINS; do
  WAYBACK_URLS=$(waybackurls $SUBDOMAIN)
  GETALL_URLS=$(getallurls $SUBDOMAIN)
  ALL_URLS+=$(echo -e "$WAYBACK_URLS\n$GETALL_URLS")
done

# Output all URLs
echo "Gathered URLs:"
echo "$ALL_URLS" | sort -u

# Save all URLs to file
echo "$ALL_URLS" | sort -u > All_Urls.txt
echo -e "\033[92mAll URLs saved to All_Urls.txt\033[0m"
