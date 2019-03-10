module Asset exposing (Image, apartments, complete, error, hotelVojvodina, kastel, luxotel, philadelphia, post12h, post13h, post15h, post17h, src, stGeorge, stonehenge)

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
    image "https://storage.googleapis.com/gingeroak.com/error.jpg"


complete : Image
complete =
    image "https://storage.googleapis.com/gingeroak.com/complete.jpg"


kastel : Image
kastel =
    image "https://storage.googleapis.com/gingeroak.com/kastel.jpeg"


apartments : Image
apartments =
    image "https://storage.googleapis.com/gingeroak.com/apartments.jpeg"


hotelVojvodina : Image
hotelVojvodina =
    image "https://storage.googleapis.com/gingeroak.com/hotel-vojvodina.jpeg"


luxotel : Image
luxotel =
    image "https://storage.googleapis.com/gingeroak.com/luxotel.jpeg"


philadelphia : Image
philadelphia =
    image "https://storage.googleapis.com/gingeroak.com/philadelphia.jpeg"


stGeorge : Image
stGeorge =
    image "https://storage.googleapis.com/gingeroak.com/stgeorge.jpeg"


stonehenge : Image
stonehenge =
    image "https://storage.googleapis.com/gingeroak.com/stonehenge.jpg"


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
    Image filename


svg : String -> String
svg filename =
    "svg/" ++ filename



-- USING IMAGES


src : Image -> Attribute msg
src (Image url) =
    Attr.src url
