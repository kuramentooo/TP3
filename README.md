# TP3
# **Objectif**
L'objectif de ce TP est de mettre en place une VM Ubuntu22 et des ressources associées (Resource group, Storage Account, Virtual Network et IP Publique) grace à Terraform via Azure.

# **Requirements** :
Mettre Ubuntu a jour avec "sudo apt update && sudo apt upgrade -y" \
Installer terraform via cette documentation : https://computingforgeeks.com/how-to-install-terraform-on-ubuntu/ \
Installer Azure CLI via cette documentation : https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt

# **Etape 1**
git clone https://github.com/kuramentooo/TP3.git

# **Etape 2** 
Se connecter à Azure : \
$ az login \
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

Explication de versions.tf 

Explication de main.tf 

Explication de vm.tf 

Explication de sa.tf 

