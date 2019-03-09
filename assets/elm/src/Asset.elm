module Asset exposing (Image, apartments, post12h, complete, post15h, post17h, error, hotelVojvodina, kastel, post13h, luxotel, philadelphia, src, stGeorge, stonehenge)

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


stonehenge : Image
stonehenge =
    image "stonehenge.jpg"

post12h : String
post12h =
    svg "post12h.svg"

post13h : String
post13h =
    svg "post13h.svg"

post15h : String
post15h =
    svg "post15h.svg"

post17h : String
post17h =
    svg "post17h.svg"


image : String -> Image
image filename =
    Image ("images/" ++ filename)

svg : String -> String
svg filename =
    "svg/" ++ filename

-- USING IMAGES


src : Image -> Attribute msg
src (Image url) =
    Attr.src url
