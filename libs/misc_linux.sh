function invalid_opt {
echo -e "\e[91mInvalid option.\e[0m"
}


function error_check {
	if [ $1 -eq 0 ]; then
  		err=""
	else
  		err=" \e[91mwith Error.\e[36m"
	fi
}

function ca_list {
	for k in `ls $rca_root|grep crt`
	do
		echo -e "\e[36m$k\e[0m"
	done
}

function certs_list {
	for k1 in `ls $cert_root|grep $1`
	do
		echo -e "\e[36m$k1\e[0m"
	done

	if [ "$k1" == "" ]; then
        	return 12 # 12 there is no certs
	else
        	return 0
	fi
}
