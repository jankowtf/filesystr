\dontrun{

standardizePath()

path <- c(".", "./dir", "..", "../dir", "~", "~/file.txt", R.home(), 
            tempdir(), "nonex", "nonex/", "nonex/file.txt", 
            "nonex/file.txt/", "", NA)
standardizePath(path = path, sep = "\\")
try(standardizePath(path = path, sep = "notallowed"))
standardizePath(path = path, shortform = TRUE)

standardizePath(".")
standardizePath(path = character())
standardizePath(path = "")
standardizePath(path = NA_character_)

}
