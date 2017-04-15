module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Stats.View as Stats

import Models exposing (Model, View(..))
import Update exposing (Msg(..))


navBar : Html Msg
navBar =
  ul [ class "nav-bar" ]
   [ button [onClick NoOp] [text "Cache"]
   , button [onClick NoOp] [text "Statistics"]
   ]

view : Model -> Html Msg
view model =
  let sectionView = case model.view of
    StatsView ->
      Html.map Stats << Stats.view << .stats
  in div []
       [ navBar
       , sectionView model
       ]
