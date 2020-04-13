
<!-- README.md is generated from README.Rmd. Please edit that file -->

# figletr

<!-- badges: start -->

<!-- badges: end -->

The goal of figletr is to …

## Installation

You can install the released version of figletr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("figletr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jbkunst/figletr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(figletr)

figlet(Sys.Date())
#>   ____     ___    ____     ___             ___    _  _             _   _____
#>  |___ \   / _ \  |___ \   / _ \           / _ \  | || |           / | |___ /
#>    __) | | | | |   __) | | | | |  _____  | | | | | || |_   _____  | |   |_ \
#>   / __/  | |_| |  / __/  | |_| | |_____| | |_| | |__   _| |_____| | |  ___) |
#>  |_____|  \___/  |_____|  \___/           \___/     |_|           |_| |____/
#> 

text <- "Figlet in R!"

figlet(text)
#>   _____   _           _          _       _             ____    _
#>  |  ___| (_)   __ _  | |   ___  | |_    (_)  _ __     |  _ \  | |
#>  | |_    | |  / _` | | |  / _ \ | __|   | | | '_ \    | |_) | | |
#>  |  _|   | | | (_| | | | |  __/ | |_    | | | | | |   |  _ <  |_|
#>  |_|     |_|  \__, | |_|  \___|  \__|   |_| |_| |_|   |_| \_\ (_)
#>               |___/

figlet(text, "banner")
#>  #######                                                       ######   ###
#>  #        #   ####   #       ######  #####      #  #    #      #     #  ###
#>  #        #  #    #  #       #         #        #  ##   #      #     #  ###
#>  #####    #  #       #       #####     #        #  # #  #      ######    #
#>  #        #  #  ###  #       #         #        #  #  # #      #   #
#>  #        #  #    #  #       #         #        #  #   ##      #    #   ###
#>  #        #   ####   ######  ######    #        #  #    #      #     #  ###
#> 

figlet(text, "starwars")
#>  _______  __    _______  __       _______ .___________.    __  .__   __.    .______       __
#> |   ____||  |  /  _____||  |     |   ____||           |   |  | |  \ |  |    |   _  \     |  |
#> |  |__   |  | |  |  __  |  |     |  |__   `---|  |----`   |  | |   \|  |    |  |_)  |    |  |
#> |   __|  |  | |  | |_ | |  |     |   __|      |  |        |  | |  . `  |    |      /     |  |
#> |  |     |  | |  |__| | |  `----.|  |____     |  |        |  | |  |\   |    |  |\  \----.|__|
#> |__|     |__|  \______| |_______||_______|    |__|        |__| |__| \__|    | _| `._____|(__)
#> 

figlet(text, "trek")
#>      dBBBBP     dBP     dBBBBb     dBP     dBBBP   dBBBBBBP             dBP     dBBBBb           dBBBBBb      dBP
#>                                                                                    dBP               dBP     dBP
#>    dBBBP      dBP     dBBBB      dBP     dBBP       dBP               dBP     dBP dBP            dBBBBK'    dBP
#>   dBP        dBP     dB' BB     dBP     dBP        dBP               dBP     dBP dBP            dBP  BB    dBP
#>  dBP        dBP     dBBBBBB    dBBBBP  dBBBBP     dBP               dBP     dBP dBP            dBP  dB'
#>                                                                                                          dBP
```
