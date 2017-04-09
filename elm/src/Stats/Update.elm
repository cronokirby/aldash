module Stats.Update exposing (..)

import Http
import Json.Decode as Decode exposing (..)
import Stats.Models exposing (Model)


type alias Statinfo = { processes : Int }

getStats : Http.Request Statinfo
getStats = Http.get "localhost:8080/stats" decodeStats

decodeStats : Decoder Statinfo
decodeStats = Decode.map Statinfo (field "processes" int)

type Msg = Change (Result Http.Error Statinfo)
         | Refresh

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
  Refresh ->
    (model, Http.send Change getStats)
  Change (Ok new) -> -- Swap out the old number
    ({ model | processes = new.processes }, Cmd.none)
  Change (Err _) ->
    (model, Cmd.none)
