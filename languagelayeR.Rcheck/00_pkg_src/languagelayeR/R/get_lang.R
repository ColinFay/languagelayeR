#'Get language
#'
#'Detect language from a character string.
#'
#'Takes a character string, returns a data.frame with the available values.
#'@param query the character string you want to detect the language from.
#'@param api_key your API key.
#'@return Returns a data.frame with the detected languages, in descending order of probability. Values are : language_code, language_name, probability (length of the provided query text and how well it is identified as a language), percentage (confidence margin between multiple matches), and reliable_result (whether or not the API is completely confident about the main match).
#'@export
#'@importFrom magrittr %>%
#'@importFrom httr GET
#'@importFrom rjson fromJSON
#'@note Before running a function of this package for the first time, you need to set your API key using the \code{\link{setApiKey}} function.
#'@examples
#'get_lang(query = "I really really love R and that's a good thing, right?", api_key = "apikey")

get_lang <- function(query, api_key = NULL){
  . <- NULL
  default <- data.frame(language_code = vector("character"),
                        language_name = vector("character"),
                        probability = vector("character"),
                        percentage = vector("character"),
                        reliable_result = vector("character"),
                        stringsAsFactors = FALSE)
  queryurl <- gsub(" ", "%20", query)
  if(is.null(is.null(api_key))){
    warning("You need to enter your API key.")
    identity <- default
  } else {
    url <- GET(paste0("http://apilayer.net/api/detect", "?access_key=", api_key, "&query=", queryurl))
    if (url$status_code != 200){
      warning("URL returned status code: ", url$status_code)
      identity <- default
    } else {
      content <- rjson::fromJSON(rawToChar(url$content))
      if(content$success == FALSE){
        content <- content$error
        warning("API error, code: ",  content$code, " ", content$type, " ", content$info)
        identity <-  default
      } else {
        content <- content$results
        if(length(content) == 0) {
          warning("No Content for that string (was ", query,")")
          identity <- default
        } else {
          identity <- lapply(content, function(obj){
            data.frame(query = query,
                       language_code = obj$language_code %||% NA,
                       language_name = obj$language_name %||% NA,
                       probability = obj$probability %||% NA,
                       percentage = obj$percentage %||% NA,
                       reliable_result = obj$reliable_result %||% NA,
                       stringsAsFactors = FALSE)
          }) %>% do.call(rbind, .)
        }
      }
    }
  }
  return(identity)
}



#' Deprecated version of get_lang
#' 
#' This function has been replaced by \code{get_lang}. Will be removed
#' in the next version of the package.
#'
#' @param ... passes args to get_lang. Here for backward compatibility
#'
#' @export


getLanguage <- function(...){
  .Deprecated("get_lang")
  get_lang(...)
}

