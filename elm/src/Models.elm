module Models exposing (..)

import Stats.Models as Stats
import Cache.Models as Cache

type View
    = StatsView
    | CacheView

type alias Model =
  { stats : Stats.Model
  , cache : Cache.Model
  , view : View
  }
