module Component.API exposing (..)

import Component.Model exposing (..)
import Json.Decode as Decode exposing (..)
import Json.Decode.Extra exposing (..)
import Json.Encode as Encode
import Time
import Task exposing (Task)
import HttpBuilder exposing (..)


-- HTTP GET REQUEST


getTasks : Cmd Msg
getTasks =
    HttpBuilder.get "http://localhost:4000/api/tasks"
        |> withHeader "Content-Type" "application/json"
        |> withTimeout (10 * Time.second)
        |> withCredentials
        |> send (jsonReader decodeTasks) stringReader
        |> Task.perform FetchFail FetchTasksSucceed


decodeTasks : Decoder MyTasks
decodeTasks =
    let
        task =
            succeed MyTask
                |: ("id" := int)
                |: ("title" := string)
                |: ("reference" := string)
                |: ("dateDelivery" := date)
    in
        at [ "data" ] (list task)

-- HTTP POST REQUEST

createUser : User -> Cmd Msg
createUser user =
    HttpBuilder.post "http://localhost:4000/api/users"
        |> withJsonBody (encodeUser user)
        |> withHeader "Content-Type" "application/json"
        |> withTimeout (10 * Time.second)
        |> withCredentials
        |> send stringReader (jsonReader errorsDecoder)
        |> Task.perform UpdateFail UpdateSucceed 


encodeUser : User -> Encode.Value
encodeUser user =
    Encode.object
        [ ( "username", Encode.string user.username )
        , ( "password", Encode.string user.password )
        , ( "name", Encode.string user.name )
        , ( "lastname", Encode.string user.lastname )
        , ( "email", Encode.string user.email )
        ]


errorsDecoder : Decoder Errors
errorsDecoder =
    at [ "errors" ] <| dict (list string)
