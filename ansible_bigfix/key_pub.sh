# Lecture des serveurs sous inventory
server=$(cat inventory)

##### root
# Copie de la clée ssh pub du serveur source vers le serveur cible
if ssh-copy-id -i /root/.ssh/id_rsa.pub "$server"
then
    # Connexion réussie, aucun mot de passe demandé
    echo "Connexion au serveur $server réussie"
else
    # Connexion échouée, mot de passe demandé automatiquement par le module ssh-copy-id


#### adm-cheops
    # Prompt pour demander le mot de passe de l'utilisateur adm-cheops
    read -p "Mot de passe de l'utilisateur adm-cheops : " cheops_pass
    sshpass -p "$cheops_pass" ssh-copy-id -i /root/.ssh/id_rsa.pub "$server" -o "User=adm-cheops"

    # Vérification de la réussite de la connexion
    if ssh "$server" "exit"
    then
        # Connexion réussie, aucun mot de passe demandé
        echo "Connexion au serveur $server réussie"
    else
        # Connexion échouée, mot de passe demandé
    

#### adm-user  ----- comment car assez peu pris en charge
        # Prompt pour demander le mot de passe de l'utilisateur adm-user
        read -p "Mot de passe de l'utilisateur adm-user : " user_pass
        sshpass -p "$user_pass" ssh-copy-id -i /root/.ssh/id_rsa.pub "$server" -o "User=adm-user"
        
        # Vérification de la réussite de la connexion
        if ssh "$server" "exit"
        then
             Connexion réussie, aucun mot de passe demandé
             echo "Connexion au serveur $server réussie"
        else
            # Connexion échouée
             echo "Connexion au serveur $server échouée"
        fi
   fi
fi

