`%||%` <- function(a,b) if(is.null(a)) b else a

#'@importFrom curl has_internet
#'@importFrom attempt stop_if_not
check_internet <- function(){
  stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}

default <- function(){
  data.frame(language_code = vector("character"),
             language_name = vector("character"),
             stringsAsFactors = FALSE)
}

#'@importFrom attempt stop_if
check_api_key <- function(api_key){
  stop_if(api_key, is.null, "You need to set an API key.")
}

#'@importFrom attempt stop_if
check_status_code <- function(url){
  stop_if(url$status_code, ~ .x != 200, "You need to set an API key.")
}


#' @importFrom jsonlite fromJSON
json_raw_to_char <- function(url){
  fromJSON(rawToChar(url$content))
}

#'@importFrom attempt stop_if_not
check_success <- function(content){
  stop_if_not(content$success, msg = "You need to set an API key.")
}

#' @importFrom stats setNames
clean_names <- function(x){
  old_names <- gsub("\\.", "_", tolower(names(x)))
  setNames(x, old_names)
}

as_tbl <- function(x){
  x <- as.data.frame(x, stringsAsFactors = FALSE)
  structure(clean_names(x), class = c("tbl_df", "tbl", "data.frame"))
}
