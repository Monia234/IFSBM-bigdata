# Bienvenue au module UE 12: Big data et modèles prédictifs

Pour suivre les TPs, vous devez avoir accès à une session R avec certaines libraires pré-installées. Pour cela, nous
allons construire un environnement dédié au projet via la gestionnaire d'environnements
[conda](https://docs.conda.io/en/latest/). En bref, `conda` vous permet d'isoler vos projets `R` et rend votre code
facilement reproductible. Ce n'est pas la seule solution, `renv` est aussi pratique mais est limité au langage R alors
que `conda` est bien plus général.

## Installation de conda

Assurez d'avoir la commande `conda` installée sur votre ordinateur. La commande est disponible en téléchargeant
[Anaconda](https://www.anaconda.com/products/individual) ou [Miniconda](https://docs.conda.io/en/latest/miniconda.html),
qui est une version plus minimaliste (prends moins d'espace) de `conda`.

Ouvrez un terminal et vérifier que la commande `conda` est bien disponible en faisant `which conda` (Mac, Linux) ou
`where.exe conda` (Windows powershell).

## Création de l'environnement IFSBM

Vous devriez déjà avoir cloné ce repo github, si ce n'est pas le cas faites

```
git clone https://github.com/gustaveroussy/IFSBM-bigdata
```

Placez-vous ensuite dans le répertoire `TP_IFSBM_module12` puis exécutez la commande 

```
conda env create -f env.yaml
```

Cette commande va créer un environnement intitulé `ifsbm` que l'on va ensuite charger via la commande


```
conda activate ifsbm
```

## Lancement de R

Si vous n'avez pas d'IDE déjà installé, téléchargez et installez `RStudio` depuis [cette
page](https://www.rstudio.com/products/rstudio/download/#download).

Ouvrez `RStudio` ou votre IDE préféré avec la commande (exemple avec Mac)

```
open -a RStudio
```

et placez vous dans le dossier `TP_IFSBM_module12` en faisant > `File > New Project >  Existing Directory > IFSBM-bigdata > TP_ISFBM_module12`

Ouvrez le fichier RMarkdown de la séance à savoir `R_TP1/src/TP_MachineLearning.Rmd` ou `R_TP2/src/TP_NN.Rmd`.

## Utilisation des notebooks R

Les  *R notebooks* sont des documents R Markdown (*.Rmd*) avec des parties textuelles et des parties de code R 
(appelées *chunks*) qui peuvent être exécutées de manière indépendente et interactive. Une introduction à leur
utilisation est incluse dans le premier TP (cf `R_TP1/src/TP_MachineLearning.Rmd`).
