module Cache.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Cache.Models exposing (Model, stringToMaybe)
import Cache.Update exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "cache-div" ]
    [ text "Search for"
    , select [ onInput (MemberInput << stringToMaybe) ]
      (List.map (\s -> option [] [text s])
        [ "None", "Members", "Roles", "Presences", "VoiceStates"
        , "Emojis", "Channels", "Guilds", "PrivateChannels"
        ])
    , text "where"
    , select [ onInput (IDInput << stringToMaybe) ]
      (List.map (\s -> option [] [text s])
       [ "None", "ID", "Name" ])
    , text "is"
    , input [ onInput FieldInput ] []
    ]
