module Stats.View exposing (..)

import Html exposing (..)

import Stats.Models exposing ( Model )
import Stats.Update exposing ( Msg )

view : Model -> Html Msg
view model =
  div []
    [ text (toString model)
    ]
