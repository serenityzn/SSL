function caadd {
 ftpl=$(echo $1|awk -F "/" '{print $NF}'|awk -F "." '{print $1}')
 ptpl=$(echo $1|awk -F "$ftpl" '{print $1}')
 ctpl=$(echo $ftpl|awk -F "-" '{print $1}')
	if [ -f $ptpl$ftpl.key ];then
	 if [ -f $rca_root/$ftpl.crt ];then
		echo -e "\e[91mCA with such name already exist. Press any key.\e[0m"
		read some
	 else
		cp $ptpl$ftpl.crt $rca_root/
		cp $ptpl$ftpl.key $rca_root/
		create_openssl_config $ctpl
		echo "CA added successfully."
		read some
	 fi
	else
		echo -e "\e[91mKey file doesn't exist. Press any key.\e[0m"
		read some
	fi
}
