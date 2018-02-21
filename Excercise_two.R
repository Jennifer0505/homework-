#1
#(a)
( tmp <- matrix( c(1,5,-2,1,2,-1,3,6,-3),nr=3) )
tmp%*%tmp%*%tmp
#(b)
tmp[,3] <- tmp[,2]+tmp[,3]
tmp[,3]

#2
tmp <- matrix(c(10,-10,10), b=T, nc=3, nr=15)
t(tmp)%*%tmp

#3
matE <- matrix(0,nr=6,nc=6)
matE[ abs(col(matE)-row(matE))==1 ] <- 1

#4
outer(0:4,0:4,"+")

#5
#(a)
outer(0:4,0:4,"+")%%5
#(b)
outer(0:9,0:9,"+")%%10
#(c)
outer(0:8,0:8,"-")%%9

#6
yVec <- c(7,-1,-3,5,17)
yVec
AMat <- matrix(0,nr=5, nc=5)
AMat
AMat <- abs(col(AMat)-row(AMat))+1
solve(AMat)%*%yVec 

#7
set.seed(75)
aMat <- matrix(sample(10, size=60, replace=TRUE), nr=6) 
#(a)
aMat[aMat>4]
#(b)
which(apply(aMat,1,function(x){sum(x==7)==2}))
#(c)
aMatColSums <- colSums(aMat)
aMatColSums

which( outer(aMatColSums,aMatColSums,"+")>75, arr.ind = TRUE )

#8
#(a)
j <- 1:5
i <- 1:20

sum(outer(i^4,3+j,"/"))
#(b)
sum((1:20)^4/(3 + outer(1:20, 1:5, "*")))
#(c)
sum(outer(1:10,1:10,function(i,j){(i>=j)*i^4/(3+i*j)}))
