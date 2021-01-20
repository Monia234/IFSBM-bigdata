# Created on Sun Jan 14 2020
# @author: pradaty
#
# Script for executing the RMarkdown file TP_NN.Rmd 

##### Clear workspace
rm(list = ls())
##### Close any open graphics devices
graphics.off()

##### Render the R markdown file into HTML
rmarkdown::render(
    input       = "lab_2/src/TP_NN.Rmd",
    output_dir  = "lab_2/src",
    output_file = "TP_NN.html",
)
