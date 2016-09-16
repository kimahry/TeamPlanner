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
import Material.Options as Options exposing (css, when)
import Material.Typography as Typo
import Material.Footer as Footer


-- HEADER


header : AppModel -> List (Html Model.Msg)
header model =
    [ Layout.row [ css "height" "60px" ]
        [ Layout.title
            [ css "font-size" "50px", css "padding-top" "10px" ]
            [ text "TeamPlanner" ]
        , Layout.spacer
        , Layout.navigation []
            [ Layout.link
                [ Layout.href "" ]
                [ text "Login" ]
            , Layout.link
                [ Layout.href "" ]
                [ text "Register" ]
            ]
        ]
    ]



-- FOOTER


footer : AppModel -> Html Model.Msg
footer model =
    Footer.mini []
        { left =
            Footer.left []
                [ Footer.logo [] [ Footer.html <| text "Mini Footer Example" ]
                , Footer.links []
                    [ Footer.linkItem [ Footer.href "#footers" ] [ Footer.html <| text "Link 1" ]
                    , Footer.linkItem [ Footer.href "#footers" ] [ Footer.html <| text "Link 2" ]
                    , Footer.linkItem [ Footer.href "#footers" ] [ Footer.html <| text "Link 3" ]
                    ]
                ]
        , right =
            Footer.right []
                []
        }



-- DRAWER


drawer : List (Html Model.Msg)
drawer =
    [ Layout.title [] [ text "My project" ]
    , Layout.navigation
        []
        [ Layout.link
            [ Layout.href "" ]
            [ text "Manager Users" ]
        ]
    ]



-- VIEW


view : AppModel -> Html Model.Msg
view model =
    Layout.render MDL
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = header model
        , drawer = drawer
        , tabs = ( [], [] )
        , main =
            [ div
                []
                [ Snackbar.view model.snackbar |> App.map Snackbar
                , body model
                , footer model
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
