\dontrun{

path <- c(
  ".",
  "..",
  "dir_a", 
  "dir_a/",
  "dir_b", 
  "dir_b/sub_1",
  "dir_b/sub_1/file.txt",
  "dir_b/sub_1/file.txt/",
  "dir_b/nonex",
  "dir_b/nonex/",
  "dir_b/nonex/file.txt",
  "nonex",
  "nonex/sub_1",
  "nonex/sub_1/file.txt",
  "nonex/foo.tgz", 
  "another nonex\\file.tar.gz", 
  "a_file", 
  "quux. quuux.tbz2", 
  "~/file.tar.xz",
  "", 
  NA_character_
)
getFileName(path = path)
getFileName(path = character())
getFileName()

}
