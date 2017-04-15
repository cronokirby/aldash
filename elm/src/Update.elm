module Update exposing (..)

import Stats.Update as Stats
import Models exposing (Model)


type Msg
    = Stats Stats.Msg
    | NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Stats msg -> -- Delegate and update the portion
          let (stats, cmd) = Stats.update msg model.stats
          in ({ model | stats = stats }, Cmd.map Stats cmd)
        NoOp ->
          (model, Cmd.none)
