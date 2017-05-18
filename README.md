languagelayeR is now on [CRAN](https://CRAN.R-project.org/package=languagelayeR)

# languagelayerR

This package is designed to detect a language from a character string in R by acessing the languagelayer API — https://languagelayer.com/

## Language layer API 

This package offers a language detection tool by connecting to the languagelayer API, a JSON interface designed to extract language information from a character string. 

## Install languagelayerR

Install this package directly in R : 

```{r}
devtools::install_github("ColinFay/languagelayerR")
```

## How languagelayeR works

The version 1.0.0 works with three functions. Which are :  

* `getLanguage` Get language information from a character string

* `getSupportedLanguage` Get all current accessible languages on the languagelayer API

* `setApiKey` Set your API key to access the languagelayer API

## First of all

Before any request on the languagelayer, you need to set your API key for your current session. Use the function `setApiKey(apikey = "yourapikey")`. 

You can get your api key on your languagelayer [dashboard](https://languagelayer.com/dashboard).

## Examples 

### getLanguage 

Detect a language from a character string. 

```{r}
getLanguage(query = "I really really love R and that's a good thing, right?")
```

### getSupportedLanguage 

List all the languages available on the languagelayer API. 

```{r}
getSupportedLanguage()
```

### Contact

Questions and feedbacks [welcome](mailto:contact@colinfay.me) !
