#!/bin/bash

# Set up variables
base_url="http://unrealsoftware.de"
cs2d_dir="."

if [ ! -d ${cs2d_dir} ]; then
    mkdir -p ${cs2d_dir}
fi

# Download CS2D and Dedicated Server Zip Files
version=$(curl -H "User-Agent:" -Ss "${base_url}/game_cs2d.php" | grep -Po "([0-9]\.)+([0-9]\.)+([0-9]\.)+([0-9])" | sed -e 's/\.//g')
cid=$(curl -H "User-Agent:" -Ss "${base_url}/get.php?get=cs2d_${version}_linux.zip" | grep -m 1 -o '"get.php[^"]\+"' | cut -d'"' -f2 | sed 's/.\+cid=//g')
curl --progress-bar -H "User-Agent:" -S "${base_url}/get.php?get=cs2d_${version}_linux.zip&p=1&cid=${cid}" -o cs2d_${version}_linux.zip
curl --progress-bar -H "User-Agent:" -S "${base_url}/files_pub/cs2d_dedicated_linux.zip" -o cs2d_dedicated_linux.zip

# Unzip Downloaded Files
unzip -qq cs2d_${version}_linux.zip -d ${cs2d_dir}
unzip -qq cs2d_dedicated_linux.zip -d ${cs2d_dir}

# Grant Execution Permission to CS2D's Dedicated Server
chmod +x ${cs2d_dir}/cs2d_dedicated

# Delete Downloaded Files
rm -f cs2d_${version}_linux.zip cs2d_dedicated_linux.zip