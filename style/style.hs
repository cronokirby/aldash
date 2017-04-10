{-# LANGUAGE OverloadedStrings #-}

import Clay
import qualified Data.Text.Lazy.IO as T


main :: IO () -- Write the text as compact css
main = T.writeFile "../build/index.css" $
         renderWith compact [] myStylesheet

-- Main style sheet
myStylesheet :: Css
myStylesheet = body ? background lightslategray
