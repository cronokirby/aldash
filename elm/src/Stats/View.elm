module Stats.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import List exposing (..)

import Stats.Models exposing (Model, Uptime)
import Stats.Update exposing (Msg(..))


formatUptime : Uptime -> String
formatUptime {days, hours, minutes} =
  foldr (++) "" <|
    map2 (\a b -> if a == 0 then ""
                  else toString a ++ b)
         [days, hours, minutes]
         ["d ", "h ", "m"]

cell : (List (Attribute msg) -> List (Html msg) -> Html msg) ->
       String -> Html msg
cell f x = f [] [Html.text x]

memCell : String -> a -> Html Msg
memCell mem a = cell td <| toString a ++ mem

mbCell : a -> Html Msg
mbCell = memCell " MB"

kbCell : a -> Html Msg
kbCell = memCell " KB"

view : Model -> Html Msg
view model =
  div []
    [ table []
        [ tr []
           [ cell th "Uptime"
           , cell th "Processes"
           , cell th "Total Memory"
           ]
        , tr []
           [ cell td <| formatUptime model.uptime
           , mbCell model.processes
           , mbCell model.totalMem
           ]
        , tr []
          [ cell th "IO input"
          , cell th "Process Memory"
          , cell th "Code Memory"
          ]
        , tr []
          [ mbCell model.io.input
          , mbCell model.procMem
          , mbCell model.codeMem
          ]
        , tr []
          [ cell th "IO output"
          , cell th "ETS memory"
          , cell th "Atom memory"
          ]
        , tr []
          [ mbCell model.io.output
          , kbCell model.etsMem
          , kbCell model.atomMem
          ]
        ]
    , button [ onClick Refresh ] [ text "refresh" ]
    ]
