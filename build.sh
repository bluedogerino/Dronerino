    
#!/bin/bash
function transfer() { 
   if [ $# -eq 0 ]; 
   then 
      echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; 
	  return 1; 
   fi 
   tmpfile=$( mktemp -t transferXXX ); 
   if tty -s; 
   then 
      basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); 
	  curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; 
   else 
      curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
   fi;
   DOWNLOAD_LINK=$(cat $tmpfile);
   rm -f $tmpfile; 
}

apt-get install wget curl -y


if [ -f /home/ci/*.txt ]
then
   cd /home/ci/
  TXT=$(ls *.txt)
  transfer ${TXT}
fi
