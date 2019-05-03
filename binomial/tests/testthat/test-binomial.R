context("binomial arguments")

# bin_choose

test_that("bin_choose works as expected", {
  n = 5
  k = 2
  expect_equal(bin_choose(n, k), 10)
  expect_length(bin_choose(n, k), 1)
  expect_type(bin_choose(n, k), "double")
  expect_error(bin_choose(5,-2))
})

# bin_probability

test_that("bin_probability works as expected", {
  n = 5
  k = 2
  p = 0.5
  expect_equal(bin_probability(k, n, p), (10* 0.5^2 * (0.5)^(3)))
  expect_length(bin_probability(k, n, p), 1)
  expect_type(bin_probability(k, n, p), "double")
})

# bin_distribution

test_that("bin_distribution works as expected", {
  trials = 5
  prob = 0.5
  expect_equal(bin_distribution(trials, prob)$prob[1], 0.03125)
  expect_equal(typeof(bin_distribution(trials, prob)), "list")
  expect_is(bin_distribution(trials, prob), c("bindis", "data.frame"))
  expect_length(bin_distribution(trials, prob), 2)
})

# bin_cumulative

test_that("bin_cumulative works as expected", {
  trials = 5
  prob = 0.5
  expect_equal(bin_cumulative(trials,prob)$cumulative[6],1)
  expect_equal(typeof(bin_distribution(trials, prob)), "list")
  expect_is(bin_distribution(trials, prob), c("bincum", "data.frame"))
  expect_length(bin_distribution(trials, prob), 2)
})



