#!/bin/bash
Green='\033[0;32m'
Yellow='\033[0;33m'
NC='\033[0m'
sleep 0.5
echo -n -e "${Yellow}Finding the biggest file"
sleep 1
for i in {1..3}
do
	echo -n -e  "."
	sleep 1
done 
echo -e "$NC"
echo -e "The biggest file was found ${Green}successfully!${NC}"
target=/user 
du -ah | sort -h | tail -n 2 | head -n 1 | awk '{print "The filename is: "$2 "\n" "It weighs: " $1}'
