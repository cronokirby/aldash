module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Stats.View as Stats
import Cache.View as Cache

import Models exposing (Model, View(..))
import Update exposing (Msg(..))


navBar : Html Msg
navBar =
  ul [ class "nav-bar" ]
   [ button [onClick <| ChangeView CacheView] [text "Cache"]
   , button [onClick <| ChangeView StatsView] [text "Statistics"]
   ]

view : Model -> Html Msg
view model =
  let sectionView = case model.view of
    StatsView ->
      Html.map Stats << Stats.view << .stats
    CacheView ->
      Html.map Cache << Cache.view << .cache
  in div []
       [ navBar
       , sectionView model
       ]
