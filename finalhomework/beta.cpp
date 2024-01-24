#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::export]]

mat predBeta(mat beta, int n) {
  mat X_1 = ones(n,1);
  mat X_2 = rbinom(n,1,0.7);
  mat X_3 = runif(n,-1,1);
  mat A = join_rows(X_1, X_2);
  A = join_rows(A, X_3);
  mat error = rnorm(n);
  mat Y = A * beta + error;
  
  A.save("X.csv", csv_ascii);
  Y.save("Y.csv", csv_ascii);
  
  mat beta_hat = inv(A.t() * A) * A.t() * Y;
  return beta_hat;
}

/*** R
library(Rcpp)
library(RcppArmadillo)

set.seed(1)
predBeta(matrix(c(1,2,3), 3), 3)
*/
