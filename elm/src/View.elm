module View exposing (..)

import Html exposing (..)

import Stats.View as Stats

import Models exposing (Model)
import Update exposing (Msg(..))

view : Model -> Html Msg
view model =
  div []
    [ Html.map Stats <| Stats.view model.stats
    ]
