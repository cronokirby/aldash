module View exposing (..)

import Html exposing (..)

import Stats.View as Stats

import Models exposing (Model, View(..))
import Update exposing (Msg(..))


navBar : Html Msg
navBar =
  ul []
   [ li [] [ text "Cache" ]
   , li [] [ text "Statistics" ]
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
