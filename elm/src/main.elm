module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text, Html)

import Stats.Models as Stats

import Models exposing (Model)
import Update exposing (Msg, update)
import View exposing (view)


init : Model
init = Model Stats.init

main : Program Never Model Msg
main = beginnerProgram { model = init, view = view, update = update }
