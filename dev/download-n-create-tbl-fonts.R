# packages ----------------------------------------------------------------
library(tidyverse)
library(rvest)

# parameters --------------------------------------------------------------
URL <- "http://www.figlet.org"

html <- read_html(paste0(URL, "/fontdb.cgi"))

# main table --------------------------------------------------------------
fonttbl <- html %>%
  html_table() %>%
  nth(2)

fonttbl

names(fonttbl) <- as.matrix(fonttbl[1, ])

fonttbl <- fonttbl[-1, ]

fonttbl[] <- lapply(fonttbl, function(x) type.convert(as.character(x)))

fonttbl <- mutate_all(fonttbl, as.character)

fonttbl <- as_tibble(fonttbl)

fonttbl <- janitor::clean_names(fonttbl)


fonttbl


# download ----------------------------------------------------------------
fontfiles <- html %>%
  html_nodes("table") %>%
  nth(2) %>%
  html_nodes("tr") %>%
  html_node("td") %>% #1st column
  html_nodes("a") %>%
  html_attr("href") %>%
  str_extract("font=.*") %>%
  str_remove("font=")

fontfiles %>%
  walk(function(font = "lean.flf"){

    message(font)

    url_font <- paste(URL, "fonts", font, sep = "/")
    pth_font <- paste("inst", "fonts", font, sep = "/")

    if(!file.exists(pth_font)) download.file(url_font, pth_font)

  })

fonttbl2 <- fontfiles %>%
  map_df(function(font = "lean.flf"){

    message(font)

    # url_font <- paste(URL, "fonts", font, sep = "/")
    pth_font <- paste("inst", "fonts", font, sep = "/")

    finfo <- figletr::font_info(pth_font)

    finfo %>%
      as.data.frame() %>%
      rownames_to_column() %>%
      janitor::clean_names() %>%
      spread(rowname, x) %>%
      add_column(font = str_remove(basename(font), "\\.flf"), .after = 0) %>%
      as_tibble()

  })

# export ------------------------------------------------------------------
fonts <- left_join(fonttbl2, fonttbl, by = c("font" = "font_name"))

usethis::use_data(fonts, overwrite = TRUE)

