# Write a message with figlet fonts

Write a message with figlet fonts

## Usage

``` r
figlet(msg, font = getOption("figletr.default_font"))
```

## Arguments

- msg:

  The message. An object which can be converted to character.

- font:

  A string specifying the font to use, if is not and option in the
  available fonts (\`figletr::fonts\`) this parameter will be used as a
  path to use this with external figlet fonts.

## Examples

``` r

figlet(Sys.Date())
#>   ____     ___    ____     __              ___    _____           _   _____ 
#>  |___ \   / _ \  |___ \   / /_            / _ \  |___  |         / | |___ / 
#>    __) | | | | |   __) | | '_ \   _____  | | | |    / /   _____  | |   |_ \ 
#>   / __/  | |_| |  / __/  | (_) | |_____| | |_| |   / /   |_____| | |  ___) |
#>  |_____|  \___/  |_____|  \___/           \___/   /_/            |_| |____/ 
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
```
