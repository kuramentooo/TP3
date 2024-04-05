# TP3
# **Objectif**
L'objectif de ce TP est de mettre en place une VM Ubuntu22 et des ressources associées (Resource group, Storage Account, Virtual Network, Network Interface et Public IP) grace à Terraform via Azure.

# **Requirements** :
Mettre Ubuntu a jour avec "sudo apt update && sudo apt upgrade -y" \
Installer terraform via cette documentation : https://computingforgeeks.com/how-to-install-terraform-on-ubuntu/ \
Installer Azure CLI via cette documentation : https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt

# **Etape 1**
git clone https://github.com/kuramentooo/TP3.git

# **Etape 2** 
Se connecter à Azure : \
$ az login --use-device-code \
Se rendre sur https://microsoft.com/devicelogin et entrer le code affiché \
$ az account list --query "[].{name:name, subscriptionId:id}" \
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/VotreSubscriptionId" 

# **Etape 3** 
Définir les variables d'environnement avec les infos obtenues via la derniere commande, comme ceci : \
$ export ARM_SUBSCRIPTION_ID=SubscriptionId  \
$ export ARM_CLIENT_ID=appId \
$ export ARM_CLIENT_SECRET=password \
$ export ARM_TENANT_ID=tenant

# **Etape 4** 
Générer une clef publique SSH : \
$ ssh-keygen -o 

Et modifier le fichier vm.tf en conséquence :  \
 " admin_ssh_key { \
    username   = "adminuser" \
    public_key = **file("~/.ssh/id_rsa.pub")** "

# **Etape 5** 
Valider et lancer terraform : 
$ Terraform validate \
$ Terraform init \
$ Terrafomr plan \
$ Terraform apply

Récupérer l'IP publique de la machine sur azure et s'y connecter en SSH avec : \
$ ssh -i ~/.ssh/id_rsa adminuser@ip_publique

# Explication des fichiers : 

**versions.tf :** \
Configure Terraform pour utiliser la version 3.0.x du fournisseur AzureRM afin de déployer des ressources Azure, tout en spécifiant que Terraform nécessite une version 0.14 ou supérieure. 

**main.tf** : \
Crée un groupe de ressources Azure avec le nom "rg_asc" dans la région Est des Etats-Unis. 

**vm.tf** : \
Déploie une machine virtuelle Ubuntu22 dans Azure, avec une interface réseau, une adresse IP publique, et un sous-réseau dans un groupe de ressources spécifique déja crée dans le main.tf. 

**sa.tf** : \
Crée un compte de stockage Azure avec un niveau "Standard" et une réplication LRS, dans le groupe de ressources spécifié.
