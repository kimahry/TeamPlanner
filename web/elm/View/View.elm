module View.View exposing (view)

import Component.Model as Model exposing (..)
import Html exposing (..)
import Html.App as App
import Material.Layout as Layout
import Material.Scheme
import Material.Color as Color
import Material.List as Lists
import Material.Textfield as Textfield
import Material.Button as Button exposing (..)
import Material.Snackbar as Snackbar
import Material.Grid exposing (..)


-- VIEW


view : AppModel -> Html Model.Msg
view model =
    Material.Scheme.topWithScheme Color.BlueGrey Color.LightBlue <|
        Layout.render MDL
            model.mdl
            [ Layout.fixedHeader
            ]
            { header = []
            , drawer = []
            , tabs = ( [], [] )
            , main =
                [ div
                    []
                    [ Snackbar.view model.snackbar |> App.map Snackbar
                    , body model
                    ]
                ]
            }


body : AppModel -> Html Model.Msg
body model =
    div []
        [ div [] [ userform model ]
        , grid []
            [ cell [ size Desktop 12 ] [ Lists.ul [] (List.map taskItem model.tasks) ] ]
        ]


userform : AppModel -> Html Model.Msg
userform model =
    [ Textfield.render MDL
        [ 0 ]
        model.mdl
        [ Textfield.label "Username"
        , Textfield.floatingLabel
        , Textfield.value model.user.username
        , Textfield.onInput (UpdateUser Username)
        , Textfield.maxlength 15
        ]
    , Textfield.render MDL
        [ 1 ]
        model.mdl
        [ Textfield.label "Password"
        , Textfield.floatingLabel
        , Textfield.onInput (UpdateUser Password)
        , Textfield.password
        ]
    , Textfield.render MDL
        [ 2 ]
        model.mdl
        [ Textfield.label "Name"
        , Textfield.floatingLabel
        , Textfield.value model.user.name
        , Textfield.onInput (UpdateUser Name)
        , Textfield.maxlength 15
        ]
    , Textfield.render MDL
        [ 3 ]
        model.mdl
        [ Textfield.label "Last name"
        , Textfield.floatingLabel
        , Textfield.value model.user.lastname
        , Textfield.onInput (UpdateUser Lastname)
        , Textfield.maxlength 15
        ]
    , Textfield.render MDL
        [ 4 ]
        model.mdl
        [ Textfield.label "Email"
        , Textfield.floatingLabel
        , Textfield.value model.user.email
        , Textfield.onInput (UpdateUser Email)
        ]
    , Button.render MDL
        [ 5 ]
        model.mdl
        [ Button.raised
        , Button.onClick CreateUser
        ]
        [ text "Submit button" ]
    ]
        |> List.map (\item -> cell [ size Desktop 4, offset Desktop 4, size Tablet 6, size Phone 2, align Middle ] [ item ])
        |> grid []


taskItem : MyTask -> Html Model.Msg
taskItem task =
    Lists.li [] [ Lists.content [] [ text (toString task.id), text task.title, text task.reference ] ]
