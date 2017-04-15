module Cache.Models exposing (..)

type Member
    = Member
    | Guild
    | Channel
    | PrivateChannel
    | Role
    | VoiceState
    | Presence
    | Emoji

type Identifier
    = Name
    | ID

type InputField
    = None
    | MemberField Member
    | IDField Identifier
    | Invalid

type alias Model =
    { memberField : InputField
    , idField : InputField
    }

init : Model
init = Model None None
