#Use data raw
devtools::use_data_raw()

#Use testthat

devtools::use_testthat()

#Use news 

devtools::use_build_ignore("NEWS.md")
devtools::use_build_ignore("README.md")

#Use vignette

devtools::use_vignette("Introduction")
devtools::build_vignettes()

# Use pkg 

devtools::use_package("attempt")
devtools::use_package("curl")

# random 

library(usethis)

use_testthat()
use_mit_license()
use_readme_rmd()
use_code_of_conduct()
use_travis()
use_coverage()
