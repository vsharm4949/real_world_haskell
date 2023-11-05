module RecursiveContents (getChildDirs, getDirChildren, getRecursiveContents) where

import Control.Monad (forM)
import System.Directory (doesDirectoryExist, getDirectoryContents)
import System.FilePath ((</>))

getDirChildren :: FilePath -> IO [FilePath]

getDirChildren dir = do
  names <- getDirectoryContents dir
  return (filter (`notElem` [".", ".."]) names)

getChildDirs :: FilePath -> IO [FilePath]

getChildDirs dir = do
  children <- getDirChildren dir
  childDirs <- forM children $ \child -> do
    let path = dir </> child
    isDir <- doesDirectoryExist path
    if isDir then return [path] else return []
  return (concat childDirs)

getRecursiveContents :: FilePath -> IO [FilePath]

getRecursiveContents dir = do
  children <- getDirChildren dir
  paths <- forM children $ \child -> do
    let path = dir </> child
    isDir <- doesDirectoryExist path
    if isDir
      then getRecursiveContents path
      else return [path]
  return (dir : concat paths)



