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
           [ cell th "Processes"
           , cell th "Uptime"
           ]
        , tr []
           [ cell td <| toString model.processes
           , cell td <| formatUptime model.uptime
           ]
        ]
    , button [ onClick Refresh ] [ text "refresh" ]
    ]
