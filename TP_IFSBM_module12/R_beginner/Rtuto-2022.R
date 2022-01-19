## melina.gallopin@u-psud.fr
## TP du 3 décembre 2019
## commande de nettoyage de l'environnement

####################################################################################
# Cours 1 : 
####################################################################################

# question 1
# Créer un vecteur nommé "sel_var" contenant uniquement les chaines de caractères 
# "disease", "gender" et "bmi"
# commande utile : c()

# question 2 
# Créer un vecteur nommé "sel_ind" contenant uniquement les entiers pairs entre 1 et 20
# commande utile : seq()

# question 3 
# Créer un vecteur nommé "sel_ind_alea" contenant 10 entiers sélectionnés aléatoirement 
# entre 1 et 10000
# commande utile : sample()

# question 4
# Créer un vecteur de taille 100 contenant uniquement des 0 et des 1 tirés aléatoirement.
# Représenter graphiquement la proportion de 0 et de 1 (il faut transformer les 0/1 en factor)

# question 5 
# Afficher un vecteur composé de 10 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.
# commandes utiles : hist(), rnorm()

# question 6 (niveau débutant)
# Afficher un vecteur composé de 100 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.

# question 7
# Afficher un vecteur composé de 1000 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.

####################################################################################
# Cours 2 : 
####################################################################################

# question 8 
# A l’aide du logiciel Excel (ou équivalent Open Office), créer un tableau de 5 colonnes 
# et 6 lignes. Donner des noms aux colonnes (ex : « colonne 1 », « colonne 2 », …, « colonne 5 ») 
# et aux lignes (ex : « ligne 1 », « ligne 2 », …, « ligne 6 »). 
# Remplir les cases du tableau comme vous le souhaitez.
# Sauvegarder ce tableau sous la forme d’un fichier texte (ou fichier CSV), 
# Importer le fichier texte obtenu dans une table R, en conservant 
# les noms des colonnes et les noms des lignes.
# (nécessite sep="X", header = TRUE, row.names=1), où X est le caractère de séparation du CSV 

# question 9: télécharger vous même les données avec TCGABiolinks 
## load package
## première installation: install.packages("BiocManager")  
## BiocManager::install("TCGAbiolinks")
library(TCGAbiolinks)

## get names of available  projects 
names_project <- TCGAbiolinks:::getGDCprojects()$project_id
## selection "TCGA" project names for all cancer 
names_project_TCGA <- names_project[grep("TCGA-",names_project)]

## choice of clinical variables
sel_var <- c("submitter_id","disease","gender",
             "race","ethnicity","days_to_death",
             "tumor_grade","age_at_diagnosis",
             "alcohol_history",
             "years_smoked","year_of_diagnosis","vital_status",
             "classification_of_tumor","cigarettes_per_day" ,"morphology")
## NB : the number of clinical variables is not always the same for each type de cancer

## construct clin table for all TCGA tumors
tcgaclin <- c()
for(nam in names_project_TCGA){
  clinical <- GDCquery_clinic(project = nam, type = "clinical")
  print(nam)
  print(paste0(c("nb obs :","nb var :"),dim(clinical)))
  tcgaclin <- rbind(tcgaclin,clinical[,sel_var])
}

# question 10
# Quelle sont les dimensions du jeu de données chargé ? 
# Combien d'invidus et combien de variables comporte le jeu de données? 
# commande utile : dim()

# question 11
# Donner le type de chaque variable contenue dans la table "tcgaclin"
# commande utile : str()

# question 12 
# Afficher la valeur ligne 3, colonne 8
# Afficher toute la ligne 3
# Affichier les valeurs des lignes 1,7 et colonnes 3,9
# Afficher 

# question 13 (niveau débutant)
# Afficher le sous-tableau extrait du tableau "tcgaclin" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind_alea", et les colonnes stockées dans le vecteur "sel_var"

# question 14
# listez tous les types de cancer de tcgaclin, pour qu'ils 
#   n'apparaissent une fois chacun
# Combien y en a-t-il ?  
# Comnbien d'observations (individus) par type de cancer sont disponibles ? 
# triez la liste par ordre d'effectif par type de cancer
# commandes utiles : length(), table(), unique(), sort()

# question 15
# Afficher combien de patients ont un age au diagnostic > 80 ans
# (attention: l'age est en jours)
# commande utile: table
# Représenter l'âge à la date du diagnostic pour l'ensemble des patients
# commande utile : hist()

# question 16
# Ajouter l'age en année arrondi à la table clinic
# commande utile: round()

# question 17
# Représenter graphiquement la distribution de la variable "cigarettes_per_day"

# question 18
# représenter graphiquement le lien entre la variable "age_arrondi" et la variable "disease"
# commande: boxplot(variable ~ fact) où fact est le facteur de séparation à utiliser
# on peut utiliser l'option las=2 pour afficher les labels verticalement

# question 19
# affichez la table des comptages de sexe par type de cancer
# La représenter graphiquement (barplot)

# question 20 (Difficile)
# affichez cette table de manière à ce que les compatages soient normalisés entre 0 et 1
# Fonctions possibles: colSums, apply, t (transposition) 

# question 21
# Même question pour la variable "ethnicity" par type de cancer


####################################################################################
# Cours 3 : 
####################################################################################
# question 23
# Compter le nombre d'observations (individus) sans données manquantes.
# commande utile : complete.cases()

# question 24
# Compter le nombre d'observations pour lesquelles les variable "cigarettes_per_day"
# et years_smoked ne sont pas manquante
# (utilisez aussi is.na())

# question 25
# creez une colonne "smoker" de type booléen donnant le statut fumeur/non fumeur 
# des patients
# On estimera qu'une valeur autre que NA dans "cigarettes_per_day" ou dans "years_smoked"
# est équivalent à fumeur et tout autre cas (NA) à non fumeur 
# affichez ensuite la table de contingence disease vs. smoker pour visualiser les cancers
# pour lesquels l'information est probablement indisponible
# puis extrayez les noms de ces cancers

# question 26
# Y a-t-il signficativement plus de fumeurs dans les cancers de type LUAD
# que dans les autres cancers pour lesquels l'information tabac est disponible? 
# (fisher.test)



