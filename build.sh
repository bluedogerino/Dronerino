    
#!/bin/bash
curl -sLo upload-github-release-asset.sh https://gist.githubusercontent.com/stefanbuck/ce788fee19ab6eb0b4447a85fc99f447/raw/dbadd7d310ce8446de89c4ffdf1db0b400d0f6c3/upload-github-release-asset.sh
sudo apt-get install wget curl -y

if [ -f /home/ci/*.txt ]
then
   cd /home/ci/
  TXT=$(ls *.txt)
  transfer ${TXT}
fi
