function sign_menu {
 clear
 echo -e "\x1B[36m[ MAIN ] - >[ Create/Sign client certificate(s). ] - >\x1B[7m[ Sign certificate(s) ]\x1B[0m\x1B[96m"
 echo "1 - Chose CA for sign."
 echo -e "2 - Sign single certificate. [sign CA: \x1B[31m$sig_ca_choosen\x1B[96m]"
 echo -e "3 - Sign multiple certificate. [sign CA: \x1B[31m$sig_ca_choosen\x1B[96m]"
 echo -e "4 - Add CA."
 echo "0 - Back"
 echo -e "\x1B[0m"
}

function menu {
 clear
 echo -e "\x1B[36m\x1B[7m[ MAIN ]\x1B[0m\x1B[96m"
 echo "1 - Create ROOT CA."
 echo "2 - Create/Sign client certificate(s)."
 echo "3 - Create p12."
 echo "0 - Exit"
 echo -e "\x1B[0m"
}

function p12_menu {
 clear
 echo -e "\x1B[36m[ MAIN ] - > \x1B[7m[ Create p12. ]\x1B[0m\x1B[96m"
 echo -e "1 - Set Password. [current password is: \x1B[91m$p12pass\x1B[0m\x1B[96m]"
 echo "2 - Create p12"
 echo "3 - Create multiple p12"
 echo "0 - back"
 echo -e "\x1B[0m"
}

function rootca_menu {
 clear
 echo -e "\x1B[36m[ MAIN ] - >\x1B[7m[ Create ROOT CA. ]\x1B[0m\x1B[96m"
 echo "1 - Generate root CA."
 echo "0 - back"
 echo -e "\x1B[0m"
}

function clients_menu {
 clear
 echo -e "\x1B[36m[ MAIN ] - >\x1B[7m[ Create/Sign client certificate(s). ]\x1B[0m\x1B[96m"
 echo "1 - Create Single certificate."
 echo "2 - Create Multiple certificates."
 echo "3 - Sign certificate(s)."
 echo "0 - Back."
 echo -e "\x1B[0m"
}
