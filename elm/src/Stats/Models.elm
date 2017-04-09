module Stats.Models exposing (..)

import Json.Decode exposing (..)

type alias Uptime =
    { days : Int
    , hours : Int
    , minutes : Int
    }

type alias Model =
    { processes : Int
    , uptime : Uptime
    }

init : Model
init = Model 0 (Uptime 0 0 0)

decoder : Decoder Model
decoder =
  map2 Model
    (field "processes" int)
    (field "uptime" uptime)

uptime : Decoder Uptime
uptime =
  map3 Uptime
    (field "d" int)
    (field "h" int)
    (field "m" int)
