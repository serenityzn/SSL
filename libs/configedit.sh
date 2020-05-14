function config_edit
{
	option=$1
	value=$2
	case $option in
		rcadays)
			sed -i '' -e  's/rca_days=.*/rca_days='$value'/' ../gen.cfg
			;;
		rca_subj)  sed -i '' -e  's/rca_subj=.*/rca_subj='$value'/' ../gen.cfg;;
		cert_subj) sed -i '' -e  's/cert_subj=.*/cert_subj='$value'/' ../gen.cfg;;
		rca_len) sed -i '' -e  's/rca_len=.*/rca_len='$value'/' ../gen.cfg;;
		rca_root) sed -i '' -e  's/rca_root=.*/rca_root='$value'/' ../gen.cfg;;
		cert_root) sed -i '' -e  's/cert_root=.*/cert_root='$value'/' ../gen.cfg;;
		cert_validity) sed -i '' -e  's/cert_validity=.*/cert_validity='$value'/' ../gen.cfg;;
		sig_ca_choosen) sed -i '' -e  's/sig_ca_choosen=.*/sig_ca_choosen='$value'/' ../gen.cfg;;
		domain) sed -i '' -e  's/domain=.*/domain='$value'/' ../gen.cfg;;
		ca_tpl) sed -i '' -e  's/ca_tpl=.*/ca_tpl='$value'/' ../gen.cfg;;
		*) echo "Wrong option!";;
	esac

}

config_edit $1 $2
#array=("RCA/CA validity [$(grep rca_days ../gen.cfg|awk -F '=' '{print $2}')]" "RCA/CA subject [$(grep rca_subj ../gen.cfg|awk -F '"' '{print $2}')]" "Cert Subject [$(grep cert_subj ../gen.cfg|awk -F '"' '{print $2}')]" "RCA key size [$(grep rca_len ../gen.cfg|awk -F '=' '{print $2}')]" "RCA certs root folder [$(grep rca_root ../gen.cfg|awk -F '=' '{print $2}')]" "Certs root folder [$(grep cert_root ../gen.cfg|awk -F '=' '{print $2}')]" "Certs Validity [$(grep cert_validity ../gen.cfg|awk -F '=' '{print $2}') year(s)]" "CA for signing [$(grep sig_ca_choosen ../gen.cfg|awk -F '=' '{print $2}')]" "Certs Domain [$(grep domain= ../gen.cfg|awk -F '=' '{print $2}')]" "CA/RCA domain prefix [$(grep ca_tpl ../gen.cfg|awk -F '=' '{print $2}')]")
echo  ${array[@]}
