module Stats.Models exposing (..)

import Json.Decode exposing (..)

type alias Uptime =
    { days : Int
    , hours : Int
    , minutes : Int
    }

type alias IO =
  { input : Int
  , output : Int
  }

type alias Model =
    { uptime : Uptime
    , processes : Int
    , totalMem : Int
    , procMem : Int
    , codeMem : Int
    , etsMem : Int
    , atomMem : Int
    , io : IO
    }

init : Model
init = Model (Uptime 0 0 0) 0 0 0 0 0 0 (IO 0 0)

decoder : Decoder Model
decoder =
  map8 Model
    (field "uptime" uptime)
    (field "processes" int)
    (field "totalmem" int)
    (field "procmem" int)
    (field "codemem" int)
    (field "ETSmem" int)
    (field "atmem" int)
    (field "io" io)


io : Decoder IO
io =
  map2 IO
  (field "input" int)
  (field "output" int)

uptime : Decoder Uptime
uptime =
  map3 Uptime
    (field "d" int)
    (field "h" int)
    (field "m" int)
