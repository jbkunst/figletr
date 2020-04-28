library(figletr)

data("fonts")

head(fonts, 10)

figlet()

figlet(Sys.Date())

figlet("Figlet in R!")

figlet("Hello")

figlet("Star Wars", "starwars")


# default font ------------------------------------------------------------
options(figletr.default_font = "mini")

figlet("Figlet in R!")

figlet("Hello")

options(figletr.default_font = "standard")


# using font as argument --------------------------------------------------
text <- "Figlet in R!"

figlet(text)

figlet(text, "banner")

figlet(text, "starwars")

figlet(text, "contessa")

figlet(text, "smkeyboard")

figlet(text, "poison")

figlet(text, "alligator2")

figlet(text, "term")

figlet_demo()


# change printer ----------------------------------------------------------
options(figletr.printer = cat)

figlet("Figlet in R!")

figlet("Hello")


# demo --------------------------------------------------------------------
fonts_list <- head(figletr::fonts$font, 30)

invisible(
  lapply(
    fonts_list,
    function(f){
      message("\n", f)
      try(figlet(text, f))
    }
  )
)


# extras ------------------------------------------------------------------
figletr:::CHARSET

cat(figletr:::CHARSET)

#   txt <- "32 (blank/space) 64 @             96  `
# 33 !             65 A             97  a
# 34 \"             66 B             98  b
# 35 #             67 C             99  c
# 36 $             68 D             100 d
# 37 %             69 E             101 e
# 38 &             70 F             102 f
# 39 '             71 G             103 g
# 40 (             72 H             104 h
# 41 )             73 I             105 i
# 42 *             74 J             106 j
# 43 +             75 K             107 k
# 44 ,             76 L             108 l
# 45 -             77 M             109 m
# 46 .             78 N             110 n
# 47 /             79 O             111 o
# 48 0             80 P             112 p
# 49 1             81 Q             113 q
# 50 2             82 R             114 r
# 51 3             83 S             115 s
# 52 4             84 T             116 t
# 53 5             85 U             117 u
# 54 6             86 V             118 v
# 55 7             87 W             119 w
# 56 8             88 X             120 x
# 57 9             89 Y             121 y
# 58 :             90 Z             122 z
# 59 ;             91 [             123 {
# 60 <             92 \             124 |
# 61 =             93 ]             125 }
# 62 >             94 ^             126 ~
# 63 ?             95 _"
#
#   dtxt <- readr::read_delim(txt, delim = " ", col_names = FALSE, quote = "")
#   dtxt <- dtxt[, c(2, 4, 6)]
#
#   txt <- tidyr::gather(dtxt)[[2]]
#   txt <- stringr::str_squish(txt)
#
# #   dput(txt)
#   ## 124 -> \\
#   ## 1st NA -> |
# char_set <- c(" ", "!", "\"", "#", "$", "%", "&", "'", "(", ")",
#               "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6",
#               "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C",
#               "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
#               "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\",
#               "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i",
#               "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
#               "w", "x", "y", "z", "{", "|", "}", "~")
#
# char_set <- c(char_set, c("Ä", "Ö", "Ü", "ä", "ö", "ü"))
#
# dput(stringi::stri_escape_unicode(c( "Ä", "Ö", "Ü", "ä", "ö", "ü")))
#
# dput(char_set)


