#Use data raw
devtools::use_data_raw()

#Use testthat

devtools::use_testthat()

#Use news 

devtools::use_build_ignore("NEWS.md")

#Use vignette

devtools::use_vignette("Introduction")
devtools::build_vignettes()
