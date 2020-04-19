#!/bin/bash

install_init(){
    INSTALL_PATH="/opt/filebt"
    LOG_PATH=${INSTALL_PATH}/logs
    DATA_PATH=${INSTALL_PATH}/data
    mkdir -p ${INSTALL_APTH} ${LOG_PATH} ${DATA_PATH}
    /bin/cp -r ../src/* $INSTALL_PATH 
    echo "------ code deploy end ------"
}

tracker(){
    yum install -y supervisor
    /bin/cp ./supervisord.d/*.ini /etc/supervisord.d/
    systemctl start supervisord && systemctl enable supervisord
    supervisorctl status
    echo "------ filebt-tracker------"
    netstat -ntlp | grep 8998
}

usage(){
    echo
    echo "Usage: $0 (install | uninstall | tracker)"
    echo
}


main(){
    case $1 in
	install)
		install_init;
		;;
        tracker)
		install_init;
		tracker;
		;;
	*)
		usage;
    esac
}

main $1
