## co-extinctions climate change/land use
## global sensitivity analyses
## accompanies paper: STRONA, G, CJA BRADSHAW. In review. Co-extinctions dominate future vertebrate losses from
##                      climate and land-use change. Science Advances 
## updated October 2022

## set working directory
setwd("~/.../")

# import data
dat <- read.table("data_for_sensitivity.csv", header=T, sep=",")
head(dat)

# split datasets by emissions scenario
dat.nona <- data.frame(na.omit(dat[!is.infinite(rowSums(dat)),]))
dim(dat.nona)[1]

datScen45 <- subset(dat.nona, scenario==45)
datScen6 <- subset(dat.nona, scenario==6)
datScen85 <- subset(dat.nona, scenario==85)


#########
## BRT ##
#########

library(dismo)
library(gbm)

## RESPONSE: div_loss
# Scenario 45
div0S45.brt.fit <- gbm.step(datScen45, gbm.x = attr(datScen45, "names")[c(4:8,11)], gbm.y = attr(datScen45, "names")[13], family="gaussian", max.trees=100000, tolerance = 0.0001, learning.rate = 0.001, bag.fraction=0.75, tree.complexity = 2)
summary(div0S45.brt.fit)
D2 <- 100 * (div0S45.brt.fit$cv.statistics$deviance.mean - div0S45.brt.fit$self.statistics$mean.resid) / div0S45.brt.fit$cv.statistics$deviance.mean
D2 # % deviance explained
gbm.plot(div0S45.brt.fit)
gbm.plot.fits(div0S45.brt.fit)

div0S45.CV.cor <- 100 * div0S45.brt.fit$cv.statistics$correlation.mean
div0S45.CV.cor
div0S45.CV.cor.se <- 100 * div0S45.brt.fit$cv.statistics$correlation.se
div0S45.CV.cor.se
print(c(div0S45.CV.cor, div0S45.CV.cor.se))

eq.sp.points <- 100
div0S45.RESP.val <- div0S45.RESP.pred <- matrix(data=NA, nrow=eq.sp.points, ncol=6)
## output average predictions
for (p in 1:6) {
  div0S45.RESP.val[,p] <- plot.gbm(div0S45.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,1]
  div0S45.RESP.pred[,p] <- plot.gbm(div0S45.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,2]
}
div0S45.RESP.val.dat <- as.data.frame(div0S45.RESP.val)
colnames(div0S45.RESP.val.dat) <- div0S45.brt.fit$var.names
div0S45.RESP.pred.dat <- as.data.frame(div0S45.RESP.pred)
colnames(div0S45.RESP.pred.dat) <- div0S45.brt.fit$var.names
head(div0S45.RESP.pred.dat)

div0S45out <- data.frame(div0S45.RESP.val.dat,div0S45.RESP.pred.dat)
write.table(div0S45out, file="div0S45out.csv", sep=",", row.names = F, col.names = T)


# Scenario 6
div0S6.brt.fit <- gbm.step(datScen6, gbm.x = attr(datScen6, "names")[c(4:8,11)], gbm.y = attr(datScen6, "names")[13], family="gaussian", max.trees=100000, tolerance = 0.0001, learning.rate = 0.001, bag.fraction=0.75, tree.complexity = 2)
summary(div0S6.brt.fit)
D2 <- 100 * (div0S6.brt.fit$cv.statistics$deviance.mean - div0S6.brt.fit$self.statistics$mean.resid) / div0S6.brt.fit$cv.statistics$deviance.mean
D2 # % deviance explained
gbm.plot(div0S6.brt.fit)
gbm.plot.fits(div0S6.brt.fit)

div0S6.CV.cor <- 100 * div0S6.brt.fit$cv.statistics$correlation.mean
div0S6.CV.cor
div0S6.CV.cor.se <- 100 * div0S6.brt.fit$cv.statistics$correlation.se
div0S6.CV.cor.se
print(c(div0S6.CV.cor, div0S6.CV.cor.se))

eq.sp.points <- 100
div0S6.RESP.val <- div0S6.RESP.pred <- matrix(data=NA, nrow=eq.sp.points, ncol=6)
## output average predictions
for (p in 1:6) {
  div0S6.RESP.val[,p] <- plot.gbm(div0S6.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,1]
  div0S6.RESP.pred[,p] <- plot.gbm(div0S6.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,2]
}
div0S6.RESP.val.dat <- as.data.frame(div0S6.RESP.val)
colnames(div0S6.RESP.val.dat) <- div0S6.brt.fit$var.names
div0S6.RESP.pred.dat <- as.data.frame(div0S6.RESP.pred)
colnames(div0S6.RESP.pred.dat) <- div0S6.brt.fit$var.names
head(div0S6.RESP.val.dat)

div0S6out <- data.frame(div0S6.RESP.val.dat,div0S6.RESP.pred.dat)
write.table(div0S6out, file="div0S6out.csv", sep=",", row.names = F, col.names = T)


# Scenario 85
div0S85.brt.fit <- gbm.step(datScen85, gbm.x = attr(datScen85, "names")[c(4:8,11)], gbm.y = attr(datScen85, "names")[13], family="gaussian", max.trees=100000, tolerance = 0.0001, learning.rate = 0.001, bag.fraction=0.75, tree.complexity = 2)
summary(div0S85.brt.fit)
D2 <- 100 * (div0S85.brt.fit$cv.statistics$deviance.mean - div0S85.brt.fit$self.statistics$mean.resid) / div0S85.brt.fit$cv.statistics$deviance.mean
D2 # % deviance explained
gbm.plot(div0S85.brt.fit)
gbm.plot.fits(div0S85.brt.fit)

div0S85.CV.cor <- 100 * div0S85.brt.fit$cv.statistics$correlation.mean
div0S85.CV.cor
div0S85.CV.cor.se <- 100 * div0S85.brt.fit$cv.statistics$correlation.se
div0S85.CV.cor.se
print(c(div0S85.CV.cor, div0S85.CV.cor.se))

eq.sp.points <- 100
div0S85.RESP.val <- div0S85.RESP.pred <- matrix(data=NA, nrow=eq.sp.points, ncol=6)
## output average predictions
for (p in 1:6) {
  div0S85.RESP.val[,p] <- plot.gbm(div0S85.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,1]
  div0S85.RESP.pred[,p] <- plot.gbm(div0S85.brt.fit, i.var=p, continuous.resolution=eq.sp.points, return.grid=T)[,2]
}
div0S85.RESP.val.dat <- as.data.frame(div0S85.RESP.val)
colnames(div0S85.RESP.val.dat) <- div0S85.brt.fit$var.names
div0S85.RESP.pred.dat <- as.data.frame(div0S85.RESP.pred)
colnames(div0S85.RESP.pred.dat) <- div0S85.brt.fit$var.names
head(div0S85.RESP.val.dat)

div0S85out <- data.frame(div0S85.RESP.val.dat,div0S85.RESP.pred.dat)
write.table(div0S85out, file="div0S85out.csv", sep=",", row.names = F, col.names = T)

