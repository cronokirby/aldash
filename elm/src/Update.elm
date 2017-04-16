module Update exposing (..)

import Stats.Update as Stats
import Cache.Update as Cache
import Models exposing (Model, View(..))


type Msg
    = Stats Stats.Msg
    | Cache Cache.Msg
    | ChangeView View

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Stats msg -> -- Delegate and update the portion
          let (stats, cmd) = Stats.update msg model.stats
          in ({ model | stats = stats }, Cmd.map Stats cmd)
        Cache msg -> -- Delegation again
          let cache = Cache.update msg model.cache
          in ({ model | cache = cache }, Cmd.none)
        ChangeView view ->
          ({ model | view = view }, Cmd.none)
