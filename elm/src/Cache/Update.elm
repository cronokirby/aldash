module Cache.Update exposing (..)

import Cache.Models exposing (Model)

type Msg
    = MemberInput (Maybe String)
    | IDInput (Maybe String)
    | FieldInput String

update : Msg -> Model -> Model
update msg model = case msg of
  MemberInput input ->
    { model | memberField = input }
  IDInput input ->
    { model | idField = input }
  FieldInput str ->
    { model | field = str }
