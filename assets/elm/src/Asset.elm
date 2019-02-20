module Asset exposing (Image, apartments, complete, error, hotelVojvodina, kastel, luxotel, philadelphia, src, stGeorge)

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


kastel : Image
kastel =
    image "kastel.jpeg"


apartments : Image
apartments =
    image "apartments.jpeg"


hotelVojvodina : Image
hotelVojvodina =
    image "hotel-vojvodina.jpeg"


luxotel : Image
luxotel =
    image "luxotel.jpeg"


philadelphia : Image
philadelphia =
    image "philadelphia.jpeg"


stGeorge : Image
stGeorge =
    image "stgeorge.jpeg"


image : String -> Image
image filename =
    Image ("images/" ++ filename)



-- USING IMAGES


src : Image -> Attribute msg
src (Image url) =
    Attr.src url
