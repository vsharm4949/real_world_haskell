data BookInfo = Book Int String [String]
    deriving (Show)

myBook = Book 123456789 "Man and His Symbols" ["Carl Jung", "Louise von Franz"]

fromMaybe defval wrapped =
    case wrapped of
      Nothing -> defval
      Just x -> x

