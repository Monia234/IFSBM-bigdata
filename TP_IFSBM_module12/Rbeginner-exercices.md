*Adapted by Daniel Gautheret*

PART 1
======

First taste of R. Setting variables, using R functions, producing R graphics.

Exercise 1.1
------------

Create vector "vec1" containing integers from 1 to 12. Add values: 16, 17, 18 to end of vector.

**Required Functions:** ":" ; c( )

Exercise 1.2
------------

Create vector "vec2" containing values: 0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0. Try to do it in different ways.

**Required Functions:** c( ); seq( )

Exercise 1.3
------------

Compute operation : 4850 / 26. Display result with 2 or 3 digit precision. Are there other R functions to control precision ?

**Required Functions:** round( ); help( )

Exercise 1.4
------------

Create vector « vec6 » containing names: « individual 1 », « individual 2 », ... , « individual 100 ». **Required Functions:** paste( )

Exercise 1.5
------------

Display today's date. Save result in variable "today". Create variable « m2 » such that m2 = "I shall remember the R script I wrote on". Combine variables "today" and m2 in order to display "I shall remember the R script I wrote on Mon Sep 10 11:50::10 2018"

**Required Functions:** : date( ) ; paste( )

Exercise 1.6
------------

Plot 3 points at positions (x, y) : (1, 2), (2, 2) and (3, 3). Augment point size using argument "cex". Change the shape of points using argument "pch". Set axis scales using arguments "xlim" and "ylim". Change point colors using argument "col". Write plot title using argument "main". Write axis labels using arguments "xlab" et "ylab". Save results as a PDF document and a JPEG image.

**Required Functions:** plot( ) ; jpeg( ) ; dev.off( )

Exercise 1.7
------------

Draw 100 random numbers following a normal distribution of mean 10 and standard deviation 5. Plot a histogram of the numbers. Change the number of bars in the histogram: 5, 50 and 100.

**Required Functions:** rnorm( ) ; hist( )

Exercise 1.8
------------

Draw 10 random numbers between 1 and 100.

**Required Functions:** sample()

Exercise 1.9
------------

Simulate 100 coin tosses. To do so, perform 100 draws with replacement in a set of 2 possible values ("head" and "tail")

**Required Functions:** sample()

Exercise 1.10
-------------

Perform the same simulation as in Exercise 9, but with a biased coin. Probability of "head" should be 0.3.

**Required Functions:** sample()

PART 2
======

Using tables and importing/exporting text data in R.

Exercise 2.1
------------

Create a identity matrix (with ones on the main diagonal and zeros elsewhere) of dimension 10 lines x 10 columns.

Create a matrix with random values of dimension 10 lines x 10 columns whose elements follow a normal distribution of mean 0 and variance 5.

**Required Functions:** matrix( ) ; diag( ), rnorm( )

Exercise 2.2
------------

Import dataset "precip" into your R session. This is one of R's pre-recorded datasets. It contains data on rainfall in various US cities. Store the list of available cities in vector "cities". How many cities are there? Display rainfall levels for cities: Philadelphia, Columbia, Baltimore, Sacramento.

**Required Functions:** data(precip) ; names( ) ; length( ).

Exercise 2.3
------------

Create 2 random vectors named "x1 and "x2" each containing 100 random values following 1) a *standard* normal distribution (mean = 0, standard deviation = 1) and 2) a uniform distribution over interval \[0 ; 10\].

Create a matrix "m1" containing the first 10 values x1 (column 1 of m1) and the last 10 values of x2 (column 2 of m1).

Create a matrix "m2" containing the 16th, 51th, 79th, 31th and 27th values of x1 (column 1 of m2) and the 30th, 70th, 12th, 49th and 45th values of x2 (column 2 of m2).

Concatenate matrices m1 and m2 into matriw m12. What are the dimensions (nb of lines and columns) of m12 ?

**Required Functions:** rnorm( ) ; runif( ) ; cbind( ) ; rbind( ) ; dim( ) ; etc.

Exercise 2.4
------------

Import dataset "WorldPhones" (a prerecorded dataset) in your R session. Display the content of variable WorldPhones. Compute the total number of phone numbers attributed 1) each year (vector "nbrTelYr"); 2) for each continent (vector "nbrTelCont"). Which continent has the most/least phone numbers ? How many continents have more than 20,000 phone numbers ? 50,000 phone numbers ? 200,000 phone numbers ?

**Required Functions:**: data(WorldPhones) ; sum( ) ; apply( ) ; names( ) ; which( ); max( ) ; min( ).

Exercise 2.5
------------

Using a spreadsheet software (Excel, Office-Calc), create a table with 5 columns and 6 lines. Give names to columns (ex : "col 1, "col 2", ..., "col 5") and lines (ex : "line 1", "line 2", ..., "line 6"). Fill table cells as you wish and save this table as a text or CSV file, using tabulations as separators. Import the file in R.

**Required Functions:** read.table() with arguments "header = T" and "row.names = 1", or read.csv()

PART 3
======

Repeating commands automatically (using tests and loops) and creating new functions. These exercises are a bit harder than in parts I & II.

Exercise 3.1
------------

Create a loop displaying index "i" of current iteration (10 iterations). Compute the cumulative sum (sumCumul) of indices.

Exercise 3.2
------------

Create vector "vecRnd" containing 100 random values from a normal distribution of mean 4 and standard deviation 5. Print indices of values higher than 3. Store these values in vector "vecGT3". Test whether the sum of these values ("valSum") is greater that 40, 30 and 20. Display an appropriate message.

Exercise 3.3
------------

Create a function named "mysum" that computes the sum of 2 variables "x" and "y" passed as arguments.

Exercise 3.4
------------

Write a function "computeFee" that takes an age as argument and displays : "children fee" if age is less than 12 years, "senior fee" if age is more than 60 years and "adult fee" othewise. Test your function for persons aged 5, 65, 85, 41, 23, 47 years.

Exercise 3.5
------------

Generate three random RNA sequences of 50, 60 et 79 nucleotides. Create a function "countNuc( )" that determines how many times each nucleotide is present in the sequence et displays the most frequent nucleotide and its number of occurences. Use this function to determine the most frequent nucleotide in your three sequences.
