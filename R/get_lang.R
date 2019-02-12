#'Get language
#'
#'Detect language from a character string.
#'
#'Takes a character string, returns a data.frame with the available values.
#'@param query the character string you want to detect the language from.
#'@param api_key your API key.
#'@return Returns a data.frame with the detected languages, in descending order of probability. Values are : language_code, language_name, probability (length of the provided query text and how well it is identified as a language), percentage (confidence margin between multiple matches), and reliable_result (whether or not the API is completely confident about the main match).
#'@export
#'@importFrom httr GET
#'@importFrom utils URLencode
#'@note Before running a function of this package for the first time, you need to get your API key.
#'@examples
#'\dontrun{
#'get_lang(query = "I really really love R and that's a good thing, right?", api_key = "apikey")
#'}
#
get_lang <- function(query, api_key = NULL){
  
  check_internet()
  check_api_key(api_key)
  
  queryurl <- URLencode(query)
  
  url <- GET(paste0("http://apilayer.net/api/detect", "?access_key=", api_key, "&query=", queryurl))
  
  check_status_code(url)
  
  content <- json_raw_to_char(url)
  
  check_success(content)
  
  content <- content$results
  
  res <- do.call(rbind, lapply(content, function(obj){
    data.frame(query = query,
               language_code = obj$language_code %||% NA,
               language_name = obj$language_name %||% NA,
               probability = obj$probability %||% NA,
               percentage = obj$percentage %||% NA,
               reliable_result = obj$reliable_result %||% NA,
               stringsAsFactors = FALSE)
  }))
  
  as_tbl(res)
}

