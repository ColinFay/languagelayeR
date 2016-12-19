#'Set API Key
#'
#'Set your API key.
#'
#'Takes a character string containing your API key.
#'@param apikey You can find your API key on your dashboard at \url{https://languagelayer.com/dashboard}.
#'@export
#'@examples
#'setApiKey(apikey = "yourapikey")

setApiKey <- function(apikey){
  options(apikey = apikey)
}


