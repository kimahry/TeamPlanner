module Component.Model exposing (..)

import Date exposing (Date)
import Material
import Material.Snackbar as Snackbar exposing (..)
import HttpBuilder exposing (Response, Error)
import Dict


-- TYPES


type alias MyTask =
    { id : Int
    , title : String
    , reference : String
    , dateDelivery : Date
    }


type alias MyTasks =
    List MyTask


type alias User =
    { username : String
    , password : String
    , name : String
    , lastname : String
    , email : String
    }


type alias AppModel =
    { user : User
    , mdl : Material.Model
    , snackbar : Snackbar.Model (Maybe Msg)
    , tasks : List MyTask
    }


type alias Mdl =
    Material.Model


type alias Errors =
    Dict.Dict String (List String)



-- MESSAGE


type UpdateUserMsg
    = Username
    | Password
    | Name
    | Lastname
    | Email


type Msg
    = MDL (Material.Msg Msg)
    | UpdateUser UpdateUserMsg String
    | FetchTasksSucceed (HttpBuilder.Response MyTasks)
    | FetchFail (HttpBuilder.Error String)
    | LoadTask
    | UpdateFail (HttpBuilder.Error Errors)
    | UpdateSucceed (HttpBuilder.Response String)
    | CreateUser
    | Snackbar (Snackbar.Msg (Maybe Msg))



-- MODEL


appModel : AppModel
appModel =
    { user = { username = "", password = "", name = "", lastname = "", email = "" }
    , mdl = Material.model
    , snackbar = Snackbar.model
    , tasks = []
    }
