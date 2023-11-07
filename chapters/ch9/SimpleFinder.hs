import RecursiveContents (getRecursiveContents)

simpleFind p dir = do
  names <- getRecursiveContents dir
  return (filter p names)

