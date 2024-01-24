myFunction = function(data,na.rm=T,abline="mean"){
  mean_data = mean(data, na.rm = na.rm)
  median_data = median(data, na.rm = na.rm)
  stripchart(data,pch =20)
  if (abline == "mean"){
    abline(v = mean_data)
  }
  else{
    abline(v = median_data)
  }
  central = c(mean_data, median_data, as.numeric(sum(is.na(data))))
  names(central) = c("Mean","Median","Number of NAs")
  print(central)
}

## Problem 2

mean_sd = function(x, ...){
  c(mean(x, ...), sd = sd(x, ...))
}

apply(airquality, 2, function(x){by(x, list(toohot = airquality$Temp > 85), mean_sd)})


## Problem 3

response = c(1,5,8,3,7)

many_medians = replicate(10000, median(sample(response, size = 5, replace = T)))
var(many_medians)
