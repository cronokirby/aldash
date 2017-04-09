module Stats.Update exposing (..)

import Stats.Models exposing (Model)

type Msg = Change Int

update : Msg -> Model -> Model
update msg model = case msg of
  Change new ->
    { model | processes = new }
