module Stats.Update exposing (..)

import Stats.Models exposing (Model)

type Msg = Change Int -- Indicates a change in the number of processes

update : Msg -> Model -> Model
update msg model = case msg of
  Change new -> -- Swap out the old number
    { model | processes = new }
