require(testthat)
context("data-prep")

test_that("the gross_stock function works", {

  expect_true(gross_stock(0) == 0)
  expect_true(gross_stock(1) == 50)
  expect_true(gross_stock(209999) == 5000000000*209999) # last 50 BTC coinbase.
  expect_true(gross_stock(210000) == 5000000000*209999 + 2500000000) # first 25 BTC coinbase.
  expect_true(gross_stock(419999) == 5000000000*209999 + 2500000000*210000) # last 25 BTC coinbase.
  expect_true(gross_stock(420000) == 5000000000*209999 + 2500000000*210000 + 1250000000) # first 12.5 BTC coinbase.

})

