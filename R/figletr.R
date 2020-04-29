CHARSET <- c(" ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+",
             ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8",
             "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E",
             "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
             "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^",
             "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
             "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
             "y", "z", "{", "|", "}", "~",
             # "Ä", "Ö", "Ü", "ä", "ö", "ü"
             # "\\u00c4", "\\u00d6", "\\u00dc", "\\u00e4", "\\u00f6", "\\u00fc"
             stringi::stri_unescape_unicode(
               c("\\u00c4", "\\u00d6", "\\u00dc", "\\u00e4", "\\u00f6", "\\u00fc")
               )
             )

CHARSET_LENGTH <- length(CHARSET)

#' @title Parse the header of a figlet font
#' @param path The font path.
#' @importFrom  stats setNames
#' @export
font_info <- function(path = "inst/fonts/basic.flf") {

  FONT_INFO <- c(
    # "signature",
    # "hardblank",
    "heigth",
    "baseline",
    "max_length",
    "old_layout",
    "comment_lines",
    "print_direction",
    "full_layout",
    "codetag_count"
  )

  ptrn <- "^flf2a\\$|^flf2a\177|^flf2a&|^flf2a%|^flf2a.{1}"

  header <- readLines(path, n = 1L)

  header_aux <- stringr::str_extract(header, ptrn)

  header <- stringr::str_remove(header, ptrn)

  header <- stringr::str_split(stringr::str_squish(header), " ", simplify = TRUE)

  header <- as.numeric(header)[1:5]

  header <- stats::setNames(header, FONT_INFO[1:5])

  header

}

#' @title Parse figlet fonts
#' @param path The font path.
#' @return A named list which every elements is a character in the figlet font.
#' @source \url{http://www.jave.de/figlet/figfont.html}
#' @export
parse_font <- function(path = "inst/fonts/basic.flf"){

  # path <- "inst/fonts/pyramid.flf"

  fontsrc <- readLines(path)

  header <- font_info(path)

  # source: comments + header
  fontsrc <- fontsrc[(header["comment_lines"] + 1 + 1):length(fontsrc)]

  limit <- CHARSET_LENGTH * header["heigth"]

  # main charset
  fontsrc_ori <- fontsrc[1:limit]

  if(header["heigth"] != 1) {
    fontsrc_ori <- stringr::str_sub(fontsrc_ori, 1, nchar(fontsrc_ori) - rep(c(rep(1, header["heigth"] - 1), 2), CHARSET_LENGTH))
  } else {
    fontsrc_ori <- stringr::str_sub(fontsrc_ori, 1, nchar(fontsrc_ori) - 1)
  }

  fontsrc_ori <- stringr::str_replace_all(fontsrc_ori, "\\$", " ")

  fontsrc_ori <- split(fontsrc_ori, rep(1:CHARSET_LENGTH, each = header["heigth"]))

  fontsrc_ori <- setNames(fontsrc_ori, CHARSET)

  # fontsrc_ext <- fontsrc[(limit + 1):length(fontsrc)]

  font <- fontsrc_ori

  font

}

#' @title Write a message with figlet fonts
#' @param msg The message. An object which can be converted to character.
#' @param font A string specifying the font to use, if is not and option in the
#'   available fonts (`figletr::fonts`) this parameter will be used as a path to
#'   use this with external figlet fonts.
#' @examples
#'
#' figlet(Sys.Date())
#'
#' text <- "Figlet in R!"
#'
#' figlet(text)
#'
#' figlet(text, "banner")
#'
#' @export
figlet <- function(msg, font = getOption("figletr.default_font")) {

  msg <- as.character(msg)

  stopifnot(is.character(msg))

  path <- system.file(paste0("fonts/", font, ".flf"), package = "figletr")

  if(!file.exists(path)){

    path <- font

  }

  font <- parse_font(path)

  out <- unlist(stringr::str_split(msg, ""))

  out <- font[out]

  out <- as.matrix(as.data.frame(out))

  out <- apply(out, 1, stringr::str_c, sep = "", collapse = "")

  printer <- getOption("figletr.printer")

  if(!identical(printer, message)) {

    out <- paste0(out, "\n")

  }

  invisible(lapply(out, printer))

}

#' @title Test and show the available fonts in the package
#' @param msg A string to test the fonts
#' @export
figlet_demo <- function(msg = "Figlet in R!"){

  fonts_list <- figletr::fonts[["font"]]

  invisible(
    lapply(
      fonts_list,
      function(f){
        message("\n", f)
        try(figlet(msg, f))
      }
    )
  )

}

.onLoad <- function(libname = find.package("figletr"), pkgname = "figletr") {

  options(
    figletr.printer = message,
    figletr.default_font = "standard"
  )
}
