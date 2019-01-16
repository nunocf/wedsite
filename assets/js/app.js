
// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
// import "../css/debug.css"
import "../css/grid.css"
import "../scss/main.scss"
import "../css/styles.css"
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import { Elm } from "../elm/src/Main.elm"


const app = Elm.Main.init({
    flags: { language: getLanguage() },
    node: document.getElementById("elm-main")
});

app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
})

function getLanguage() {
    return localStorage.getItem("elm-i18n-example-language") ||
        navigator.language ||
        navigator.userLanguage
}