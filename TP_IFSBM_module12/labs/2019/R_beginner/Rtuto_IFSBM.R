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

# question 9 (optionnel niveau avancé: pour télécharger vous même les données avec TCGABiolinks) 
# En utilisant le package TCGAbiolinks disponible sur bioconductor, 
# télécharger les données cliniques disponibles pour l'ensemble des patients
# (tout cancer confondu) pour les variables suivantes "submitter_id","disease",
# "gender", "race","ethnicity","days_to_death","tumor_stage","age_at_diagnosis",
# "weight","hieght","bmi","alcohol_history","years_smoked","year_of_diagnosis",
# "classification_of_tumor","cigarettes_per_day" et "morphology" 
sel_var <- c("submitter_id","disease","gender",
             "race","ethnicity","days_to_death",
             "tumor_stage","age_at_diagnosis",
             "weight","height","bmi","alcohol_history",
             "years_smoked","year_of_diagnosis","vital_status",
             "classification_of_tumor","cigarettes_per_day" ,"morphology")

## load package
library(TCGAbiolinks)

## get names of available  projects 
names_project <- TCGAbiolinks:::getGDCprojects()$project_id
## selection "TCGA" project names for all cancer 
names_project_TCGA <- names_project[grep("TCGA-",names_project)]

## choice of clinical variables
sel_var <- c("submitter_id","disease","gender",
             "race","ethnicity","days_to_death",
             "tumor_stage","age_at_diagnosis",
             "weight","height","bmi","alcohol_history",
             "years_smoked","year_of_diagnosis","vital_status",
             "classification_of_tumor","cigarettes_per_day" ,"morphology")
## NB : the number of clinical variables is not always the same for each type de cancer

## construct full table
full_table <- c()
for(nam in names_project_TCGA){
  clinical <- GDCquery_clinic(project = nam, type = "clinical")
  print(nam)
  print(paste0(c("nb obs :","nb var :"),dim(clinical)))
  full_table <- rbind(full_table,clinical[,sel_var])
}
## check dimension
colnames(clinical)
dim(full_table)
head(full_table)

## write table
write.table(full_table,file="clinical_all_tcga.txt")

# question 10 
# Charger les données contenues dans le fichier clinical_all_tcga.txt 
# Stocker ces données dans un tableau "clinic".
# commande utile : read.csv2()

# question 11
# Quelle sont les dimensions du jeu de données chargé ? 
# Combien d'invidus et combien de variables comporte le jeu de données? 
# commande utile : dim()

# question 12 
# Afficher la valeur ligne 3, colonne 8
# Afficher toute la ligne 3
# Affichier les valeurs des lignes 1,7 et colonnes 3,9
# Afficher 


# question 13 (niveau débutant)
# Afficher le sous-tableau extrait du tableau "clinic" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind_alea", et les colonnes stockées dans le vecteur "sel_var"

# question 14
# Combien de types de cancer sont répertoriés dans les données ? 
# Comnbien d'observations (individus) par type de cancer sont disponibles ? 
# commandes utiles : length(), table(), unique()

# question 15
# Afficher combien de patients ont un age au diagnostic > 80 ans
# (attention: l'age est en jours)
# commande utile: table
# Représenter l'âge à la date du diagnostic pour l'ensemble des patients
# commande utile : hist()

# question 16
# Ajouter l'age en année arroundi à la table clinic
# commande utile: round()

# question 17
# Donner le type de chaque variable contenue dans la table "clinic"
# commande utile : str()

# question 18
# Représenter graphiquement la distribution des variables "weight","height","bmi" et "cigarettes_per_day"
## NB: toutes ces variables sont de type "factor"
#   attention aux conversions "factor" <-> "numeric". cf exemple ci-dessous.
#   vous devez donc ajouter au tableau les variables transformées avec as.numeric(as.character())
vect=c(7,18,2)
plot(vect)
data.class(vect)
vect_f=factor(vect)
plot(vect_f)
data.class(vect_f)
vect_f_n=as.numeric(vect_f)
vect_f_n # vect_f_n vaut 2 3 1 et non 7 18 2 !!!
plot(vect_f_n)
vect_f_c_n=as.numeric(as.character(vect_f))
vect_f_c_n # vect_f_n_c vaut bien 7 18 2 comme attendu


# question 19
# représenter graphiquement le lien entre la variable "weight" et la variable "bmi"

# question 20
# représenter graphiquement le lien entre la variable "weight" et la variable "height"

# question 21
# représenter graphiquement le lien entre la variable "weight" et la variable "tumor_stage"
# commande: boxplot(variable ~ fact) où fact est le facteur de séparation à utiliser
# on peut utiliser l'option las=2 pour afficher les labels verticalement

# NB : on ne "voit rien" sur ce premier graphique, car il y a des valeurs extrèmes...
# une solution pour mieux "voir" les données est de prendre le log d'un ou 2 variables

# question 22
# représenter graphiquement le sexe ratio par type de cancer

# question 23
# représenter graphiquement les proportions relatives de la variable "ethnicity" par type de cancer

# question 24
# représenter graphiquement l'année du diagnostic en fonction du type de cancer

# question 25
# représenter graphiquement le nombre de cigarettes consommées par jour en fonction de l'indice bmi 

# question 26
# Représeter graphiquement la valeur de l'indice "bmi" en fonction du sexe

# question 27
# Représenter graphiquement la distribution de l'âge au diagnostic en fonction du type de cancer. 

####################################################################################
# Cours 3 : 
####################################################################################
# question 28 
# Compter le nombre d'observations (individus) sans données manquantes.
# commande utile : complete.cases()

# question 29
# Compter le nombre d'observations pour lesquelles les variables "bmi" et "cigarettes_per_day"
# ne sont pas des valeurs manquantes
# (utilisez aussi complete.cases())

# question 30
# Afficher le tableau des individus ayant une valeur de "bmi" supérieure à 70
# inspirez-vous de ces exemples
monvect=1:10
monvect>5 
(monvect>6) | (monvect<3)
monvect[which((monvect>6) | (monvect<3))]

# question 31
# Compter le nombre d'individus ayant un indice "bmi" supérieur à 40 
# et fumant moins de 3 cigarettes par jour.

# question 32
# Donner la liste des cancers associés à un indice "bmi" supérieur à 40 
# et à plus de 3 cigarettes par jour.

# question 33
# représenter graphiquement la taille chez les hommes, puis chez les femmes
# en réalisant un graphique à deux paneaux avec par(mfrow=c(1,2))
# commande: hist()

# question 34
# comparer la taille des hommes et des femmes
# commande: mean() avec option na.rm=TRUE
# testez la significativité de la différence
# commande: t.test
