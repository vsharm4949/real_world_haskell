import RecursiveContents (getRecursiveContents)

main = do
  childDirs <- getRecursiveContents "/Users/vsharm/Desktop/Practice/sandbox/languages/haskell/real_world/chapters/ch9"
  print childDirs
