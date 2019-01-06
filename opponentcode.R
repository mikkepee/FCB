d = read.csv("C:/Users/Mikael/Documents/koulu/UPC/Bayes/project/fcbdata.csv", header=T)
against = unique(d$opposition)
against = as.character(against)
df = data.frame(against)

n = length(against)
games = rep(0,n)
W = rep(0,n)
D = rep(0,n)
L = rep(0,n)
gs = rep(0,n)
gc = rep(0,n)
pos = rep(0,n)
pas = rep(0,n)
stot = rep(0,n)
starg = rep(0,n)
for (i in 1:n) {
  tmp = d[opposition==against[i],]
  games[i] = length(tmp$X)
  W[i] = sum(tmp$pts==3)
  D[i] = sum(tmp$pts==1)
  L[i] = sum(tmp$pts==0)
  gs[i] = round(mean(tmp$goalsScored),2)
  gc[i] = round(mean(tmp$goalsConceded),2)
  pos[i] = round(mean(tmp$possession),2)
  pas[i] = round(mean(tmp$passSucces),2)
  stot[i] = round(mean(tmp$shotsTotal),2)
  starg[i] = round(mean(tmp$shotsTarget),2)
}
df$games = games
df$W = W
df$D = D
df$L = L
df$gScored = gs
df$gCons = gc
df$possession = pos
df$passSucces = pas
df$totalShots = stot
df$shotsTarget = starg

df$against = as.character(df$against)
df[13,1] = "Atletico Madrid"
df[15,1] = "Atletic Bilbao"

setwd("~/koulu/tilasto/omat")

write.table(df, file="fcbopponents.csv", row.names=F, sep=",")
