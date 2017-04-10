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
           , cell td <| toString model.processes
           , cell td <| toString model.totalMem
           ]
        , tr []
          [ cell th "IO input"
          , cell th "Process Memory"
          , cell th "Code Memory"
          ]
        , tr []
          [ cell td <| toString model.io.input
          , cell td <| toString model.procMem
          , cell td <| toString model.codeMem
          ]
        , tr []
          [ cell th "IO output"
          , cell th "ETS memory"
          , cell th "Atom memory"
          ]
        , tr []
          [ cell td <| toString model.io.output
          , cell td <| toString model.etsMem
          , cell td <| toString model.atomMem
          ]
        ]
    , button [ onClick Refresh ] [ text "refresh" ]
    ]
