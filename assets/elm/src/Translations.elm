module Translations exposing (..)

type Lang
  =  En
  |  Pt
  |  Rs

getLnFromCode: String -> Lang
getLnFromCode code =
   case code of 
      "en" -> En
      "pt" -> Pt
      "rs" -> Rs
      _ -> En

title: Lang -> String
title lang  =
  case lang of 
      En -> "Nuno & Oli's Wedsite"
      Pt -> "Nuno & Oli's Wedsite"
      Rs -> "Nuno & Oli's Wedsite"

verticallyCenteringInCssIsEasy: Lang -> String
verticallyCenteringInCssIsEasy lang  =
  case lang of 
      En -> "Vertically centering things in css is easy!"
      Pt -> "Centrar elementos verticalmente em CSS é fácil!"
      Rs -> "Kaffa sa žirafom!"

ourStoryTitle: Lang -> String
ourStoryTitle lang  =
  case lang of 
      En -> "How did this happen to us?"
      Pt -> "Como é que isto nos aconteceu?"
      Rs -> "Kako nam se sve ovo desilo?"

ourStory0: Lang -> String
ourStory0 lang  =
  case lang of 
      En -> "On an island far, far away,"
      Pt -> "Portuguese verse 0"
      Rs -> "Iza sedam gora,"

ourStory1: Lang -> String
ourStory1 lang  =
  case lang of 
      En -> "Between fields of plump carrots"
      Pt -> "Portuguese verse 1"
      Rs -> "Iza sedam mora,"

ourStory2: Lang -> String
ourStory2 lang  =
  case lang of 
      En -> "and beans on toast,"
      Pt -> "Portuguese verse 2"
      Rs -> "Međ’ poljima zrelih šargarepa"

ourStory3: Lang -> String
ourStory3 lang  =
  case lang of 
      En -> "There was a girl"
      Pt -> "Portuguese verse 3"
      Rs -> "I čaja u pet,"

ourStory4: Lang -> String
ourStory4 lang  =
  case lang of 
      En -> "who refused to eat her vegetables."
      Pt -> "Portuguese verse 4"
      Rs -> "Živela je devojka koja je odbijala da jede povrće."

ourStory5: Lang -> String
ourStory5 lang  =
  case lang of 
      En -> "And a boy who nearly got broccoli"
      Pt -> "Portuguese verse 5"
      Rs -> "I momče koje je jelo spanać,"

ourStory6: Lang -> String
ourStory6 lang  =
  case lang of 
      En -> "to the point of extinction."
      Pt -> "Portuguese verse 6"
      Rs -> "Češće nego Popaj."

ourStory7: Lang -> String
ourStory7 lang  =
  case lang of 
      En -> "She was given the noble task"
      Pt -> "Portuguese verse 7"
      Rs -> "Njoj dadoše plemeniti zadatak"

ourStory8: Lang -> String
ourStory8 lang  =
  case lang of 
      En -> "of defeating the mighty Hepatitis E,"
      Pt -> "Portuguese verse 8"
      Rs -> "Da uništi moćni Hepatits E"

ourStory9: Lang -> String
ourStory9 lang  =
  case lang of 
      En -> "but Rapivab didn't work,"
      Pt -> "Portuguese verse 9"
      Rs -> "Kome ni Rapivab nije mogao izaći na megdan"

ourStory10: Lang -> String
ourStory10 lang  =
  case lang of 
      En -> "So Excalibur was still stuck in the stone."
      Pt -> "Portuguese verse 10"
      Rs -> "Ali avaj! Markovog buzdovana nigde nije bilo."

ourStory11: Lang -> String
ourStory11 lang  =
  case lang of 
      En -> "She desperately needed a weapon,"
      Pt -> "Portuguese verse 11"
      Rs -> "Ustreba joj odveć posebno oružije"

ourStory12: Lang -> String
ourStory12 lang  =
  case lang of 
      En -> "A weapon designed to work in the mythical realm"
      Pt -> "Portuguese verse 12"
      Rs -> "Kako bih vam rekao, jedan kalkulator."

ourStory13: Lang -> String
ourStory13 lang  =
  case lang of 
      En -> "of log distributions and lack of sample numbers."
      Pt -> "Portuguese verse 13"
      Rs -> "Magičan kalkulator koji nalazi rešenja čak i u svetu"

ourStory14: Lang -> String
ourStory14 lang  =
  case lang of 
      En -> "More precisely: she needed a calculator."
      Pt -> "Portuguese verse 14"
      Rs -> "Log distribucija i nedovoljno uzoraka."

ourStory15: Lang -> String
ourStory15 lang  =
  case lang of 
      En -> "Where could she possibly find such mighty power?"
      Pt -> "Portuguese verse 15"
      Rs -> "Gde bi ona mogla naći ovakvo čudo?"

ourStory16: Lang -> String
ourStory16 lang  =
  case lang of 
      En -> "Help arrives from somewhere unexpected."
      Pt -> "Portuguese verse 16"
      Rs -> "Pomoć stiže odveć neočekivano."

ourStory17: Lang -> String
ourStory17 lang  =
  case lang of 
      En -> "The boy who was also her weightlifting buddy."
      Pt -> "Portuguese verse 17"
      Rs -> "Ono momče, s kojim i tegove beše dizala"

ourStory18: Lang -> String
ourStory18 lang  =
  case lang of 
      En -> "Not only was he the second cousin"
      Pt -> "Portuguese verse 18"
      Rs -> "Nije on bio samo Popajev dalji rođak,"

ourStory19: Lang -> String
ourStory19 lang  =
  case lang of 
      En -> "on the maternal side of Hercules,"
      Pt -> "Portuguese verse 19"
      Rs -> "Ali od muške tetke"

ourStory20: Lang -> String
ourStory20 lang  =
  case lang of 
      En -> "he also had the ability to do Terminal magic."
      Pt -> "Portuguese verse 20"
      Rs -> "Veće i baratao magijom Terminala."

ourStory21: Lang -> String
ourStory21 lang  =
  case lang of 
      En -> "Several sleepless nights later"
      Pt -> "Portuguese verse 21"
      Rs -> "Nekoliko besanih noći kasnije"

ourStory22: Lang -> String
ourStory22 lang  =
  case lang of 
      En -> "The Calculator was born,"
      Pt -> "Portuguese verse 22"
      Rs -> "Kalkulator je rođen,"

ourStory23: Lang -> String
ourStory23 lang  =
  case lang of 
      En -> "so the girl managed to defeat this mighty virus"
      Pt -> "Portuguese verse 23"
      Rs -> "Devojče pobedi ozloglašeni virus"

ourStory24: Lang -> String
ourStory24 lang  =
  case lang of 
      En -> "with the boy’s additional help"
      Pt -> "Portuguese verse 24"
      Rs -> "Dok joj je momče spremao"

ourStory25: Lang -> String
ourStory25 lang  =
  case lang of 
      En -> "of counting her macros"
      Pt -> "Portuguese verse 25"
      Rs -> "Užinu za poneti"

ourStory26: Lang -> String
ourStory26 lang  =
  case lang of 
      En -> "and ultimately they made a deal"
      Pt -> "Portuguese verse 26"
      Rs -> "I na kraju rukovaše se u dogovoru"

ourStory27: Lang -> String
ourStory27 lang  =
  case lang of 
      En -> "to fight against all future monsters together."
      Pt -> "Portuguese verse 27"
      Rs -> "Da sve buduće ale pobeđuju zajedno."

ourStory28: Lang -> String
ourStory28 lang  =
  case lang of 
      En -> "So come and celebrate this unexpected brain story."
      Pt -> "Portuguese verse 28"
      Rs -> "Zato se priključite slavlju ovog neočekivanog umnog spoja."

ourStory29: Lang -> String
ourStory29 lang  =
  case lang of 
      En -> "Excuse me, Love story."
      Pt -> "Portuguese verse 29"
      Rs -> "Pardon, ljubavnog spoja."

scheduleTitle: Lang -> String
scheduleTitle lang  =
  case lang of 
      En -> "What can you expect on the day?"
      Pt -> "O que esperar no dia?"
      Rs -> "Šta imamo u planu za ovaj dan?"

scheduleSubtitle: Lang -> String
scheduleSubtitle lang  =
  case lang of 
      En -> "On this Holy day of spiritual entanglement many festivities await, behold in wonderment!"
      Pt -> "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
      Rs -> "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."

elevenAM: Lang -> String
elevenAM lang  =
  case lang of 
      En -> "11am"
      Pt -> "11h"
      Rs -> "11h"

elevenAMDesc0: Lang -> String
elevenAMDesc0 lang  =
  case lang of 
      En -> "Groom’s side meetup"
      Pt -> "Festa na casa do Noivo"
      Rs -> "Skup mladoženjinih svatova"

elevenAMDesc1: Lang -> String
elevenAMDesc1 lang  =
  case lang of 
      En -> "Brigadira Ristica B2 L9"
      Pt -> ""
      Rs -> "Brigadira Ristića B2 L9"

elevenAMDesc2: Lang -> String
elevenAMDesc2 lang  =
  case lang of 
      En -> "If you are on the Groom’s side this is where you start your day. Marvel at his glorious suit and head over to the Bride’s hoonking all the way!"
      Pt -> ""
      Rs -> "Ako se priključujete veselju sa mladoženjine strane, ovde ćete započeti svoj dan. Uživajte u pogledu na tu zanosnu bradu i pružite trubi Vaših kola zadovoljstvo da peva iz sveg glasa!"

twelveAM: Lang -> String
twelveAM lang  =
  case lang of 
      En -> "12am"
      Pt -> "12h"
      Rs -> "12h"

twelveAMDesc0: Lang -> String
twelveAMDesc0 lang  =
  case lang of 
      En -> "Bride pickup"
      Pt -> "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, odio a posuere semper, eros nibh efficitur metus, non sagittis nunc lectus ac felis. Morbi nec tincidunt quam, fringilla fermentum magna."
      Rs -> "Stižemo po mladu"

twelveAMDesc1: Lang -> String
twelveAMDesc1 lang  =
  case lang of 
      En -> "Prvomajska 64"
      Pt -> "Mauris elementum velit in nisi posuere ultrices. Vestibulum condimentum leo est, elementum pretium enim tristique a. Donec nec lobortis felis, ac eleifend augue."
      Rs -> "Prvomajska 64"

twelveAMDesc2: Lang -> String
twelveAMDesc2 lang  =
  case lang of 
      En -> "Whether you are on Bride’s side starting your day here or you’ve just arrived with the Groom you’ll be able to witness the rowdy haggling where the Best Man and Grooms’ brother try to outsmart the Bride's family to lower her purchasing price. You are welcome to participate with witty ideas for either side."
      Pt -> ""
      Rs -> "Bez obzira sa čije ste strane, verujemo da ćete uživati u mladoženjinim pokušajima da se iscenjka za tatinu mezimicu. Dobrodošli ste da učestvujete u nadmetanju na bilo čijoj strani."

twoPM: Lang -> String
twoPM lang  =
  case lang of 
      En -> "2pm"
      Pt -> "14h"
      Rs -> "14h"

twoPMDesc0: Lang -> String
twoPMDesc0 lang  =
  case lang of 
      En -> "Church wedding"
      Pt -> "Cerimónia de igreja @ Igreja da Aparição da Virgem Maria"
      Rs -> "Venčanje u crkvi"

twoPMDesc1: Lang -> String
twoPMDesc1 lang  =
  case lang of 
      En -> "Church of Presentation of Blessed Virgin Mary"
      Pt -> ""
      Rs -> "Vavedenska crkva"

twoPMDesc2: Lang -> String
twoPMDesc2 lang  =
  case lang of 
      En -> "Cara Dušana 82"
      Pt -> ""
      Rs -> "Cara Dušana 82"

twoPMDesc3: Lang -> String
twoPMDesc3 lang  =
  case lang of 
      En -> "Here our couple to be will saying their first “I DOs” of the day in a lovely orthodox church from 1700s. A word of advice, if you are a lady it is respectful to enter with covered shoulders and back and if you are gentleman have sleeves and trousers covering knees. When entering the church women stay on the left side and men on the right."
      Pt -> ""
      Rs -> "Prvi zvanični zajednički koraci će biti načinjeni u ovoj simpatičnoj pravoslavnoj crkvi podignutoj u XVIII veku. Skrećemo pažnju da bi dame trebale da uđu u crkvu pokrivenih ramena i leđa i da se postave sa leve strane oltara, dok gospoda trebaju da se pojave u pantalonama koje pokrivaju kolena i da zauzmu mesta sa desne strane oltara."

fourPM: Lang -> String
fourPM lang  =
  case lang of 
      En -> "4pm"
      Pt -> "16h"
      Rs -> "16h"

fourPMDesc0: Lang -> String
fourPMDesc0 lang  =
  case lang of 
      En -> "Civil Cerimony"
      Pt -> "Cerimónia civil"
      Rs -> "Opštinsko venčanje"

fourPMDesc1: Lang -> String
fourPMDesc1 lang  =
  case lang of 
      En -> "Caste Kaštel, Ečka"
      Pt -> ""
      Rs -> "Dvorac Kaštel, Ečka"

fourPMDesc2: Lang -> String
fourPMDesc2 lang  =
  case lang of 
      En -> "Continuing in the “I DO” fashion, our couple becomes joint in the eyes of the state as well. Get the party going while they take some very artistic photos in the gardens and enjoy the traditional appetizers."
      Pt -> ""
      Rs -> "Nakon državne ceremonije uz nezaboravne stihove Duška Radovića, nadoknadite izgubljenu snagu predjelo i pokrenite proslavu dok se mladenci i sulikaju koji put da bi imali čime da se hvale unucima jednog lepog dana."

sevenPM: Lang -> String
sevenPM lang  =
  case lang of 
      En -> "7pm"
      Pt -> "19h"
      Rs -> "19h"

sevenPMDesc0: Lang -> String
sevenPMDesc0 lang  =
  case lang of 
      En -> "First dance & Dinner"
      Pt -> "Jantar"
      Rs -> "Prvi ples i večera"

sevenPMDesc1: Lang -> String
sevenPMDesc1 lang  =
  case lang of 
      En -> "Try not to laugh too hard as we bust a move as Mr&Ms Ferreira and enjoy your well earned dinner."
      Pt -> ""
      Rs -> "Priključite se mladencima u prvom plesu i dobro zasluženoj večeri!"

ninePM: Lang -> String
ninePM lang  =
  case lang of 
      En -> "9pm"
      Pt -> "21h"
      Rs -> "21h"

ninePMDesc0: Lang -> String
ninePMDesc0 lang  =
  case lang of 
      En -> "Cake time"
      Pt -> "Bolo de casamento"
      Rs -> "Torta"

ninePMDesc1: Lang -> String
ninePMDesc1 lang  =
  case lang of 
      En -> "We do have a bit of a sweet tooth so we are ceremonially cutting two cakes! Our wedding cake, clearly fitting the theme with all those sunflowers and the traditional “Mother’s cake” which we will come and serve to all of you, also taking the opportunity of taking a pic with you which you can later purchase from the photo team."
      Pt -> ""
      Rs -> "Slatkiša nikad dosta! Prvo vešto dekorisana mladenačka torta, a zatim i materina pogača koji će Vam mladenci, nadajmo se uspešno, podeliti i top prilikom se i slikati s Vama."

elevenPM: Lang -> String
elevenPM lang  =
  case lang of 
      En -> "11pm"
      Pt -> "23h"
      Rs -> "23h"

elevenPMDesc0: Lang -> String
elevenPMDesc0 lang  =
  case lang of 
      En -> "Second dinner"
      Pt -> "Segundo jantar"
      Rs -> "Druga večera"

elevenPMDesc1: Lang -> String
elevenPMDesc1 lang  =
  case lang of 
      En -> "Does dancing get you tired? No worries, we have a super energy dense second diner that will keep you going for hours!"
      Pt -> ""
      Rs -> "Red je i da popunimo energetske rezerve kako bi veselje moglo nesmetano da se nastavi!"

travellingHeader: Lang -> String
travellingHeader lang  =
  case lang of 
      En -> "How to get to us?"
      Pt -> "Como chegar até nós?"
      Rs -> "Kako stići do nas?"

travellingSubtitle0: Lang -> String
travellingSubtitle0 lang  =
  case lang of 
      En -> "If you don't suffer from time-space travel nausea, we recommend using your favourite teleportation device and input these coordinates:"
      Pt -> "Se não sofreres de enjoos causados por viagens no tempo-espaço, o melhor a fazer é saltares para a máquina de teletransporte mais próxima e introduzir as seguintes coordenadas para Zrenjanin:"
      Rs -> "Ukoliko ne patite od mučnine izazvane promenama u prostor-vremenu, preporučujemo upotrebu uređaja za teleportaciju koristeći sledeće koordinate:"

travellingSubtitle1: Lang -> String
travellingSubtitle1 lang  =
  case lang of 
      En -> "If by any chance, you are unable to get your hands on one, there are more rudimentary means of transportation."
      Pt -> "Se por algum motivo não tiveres acesso a tal aparelho, existem opçōes de transporte mais rudimentares."
      Rs -> "Ako, kojim slučajem, niste u mogućnosti da pribavite takav uređaj, slobodno se poslužite nekim od zastarelih sistema transporta:"

coordinates: Lang -> String
coordinates lang  =
  case lang of 
      En -> "45.3816° N, 20.3686° E"
      Pt -> "45.3816° N, 20.3686° E"
      Rs -> "45.3816° N, 20.3686° E"

airplane: Lang -> String
airplane lang  =
  case lang of 
      En -> "Plane"
      Pt -> "Avião"
      Rs -> ""

mainAirport0: Lang -> String
mainAirport0 lang  =
  case lang of 
      En -> "There are 3 airports nearby, with the most convenient being "
      Pt -> "Tens 3 aeroportos na proximidade, sendo o mais conveniente o"
      Rs -> ""

mainAirport1: Lang -> String
mainAirport1 lang  =
  case lang of 
      En -> "(85 km from the venue)."
      Pt -> "a 85km do destino."
      Rs -> ""

belgradeAirport: Lang -> String
belgradeAirport lang  =
  case lang of 
      En -> "Nikola Tesla Airport"
      Pt -> "aeroporto Nikola Tesla"
      Rs -> ""

em: Lang -> String
em lang  =
  case lang of 
      En -> " in "
      Pt -> " em "
      Rs -> ""

belgrade: Lang -> String
belgrade lang  =
  case lang of 
      En -> "Belgrade"
      Pt -> "Belgrado"
      Rs -> ""

londonLuton: Lang -> String
londonLuton lang  =
  case lang of 
      En -> "London Luton"
      Pt -> "Londres Luton"
      Rs -> ""

londonHeathrow: Lang -> String
londonHeathrow lang  =
  case lang of 
      En -> "London Heathrow"
      Pt -> "Londres Heathrow"
      Rs -> ""

easyJet: Lang -> String
easyJet lang  =
  case lang of 
      En -> "EasyJet"
      Pt -> "EasyJet"
      Rs -> ""

wizzAir: Lang -> String
wizzAir lang  =
  case lang of 
      En -> "WizzAir"
      Pt -> "WizzAir"
      Rs -> ""

wizzAirUrl: Lang -> String
wizzAirUrl lang  =
  case lang of 
      En -> "https://wizzair.com/en-gb#/"
      Pt -> "https://wizzair.com/pt-pt#/"
      Rs -> ""

airSerbia: Lang -> String
airSerbia lang  =
  case lang of 
      En -> "AirSerbia"
      Pt -> "AirSerbia"
      Rs -> ""

brussels: Lang -> String
brussels lang  =
  case lang of 
      En -> "Brussels"
      Pt -> "Bruxelas"
      Rs -> ""

eindhoven: Lang -> String
eindhoven lang  =
  case lang of 
      En -> "Eindhoven"
      Pt -> "Eindhoven"
      Rs -> ""

luqa: Lang -> String
luqa lang  =
  case lang of 
      En -> "Luqa"
      Pt -> "Luqa"
      Rs -> ""

parisBeauvais: Lang -> String
parisBeauvais lang  =
  case lang of 
      En -> "Paris Beauvais"
      Pt -> "Paris Beauvais"
      Rs -> ""

lufthansa: Lang -> String
lufthansa lang  =
  case lang of 
      En -> "Lufthansa"
      Pt -> "Lufthansa"
      Rs -> "Lufthansa"

lufthansaUrl: Lang -> String
lufthansaUrl lang  =
  case lang of 
      En -> "https://www.lufthansa.com/pt/pt/homepage"
      Pt -> "https://www.lufthansa.com/pt/pt/homepage"
      Rs -> "https://www.lufthansa.com/pt/pt/homepage"

tap: Lang -> String
tap lang  =
  case lang of 
      En -> "TAP"
      Pt -> "TAP"
      Rs -> "TAP"

tapUrl: Lang -> String
tapUrl lang  =
  case lang of 
      En -> "https://www.flytap.com/pt-pt/"
      Pt -> "https://www.flytap.com/pt-pt/"
      Rs -> "https://www.flytap.com/pt-pt/"

vueling: Lang -> String
vueling lang  =
  case lang of 
      En -> "Vueling"
      Pt -> "Vueling"
      Rs -> "Vueling"

vuelingUrl: Lang -> String
vuelingUrl lang  =
  case lang of 
      En -> "https://en.aegeanair.com/"
      Pt -> "https://en.aegeanair.com/"
      Rs -> "https://en.aegeanair.com/"

aegaen: Lang -> String
aegaen lang  =
  case lang of 
      En -> "Aegaen"
      Pt -> "Aegaen"
      Rs -> "Aegaen"

aegaenUrl: Lang -> String
aegaenUrl lang  =
  case lang of 
      En -> "https://www.vueling.com/pt"
      Pt -> "https://www.vueling.com/pt"
      Rs -> "https://www.vueling.com/pt"

and: Lang -> String
and lang  =
  case lang of 
      En -> "e"
      Pt -> " e "
      Rs -> "e"

airSerbiaUrl: Lang -> String
airSerbiaUrl lang  =
  case lang of 
      En -> ""
      Pt -> "https://www.airserbia.com/en"
      Rs -> ""

ryanAir: Lang -> String
ryanAir lang  =
  case lang of 
      En -> "RyanAir"
      Pt -> "RyanAir"
      Rs -> "RyanAir"

ryanAirUrl: Lang -> String
ryanAirUrl lang  =
  case lang of 
      En -> "https://www.ryanair.com/pt/pt/"
      Pt -> "https://www.ryanair.com/pt/pt/"
      Rs -> "https://www.ryanair.com/pt/pt/"

mainAirportSecondParagraph0: Lang -> String
mainAirportSecondParagraph0 lang  =
  case lang of 
      En -> "Direct flights are available from "
      Pt -> "Infelizmente só existem voos directos para Budapeste. A "
      Rs -> ""

mainAirportSecondParagraph1: Lang -> String
mainAirportSecondParagraph1 lang  =
  case lang of 
      En -> "several cities in Germany "
      Pt -> " oferece voos do Porto às Terças e Sábados, e voos de Lisboa às Segundas, Terças, Quintas e Sábados."
      Rs -> ""

mainAirportSecondParagraph2: Lang -> String
mainAirportSecondParagraph2 lang  =
  case lang of 
      En -> ""
      Pt -> "Se decidires voar para Belgrado vais precisar de fazer escala noutro aeroporto. Algumas opçōes são Munique, Atenas, Zurique, Barcelona e Paris a usar os serviços da "
      Rs -> ""

mainAirportSecondParagraph3: Lang -> String
mainAirportSecondParagraph3 lang  =
  case lang of 
      En -> ""
      Pt -> "Voar para Timisoara também implica fazer escala e como é um aeroporto de companhias low cost, as companhias aéreas que lá operam são a "
      Rs -> ""

mainAirportSecondParagraph4: Lang -> String
mainAirportSecondParagraph4 lang  =
  case lang of 
      En -> ""
      Pt -> "Se não tiveres possibilidade de voar durante a semana, recomendamos voar sexta de manhã do Porto para Paris Beauvais via "
      Rs -> ""

mainAirportSecondParagraph5: Lang -> String
mainAirportSecondParagraph5 lang  =
  case lang of 
      En -> ""
      Pt -> " e voar ao início da tarde de Paris Beauvais para Timisoara via "
      Rs -> ""

mainAirportSecondParagraph6: Lang -> String
mainAirportSecondParagraph6 lang  =
  case lang of 
      En -> ""
      Pt -> ". Com o serviço de transporte consegues chegar a Zrenjanin depois de jantar e tens tempo suficiente para descansar para o nosso grande dia. Para regressar podes voar no domingo de Budapeste para Lisbon apanhar um voo para o Porto via "
      Rs -> ""

mainAirportSecondParagraph7: Lang -> String
mainAirportSecondParagraph7 lang  =
  case lang of 
      En -> ""
      Pt -> ", se decidires usar o serviço de transporte para Budapeste implica começar a viagem de regresso antes do meio dia."
      Rs -> ""

etc: Lang -> String
etc lang  =
  case lang of 
      En -> "etc."
      Pt -> "etc."
      Rs -> ""

timisoaraAirport: Lang -> String
timisoaraAirport lang  =
  case lang of 
      En -> "Traian Vuia Timisoara Airport"
      Pt -> "aeroporto Traian Vuia Timisoara"
      Rs -> ""

romania: Lang -> String
romania lang  =
  case lang of 
      En -> "Romania"
      Pt -> "Roménia"
      Rs -> ""

budapest: Lang -> String
budapest lang  =
  case lang of 
      En -> "Budapest"
      Pt -> "Budapeste"
      Rs -> ""

hungary: Lang -> String
hungary lang  =
  case lang of 
      En -> "Hungary"
      Pt -> "Hungria"
      Rs -> ""

budapestAirport: Lang -> String
budapestAirport lang  =
  case lang of 
      En -> "Ferenc Liszt Airport"
      Pt -> "aeroporto Ferenc Liszt"
      Rs -> ""

otherAirports: Lang -> String
otherAirports lang  =
  case lang of 
      En -> "Other airports of interest are "
      Pt -> "Outros aeroportos de interesse são "
      Rs -> ""

romaniaAirportDistance: Lang -> String
romaniaAirportDistance lang  =
  case lang of 
      En -> " (120 km from the destination) and "
      Pt -> " (120km do destino) e "
      Rs -> ""

budapestAirportDistance: Lang -> String
budapestAirportDistance lang  =
  case lang of 
      En -> " (330km from the destination)."
      Pt -> " (330km do destino)."
      Rs -> ""

publicTravelFromAirport: Lang -> String
publicTravelFromAirport lang  =
  case lang of 
      En -> " In both cases keep in mind that you will need additional transportation service to reach Serbia with fixed price of 15€ from Timisoara and 25€ from Budapest when using "
      Pt -> " Em ambos os casos é necessário transporte adicional para chegar à Sérvia, com preço fixo de 15€ de Timisoara e 25€ de Budapeste pela companhia "
      Rs -> ""

geaTravel: Lang -> String
geaTravel lang  =
  case lang of 
      En -> " GeaTravel Services"
      Pt -> " GeaTravel Services"
      Rs -> ""

trainsTitle: Lang -> String
trainsTitle lang  =
  case lang of 
      En -> "Trains"
      Pt -> "Comboios"
      Rs -> "Vozovi"

trains0: Lang -> String
trains0 lang  =
  case lang of 
      En -> "For easiest coordination please visit the "
      Pt -> "Para melhor coordenação, dá uma olhadela no horário da "
      Rs -> "Raspored vozova možete proveriti na sajtu"

trains1: Lang -> String
trains1 lang  =
  case lang of 
      En -> " and check trains that take you either to Novi Sad or Beograd Centar."
      Pt -> " para comboios que te levem para Novi Sad ou Beograd Centar."
      Rs -> "Direktne linije će Vas dovesti iz Kikinde, Novog Sada i Beograda."

trains2: Lang -> String
trains2 lang  =
  case lang of 
      En -> "Direct connections are available from Budapest, Hungary (15€ one way) and from Ljubljana, Slovenia (41€) and Zagreb, Croatia (24€), Thessaloniki, Greece (23€), Skopje, Macedonia (23€) and Sophia, Bulgaria (20€) to Belgrade."
      Pt -> "Existem ligaçōes directas de Budapeste, Hungria para Novi Sad por 15€ e de Ljubljana, Eslovénia para Belgrado 41€. Uma viagem destas pode ser a desculpa ideal para umas férias diferentes, mas tem em atenção que vai demorar por volta de 36h para chegares à Sérvia. Dois itinerários possíveis são: Porto (PT) - Vigo (ESP) - Barcelona (ESP) - Paris (FR) - Zurique (CH) - Belgrado (SRB) ou então Porto (PT) - Lisboa (PT) - Irun (ESP) - Paris (FR) - Zurique (CH) - Budapeste (HUN) - Novi Sad (SRB). Podes também combinar comboios e camionetas para viajar mais rápido."
      Rs -> ""

trainTimetable: Lang -> String
trainTimetable lang  =
  case lang of 
      En -> "Serbian Railway timetable"
      Pt -> "Rede Ferroviária da Sérvia"
      Rs -> "Železnica Srbije"

trainTimetableUrl: Lang -> String
trainTimetableUrl lang  =
  case lang of 
      En -> "http://w3.srbrail.rs/ZSRedVoznje/en"
      Pt -> "http://w3.srbrail.rs/ZSRedVoznje/en"
      Rs -> "http://w3.srbrail.rs/ZSRedVoznje/"

busTitle: Lang -> String
busTitle lang  =
  case lang of 
      En -> "Bus"
      Pt -> "Camionetas"
      Rs -> "Autobusi"

bus0: Lang -> String
bus0 lang  =
  case lang of 
      En -> "If you are not a big fan of the gentle rocking of the train and prefer to stay on the road, consider checking out the bus service. "
      Pt -> "Se não gostas de comboios e preferes andar na estrada, existe a possibilidade de viajar numa camioneta. "
      Rs -> "Najsigurniji način provere rasporeda autobusa je ili preko sajta "

bus1: Lang -> String
bus1 lang  =
  case lang of 
      En -> "As for the train, we recommend arriving at either Novi Sad or Belgrade. "
      Pt -> "Tal como os comboios, tens de chegar a Belgrado ou Novi Sad. "
      Rs -> " ili "

bus2: Lang -> String
bus2 lang  =
  case lang of 
      En -> "You can have a look at the "
      Pt -> "Podes consultar o "
      Rs -> " u zavisnosti iz kog pravca dolazite."

bus3: Lang -> String
bus3 lang  =
  case lang of 
      En -> " of the Novi Sad bus stop. "
      Pt -> " da estação de camionagem de Novi Sad. "
      Rs -> "Autobuski prevoz je čest (na od prilike svakih 60-90min) iz oba grada, a do Zrenjanina će Vam trebati nešto vise od sat vremena putovanja."

bus4: Lang -> String
bus4 lang  =
  case lang of 
      En -> "As there’s no English website choose the date of travel from the drop down menu and specify are you looking for arrivals to Novi Sad (DOLASCI) or departures from Novi Sad (POLASCI) and start typing the name of the city you are interested in. "
      Pt -> "Se não fores fluente em sérvio (compreensível!), para usares o site escolhe a data da viagem e seleciona Chegadas (DOLASCI) ou Partidas (POLASCI) para Novi Sad e escolhe a cidade para que pretendes viajar. "
      Rs -> "Alternativno, možete koristiti usluge “divljih taksija” koji se obično nalaze ispred autobuske stanice u Novom Sadu ili kod cvetne pijace u Borči."

bus5: Lang -> String
bus5 lang  =
  case lang of 
      En -> "Keep in mind that not all destinations are served daily and that the price is given for one direction in RSD (Serbian dinars). "
      Pt -> "Tem em consideração que nem todas as viagens acontecem diáriamente e que o preço está em Dinaras Sérvias (RSD). "
      Rs -> ""

bus6: Lang -> String
bus6 lang  =
  case lang of 
      En -> "You can check the "
      Pt -> "Podes ver o "
      Rs -> ""

bus7: Lang -> String
bus7 lang  =
  case lang of 
      En -> " of the Belgrade bus stop as well, choose whether you need arrivals or departures, specific date and country and start typing the city’s name in the remaining box. "
      Pt -> " da central de Belgrado também, escolhe partidas ou chegadas, escolhe a data de viagem, país destino e começa a escrever o nome da cidade no campo restante. "
      Rs -> ""

bus8: Lang -> String
bus8 lang  =
  case lang of 
      En -> "Country names are given in Serbian and if you have trouble understanding/translating let us know. "
      Pt -> "Os nomes dos países estão em sérvio, portanto se tiveres dúvidas e precisares de ajuda/tradutores avisa-nos, estamos aqui para ajudar. "
      Rs -> ""

bus9: Lang -> String
bus9 lang  =
  case lang of 
      En -> "Unfortunately this site won’t provide you with the ticket price (Serbia is a lovely country, and people still really like to give everyone a call), so in case you find something you think will work for you, let us know and we’ll get the price information. "
      Pt -> "Infelizmente esta pagina não tem informação de preços dos bilhetes. Na amável Sérvia, as pessoas ainda preferem telefonar para saber informaçōes, e podemos fazer isso por ti, claro!"
      Rs -> ""

timetableNoviSad: Lang -> String
timetableNoviSad lang  =
  case lang of 
      En -> "timetable"
      Pt -> "horário"
      Rs -> "novosadske autobuske stanice"

timetableBelgrade: Lang -> String
timetableBelgrade lang  =
  case lang of 
      En -> "timetable"
      Pt -> "horário"
      Rs -> "BAS-ove stanice u Beogradu"

timetableNoviSadUrl: Lang -> String
timetableNoviSadUrl lang  =
  case lang of 
      En -> "http://www.gspns.co.rs/red-voznje-medjumesni"
      Pt -> "http://www.gspns.co.rs/red-voznje-medjumesni"
      Rs -> "http://www.gspns.co.rs/red-voznje-medjumesni"

timetableBelgradeUrl: Lang -> String
timetableBelgradeUrl lang  =
  case lang of 
      En -> "http://www.bas.rs/basweb_lat/RedVoznje.aspx?lng=sl&idDrzave=70"
      Pt -> "http://www.bas.rs/basweb_lat/RedVoznje.aspx?lng=sl&idDrzave=70"
      Rs -> "http://www.bas.rs/basweb_lat/RedVoznje.aspx?lng=sl&idDrzave=70"

carTitle: Lang -> String
carTitle lang  =
  case lang of 
      En -> "Car"
      Pt -> "Carro"
      Rs -> "Automobil"

car0: Lang -> String
car0 lang  =
  case lang of 
      En -> "If you decide to drive we recommend taking some extra time to make stops at some interesting destinations. "
      Pt -> "Se decidires conduzir, o melhor é mesmo tirar uns dias e parar em sítios de interesse, a viagem é longa."
      Rs -> "Ako se odlučite da povedete svog mezimca u vožnju, sigurni smo da će biti vrlo srećan jer će osim aktivnog dana dobiti i veselu cvetnu dekoraciju!"

car1: Lang -> String
car1 lang  =
  case lang of 
      En -> "Depending on where are you traveling from it will take you around two full days of driving, if coming from west Europe (eg. London - Zrenjanin distance 2000 km) or a very intense one day if coming from central Europe (eg. Frankfurt - Zrenjanin distance 1200km)."
      Pt -> "Se viajares do Porto são 3000km e demorará cerca de 3-4 dias longos a conduzir."
      Rs -> " Zrenjanin se nalazi na 50km of Novog Sada i 80km od Beograda."

motorbikeTitle: Lang -> String
motorbikeTitle lang  =
  case lang of 
      En -> "Bike/Motorbike"
      Pt -> "Mota"
      Rs -> "Motocikl & Bicikl"

motorbike0: Lang -> String
motorbike0 lang  =
  case lang of 
      En -> "If feeling super enthusiastic venture out with your two wheeled best friend! Weather in September is warm and dry in the most of Europe and this could easily be a week long trip to tell the grandkids about. "
      Pt -> "É sempre uma boa idea vires na amiga de duas rodas! O tempo em setembro costuma ser bom, e é a desculpa perfeita para uma aventura para contar aos netos! "
      Rs -> "Ako ste avanturističkog duha ovo može biti odlična opcija! Vreme u septembru je generalno toplo i suvo tako da će i sam put biti prijatan. Po dolasku Vas očekuju brufen, voda i šećer u neograničenim količinama."

motorbike1: Lang -> String
motorbike1 lang  =
  case lang of 
      En -> "Paramedics and sugary water will be available upon reaching the destination. And all the glory of course, we love bikes! 🏍 Don't forget to show us the pictures!"
      Pt -> "Garantimos médicos, água com açúcar e rakija para ajudar com a recuperação motoqueira, juntamente com um incrível respeito. Não te esqueças de mostrar as fotos. Nós adoramos motas! 🏍"
      Rs -> "Naravno i sva slava ovakovog poduhvata, jer i mi volimo dvotočkaše svih oblika! 🏍🏍🏍"

walkAndSwimTitle: Lang -> String
walkAndSwimTitle lang  =
  case lang of 
      En -> "Walk & swim"
      Pt -> "A pé e a nado"
      Rs -> "Pešice"

walkAndSwim0: Lang -> String
walkAndSwim0 lang  =
  case lang of 
      En -> "Aren't you the enthusiast of the party? "
      Pt -> "Tu é que és maluco, chefe! "
      Rs -> "Hvale vredan podvig! Nemamo šta da dodamo, osim da na vreme potvrdite dolazak pa put pod noge, da ne zakasnite!"

walkAndSwim1: Lang -> String
walkAndSwim1 lang  =
  case lang of 
      En -> "If this is how you like it, only thing we can say is scroll down to the RSVP page, confirm your arrival, and get going, you don't want to be late!"
      Pt -> "Bem, mas se quiseres mesmo, confirma o RSVP e toca a despachar, senão chegas atrasado!"
      Rs -> ""

carRentalTitle: Lang -> String
carRentalTitle lang  =
  case lang of 
      En -> "Rent-a-car"
      Pt -> "Rent-a-car"
      Rs -> ""

carRental0: Lang -> String
carRental0 lang  =
  case lang of 
      En -> "Not a problem! "
      Pt -> "Não há problema! "
      Rs -> ""

carRental1: Lang -> String
carRental1 lang  =
  case lang of 
      En -> "If you are arriving in Belgrade (by plane, train or bus) we are happy to recommend "
      Pt -> "Se chegares a Belgrado nós recomendamos "
      Rs -> ""

carRental2: Lang -> String
carRental2 lang  =
  case lang of 
      En -> "Their website may not be, but they are very English friendly, decently priced and will bring the car to you at any time. "
      Pt -> "O site está em sérvio, mas toda a equipa fala inglês. Os preços são bons e eles entregam te o carro a qualquer altura do dia. "
      Rs -> ""

carRental3: Lang -> String
carRental3 lang  =
  case lang of 
      En -> "Plus side is that you can also use it to travel around Balkans and EU with no distance limitations. "
      Pt -> "Além disso, podes passar fronteiras (tanto dentro e fora da UE) sem limites de quilometragem. "
      Rs -> ""

carRental4: Lang -> String
carRental4 lang  =
  case lang of 
      En -> "Select your car and email/WhatsApp/Viber them with the details of your trip and they will guide you through the entire process."
      Pt -> "Escolhe o carro que queres e manda-lhes um mail/WhatsApp com informaçaão sobre a tua viagem e eles ajudam te no processo todo."
      Rs -> ""

novaRent: Lang -> String
novaRent lang  =
  case lang of 
      En -> "Nova rent. "
      Pt -> "Nova rent. "
      Rs -> ""

travellingFinal: Lang -> String
travellingFinal lang  =
  case lang of 
      En -> "Whatever your preference of transportation is, let us know and we will happily help with arranging the details."
      Pt -> "Qualquer que seja a tua preferência de transporte, contacta-nos que temos todo o gosto em ajudar-te a organizar tudo."
      Rs -> "Ukoliko su Vam potrebne bilo kakve informacije ili pomoć vezana za transport stojimo Vam na raspolaganju."

accomodationTitle: Lang -> String
accomodationTitle lang  =
  case lang of 
      En -> "Where can you stay?"
      Pt -> "Onde posso ficar?"
      Rs -> "Želite prenoćište?"

dvoracKastel: Lang -> String
dvoracKastel lang  =
  case lang of 
      En -> "Castle Kaštel"
      Pt -> "Castelo Kaštel"
      Rs -> "Dvorac Kaštel"

kastelWebsite: Lang -> String
kastelWebsite lang  =
  case lang of 
      En -> "http://kastelecka.com/en"
      Pt -> "http://kastelecka.com/en"
      Rs -> "http://kastelecka.com"

dvoracKastelDist: Lang -> String
dvoracKastelDist lang  =
  case lang of 
      En -> "This is our venue!"
      Pt -> "A festa é aqui!"
      Rs -> "Venčanje je ovde!"

dvoracKastelDesc0: Lang -> String
dvoracKastelDesc0 lang  =
  case lang of 
      En -> "38 rooms and 7 suites"
      Pt -> "38 quartos e 7 suites disponíveis"
      Rs -> "38 soba i 7 apartmana"

dvoracKastelDesc1: Lang -> String
dvoracKastelDesc1 lang  =
  case lang of 
      En -> "Complimentary 15% discount for 2 nights"
      Pt -> "Desconto de 15% por 2 noites"
      Rs -> "Dodatnih 15% popusta za 2 noći"

hotelVojvodina: Lang -> String
hotelVojvodina lang  =
  case lang of 
      En -> "Hotel Vojvodina"
      Pt -> "Hotel Vojvodina"
      Rs -> "Hotel Vojvodina"

hotelVojvodinaWebsite: Lang -> String
hotelVojvodinaWebsite lang  =
  case lang of 
      En -> "https://hotel-vojvodina.rs/home-2/"
      Pt -> "https://hotel-vojvodina.rs/home-2/"
      Rs -> "https://hotel-vojvodina.rs"

hotelVojvodinaDist: Lang -> String
hotelVojvodinaDist lang  =
  case lang of 
      En -> "8km away"
      Pt -> "8km da festa"
      Rs -> "Udaljenost 8km"

hotelVojvodinaDesc0: Lang -> String
hotelVojvodinaDesc0 lang  =
  case lang of 
      En -> "Double and twin rooms and suits"
      Pt -> "Quartos duplos e suites disponíveis"
      Rs -> "Dvokrevetne sobe i apartmani"

hotelVojvodinaDesc1: Lang -> String
hotelVojvodinaDesc1 lang  =
  case lang of 
      En -> "Located in the pedestrian zone"
      Pt -> "Situado na zona pedestre"
      Rs -> "U pešačkoj zoni"

luxotel: Lang -> String
luxotel lang  =
  case lang of 
      En -> "Luxotel"
      Pt -> "Luxotel"
      Rs -> "Luxotel"

luxotelWebsite: Lang -> String
luxotelWebsite lang  =
  case lang of 
      En -> "https://luxotel-rs.book.direct/en-us"
      Pt -> "https://luxotel-rs.book.direct/pt-pt"
      Rs -> "https://luxotel-rs.book.direct/sr-cs"

luxotelDist: Lang -> String
luxotelDist lang  =
  case lang of 
      En -> "12km away"
      Pt -> "12km da festa"
      Rs -> "Udaljenost 12km"

luxotelDesc0: Lang -> String
luxotelDesc0 lang  =
  case lang of 
      En -> "Double, twin and triple rooms available"
      Pt -> "Quartos duplos e triplos disponíveis"
      Rs -> "Dvokrevetne i trokrevetne sobe"

luxotelDesc1: Lang -> String
luxotelDesc1 lang  =
  case lang of 
      En -> "Small, family operated hotel"
      Pt -> "Pequeno negócio familiar"
      Rs -> "Mali, porodično vođen hotel"

apartments: Lang -> String
apartments lang  =
  case lang of 
      En -> "St. George's apartments"
      Pt -> "Villa de S. George"
      Rs -> "Apartmani Sv. Đorđa"

apartmentsWebsite: Lang -> String
apartmentsWebsite lang  =
  case lang of 
      En -> "http://stgeorge.rs/en/"
      Pt -> "http://stgeorge.rs/en/"
      Rs -> "http://stgeorge.rs"

apartmentsDist: Lang -> String
apartmentsDist lang  =
  case lang of 
      En -> "6km away"
      Pt -> "6km da festa"
      Rs -> "Udaljenost 6km"

apartmentsDesc0: Lang -> String
apartmentsDesc0 lang  =
  case lang of 
      En -> "Single and double rooms available"
      Pt -> "Quartos individuais e duplos disponíveis"
      Rs -> "Jednokrevetne i dvokrevetne sobe"

apartmentsDesc1: Lang -> String
apartmentsDesc1 lang  =
  case lang of 
      En -> "Ethno styled apartments"
      Pt -> "Apartamentos com estilo rústico local"
      Rs -> "Apartmani u etno stilu"

villa: Lang -> String
villa lang  =
  case lang of 
      En -> "Villa Filadelija"
      Pt -> "Villa Filadelija"
      Rs -> "Vila Filadelija"

villaWebsite: Lang -> String
villaWebsite lang  =
  case lang of 
      En -> "http://www.filadelfija.com/index.php/en/"
      Pt -> "http://www.filadelfija.com/index.php/en/"
      Rs -> "http://www.filadelfija.com/index.php/sr/"

villaDist: Lang -> String
villaDist lang  =
  case lang of 
      En -> "8km away"
      Pt -> "8km da festa"
      Rs -> "Udaljenost 8km"

villaDesc0: Lang -> String
villaDesc0 lang  =
  case lang of 
      En -> "Variety of rooms"
      Pt -> "Variedade de quartos disponíveis"
      Rs -> "Veći broj različitih soba"

airbnb: Lang -> String
airbnb lang  =
  case lang of 
      En -> "Airbnb"
      Pt -> "Airbnb"
      Rs -> "Airbnb"

booking: Lang -> String
booking lang  =
  case lang of 
      En -> "Booking.com"
      Pt -> "Booking.com"
      Rs -> "Booking.com"

apartmani: Lang -> String
apartmani lang  =
  case lang of 
      En -> "Apartmani ZR"
      Pt -> "Apartmani ZR"
      Rs -> "Apartmani ZR"

apartmaniWebsite: Lang -> String
apartmaniWebsite lang  =
  case lang of 
      En -> "https://www.apartmanizrenjanin.rs/about-us/?lang=en"
      Pt -> "https://www.apartmanizrenjanin.rs/about-us/?lang=en"
      Rs -> "https://www.apartmanizrenjanin.rs"

apartmeniDist: Lang -> String
apartmeniDist lang  =
  case lang of 
      En -> "9km away"
      Pt -> "9km da festa"
      Rs -> "Udaljenost 9km"

apartmaniDesc0: Lang -> String
apartmaniDesc0 lang  =
  case lang of 
      En -> "Several rooms, studios and apartments available"
      Pt -> "Vários quartos, estúdios e apartamentos"
      Rs -> "Više različitih soba, apartmana i studia"

apartmaniDesc1: Lang -> String
apartmaniDesc1 lang  =
  case lang of 
      En -> "Located in the city center"
      Pt -> "Situado no centro da cidade"
      Rs -> "U centru grada"

rsvpTitle: Lang -> String
rsvpTitle lang  =
  case lang of 
      En -> "RSVP"
      Pt -> "RSVP"
      Rs -> "Potvrdite svoj dolazak"

rsvp0: Lang -> String
rsvp0 lang  =
  case lang of 
      En -> "Please RSVP no later than the 1st of July."
      Pt -> "Preenche o RSVP até dia 1 de Julho, por favor."
      Rs -> "Molimo Vas da potvrdite svoj dolazak najkasnije do 1. jula."

rsvp1: Lang -> String
rsvp1 lang  =
  case lang of 
      En -> "Kindly provide dietary requirements/allergies in the NOTES section. "
      Pt -> "Se tiveres alergias ou dietas alternativas, informa-nos na secção das Notas. "
      Rs -> "Prilikom potvrde dolaska obavestite nas o mogućim alregijama, intolerancijama ili posebnim dijetama o kojima bi trebali da vodimo računa, kao i da li su Vam potrebne usluge transporta na dan venčanja (skup svatova - crkva - restoran)."

rsvp2: Lang -> String
rsvp2 lang  =
  case lang of 
      En -> " Also let us know if you will you be needing transportation services to and from the airport/train station and on the day of the wedding (brides house - church - restaurant)."
      Pt -> "Avisa-nos também se precisas de transporte, para tentarmos organizar forma de te ir buscar ao aeroporto/estação, ou dar-te boleia para qualquer um dos lugares da festa (Casa do noivo - casa da noiva - Castelo)"
      Rs -> ""

showMore: Lang -> String
showMore lang  =
  case lang of 
      En -> "Show more"
      Pt -> "Ver mais"
      Rs -> "Više"

showLess: Lang -> String
showLess lang  =
  case lang of 
      En -> "Show less"
      Pt -> "Ver menos"
      Rs -> "Manje"

insertInviteCode: Lang -> String
insertInviteCode lang  =
  case lang of 
      En -> "Please insert your invitation code"
      Pt -> "Por favor introduz o código do teu convite"
      Rs -> "Molimo Vas ubacite svoju šifru"

codeSubmit: Lang -> String
codeSubmit lang  =
  case lang of 
      En -> "Let's go!"
      Pt -> "Siga"
      Rs -> "Pa da počnemo!"

codeNotFound: Lang -> String
codeNotFound lang  =
  case lang of 
      En -> "Code not found"
      Pt -> "Código não encontrado"
      Rs -> "Código não encontrado"

errorRequest: Lang -> String
errorRequest lang  =
  case lang of 
      En -> "There was an error processing your request"
      Pt -> "Houve um problema a processar o teu pedido"
      Rs -> "Houve um problema a processar o teu pedido"

hello: Lang -> String
hello lang  =
  case lang of 
      En -> "Hello "
      Pt -> "Alô "
      Rs -> "Zdravo "

defaultName: Lang -> String
defaultName lang  =
  case lang of 
      En -> "and welcome"
      Pt -> "artista"
      Rs -> "dobrodošli"

joiningUs: Lang -> String
joiningUs lang  =
  case lang of 
      En -> ", are you joining us for the party?"
      Pt -> ", vens juntar-te à nossa festa?"
      Rs -> ", da li ćete nam se pridružiti?"

hellYes: Lang -> String
hellYes lang  =
  case lang of 
      En -> "Aw hell ye 🎉"
      Pt -> "Mas é claro! 🎉"
      Rs -> "Naravno da DA 🎉"

hellNo: Lang -> String
hellNo lang  =
  case lang of 
      En -> "No, I will have diarhea 💩"
      Pt -> "Não, o meu gato não deixa."
      Rs -> "Ne, ipak imam neodložna posla 💩"

additionalGuest: Lang -> String
additionalGuest lang  =
  case lang of 
      En -> "Additional guest"
      Pt -> "Acompanhante extra"
      Rs -> "Dodatni gost"

whoComes: Lang -> String
whoComes lang  =
  case lang of 
      En -> "Who's coming?"
      Pt -> "Quem mais vem contigo?"
      Rs -> "Ko dolazi?"

comingSubmit: Lang -> String
comingSubmit lang  =
  case lang of 
      En -> "Onwards"
      Pt -> "Próximo!"
      Rs -> "Próximo!"

lowPrice: Lang -> String
lowPrice lang  =
  case lang of 
      En -> "£"
      Pt -> "€"
      Rs -> "€"

mediumPrice: Lang -> String
mediumPrice lang  =
  case lang of 
      En -> "£ £"
      Pt -> "€ €"
      Rs -> "€ €"

highPrice: Lang -> String
highPrice lang  =
  case lang of 
      En -> "£ £ £"
      Pt -> "€ € €"
      Rs -> "€ € €"

location: Lang -> String
location lang  =
  case lang of 
      En -> "Location"
      Pt -> "Coordenadas"
      Rs -> "Lokacija"

coordinatesLink: Lang -> String
coordinatesLink lang  =
  case lang of 
      En -> "https://en.wikipedia.org/wiki/Zrenjanin"
      Pt -> "https://en.wikipedia.org/wiki/Zrenjanin"
      Rs -> "https://sr.wikipedia.org/wiki/%D0%97%D1%80%D0%B5%D1%9A%D0%B0%D0%BD%D0%B8%D0%BD"

doingIt: Lang -> String
doingIt lang  =
  case lang of 
      En -> "We are doing it!"
      Pt -> "Boas notícias!"
      Rs -> "Čujte i počujte!"

mrMrsFerreira: Lang -> String
mrMrsFerreira lang  =
  case lang of 
      En -> "After a careful but not too long deliberation, soon to be Mrs. and Mr. Ferreira have decided to tie the knot and are delighted to invite you to their very-much-DIY wedding and all night party on the"
      Pt -> "Nós, os futuros Ferreiras decidimos dar o nó e achamos que a ocasião merece farra pela noite dentro. Junta-te a nós no dia"
      Rs -> "Nakon pažljivog ali ne predugog razmatranja, budući bračni par Ferreira je odlučio da stane na ludi kamen. Ovom prilikom ste toplo pozvani da se priključite činu venčanja i ludoj žurci posle"

date: Lang -> String
date lang  =
  case lang of 
      En -> "7th of Septeber 2019 in Zrenjanin, Serbia"
      Pt -> "7 de setembro de 2019 na cidade de Zrenjanin na Sérvia"
      Rs -> "dana 7. septembra u Zrenjaninu"

next: Lang -> String
next lang  =
  case lang of 
      En -> "Next!"
      Pt -> "Próximo!"
      Rs -> "Next!"

dietQuestion: Lang -> String
dietQuestion lang  =
  case lang of 
      En -> ", what are your feasting habits?"
      Pt -> ", tens uma dieta predilecta?"
      Rs -> ", what are your feasting habits?"

dietNotesPlaceholder: Lang -> String
dietNotesPlaceholder lang  =
  case lang of 
      En -> "Tell us more! We don't want you to starve"
      Pt -> "Dá-nos mais detalhes! Aqui ninguém passa fome."
      Rs -> "Tell us more! We don't want you to starve"

normalDiet: Lang -> String
normalDiet lang  =
  case lang of 
      En -> "Normal"
      Pt -> "Normal"
      Rs -> "Normal"

vegetarianDiet: Lang -> String
vegetarianDiet lang  =
  case lang of 
      En -> "Vegetarian"
      Pt -> "Vegetariana"
      Rs -> "Vegetarian"

halalDiet: Lang -> String
halalDiet lang  =
  case lang of 
      En -> "Halal"
      Pt -> "Halal"
      Rs -> "Halal"

otherDiet: Lang -> String
otherDiet lang  =
  case lang of 
      En -> "Other"
      Pt -> "Outra"
      Rs -> "Other"

allergyNotesPlaceholder: Lang -> String
allergyNotesPlaceholder lang  =
  case lang of 
      En -> "Tell us more! We don't want you to die"
      Pt -> "Dá-nos mais detalhes! Morrer no dia do nosso casório é feio."
      Rs -> "Tell us more! We don't want you to die"

allergyQuestion: Lang -> String
allergyQuestion lang  =
  case lang of 
      En -> "Do you have any food allergies?"
      Pt -> "Tens alguma alergia alimentar?"
      Rs -> "Do you have any food allergies?"

allergyYes: Lang -> String
allergyYes lang  =
  case lang of 
      En -> "Yes"
      Pt -> "Yep"
      Rs -> "Yes"

allergyNo: Lang -> String
allergyNo lang  =
  case lang of 
      En -> "No"
      Pt -> "Não"
      Rs -> "No"

courseQuestion: Lang -> String
courseQuestion lang  =
  case lang of 
      En -> "What do you wanna eat?"
      Pt -> "Escolhe o teu prato!"
      Rs -> "What do you wanna eat?"

course1: Lang -> String
course1 lang  =
  case lang of 
      En -> "Tasty tasty Serbian Schnitzel"
      Pt -> "Karadjordjeva šnicla - Rolo de porco com queijo"
      Rs -> "Tasty tasty Serbian Schnitzel"

course2: Lang -> String
course2 lang  =
  case lang of 
      En -> "Pork with dates and stuff"
      Pt -> "Carski file - Rolo de porco com ameixas"
      Rs -> "Pork with dates and stuff"

almostDone: Lang -> String
almostDone lang  =
  case lang of 
      En -> "Cool! We're almost done."
      Pt -> "Ótimo! Já estamos no fim."
      Rs -> "Cool! We're almost done."

cantWait: Lang -> String
cantWait lang  =
  case lang of 
      En -> "We can't wait to see you!"
      Pt -> "Mal podemos esperar para te ver!"
      Rs -> "We can't wait to see you!"

giveEmail: Lang -> String
giveEmail lang  =
  case lang of 
      En -> "Oh, for a link with the wedding photos please give us your email."
      Pt -> "Já agora, se quiseres um link com as fotos do casório, dá-nos o teu mail."
      Rs -> "Oh, for a link with the wedding photos please give us your email."

noSpam: Lang -> String
noSpam lang  =
  case lang of 
      En -> "We promise we won't spam too much!"
      Pt -> "Prometemos que não te chateamos muito!"
      Rs -> "We promise we won't spam too much!"

emailPlaceholder: Lang -> String
emailPlaceholder lang  =
  case lang of 
      En -> "Your email"
      Pt -> "O teu email"
      Rs -> "Your email"

okBai: Lang -> String
okBai lang  =
  case lang of 
      En -> "OK bai!"
      Pt -> "OK xau!"
      Rs -> "OK bai!"

shocking: Lang -> String
shocking lang  =
  case lang of 
      En -> "Shocking!"
      Pt -> "Oh, é pena! :("
      Rs -> "Skandalozno!"

changeMind: Lang -> String
changeMind lang  =
  case lang of 
      En -> "If you change your mind, you can change your RSVP until the 1st of July."
      Pt -> "Se mudares de ideias podes mudar o RSVP até dia 1 de Julho."
      Rs -> "Ako se predomislite, ponovo popunite formular do prvog jula."