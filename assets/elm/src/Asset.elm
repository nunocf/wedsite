module Asset exposing (Image, complete, error, src)

{-| Assets, like images.
We should never expose asset URLs directly; this module should be in charge of
all of them. One source of truth!
-}

import Html exposing (Attribute, Html)
import Html.Attributes as Attr


type Image
    = Image String



-- IMAGES


error : Image
error =
    image "error.jpg"


complete : Image
complete =
    image "complete.jpg"


image : String -> Image
image filename =
    Image ("images/" ++ filename)



-- USING IMAGES


src : Image -> Attribute msg
src (Image url) =
    Attr.src url
