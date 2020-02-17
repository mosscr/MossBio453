library(vegan)
data(BCI)
BCI_xy = data.frame(x = rep(seq(625754, 626654, by=100), each=5), 
                    y = rep(seq(1011569,  1011969, by=100), len=50))

plot(BCI_xy)
BCI
BCI$Brosimum.alicastrum
BCI$Beilschmiedia.pendula
plot(BCI$Brosimum.alicastrum)
plot(BCI$Beilschmiedia.pendula)

col_brks = hist(BCI_xy, plot=F)$breaks
col_indices = as.numeric(cut(BCI, col_brks))
cols = rev(terrain.colors(length(col_brks)))
plot(BCI, cex=2, pch=19, col=cols[col_indices])

xy_dist <- dist(BCI_xy)
r_dist <- dist(BCI$Brosimum.alicastrum)
c_dist <- dist(BCI$Beilschmiedia.pendula)

plot(xy_dist, r_dist)
plot(xy_dist, c_dist)
lines(lowess(xy_dist, r_dist, f = 0.25))
lines(lowess(xy_dist, c_dist, f = 0.25))
    ##It seems to me that these two species are evenly distributed 
        #where they are found, based on these plots.

sp_ids = c("Cordia.lasiocalyx", "Hirtella.triandra",
           "Picramnia.latifolia", "Quassia.amara",
           "Tabernaemontana.arborea", "Trattinnickia.aspera", 
           "Xylopia.macrantha")
max_dist = max(xy_dist) / 2 
library(nlme)
sp_dat = data.frame(BCI, BCI_xy)
sp_lm = gls(Drypetes.standleyi ~ Hirtella.triandra, data = sp_dat)
plot(Variogram(sp_lm, form= ~ x + y))
sp_exp_nug = update(sp_lm, corr=corExp(form=~x + y, nugget=T))
plot(Variogram(sp_exp_nug, maxDist = max_dist))                    

sp_lmmult = gls(Drypetes.standleyi ~ Cordia.lasiocalyx + Hirtella.triandra + Picramnia.latifolia + Quassia.amara + Tabernaemontana.arborea + Trattinnickia.aspera + Xylopia.macrantha, data = sp_dat)
plot(Variogram(sp_lmmult, form= ~ x + y))
spmult_exp_nug = update(sp_lm, corr=corExp(form=~x + y, nugget=T))
plot(Variogram(spmult_exp_nug, maxDist = max_dist))
    ##It does not appear that including the error term had an impact on the coefficients
anova(sp_lm, sp_exp_nug)
anova(sp_lmmult, spmult_exp_nug)
    ##I think that while it did make a difference (at least in the univariate model), 
       #it was not a hugely significant one. The comparison using the multivariate model
       #produced no meaningful results. 
    ##We did not see much of a difference because each model fit the
       #data well 