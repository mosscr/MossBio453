install.packages("vegan")
library(vegan)
data(dune)
data(dune.env)
?dune

dune_fit <- envfit(dune_mds, dune.env)
dune_fit

#look at correlations in comm. matrix and create the mds
dune_pca <- rda(dune, scale = TRUE)
dune_pca
dune_mds <- metaMDS(dune)

#make and examine the NMDS plot
plot(dune_mds, type = "n")
text(dune_mds, "sp", cex = .5)
color_vect = rev(terrain.colors (6)) [-1]
points(dune_mds, "sites", pch = 19, col = color_vect[dune.env$Moisture])
legend('topright', paste("Moisture =", 1:5, sep=''), 
       col=color_vect, pch=19)
#The goal of creating a plot like this is to find patterns in the correlations. This
    #analysis specifically shows us that there is a correlation between certain species and 
    #the areas where they are found. For example, we see Trifprat in fairly dry areas
    #and Eleoplau in very moist areas. Species that prefer these environments are found at the 
    #extremes of the graph, as these are the extreme measures of moisture. Species such as Sagriproc, 
    #who are found in more mild areas are found in the middle of the plot, which makes sense. 

cca_dune <- cca(dune, data = dune.env)
cca_dune
RsquareAdj(cca_dune, 100)
anova(cca_dune, permutations = 999)
anova(cca_dune, by = 'margin', permutations = 999)

plot(cca_dune)

##Based on the plots that I generated, the two tests seem to be
  #giving the same general information. The species are in the same 
  #spots on either graph. They agree with each other. I thinkm that 
  #I personally found the NMDS more useful than the CCA.