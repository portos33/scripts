##TARENTA Anthony
## 04-01-2023

Playbook d'installation Bigfix :

main_bigfix.yml

Il permet l'installation de l'agent sur les OS RHEL CentOS Ubuntu Debian

Utilisation:
ansible-playbook main_bigfix.yml -i inventory
Selectionner la VIP qui est sur l'IPAM
Selectionner le cid du client à cvette adresse : M:\Sécurité-SI\Projets\PatchManagement\BigFix\DOC\Table de correspondance.xlsx
Une fois terminé le(s) serveur(s) sont visible et joignable sur la console BIGFIX

Pour plus d'information sur l'installation de BigFix veuillez voir référer aux video mis à votre disposition sur le site sharepoint formation:
https://cheopstechnology.sharepoint.com/sites/FormationsInterne



main_bfdeploy.yml

Il permet de créer un user ayant les droits sudo, cela peut gagner du temps si votre liste de serveurs contient plusieur mdp différents

Utilisation:
ansible-playbook main_bfdeploy.yml -i inventory




main-suppr-prerequis.yml

Il permet de supprimer le user créer avec le playbook "main_bfdeploy.yml"

Utilisation:
ansible-playbook main-suppr-prerequis.yml -i inventory
