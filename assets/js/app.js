
// Import dependencies

import "phoenix_html"

// Import local files
// Local files can be imported directly using relative paths, for example:
import "../css/grid.css"
import "../scss/main.scss"
import "../css/styles.css"
import { Elm } from "../elm/src/Main.elm"




const app = Elm.Main.init({
    flags: { language: getLanguage() },
    node: document.getElementById("elm-main")
});

var
    groomMapDiv,
    brideMapDiv,
    churchMapDiv,
    restaurantMapDiv;

var groomMap,
    brideMap,
    churchMap,
    restaurantMap;

function initMaps() {
    groomMapDiv = document.getElementById("groomMap");
    brideMapDiv = document.getElementById("brideMap");
    churchMapDiv = document.getElementById("churchMap");
    restaurantMapDiv = document.getElementById("restaurantMap");

    const myLatLng = new google.maps.LatLng(0, 0);
    const mapOptions = {
        zoom: 16,
        center: myLatLng
    };

    return {
        groomMap: new google.maps.Map(groomMapDiv, mapOptions),
        brideMap: new google.maps.Map(brideMapDiv, mapOptions),
        churchMap: new google.maps.Map(churchMapDiv, mapOptions),
        restaurantMap: new google.maps.Map(restaurantMapDiv, mapOptions)
    }
}





app.ports.initMaps.subscribe((locations) => {
    requestAnimationFrame(() => {
        let newMaps = initMaps();

        groomMap = newMaps.groomMap;
        brideMap = newMaps.brideMap;
        churchMap = newMaps.churchMap;
        restaurantMap = newMaps.restaurantMap;

        locations.forEach(({ name, location }) => {
            let myLatLng = new google.maps.LatLng(location);
            switch (name) {
                case "groomHouse":
                    new google.maps.Marker({
                        position: myLatLng,
                        map: groomMap,
                        animation: google.maps.Animation.DROP,
                        title: '🍾 Bingo! 🍾'
                    });
                    break;
                case "brideHouse":
                    new google.maps.Marker({
                        position: myLatLng,
                        map: brideMap,
                        animation: google.maps.Animation.DROP,
                        title: '💄👰🏻🌻'
                    });
                    break;
                case "church":
                    new google.maps.Marker({
                        position: myLatLng,
                        map: churchMap,
                        animation: google.maps.Animation.DROP,
                        title: '☦️💒'
                    });
                    break;
                case "restaurant":
                    new google.maps.Marker({
                        position: myLatLng,
                        map: restaurantMap,
                        animation: google.maps.Animation.DROP,
                        title: '🍖🍺🍗'
                    });
                    break;
                default:
                    break;
            }
        });


        const getLatLng = (callee) => ({ lat: callee.getCenter().lat, lng: callee.getCenter().lng() })

        groomMap.addListener("drag", () => {
            app.ports.mapMoved.send({ location: getLatLng(groomMap), name: "groomMap" })
        });

        brideMap.addListener("drag", () => {
            app.ports.mapMoved.send({ location: getLatLng(brideMap), name: "brideMap" })
        });

        churchMap.addListener("drag", () => {
            app.ports.mapMoved.send({ location: getLatLng(churchMap), name: "churchMap" })
        });

        restaurantMap.addListener("drag", () => {
            app.ports.mapMoved.send({ location: getLatLng(restaurantMap), name: "restaurantMap" })
        });

    });



});

app.ports.moveMap.subscribe(({ location, name }) => {
    requestAnimationFrame(() => {

        let myLatLng = new google.maps.LatLng(location);

        switch (name) {
            case "groomHouse":
                groomMap.setCenter(myLatLng)
                break;
            case "brideHouse":
                brideMap.setCenter(myLatLng)
                break;
            case "church":
                churchMap.setCenter(myLatLng)
                break;
            case "restaurant":
                restaurantMap.setCenter(myLatLng)
                break;
            default:
                break;
        }
    });
});


app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
})

function getLanguage() {
    return localStorage.getItem("elm-i18n-example-language") ||
        navigator.language ||
        navigator.userLanguage
}