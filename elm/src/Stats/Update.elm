module Stats.Update exposing (..)

import Http
import Json.Decode as Decode exposing (..)
import Stats.Models exposing (Model)


getStats : Http.Request Model
getStats = Http.get "http://localhost:8080/stats" decodeStats

decodeStats : Decoder Model
decodeStats = Decode.map Model (field "processes" int)

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
