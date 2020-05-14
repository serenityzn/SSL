function text {
message[0]="\x1B[96mPlease enter Root CA Name:\x1B[0m"
message[1]="\x1B[96mDONE. Press any key.\x1B[0m"
message[2]="\x1B[96mPlease enter certificate name. (without gapes)\x1B[0m"
message[3]="\x1B[96mPlease enter count of certs."
message[4]="\x1B[91mWrong value. Please enter numeric value..\x1B[0m"
message[5]="\x1B[96mPlease enter certificate name template. (without gapes)\x1B[0m"
message[6]="\x1B[96mPlease enter full CA name.\x1B[0m"
message[7]="\x1B[91mFile doesn't exist! Please enter again!\x1B[0m"
message[8]="\x1B[91mYou must select CA cert first! Press any key.\x1B[0m"
message[9]="\x1B[91mThere is no certificates! Press any key.\x1B[0m"
#message[10]="\x1B[96mEnter signing certificate template name. (without domain: For example if cert name is cert1-example.csr you need to enter cert1.:\x1B[0m"
message[10]="\x1B[96mEnter Common Name(!the one you used to generate CSR!) like 'your.domain.org'\x1B[0m"
message[11]="\x1B[91mFile doesn't exist! Please enter again!\x1B[0m"
message[12]="\x1B[96mComplete$err. \x1B[96mPress any key.\x1B[0m"
message[13]="\x1B[96mPlease enter cert template name:"
message[14]="\x1B[91mWrong template name! Enter again. CNAME=$cname1 DOMAIN=$domain\x1B[0m"
message[15]="\x1B[96mPlease enter full path to ca cert.\x1B[0m"
message[16]="\x1B[96m\x1B[1mBe aware that your ca crt and key names must be like: example_ca.crt example_ca.key!\x1B[0m"
message[17]="\x1B[91mWrong path. File doesn't exist. Press any key.\x1B[0m"
message[18]="\x1B[96mEnter p12 password:"
message[19]="\x1B[91mNO CERTS! Press any key.\x1B[0m"
message[20]="\x1B[96mPlease enter cert name:"
message[21]="\x1B[91mNo such file. Press any key.\x1B[0m"

echo -e ${message[$1]}
}

text $1
