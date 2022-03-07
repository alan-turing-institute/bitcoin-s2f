#' Gross stock
#'
#' Returns the gross Bitcoin stock, in satoshis, for a given block height.
#'
#' @param block_height
#' The (integer) block height.
#' @param by_halving
#' A logical value. If TRUE, the gross stock is returned as a vector
#' with one element per halving period.
#'
#' @return The gross Bitcoin stock as an integer number of satoshis.
#'
#' @export
#'
#' @examples
#' gross_stock(1)
#' gross_stock(209999)
#' gross_stock(210000)
#' gross_stock(210000, by_halving = TRUE)
#' gross_stock(420000, by_halving = TRUE)
#' gross_stock(723896)
gross_stock <- function(block_height, by_halving = FALSE) {

  stopifnot(as.integer(block_height) == block_height)

  halvings <- as.integer(block_height %/% s2fr::halving_period)
  blocks_since_last_halving <- block_height %% s2fr::halving_period + 1

  coins_per_halving_period <- vapply(0:halvings, FUN.VALUE = double(1), FUN = function(i) {
    blocks <- ifelse(i == halvings, yes = blocks_since_last_halving, no = s2fr::halving_period)

    # Account for the unspendable genesis block coinbase.
    if (i == 0) {
      blocks <- blocks - 1
    }

    blocks * s2fr::max_block_subsidy * 2^(-i)
  })

  if (by_halving) {
    return(coins_per_halving_period)
  }
  sum(coins_per_halving_period)
}
