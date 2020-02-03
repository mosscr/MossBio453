trees <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/treedata_subset.csv')
boxplot(cover ~ species, data = trees, xlab = "species", ylab = "cover")
install.packages("car")
library("car")
treecov = with(trees, tapply(cover, list(plotID, species), mean))
ifelse(is.na(mat), 0, mat)
ifelse(is.na(treecov), 0, treecov)
library("car")
cov_mod <- lm(cover ~ beers, data = trees)
    ## one was run for each variable
        #elev: 0.0187
        #tci: 0.000147 
        #streamdist: 0.0003044
        #disturb: 0.007115
        #beers: 0.003689 
summary(cov_mod)
Anova(cov_mod)
abiefra <- trees[trees$spcode=="ABIEFRA",]
acerrub <- trees[trees$spcode=="ACERRUB",]
boxplot(cover ~ abiefra$species == "Abies fraseri", data = abiefra, xlab = "Abies fraseri", ylab = "cover")
boxplot(cover ~ acerrub$species == "Acer rubrum", data = acerrub, xlab = "Acer rubrum", ylab = "cover")
abiefra_mod <- lm(cover ~ abiefra$species == "Abies fraseri", data = abiefra)
acerrub_mod <- lm(cover ~ acerrub$species == "Acer rubrum", data = acerrub)
##How well does the model appear to explain cover?
    ##Based on the summary p-values (the anova function did not give me any, for some reason), the 
     #model explains cover pretty well. The p-values given were p = <2e-16, which is much less than 
     #p = 0.05, meaning that it is statistically significant
##What explanatory variables are the most important? 
    ##I would say that elevation, distance from stream, and types of divergence are important
##Do model diagnostics indicate any problems with violations of OLS assumptions?
    ##I don't believe so 
##are you able to explain variance in one species better than another, why might this be the case?
    ## For some reason, the anova function is not giving me r-squared values, but one species may not be
     # as well suited to the plot they were gathering data on
acer_poi <- glm(cover ~ acerrub$species == "Acer rubrum", data = acerrub, family = "poisson")
acer_poi <- glm(cover ~ beers, data = acerrub, family = "poisson")
    ##one was run for each variable
       #elev: 0.009541181
       # tci: 0.003949937
       #streamdist: 0.007591422
       # disturb: 0.005199529
       # beers: 0.01241418
pseudo_r2(acer_poi)
##Does it appear that changing the error distribution changed the results much? In what ways?
    ## Again, I was not able to get p values out of the anova car function, however, based on the adjusted
       #r2 values in the summaries of each variable, yes, it does appear to change the results.
       # when running th glm, elevation, type of disturbance, and beers had higher pseudo r2 values,
       #meaning that, in the glm, more variance was explained by them. 
##Provide a plain English summary (i.e., no statistics) of what you have found and what conclusions we can take away from your analysis?
    ##Using this analysis, it has been shown that there may be many variables as to why one species of tree
      #may be more abundant in an area than another. However, some variables explain more of the differences
      #in abundance than others and the amount of differences explained by these variables can change,
      #based on what kind of test you run. 