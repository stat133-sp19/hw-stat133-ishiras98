
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

The package `"binomial"` is an [R](http://www.r-project.org/) package that intends to simulate a binomial experiment and create a distribution of probabilities associated with a certain number of successes in the experiment.

Motivation
----------

This package has been developed to create a binomial library that easily allows users to calculate probabilities of binomial random variables and that allows one to visually depict binomial experiments using plots.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-ishiras98/binomial")

# install "binomial" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-ishiras98/binomial", build_vignettes = TRUE)
```

Usage
-----

``` r

library(binomial)

# binomial probability
# examples of how the package works 

# probability of 2 successes in 5 trials, probability of success = 0.5
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125

# binomial distribution which shows binomial probabilities associated with each number of successes when there are 5 trials 

bin_distribution(trials = 5, prob = 0.5)
#>   success    prob
#> 1       0 0.03125
#> 2       1 0.15625
#> 3       2 0.31250
#> 4       3 0.31250
#> 5       4 0.15625
#> 6       5 0.03125

# binomial cumulative distribution  

bin_cumulative(trials = 5, prob = 0.5)
#>   success    prob cumulative
#> 1       0 0.03125    0.03125
#> 2       1 0.15625    0.18750
#> 3       2 0.31250    0.50000
#> 4       3 0.31250    0.81250
#> 5       4 0.15625    0.96875
#> 6       5 0.03125    1.00000


# summary of a binomial random variable, with number of trials and probability of success given 

bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1
#> $x
#>   trials prob mean variance mode  skewness   kurtosis
#> 1     10  0.3    3      2.1    3 0.2760262 -0.1238095
#> 
#> attr(,"class")
#> [1] "summary.binvar"

# mean of a binomial experiment with 10 trials and prob of success equal to 0.3

bin_mean(10, 0.3)
#> [1] 3

# variance of a binomial experiment with 10 trials and prob of success equal to 0.3

# mode(s) of a binomial experiment with 10 trials and prob of success equal to 0.3

bin_mode(10, 0.3)
#> [1] 3
```
