require(testthat)
context("data-prep")

test_that("the gross_stock function works", {

  expect_equal(gross_stock(0), 0)
  expect_equal(gross_stock(1), 5000000000)

  # The last 50 BTC subsidy.
  expect_equal(gross_stock(209999), 5000000000*209999)

  # The first 25 BTC subsidy.
  expect_equal(gross_stock(210000), 5000000000*209999 + 2500000000)

  # The last 25 BTC subsidy.
  expect_equal(gross_stock(419999), 5000000000*209999 + 2500000000*210000)

  # first 12.5 BTC subsidy.
  expect_equal(gross_stock(420000), 5000000000*209999 + 2500000000*210000 + 1250000000)

})

