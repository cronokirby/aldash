module Cache.Update exposing (..)

import Cache.Models exposing (Model, InputField(..))

type Msg
    = Input String (Model -> InputField)

update : Msg -> Model -> Model
update msg model = case msg of
  Input str access ->
    model
