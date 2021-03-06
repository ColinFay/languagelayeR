
<!-- README.md is generated from README.Rmd. Please edit that file -->

languagelayeR is now on
[CRAN](https://CRAN.R-project.org/package=languagelayeR)

[![Travis build
status](https://travis-ci.org/ColinFay/languagelayeR.svg?branch=master)](https://travis-ci.org/ColinFay/languagelayeR)
[![Coverage
status](https://codecov.io/gh/ColinFay/languagelayeR/branch/master/graph/badge.svg)](https://codecov.io/github/ColinFay/languagelayeR?branch=master)

# languagelayerR

This package is designed to detect a language from a character string in
R by acessing the languagelayer API — <https://languagelayer.com/>

## Language layer API

This package offers a language detection tool by connecting to the
languagelayer API, a JSON interface designed to extract language
information from a character string.

## Install languagelayerR

Install this package directly in R :

From CRAN :

``` r
install.packages("languagelayeR")
```

From Github :

``` r
devtools::install_github("ColinFay/languagelayeR")
```

## How languagelayeR works

The version 1.1.0 works with two functions. Which are :

  - `get_lang` Get language information from a character string

  - `get_supported_lang` Get all current accessible languages on the
    languagelayer API

## First of all

Before any request on the languagelayer, you need to get your API key
from your language layer
[dashboard](https://languagelayer.com/dashboard).

## Examples

### getLanguage

Detect a language from a character
string.

``` r
get_lang(query = "I really really love R and that's a good thing, right?", api_key = "your_api_key")
```

### getSupportedLanguage

List all the languages available on the languagelayer API.

``` r
get_supported_lang(api_key = "your_api_key")
```

### Contact

Questions and feedbacks [welcome](mailto:contact@colinfay.me) \!

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
