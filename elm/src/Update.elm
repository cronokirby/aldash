module Update exposing (..)

import Stats.Update as Stats

import Models exposing ( Model )

type Msg = Stats Stats.Msg

update : Msg -> Model -> Model
update msg model = case msg of
  Stats msg ->
    let stats = Stats.update msg model.stats
    in { model | stats = stats }
