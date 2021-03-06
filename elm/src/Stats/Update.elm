module Stats.Update exposing (..)

import Http
import Stats.Models exposing (Model, Uptime, decoder)


getStats : Http.Request Model
getStats = Http.get "http://localhost:8080/stats" decoder


type Msg = Change (Result Http.Error Model)
         | Refresh

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
  Refresh ->
    (model, Http.send Change getStats)
  Change (Ok new) -> -- Swap out the entire thing
    (new, Cmd.none)
  Change (Err why) ->
    (model, Cmd.none)
