module Cache.Models exposing (..)

-- Guaranteed to be correct because of the dropdown selection
type alias Member = String

-- Same shtick here
type alias Identifier = String

type alias Model =
    { memberField : Maybe Member
    , idField : Maybe Identifier
    , field : String
    }

init : Model
init = Model Nothing Nothing ""

stringToMaybe : String -> Maybe String
stringToMaybe str = case str of
  "None" -> Nothing
  str    -> Just str
