#1.
#(a)
1:20
#(b)
20:1
#(c)
c(1:20,19:1)
#(d)
tmp <-c(4,6,3)
#(e)
rep(tmp,10)
#(f)
rep(tmp,10,len=31)
#(g)
rep(tmp,times=c(10,20,30))

#2
tmp <- seq(3,6,by=0.1) 
exp(tmp)*cos(tmp)

#3
#(a)
(0.1^seq(3,36,by=3))*(0.2^seq(1,34,by=3))
#(b)
(2^(1:25))/(1:25)

#4
#(a)
tmp <- 10:100
sum(tmp^3+4*tmp^2)
#(b)
tmp <- 1:25
sum((2^tmp)/tmp + 3^tmp/(tmp^2))

#5
paste("label", 1:30)
paste("fn", 1:30,sep="")

#6
#(a)
set.seed(50)
xVec <- sample(0:999,250,replace=T)
yVec <- sample(0:999,250,replace=T)
xVec
yVec
a <- yVec[2:250]-xVec[1:249]
#(b)
b <- sin(yVec[1:249])/cos(xVec[2:250])
#(c)
c <- xVec[1:248]+2*xVec[2:249]-xVec[3:250]
#(d)
d <- sum(exp(-xVec[2:250])/xVec[1:249]+10)

#7
#(a)
y <- yVec[yVec>600]
#(b)
which(yVec>600)
#(c)
xVec[yVec>600]
#(d)
sqrt(abs(xVec-mean(xVec)))
#(e)
sum( yVec>max(yVec)-200 )
#(f)
sum(xVec%%2==0)
#(g)
xVec[order(yVec)]
#(h)
yVec[c(T,F,F)]

#8
1+sum(cumprod(seq(2,38,b=2)/seq(3,39,b=2)))
