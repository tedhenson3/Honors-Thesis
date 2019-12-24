
aau = aau %>% dplyr::select(-Position.Basic)
aau.pca <- prcomp(aau, center = T, scale = T)


prep = prep %>% dplyr::select(-Position.Basic)


prep.pca <- prcomp(prep, center = T, scale = T)


pr.var.aau <- aau.pca$sdev^2
pve.aau = pr.var.aau / sum(pr.var.aau)


pr.var.prep <- prep.pca$sdev^2
pve.prep = pr.var.prep / sum(pr.var.prep)
