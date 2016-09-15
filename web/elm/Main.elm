module Main exposing (..)

import Component.Model exposing (..)
import Component.Update exposing(update)
import Component.API as API
import View.View exposing (view)
import Html.App as App
import Material



main : Program Never
main =
    App.program
        { init = ( appModel, API.getTasks )
        , view = view
        , subscriptions = subscriptions
        , update = update
        }


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Material.subscriptions MDL model







