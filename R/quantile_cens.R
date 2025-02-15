#' Calculate quantiles respecting the censored data
#' 
#' @param x data
#' @param p quantile
#' @param limit censoring limit
#' @param cens censoring direction (left/right)
#' @param ... other arguments to be passed
#' @export
#' 
quantile_cens <- function(x, p = 0.5, limit = 1, cens = "left", ...) {
  if (cens %in% c("left", "lower", "bloq", "loq", "lloq")) {
    x[is.na(x)] <- -Inf
    x[x < limit] <- -Inf
  }
  else {
    x[is.na(x)] <- Inf
    x[x > limit] <- Inf
  }
  q <- quantile(x, p, ...)
  ifelse(q %in% c(Inf, -Inf), NA, q)
}
