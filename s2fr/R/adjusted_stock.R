#' Adjusted stock
#'
#' Returns the adjusted Bitcoin stock, in satoshis, for a given block height.
#'
#' @param block_height
#' The (integer) block height. May be a vector.
#' @param total_amount
#' The \code{total_amount} of spendable bitcoins, in satoshis, at a particular block height.
#' @param total_amount_height
#' The block height at which the \code{total_amount} parameter applies.
#'
#' @return The adjusted Bitcoin stock as an integer number of satoshis.
#'
#' @export
#'
#' @examples
#' adjusted_stock(1, 1896164634950948, 723896)
#' adjusted_stock(209999, 1896164634950948, 723896)
#' adjusted_stock(723896, 1896164634950948, 723896)
#'
#' adjusted_stock(0:10, 1896164634950948, 723896)
adjusted_stock <- function(block_height, total_amount, total_amount_height) {

  # Check all arguments are integer values.
  stopifnot(as.integer(block_height) == block_height)
  stopifnot(total_amount %% 1 == 0)
  stopifnot(as.integer(total_amount_height) == total_amount_height)

  adjustment_factor <- total_amount/gross_stock(total_amount_height)

  adjustment_factor * gross_stock(block_height)
}
