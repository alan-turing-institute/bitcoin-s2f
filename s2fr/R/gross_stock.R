#' Gross stock
#'
#' Returns the gross stock of bitcoins for a given block height.
#'
#' @param block_height
#' The block height.
#'
#' @return The gross stock of bitcoins as an integer number of satoshis.
#'
#' @seealso \code{\link{execute_synthetic_experiment}}
#'
#' @export
#'
#' @examples
#' gross_stock(1)
#' gross_stock(100000)
#' gross_stock(723896)
gross_stock <- function(block_height) {

  halvings <- block_height %/% halving_period
  since_last_halving <- block_height %% halving_period

  # Not yet implemented.
  return(0)
}
