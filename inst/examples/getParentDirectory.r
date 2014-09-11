\dontrun{

path <- c(getwd(), R.home())

getParentDirectory(path = path)
getParentDirectory(path = path, up = 2)
getParentDirectory(path = path, up = 3)
getParentDirectory(path = path, up = c(1,4))

path <- "c:/Windows"
getParentDirectory(path = path, up = 2)
try(getParentDirectory(path = path, up = 3))

}
