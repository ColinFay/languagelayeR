#'Get supported languages
#'
#'Get all current available languages on the languagelayer API.
#'
#'Returns a data.frame with the available languages.
#'@param api_key Your API key.
#'@return Returns a data.frame with language_code and language_name.
#'@export
#'@note Before running a function of this package for the first time, you need to get your API key.
#'@examples
#'\dontrun{
#'get_supported_lang(api_key = "yourapikey")
#'}

get_supported_lang <- function(api_key= NULL){
  
  check_internet()
  
  check_api_key(api_key)
  
  url <- GET(paste0("http://apilayer.net/api/languages", "?access_key=", api_key))
  
  check_status_code(url)
  
  content <- json_raw_to_char(url)
  
  check_success(content)
  
  content <- content$language
  
  if(length(content) == 0) {
    warning("No Content")
    return(default()) 
  }
  
  res <- do.call(
    rbind, 
    lapply(content, function(obj){
      data.frame(
        language_code = obj$language_code %||% NA,
        language_name = obj$language_name %||% NA,
        stringsAsFactors = FALSE
      )
    })
  )
  
  as_tbl(res)
}


