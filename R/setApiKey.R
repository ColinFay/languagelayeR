#'Set API Key
#'
#'Set your API key to access the languagelayer API
#'
#'Takes a character string containing your API key.
#'@param apikey the API key you can get from your languagelayer dashboard at \url{https://languagelayer.com/dashboard}.
#'@export
#'@examples
#'setApiKey(apikey = "yourapikey")

setApiKey <- function(apikey){
  options(apikey = apikey)
}


