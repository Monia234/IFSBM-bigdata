# Bienvenue au module UE 12: Big data et modèles prédictifs

Pour suivre les TPs, vous devez avoir accès à une session R avec certaines libraires pré-installées. Pour cela, vous
pouvez utiliser le gestionnaire d'environnements R [renv](https://rstudio.github.io/renv/articles/renv.html). En
bref, `renv` vous permet d'isoler vos projets `R` et rend votre code facilement reproductible. 

## Installation de `R`

Assurez d'avoir une version de `R` installée sur votre ordinateur. Si vous n'êtes pas dans `RStudio`, vous pouvez
vérifier en ligne de commande en lançant `R --version` ce qui retourne

```
R version 4.0.0 (2020-04-24) -- "Arbor Day"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin18.7.0 (64-bit)
```

Si vous n'avez pas déjà `R`, veuillez installer la dernière version de `R` disponible
[ici](https://cran.r-project.org/) puis, si vous souhaitez utiliser Rstudio comme IDE, installez le depuis [ici](https://rstudio.com/products/rstudio/download/).

## Création de l'environnement `renv`

1. Veuillez cloner ce répertoire si ce n'est pas déjà fait (`git clone https://github.com/gustaveroussy/IFSBM-bigdata`).
2. Ouvrez `RStudio` ou votre IDE préféré et placez vous dans le dossier `TPs`
> `File > New Project >  Existing Directory > IFSBM-bigdata > TP_ISFBM_module12 > TPs`

ou

> `cd [...]/ISFBM-bigdata/TP_IFSBM_module12 > TPs`
3. Depuis la console `R`, lancez la commande  `renv::restore()`.

## Utilisation des notebooks R

Les  *R notebooks* sont des documents R Markdown (*.Rmd*) avec des parties textuelles et des parties de code R 
(appelées *chunks*) qui peuvent être exécutées de manière indépendente et interactive. Une introduction à leur
utilisation est incluse dans le premier TP (cf `R_TP1/src/TP_MachineLearning.Rmd`).
