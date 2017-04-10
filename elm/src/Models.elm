module Models exposing (..)

import Stats.Models as Stats

type View = StatsView

type alias Model =
  { stats : Stats.Model
  , view : View
  }
