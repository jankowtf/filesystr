\dontrun{

 path <- c(
  "dir_b/sub_1",
  "dir_b/sub_1/",
  "dir_b/sub_1/file.txt",
  "dir_b/sub_1/file.txt/",
  "dir_b/sub_1/notthere.txt",
  "dir_b/sub_1/notthere.txt/",
  "dir_b/noext",
  "dir_b/noext/",
  "dir_b/noext/file.txt",
  "dir_b/noext/file.txt/",
  "dir_b/noext/notthere.txt",
  "dir_b/noext/notthere.txt/"
)
path_dec <- decomposePath(path = path)
path_rec <- recomposePath(path = path_dec)
identical(path_rec, standardizePath(path))

path_rec <- recomposePath(path = path_dec, shortform = TRUE)
identical(path_rec, gsub("/$", "", path))

}
