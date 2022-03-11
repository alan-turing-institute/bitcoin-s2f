require(testthat)
context("data-prep")

test_that("the adjusted_stock function works", {

  adj_factor <- 1896164634950948/1896180625000000

  expect_equal(adjusted_stock(0, 1896164634950948, 723896), 0)
  expect_equal(adjusted_stock(1, 1896164634950948, 723896), adj_factor * 5000000000)
})

test_that("the adjusted_stock function works with a vector argument", {

  adj_factor <- 1896164634950948/1896180625000000

  result = adjusted_stock(0:10, 1896164634950948, 723896)

  expect_equal(length(result), 11)
  expect_equal(result[1], 0)
  expect_equal(result[2], adj_factor * 5000000000)
})

