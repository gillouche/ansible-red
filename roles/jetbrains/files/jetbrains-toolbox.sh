#!/usr/bin/env bash

set -eou pipefail

# source: https://github.com/nagygergo/jetbrains-toolbox-install

echo -e " Installing Jetbrains Toolbox"
echo ""

function getLatestUrl() {
USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')

URL=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
echo $URL
}
getLatestUrl

FILE=$(basename ${URL})
DEST=/tmp/$FILE

echo ""
echo -e "Downloading Toolbox files"
echo ""
wget -cO  ${DEST} ${URL} --read-timeout=5 --tries=0
echo ""
echo -e "Download complete!"

DIR="/opt/jetbrains-toolbox"
echo ""
echo  -e "Cleaning to $DIR"
echo ""
rm -rf "$DIR"
rm -f /usr/local/bin/jetbrains-toolbox

echo ""
echo  -e "Installing to $DIR"
echo ""
mkdir -p "$DIR" 
tar -xzf ${DEST} -C ${DIR} --strip-components=1

chmod -R u+rwX,go+rX,go-w ${DIR}

ln -s ${DIR}/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
chmod +x /usr/local/bin/jetbrains-toolbox

echo ""
rm ${DEST}
echo  -e "Done."