module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text, Html)

import Stats.Models as Stats

import Models exposing (Model, View(..))
import Update exposing (Msg, update)
import View exposing (view)


init : (Model, Cmd Msg)
init = (Model Stats.init StatsView, Cmd.none)

main : Program Never Model Msg
main = Html.program { init = init
                    , view = view
                    , update = update
                    , subscriptions = subscriptions
                    }

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none
