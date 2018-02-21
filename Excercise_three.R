#1
#(a)
tmpFn1 <- function(xVec)
{
  xVec^(1:length(xVec))
}
tmpFn2 <- function(xVec)
{
  n <- length(xVec)
  (xVec^(1:n))/(1:n)
}
#(b)
tmpFn3 <- function(x, n)
{
  1 + sum((x^(1:n))/(1:n))
}

#2
tmpFn <- function(xVec) {
  n <- length(xVec)
  ( xVec[ -c(n-1,n) ] + xVec[ -c(1,n) ] + xVec[ -c(1,2) ] )/3
}

#3
tmpFn <- function(x) {
  ifelse(x < 0, x^2 + 2*x + 3, ifelse(x < 2, x+3, x^2 + 4*x - 7))
}
tmp <- seq(-3, 3, len=100)
plot(tmp, tmpFn(tmp), type="l")

#4
tmpFn <- function(mat) {
  mat[mat%%2 == 1] <- 2 * mat[mat%%2 == 1]
  mat }

#5
tmp <- diag(2, nr = 5)
tmp[abs(row(tmp)-col(tmp))==1] <- 1
tmp
tmpFn <- function(n,k){
  tmp <- diag(nr = n)
  tmp[abs(row(tmp)-col(tmp))==1] <- 1
  tmp
}
tmpFn(5,2)

#6
quadrant <- function(alpha) {
  1 + (alpha%%360)%/%90
}

#7
#(a)
weekday <- function(day, month, year) {
  month <- month - 2
  if(month <= 0) {
    month <- month + 12
    year <- year - 1
  }
  cc <- year %/% 100
  year <- year %% 100
  tmp <- floor(2.6*month - 0.2) + day + year + year %/% 4 + cc %/% 4 - 2 * cc
  c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")[1+tmp%%7]
}
#(b)
weekday2 <- function(day, month, year)
{
  flag <- month <= 2
  month <- month - 2 + 12*flag
  year <- year - flag
  cc <- year %/% 100
  year <- year %% 100
  tmp <- floor(2.6*month - 0.2) + day + year + year %/% 4 + cc %/% 4 - 2 * cc
  c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")[1+tmp%%7]
}