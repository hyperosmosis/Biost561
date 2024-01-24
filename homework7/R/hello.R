#' Bootstrap Resampling
#'
#' @description \code{bootStrap} performs simple bootstrapping on a numeric dataset.
#'
#' @usage bootStrap(data, column, n)
#'
#' @param data Dataframe where you want to take the bootstrap from
#' @param column Column of interest. This must be numeric
#' @param n Number of bootstrap resamples you want to take.
#'
#'
#' @return Returns a 95\% confidence interval (quartile) as well as a histogram of the spread of the bootstraps
#'
#'
#' @examples
#' bootStrap(beaver1, 2, 200)
#' bootStrap(beaver2, 2, 10000)
#'
#' @export bootStrap
#
#
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

bootStrap <- function(data, column, n){
  ntimes <- n
  mean_stars <- rep(NA, ntimes)
  set.seed(4)
  for(i in 1:ntimes){ ## Try Catch statement?
    resample.y <- data[sample(nrow(data), nrow(data), replace = T),]
    mean_stars[i] <- mean(resample.y[,column])
  }

  print(histBoot(mean_stars))

  quantile = quantile(mean_stars, c(0.025, 0.975))
  moment_l = mean(mean_stars)-1.96*sd(mean_stars)
  moment_h = mean(mean_stars)+1.96*sd(mean_stars)

  print(quantile)

}

histBoot <- function(data){
  ggplot() + aes(data) + geom_histogram()
}
