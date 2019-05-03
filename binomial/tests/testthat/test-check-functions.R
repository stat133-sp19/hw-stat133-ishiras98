context("checker arguments")

# check_prob

test_that("check_prob works as expected", {
  expect_true(check_prob(0.5))
  expect_error(check_prob(3))
  expect_error(check_prob(-4))
  expect_error(check_prob("one"))
  expect_error(check_prob(1:3))
})

# check_trials

test_that("check_trials works as expected",{
  expect_true(check_trials(5))
  expect_true(check_trials(0))
  expect_error(check_trials(-1))
  expect_error(check_trials(5.5))
  expect_error(check_trials(1:3))
})

# check_success

test_that("check_success works as expected",{
  expect_true(check_success(1:4, 5))
  expect_error(check_success(5, -3))
  expect_error(check_success(5, 2.5))
  expect_error(check_success(6, 5))
  expect_error(check_success(1:4, 2))
})


