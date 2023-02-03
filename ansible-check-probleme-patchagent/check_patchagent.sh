#!/bin/bash

for SERVER in $(cat list_serv_Linux_all); do
    ssh -q $SERVER df -hP | grep patchagent > /dev/null
    verif_fs=$?
    ssh -q $SERVER grep patchagent /etc/fstab > /dev/null
    verif_fstab=$?
    if [ $verif_fs = 1 ] && [ $verif_fstab = 0 ]; then
	echo "$SERVER doit être vérifié"
        echo "$SERVER doit être vérifié" >> /root/ansible/ansible-check-probleme-patchagent/result_server
    elif [ $verif_fs = 0 ] && [ $verif_fstab = 0 ]; then
	echo "$SERVER possède un FS patchagent correctement paramétré"
	echo "$SERVER possède un FS patchagent correctement paramétré" >> /root/ansible/ansible-check-probleme-patchagent/result_server
    elif [ $verif_fs = 1 ] && [ $verif_fstab = 1 ]; then
	echo "$SERVER ne possède pas de patchagent"
	echo "$SERVER ne possède pas de patchagent" >> /root/ansible/ansible-check-probleme-patchagent/result_server
    else
	echo "$SERVER [ERREUR] -- code erreur fs $verif_fs || code erreur fstab $verif_fstab" 
	echo "$SERVER [ERREUR] -- code erreur fs $verif_fs || code erreur fstab $verif_fstab" >> /root/ansible/ansible-check-probleme-patchagent/result_server
    fi
    verif_fs=3
    verif_fstab=3
done
