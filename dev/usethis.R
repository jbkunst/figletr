usethis::create_package()

usethis::use_package("stats")

usethis::use_build_ignore("dev")

options(usethis.full_name = "Joshua Kunst")

usethis::use_mit_license()


DESC <- desc::description$new(file = "DESCRIPTION")

DESC

DESC$set_authors(
  person(
    given = "Joshua",
    family = "Kunst",
    email = "jbkunst@gmail.com",
    role = c("aut", "cre")
  )
)

DESC$write()
