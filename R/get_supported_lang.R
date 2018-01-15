#'Get supported languages
#'
#'Get all current available languages on the languagelayer API.
#'
#'Returns a data.frame with the available languages.
#'@param api_key Your API key.
#'@return Returns a data.frame with language_code and language_name.
#'@export
#'@note Before running a function of this package for the first time, you need to set your API key.
#'@examples
#'get_supported_lang(api_key = "yourapikey")

get_supported_lang <- function(api_key= NULL){
  internet <- has_internet()
  stop_if_not(.x = internet, msg = "Please check your internet connexion")
  default <- data.frame(language_code = vector("character"),
                        language_name = vector("character"),
                        stringsAsFactors = FALSE)
  if(is.null(api_key)){
    warning("You need to enter you API key first. Please use the setApiKey function.")
    return(identity) 
  } else {
    url <- GET(paste0("http://apilayer.net/api/languages", "?access_key=", api_key))
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
        content <- content$language
        if(length(content) == 0) {
          warning("No Content")
          identity <- default
        } else {
          identity <- do.call(rbind, lapply(content, function(obj){
            data.frame(language_code = obj$language_code %||% NA,
                       language_name = obj$language_name %||% NA,
                       stringsAsFactors = FALSE)
          }))
        }
      }
    }
    return(identity)
  }
}


