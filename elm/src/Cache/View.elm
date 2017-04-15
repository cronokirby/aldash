module Cache.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Cache.Models exposing (Model)
import Cache.Update exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "cache-div" ]
    [ select [] []

    ]
