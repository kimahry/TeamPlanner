module Component.Update exposing (..)

import Component.Model exposing (..)
import Component.API exposing (..)
import HttpBuilder exposing (..)
import Material
import Material.Snackbar as Snackbar 


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case Debug.log "cas" msg of
        -- Boilerplate: Mdl action handler.
        MDL msg' ->
            Material.update msg' model

        UpdateUser subMsg input ->
            ( (updateUser model subMsg input), Cmd.none )

        LoadTask ->
            ( model, getTasks )
        
        FetchTasksSucceed msg ->
            ( { model | tasks = msg.data }, Cmd.none )

        FetchFail msg ->
            model ! [] |> notify "errors" msg

        UpdateSucceed msg ->
            model ! [] |> notify "message" msg.data

        UpdateFail msg ->
            case msg of
                BadResponse resp ->
                    model ! [] |> notify "errors" resp.data

                _ ->
                    model ! [] |> notify "errors" "Can't cmmunicate with the server"

        CreateUser ->
            ( model, createUser model.user )

        Snackbar msg' ->
            let
                ( snackbar, snackCmd ) =
                    Snackbar.update msg' model.snackbar
            in
                { model | snackbar = snackbar } ! [ Cmd.map Snackbar snackCmd ]



updateUser : AppModel -> UpdateUserMsg -> String -> AppModel
updateUser model msg input =
    let
        user =
            model.user
    in
        case msg of
            Username ->
                { model | user = { user | username = input } }

            Password ->
                { model | user = { user | password = input } }

            Name ->
                { model | user = { user | name = input } }

            Lastname ->
                { model | user = { user | lastname = input } }

            Email ->
                { model | user = { user | email = input } }


notify : String -> a -> ( AppModel, Cmd Msg ) -> ( AppModel, Cmd Msg )
notify tag value ( model, cmd ) =
    let
        _ =
            Debug.log tag value

        ( snackbar, snackCmd ) =
            Snackbar.add (Snackbar.toast Nothing (toString value)) model.snackbar
    in
        ( { model | snackbar = snackbar }
        , Cmd.batch
            [ cmd
            , Cmd.map Snackbar snackCmd
            ]
        )