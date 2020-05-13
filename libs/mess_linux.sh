function text {
message[0]="\e[96mPlease enter Root CA Name:\e[0m"
message[1]="\e[96mDONE. Press any key.\e[0m"
message[2]="\e[96mPlease enter certificate name. (without gapes)\e[0m"
message[3]="\e[96mPlease enter count of certs."
message[4]="\e[91mWrong value. Please enter numeric value..\e[0m"
message[5]="\e[96mPlease enter certificate name template. (without gapes)\e[0m"
message[6]="\e[96mPlease enter full CA name.\e[0m"
message[7]="\e[91mFile doesn't exist! Please enter again!\e[0m"
message[8]="e[91mYou must select CA cert first! Press any key.\e[0m"
message[9]="\e[91mThere is no certificates! Press any key.\e[0m"
message[10]="\e[96mEnter signing certificate template name. (without domain: For example if cert name is cert1-example.csr you need to enter cert1.:\e[0m"
message[11]="\e[91mFile doesn't exist! Please enter again!\e[0m"
message[12]="\e[96mComplete$err. \e[96mPress any key.\e[0m"
message[13]="\e[96mPlease enter cert template name:"
message[14]="\e[91mWrong template name! Enter again. CNAME=$cname1 DOMAIN=$domain\e[0m"
message[15]="\e[96mPlease enter full path to ca cert.\e[0m"
message[16]="\e[96m\e[1mBe aware that your ca crt and key names must be like: example_ca.crt example_ca.key!\e[0m"
message[17]="\e[91mWrong path. File doesn't exist. Press any key.\e[0m"
message[18]="\e[96mEnter p12 password:"
message[19]="\e[91mNO CERTS! Press any key.\e[0m"
message[20]="\e[96mPlease enter cert name:"
message[21]="\e[91mNo such file. Press any key.\e[0m"

echo -e ${message[$1]}
}

text $1
