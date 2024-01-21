module SimpleJSON (
    JVal(..)
  , getString
  , getInt
  , getDouble
  , getBool
  , getObject
  , getArray
  , isNull
) where

data JVal =
    JString String
  | JNumber Double
  | JBool Bool
  | JNull
  | JObject [(String, JVal)]
  | JArray [JVal]
  deriving (Eq, Ord, Show)

getString :: JVal -> Maybe String
getString (JString x) = Just x
getString _ = Nothing

getInt :: JVal -> Maybe Int
getInt (JNumber x) = Just (truncate x)
getInt _ = Nothing

getDouble :: JVal -> Maybe Double
getDouble (JNumber x) = Just x
getDouble _ = Nothing

getBool :: JVal -> Maybe Bool
getBool (JBool x) = Just x
getBool _ = Nothing

getObject :: JVal -> Maybe [(String, JVal)]
getObject (JObject x) = Just x
getObject _ = Nothing

getArray :: JVal -> Maybe [JVal]
getArray (JArray x) = Just x
getArray _ = Nothing

isNull :: JVal -> Bool
isNull x = x == JNull
