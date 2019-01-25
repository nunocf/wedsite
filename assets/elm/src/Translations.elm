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
      Rs -> "Serbian verse 0"

ourStory1: Lang -> String
ourStory1 lang  =
  case lang of 
      En -> "Between fields of plump carrots"
      Pt -> "Portuguese verse 1"
      Rs -> "Serbian verse 1"

ourStory2: Lang -> String
ourStory2 lang  =
  case lang of 
      En -> "and beans on toast,"
      Pt -> "Portuguese verse 2"
      Rs -> "Serbian verse 2"

ourStory3: Lang -> String
ourStory3 lang  =
  case lang of 
      En -> "There was a broccoli monster"
      Pt -> "Portuguese verse 3"
      Rs -> "Serbian verse 3"

ourStory4: Lang -> String
ourStory4 lang  =
  case lang of 
      En -> "and a girl who refused to eat her vegetables."
      Pt -> "Portuguese verse 4"
      Rs -> "Serbian verse 4"

ourStory5: Lang -> String
ourStory5 lang  =
  case lang of 
      En -> "She was given the noble task of defeating Hepatitis E,"
      Pt -> "Portuguese verse 5"
      Rs -> "Serbian verse 5"

ourStory6: Lang -> String
ourStory6 lang  =
  case lang of 
      En -> "but Rapivab didn't work,"
      Pt -> "Portuguese verse 6"
      Rs -> "Serbian verse 6"

ourStory7: Lang -> String
ourStory7 lang  =
  case lang of 
      En -> "So Excalibur was still stuck in the stone."
      Pt -> "Portuguese verse 7"
      Rs -> "Serbian verse 7"

ourStory8: Lang -> String
ourStory8 lang  =
  case lang of 
      En -> "She desperately needed a weapon,"
      Pt -> "Portuguese verse 8"
      Rs -> "Serbian verse 8"

ourStory9: Lang -> String
ourStory9 lang  =
  case lang of 
      En -> "A weapon designed to work in the mythical realm"
      Pt -> "Portuguese verse 9"
      Rs -> "Serbian verse 9"

ourStory10: Lang -> String
ourStory10 lang  =
  case lang of 
      En -> "of log distributions and lack of sample numbers."
      Pt -> "Portuguese verse 10"
      Rs -> "Serbian verse 10"

ourStory11: Lang -> String
ourStory11 lang  =
  case lang of 
      En -> "More precisely: a calculator."
      Pt -> "Portuguese verse 11"
      Rs -> "Serbian verse 11"

ourStory12: Lang -> String
ourStory12 lang  =
  case lang of 
      En -> "Where could she possibly find such mighty power?"
      Pt -> "Portuguese verse 12"
      Rs -> "Serbian verse 12"

ourStory13: Lang -> String
ourStory13 lang  =
  case lang of 
      En -> "Help arrives from somewhere unexpected."
      Pt -> "Portuguese verse 13"
      Rs -> "Serbian verse 13"

ourStory14: Lang -> String
ourStory14 lang  =
  case lang of 
      En -> "The boy was her weightlifting buddy."
      Pt -> "Portuguese verse 14"
      Rs -> "Serbian verse 14"

ourStory15: Lang -> String
ourStory15 lang  =
  case lang of 
      En -> "Not only was he Hercules' 86th cousin"
      Pt -> "Portuguese verse 15"
      Rs -> "Serbian verse 15"

ourStory16: Lang -> String
ourStory16 lang  =
  case lang of 
      En -> "he also had the ability to do Terminal magic."
      Pt -> "Portuguese verse 16"
      Rs -> "Serbian verse 16"

ourStory17: Lang -> String
ourStory17 lang  =
  case lang of 
      En -> "Several sleepless nights later The Calculator was born,"
      Pt -> "Portuguese verse 17"
      Rs -> "Serbian verse 17"

ourStory18: Lang -> String
ourStory18 lang  =
  case lang of 
      En -> "so the girl managed to defeat this mighty virus"
      Pt -> "Portuguese verse 18"
      Rs -> "Serbian verse 18"

ourStory19: Lang -> String
ourStory19 lang  =
  case lang of 
      En -> "with the boy’s additional help"
      Pt -> "Portuguese verse 19"
      Rs -> "Serbian verse 19"

ourStory20: Lang -> String
ourStory20 lang  =
  case lang of 
      En -> "of counting her macros"
      Pt -> "Portuguese verse 20"
      Rs -> "Serbian verse 20"

ourStory21: Lang -> String
ourStory21 lang  =
  case lang of 
      En -> "and ultimately they made a deal"
      Pt -> "Portuguese verse 21"
      Rs -> "Serbian verse 21"

ourStory22: Lang -> String
ourStory22 lang  =
  case lang of 
      En -> "to fight against all future monsters together."
      Pt -> "Portuguese verse 22"
      Rs -> "Serbian verse 22"

ourStory23: Lang -> String
ourStory23 lang  =
  case lang of 
      En -> "So come and celebrate this unexpected brain story."
      Pt -> "Portuguese verse 23"
      Rs -> "Serbian verse 23"

ourStory24: Lang -> String
ourStory24 lang  =
  case lang of 
      En -> "Excuse me, Love story."
      Pt -> "Portuguese verse 24"
      Rs -> "Serbian verse 24"

scheduleTitle: Lang -> String
scheduleTitle lang  =
  case lang of 
      En -> "What can you expect on the day?"
      Pt -> "O que esperar no dia?"
      Rs -> "O que esperar no dia?"

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

elevenAMDesc: Lang -> String
elevenAMDesc lang  =
  case lang of 
      En -> ""
      Pt -> ""
      Rs -> ""

twelveAM: Lang -> String
twelveAM lang  =
  case lang of 
      En -> "12am"
      Pt -> "12h"
      Rs -> "12h"

twelveAMDesc0: Lang -> String
twelveAMDesc0 lang  =
  case lang of 
      En -> "Serbian weddings are filled with seemingly barbaric customs but the Bride likes to nurture her savage nature, so, the first task of the day is the Purchase of the bride."
      Pt -> "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, odio a posuere semper, eros nibh efficitur metus, non sagittis nunc lectus ac felis. Morbi nec tincidunt quam, fringilla fermentum magna."
      Rs -> "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, odio a posuere semper, eros nibh efficitur metus, non sagittis nunc lectus ac felis. Morbi nec tincidunt quam, fringilla fermentum magna."

twelveAMDesc1: Lang -> String
twelveAMDesc1 lang  =
  case lang of 
      En -> "You’ll be able to witness the rowdy haggling where the Best Man and Grooms’ brother try to outsmart the Bride's family to lower her purchasing price. You are welcome to participate with witty ideas for either side."
      Pt -> "Mauris elementum velit in nisi posuere ultrices. Vestibulum condimentum leo est, elementum pretium enim tristique a. Donec nec lobortis felis, ac eleifend augue."
      Rs -> "Mauris elementum velit in nisi posuere ultrices. Vestibulum condimentum leo est, elementum pretium enim tristique a. Donec nec lobortis felis, ac eleifend augue."

twoPM: Lang -> String
twoPM lang  =
  case lang of 
      En -> "2pm"
      Pt -> "14h"
      Rs -> "14h"

twoPMDesc: Lang -> String
twoPMDesc lang  =
  case lang of 
      En -> "Church wedding, Church of Presentation of Blessed Virgin Mary"
      Pt -> "Cerimónia de igreja @ Igreja da Aparição da Virgem Maria"
      Rs -> "Cerimónia de igreja @ Igreja da Aparição da Virgem Maria"

fourPM: Lang -> String
fourPM lang  =
  case lang of 
      En -> "4pm"
      Pt -> "16h"
      Rs -> "16h"

fourPMDesc: Lang -> String
fourPMDesc lang  =
  case lang of 
      En -> "Civil Cerimony"
      Pt -> "Cerimónia civil"
      Rs -> "Cerimónia civil"

sevenPM: Lang -> String
sevenPM lang  =
  case lang of 
      En -> "7pm"
      Pt -> "19h"
      Rs -> "19h"

sevenPMDesc: Lang -> String
sevenPMDesc lang  =
  case lang of 
      En -> "Dinner"
      Pt -> "Jantar"
      Rs -> "Jantar"

ninePM: Lang -> String
ninePM lang  =
  case lang of 
      En -> "9pm"
      Pt -> "21h"
      Rs -> "21h"

ninePMDesc: Lang -> String
ninePMDesc lang  =
  case lang of 
      En -> "Cake"
      Pt -> "Bolo de casamento"
      Rs -> "Bolo de casamento"

elevenPM: Lang -> String
elevenPM lang  =
  case lang of 
      En -> "11pm"
      Pt -> "23h"
      Rs -> "23h"

elevenPMDesc: Lang -> String
elevenPMDesc lang  =
  case lang of 
      En -> "Second dinner"
      Pt -> "Segundo jantar"
      Rs -> "Segundo jantar"

travellingHeader: Lang -> String
travellingHeader lang  =
  case lang of 
      En -> "How to get to us?"
      Pt -> "Como chegar até nós?"
      Rs -> "Como chegar até nós?"

travellingSubtitle0: Lang -> String
travellingSubtitle0 lang  =
  case lang of 
      En -> "If you don't suffer from time-space travel nausea, we recommend using your favourite teleportation device and input these coordinates:"
      Pt -> "If you don't suffer from time-space travel nausea, we recommend using your favourite teleportation device and input these coordinates:"
      Rs -> "If you don't suffer from time-space travel nausea, we recommend using your favourite teleportation device and input these coordinates:"

travellingSubtitle1: Lang -> String
travellingSubtitle1 lang  =
  case lang of 
      En -> "If by any chance, you are unable to get your hands on one, here are more rudimentary means of transportation:"
      Pt -> "Se por algum motivo não tiveres acesso a tal aparelho, existem opçōes de transporte mais rudimentares:"
      Rs -> "Se por algum motivo não tiveres acesso a tal aparelho, existem opçōes de transporte mais rudimentares:"

coordinates: Lang -> String
coordinates lang  =
  case lang of 
      En -> "45.3816° N, 20.3686° E"
      Pt -> "45.3816° N, 20.3686° E"
      Rs -> "45.3816° N, 20.3686° E"

airplane: Lang -> String
airplane lang  =
  case lang of 
      En -> "Airplane"
      Pt -> "Avião"
      Rs -> "Avião"

mainAirport0: Lang -> String
mainAirport0 lang  =
  case lang of 
      En -> "There are 3 airports nearby, with the most convenient being "
      Pt -> "Tens 3 aeroportos na proximidade, sendo o mais conveniente o"
      Rs -> "Tens 3 aeroportos na proximidade, sendo o mais conveniente o"

mainAirport1: Lang -> String
mainAirport1 lang  =
  case lang of 
      En -> "(85 km from the venue)."
      Pt -> "a 85km do destino."
      Rs -> "a 85km do destino."

belgradeAirport: Lang -> String
belgradeAirport lang  =
  case lang of 
      En -> "Nikola Tesla Airport"
      Pt -> "aeroporto Nikola Tesla"
      Rs -> "aeroporto Nikola Tesla"

em: Lang -> String
em lang  =
  case lang of 
      En -> " in "
      Pt -> " em "
      Rs -> " em "

belgrade: Lang -> String
belgrade lang  =
  case lang of 
      En -> "Belgrade"
      Pt -> "Belgrado"
      Rs -> "Belgrado"

londonLuton: Lang -> String
londonLuton lang  =
  case lang of 
      En -> "London Luton"
      Pt -> "Londres Luton"
      Rs -> "Londres Luton"

londonHeathrow: Lang -> String
londonHeathrow lang  =
  case lang of 
      En -> "London Heathrow"
      Pt -> "Londres Heathrow"
      Rs -> "Londres Heathrow"

easyJet: Lang -> String
easyJet lang  =
  case lang of 
      En -> "EasyJet"
      Pt -> "EasyJet"
      Rs -> "EasyJet"

wizzAir: Lang -> String
wizzAir lang  =
  case lang of 
      En -> "WizzAir"
      Pt -> "WizzAir"
      Rs -> "WizzAir"

airSerbia: Lang -> String
airSerbia lang  =
  case lang of 
      En -> "AirSerbia"
      Pt -> "AirSerbia"
      Rs -> "AirSerbia"

brussels: Lang -> String
brussels lang  =
  case lang of 
      En -> "Brussels"
      Pt -> "Bruxelas"
      Rs -> "Bruxelas"

eindhoven: Lang -> String
eindhoven lang  =
  case lang of 
      En -> "Eindhoven"
      Pt -> "Eindhoven"
      Rs -> "Eindhoven"

luqa: Lang -> String
luqa lang  =
  case lang of 
      En -> "Luqa"
      Pt -> "Luqa"
      Rs -> "Luqa"

parisBeauvais: Lang -> String
parisBeauvais lang  =
  case lang of 
      En -> "Paris Beauvais"
      Pt -> "Paris Beauvais"
      Rs -> "Paris Beauvais"

mainAirportSecondParagraph0: Lang -> String
mainAirportSecondParagraph0 lang  =
  case lang of 
      En -> "Direct flights are available from "
      Pt -> "Voos directos disponíveis de "
      Rs -> "Voos directos disponíveis de "

mainAirportSecondParagraph1: Lang -> String
mainAirportSecondParagraph1 lang  =
  case lang of 
      En -> "several cities in Germany "
      Pt -> "várias cidades na Alemanha "
      Rs -> "várias cidades na Alemanha "

etc: Lang -> String
etc lang  =
  case lang of 
      En -> "etc."
      Pt -> "etc."
      Rs -> "etc."

timisoaraAirport: Lang -> String
timisoaraAirport lang  =
  case lang of 
      En -> "Traian Vuia Timisoara Airport"
      Pt -> "aeroporto Traian Vuia Timisoara"
      Rs -> "aeroporto Traian Vuia Timisoara"

romania: Lang -> String
romania lang  =
  case lang of 
      En -> "Romania"
      Pt -> "Roménia"
      Rs -> "Roménia"

budapest: Lang -> String
budapest lang  =
  case lang of 
      En -> "Budapest"
      Pt -> "Budapeste"
      Rs -> "Budapeste"

hungary: Lang -> String
hungary lang  =
  case lang of 
      En -> "Hungary"
      Pt -> "Hungria"
      Rs -> "Hungria"

budapestAirport: Lang -> String
budapestAirport lang  =
  case lang of 
      En -> "Ferenc Liszt Airport"
      Pt -> "aeroporto Ferenc Liszt"
      Rs -> "aeroporto Ferenc Liszt"

otherAirports: Lang -> String
otherAirports lang  =
  case lang of 
      En -> "Other airports of interest are "
      Pt -> "Outros aeroportos de interesse são "
      Rs -> "Outros aeroportos de interesse são "

romaniaAirportDistance: Lang -> String
romaniaAirportDistance lang  =
  case lang of 
      En -> " (120 km from the destination) and "
      Pt -> " (120km do destino) e "
      Rs -> " (120km do destino) e "

budapestAirportDistance: Lang -> String
budapestAirportDistance lang  =
  case lang of 
      En -> " (330km from the destination)."
      Pt -> " (330km do destino)."
      Rs -> " (330km do destino)."

publicTravelFromAirport: Lang -> String
publicTravelFromAirport lang  =
  case lang of 
      En -> " In both cases keep in mind that you will need additional transportation service to reach Serbia with fixed price of 15€ from Timisoara and 25€ from Budapest when using "
      Pt -> " Em ambos os casos é necessário transporte adicional para chegar à Sérvia, com preço fixo de 15€ de Timisoara e 25€ de Budapeste pela companhia "
      Rs -> " Em ambos os casos é necessário transporte adicional para chegar à Sérvia, com preço fixo de 15€ de Timisoara e 25€ de Budapeste pela companhia "

geaTravel: Lang -> String
geaTravel lang  =
  case lang of 
      En -> " GeaTravel Services"
      Pt -> " GeaTravel Services"
      Rs -> " GeaTravel Services"

trainsTitle: Lang -> String
trainsTitle lang  =
  case lang of 
      En -> "Trains"
      Pt -> "Comboios"
      Rs -> "Comboios"

trains0: Lang -> String
trains0 lang  =
  case lang of 
      En -> "For easiest coordination please visit the Serbian Railway timetable and check trains that take you either to Novi Sad or Beograd Centar."
      Pt -> "Para melhor coordenação, dá uma olhadela no horário da Rede Ferroviária da Sérvia para comboios que te levem para Novi Sad ou Beograd Centar."
      Rs -> "Para melhor coordenação, dá uma olhadela no horário da Rede Ferroviária da Sérvia para comboios que te levem para Novi Sad ou Beograd Centar."

trains1: Lang -> String
trains1 lang  =
  case lang of 
      En -> "Direct connections are available from Vienna, Austria to Novi Sad (ADD PRICE HERE), from Budapest,Hungary to Novi Sad and from Ljubljana, Slovenia and Zagreb, Croatia to Belgrade."
      Pt -> "Há comboios directos de Viena, Austria e Budapeste, Hungria para Novi Sad e de Ljubljana, Eslovénia e Zagreb, Croácia para Belgrado."
      Rs -> "Há comboios directos de Viena, Austria e Budapeste, Hungria para Novi Sad e de Ljubljana, Eslovénia e Zagreb, Croácia para Belgrado."

busTitle: Lang -> String
busTitle lang  =
  case lang of 
      En -> "Bus"
      Pt -> "Camionetas"
      Rs -> "Camionetas"

bus0: Lang -> String
bus0 lang  =
  case lang of 
      En -> "If you are not a big fan of the gentle rocking of the train and prefer to stay on the road, consider checking out the bus service. "
      Pt -> "Se não gostas de comboios e preferes andar na estrada, existe a possibilidade de viajar numa camioneta. "
      Rs -> "Se não gostas de comboios e preferes andar na estrada, existe a possibilidade de viajar numa camioneta. "

bus1: Lang -> String
bus1 lang  =
  case lang of 
      En -> "As for the train, we recommend arriving at either Novi Sad or Belgrade. "
      Pt -> "Tal como os comboios, tens de chegar a Belgrado ou Novi Sad."
      Rs -> "Tal como os comboios, tens de chegar a Belgrado ou Novi Sad."

bus2: Lang -> String
bus2 lang  =
  case lang of 
      En -> "You can have a look at the "
      Pt -> "Podes consultar o "
      Rs -> "Podes consultar o "

bus3: Lang -> String
bus3 lang  =
  case lang of 
      En -> " of the Novi Sad bus stop. "
      Pt -> "da estação de camionagem de Novi Sad.  "
      Rs -> "da estação de camionagem de Novi Sad.  "

bus4: Lang -> String
bus4 lang  =
  case lang of 
      En -> "As there’s no English website choose the date of travel from the drop down menu and specify are you looking for arrivals to Novi Sad (DOLASCI) or departures from Novi Sad (POLASCI) and start typing the name of the city you are interested in. "
      Pt -> "Se não fores fluente em sérvio (compreensível!), para usares o site escolhe a data da viagem e seleciona Chegadas (DOLASCI) ou Partidas (POLASCI) para Novi Sad e escolhe a cidade para que pretendes viajar. "
      Rs -> "Se não fores fluente em sérvio (compreensível!), para usares o site escolhe a data da viagem e seleciona Chegadas (DOLASCI) ou Partidas (POLASCI) para Novi Sad e escolhe a cidade para que pretendes viajar. "

bus5: Lang -> String
bus5 lang  =
  case lang of 
      En -> "Keep in mind that not all destinations are served daily and that the price is given for one direction in RSD (Serbian dinars). "
      Pt -> "Tem em consideração que nem todas as viagens acontecem diáriamente e que o preço está em Dinaras Sérvias (RSD). "
      Rs -> "Tem em consideração que nem todas as viagens acontecem diáriamente e que o preço está em Dinaras Sérvias (RSD). "

bus6: Lang -> String
bus6 lang  =
  case lang of 
      En -> "You can check the "
      Pt -> "Podes ver o "
      Rs -> "Podes ver o "

bus7: Lang -> String
bus7 lang  =
  case lang of 
      En -> " of the Belgrade bus stop as well, choose whether you need arrivals or departures, specific date and country and start typing the city’s name in the remaining box. "
      Pt -> " da central de Belgrado também, escolhe partidas ou chegadas, escolhe a data de viagem, país destino e começa a escrever o nome da cidade no campo restante. "
      Rs -> " da central de Belgrado também, escolhe partidas ou chegadas, escolhe a data de viagem, país destino e começa a escrever o nome da cidade no campo restante. "

bus8: Lang -> String
bus8 lang  =
  case lang of 
      En -> "Country names are given in Serbian and if you have trouble understanding/translating let us know. "
      Pt -> "Os nomes dos países estão em sérvio, portanto se tiveres dúvidas e precisares de ajuda/tradutores avisa-nos, estamos aqui para ajudar. "
      Rs -> "Os nomes dos países estão em sérvio, portanto se tiveres dúvidas e precisares de ajuda/tradutores avisa-nos, estamos aqui para ajudar. "

bus9: Lang -> String
bus9 lang  =
  case lang of 
      En -> "Unfortunately this site won’t provide you with the ticket price (Serbia is a lovely country, and people still really like to give everyone a call), so in case you find something you think will work for you, let us know and we’ll get the price information. "
      Pt -> "Infelizmente esta pagina não tem informação de preços dos bilhetes. Na amável Sérvia, as pessoas ainda preferem telefonar para saber informaçōes, e podemos fazer isso por ti, claro!"
      Rs -> "Infelizmente esta pagina não tem informação de preços dos bilhetes. Na amável Sérvia, as pessoas ainda preferem telefonar para saber informaçōes, e podemos fazer isso por ti, claro!"

timetable: Lang -> String
timetable lang  =
  case lang of 
      En -> "timetable"
      Pt -> "horário"
      Rs -> "horário"

carTitle: Lang -> String
carTitle lang  =
  case lang of 
      En -> "Car"
      Pt -> "Carro"
      Rs -> "Carro"

car0: Lang -> String
car0 lang  =
  case lang of 
      En -> "If you decide to drive we recommend taking some extra time to make stops at some interesting destinations. "
      Pt -> "Se decidires conduzir, o melhor é mesmo tirar uns dias e parar em sítios de interesse, a viagem é longa."
      Rs -> "Se decidires conduzir, o melhor é mesmo tirar uns dias e parar em sítios de interesse, a viagem é longa."

car1: Lang -> String
car1 lang  =
  case lang of 
      En -> "Depending on where are you traveling from it will take you around two full days of driving, if coming from west Europe (eg. London - Zrenjanin distance 2000 km) or a very intense one day if coming from central Europe (eg. Frankfurt - Zrenjanin distance 1200km)."
      Pt -> "Se viajares do Porto são 3000km e demorará cerca de 3-4 dias longos a conduzir."
      Rs -> "Se viajares do Porto são 3000km e demorará cerca de 3-4 dias longos a conduzir."

motorbikeTitle: Lang -> String
motorbikeTitle lang  =
  case lang of 
      En -> "Motorbike"
      Pt -> "Mota"
      Rs -> "Mota"

motorbike0: Lang -> String
motorbike0 lang  =
  case lang of 
      En -> "If feeling super enthusiastic venture out with your two wheeled best friend! "
      Pt -> "É sempre uma boa idea vires na amiga de duas rodas! "
      Rs -> "É sempre uma boa idea vires na amiga de duas rodas! "

motorbike1: Lang -> String
motorbike1 lang  =
  case lang of 
      En -> "Weather in September is warm and dry in the most of Europe and this could easily be a week long trip to tell the grandkids about. "
      Pt -> "O tempo em setembro costuma ser bom, e é a desculpa perfeita para uma aventura para contar aos netos! "
      Rs -> "O tempo em setembro costuma ser bom, e é a desculpa perfeita para uma aventura para contar aos netos! "

motorbike2: Lang -> String
motorbike2 lang  =
  case lang of 
      En -> "Paramedics and sugary water will be available upon reaching the destination. And all the glory of course, we love bikes! 🏍 Don't forget to show us the pictures!"
      Pt -> "Garantimos médicos, água com açúcar e Rakia para ajudar com a recuperação motoqueira, juntamente com um incrível respeito. Não te esqueças de mostrar as fotos. Nós adoramos motas! 🏍"
      Rs -> "Garantimos médicos, água com açúcar e Rakia para ajudar com a recuperação motoqueira, juntamente com um incrível respeito. Não te esqueças de mostrar as fotos. Nós adoramos motas! 🏍"

walkAndSwimTitle: Lang -> String
walkAndSwimTitle lang  =
  case lang of 
      En -> "Walk & swim"
      Pt -> "A pé e a nado"
      Rs -> "A pé e a nado"

walkAndSwim0: Lang -> String
walkAndSwim0 lang  =
  case lang of 
      En -> "Aren't you the enthusiast of the party? "
      Pt -> "Tu é que és maluco, chefe! "
      Rs -> "Tu é que és maluco, chefe! "

walkAndSwim1: Lang -> String
walkAndSwim1 lang  =
  case lang of 
      En -> "If this is how you like it, only thing we can say is scroll down to the RSVP page, confirm your arrival, and get going, you don't want to be late!"
      Pt -> "Bem, mas se quiseres mesmo, confirma o RSVP e toca a despachar, senão chegas atrasado!"
      Rs -> "Bem, mas se quiseres mesmo, confirma o RSVP e toca a despachar, senão chegas atrasado!"

carRentalTitle: Lang -> String
carRentalTitle lang  =
  case lang of 
      En -> "Can't live without your car?"
      Pt -> "Não vives sem o teu carro?"
      Rs -> "Não vives sem o teu carro?"

carRental0: Lang -> String
carRental0 lang  =
  case lang of 
      En -> "Not a problem! "
      Pt -> "Não há problema! "
      Rs -> "Não há problema! "

carRental1: Lang -> String
carRental1 lang  =
  case lang of 
      En -> "If you are arriving in Belgrade (by plane, train or bus) we are happy to recommend "
      Pt -> "Se chegares a Belgrado nós recomendamos "
      Rs -> "Se chegares a Belgrado nós recomendamos "

carRental2: Lang -> String
carRental2 lang  =
  case lang of 
      En -> "Their website may not be, but they are very English friendly, decently priced and will bring the car to you at any time. "
      Pt -> "O site está em sérvio, mas toda a equipa fala inglês. Os preços são bons e eles entregam te o carro a qualquer altura do dia. "
      Rs -> "O site está em sérvio, mas toda a equipa fala inglês. Os preços são bons e eles entregam te o carro a qualquer altura do dia. "

carRental3: Lang -> String
carRental3 lang  =
  case lang of 
      En -> "Plus side is that you can also use it to travel around Balkans and EU with no distance limitations. "
      Pt -> "Além disso, podes passar fronteiras (tanto dentro e fora da UE) sem limites de quilometragem. "
      Rs -> "Além disso, podes passar fronteiras (tanto dentro e fora da UE) sem limites de quilometragem. "

carRental4: Lang -> String
carRental4 lang  =
  case lang of 
      En -> "Select your car and email/WhatsApp them with the details of your trip and they will guide you through the entire process."
      Pt -> "Escolhe o carro que queres e manda-lhes um mail/WhatsApp com informaçaão sobre a tua viagem e eles ajudam te no processo todo."
      Rs -> "Escolhe o carro que queres e manda-lhes um mail/WhatsApp com informaçaão sobre a tua viagem e eles ajudam te no processo todo."

novaRent: Lang -> String
novaRent lang  =
  case lang of 
      En -> "Nova rent. "
      Pt -> "Nova rent. "
      Rs -> "Nova rent. "

travellingFinal: Lang -> String
travellingFinal lang  =
  case lang of 
      En -> "Whatever your preference of transportation is, let us know and we will happily help with arranging the details."
      Pt -> "Qualquer que seja a tua preferência de transporte, contacta-nos que temos todo o gosto em ajudar-te a organizar tudo."
      Rs -> "Qualquer que seja a tua preferência de transporte, contacta-nos que temos todo o gosto em ajudar-te a organizar tudo."

accomodationTitle: Lang -> String
accomodationTitle lang  =
  case lang of 
      En -> "Where can you stay?"
      Pt -> "Onde posso ficar?"
      Rs -> "Onde posso ficar?"

accomodationDesc: Lang -> String
accomodationDesc lang  =
  case lang of 
      En -> "City and the surrounding area offer several accommodation places that can work a range of needs and budgets."
      Pt -> "a cidade de Zrenjanin oferece várias opçōes de alojamento para vários orçamentos."
      Rs -> "a cidade de Zrenjanin oferece várias opçōes de alojamento para vários orçamentos."

dvoracKastel: Lang -> String
dvoracKastel lang  =
  case lang of 
      En -> "Dvorac Kaštel"
      Pt -> "Dvorac Kaštel"
      Rs -> "Dvorac Kaštel"

dvoracKastelDesc: Lang -> String
dvoracKastelDesc lang  =
  case lang of 
      En -> "This is our venue! They offer 38 rooms and 7 suites ranging from 40€ to 90€ a night. If you decide to book, mention you are in out wedding party and you will receive complimentary 15% discount for 2 nights. "
      Pt -> "O casório é aqui! Existem 38 quartos e 7 suites de 40€ até 90€ por noite (preço por quarto). Se quiseres reservar, diz-lhes que vais estar lá na nossa festa e tens 15% de desconto por 2 noites. "
      Rs -> "O casório é aqui! Existem 38 quartos e 7 suites de 40€ até 90€ por noite (preço por quarto). Se quiseres reservar, diz-lhes que vais estar lá na nossa festa e tens 15% de desconto por 2 noites. "

hotelVojvodina: Lang -> String
hotelVojvodina lang  =
  case lang of 
      En -> "Hotel Vojvodina"
      Pt -> "Hotel Vojvodina"
      Rs -> "Hotel Vojvodina"

hotelVojvodinaDesc: Lang -> String
hotelVojvodinaDesc lang  =
  case lang of 
      En -> "Located in the city center of Zrenjanin, 8km from our venue, this hotel is newly renovated and offers double and twin rooms as well as suites. Prices start from 40€. "
      Pt -> "Situado no centro de Zrenjanin, a 8km do sítio da festa, este hotel foi renovado recentemente e oferece quartos duplos e suites. Preços deste 40€. "
      Rs -> "Situado no centro de Zrenjanin, a 8km do sítio da festa, este hotel foi renovado recentemente e oferece quartos duplos e suites. Preços deste 40€. "

luxotel: Lang -> String
luxotel lang  =
  case lang of 
      En -> "Luxotel"
      Pt -> "Luxotel"
      Rs -> "Luxotel"

luxotelDesc: Lang -> String
luxotelDesc lang  =
  case lang of 
      En -> "Small, family owned and operated hotel, located 12km from our venue. It is equipped with double, twin and triple rooms with prices starting at 25€ per person."
      Pt -> "Um pequeno negócio de família, a located 12km da nossa festa. Tem quartos duplos e triplos com preços desde 25€ por pessoa."
      Rs -> "Um pequeno negócio de família, a located 12km da nossa festa. Tem quartos duplos e triplos com preços desde 25€ por pessoa."

accomodationFinal: Lang -> String
accomodationFinal lang  =
  case lang of 
      En -> "All options come with complimentary parking and optional breakfast. "
      Pt -> "Todas estas opçōes oferecem estacionamento gratuito, mas o pequeno almoço não está incluído. "
      Rs -> "Todas estas opçōes oferecem estacionamento gratuito, mas o pequeno almoço não está incluído. "

apartments: Lang -> String
apartments lang  =
  case lang of 
      En -> "St. George's apartments"
      Pt -> "Apartamentos de S. George"
      Rs -> "Apartamentos de S. George"

apartmentsDesc: Lang -> String
apartmentsDesc lang  =
  case lang of 
      En -> "etho styled apartments in the city center, priced at (ADD PRICE HERE)"
      Pt -> "Apartmentos no centro da cidade, preços desde (ADD PRICE HERE)"
      Rs -> "Apartmentos no centro da cidade, preços desde (ADD PRICE HERE)"

villa: Lang -> String
villa lang  =
  case lang of 
      En -> "Villa Filadelija"
      Pt -> "Villa Filadelija"
      Rs -> "Villa Filadelija"

villaDesc: Lang -> String
villaDesc lang  =
  case lang of 
      En -> "located in the wider city center area, 8km from the venue, with several rooms and price starting at 16€ a night"
      Pt -> "Também no centro, a 8km da nossa festa, tem vários quartos desde 16€ por noite"
      Rs -> "Também no centro, a 8km da nossa festa, tem vários quartos desde 16€ por noite"

hostelZrenjanin: Lang -> String
hostelZrenjanin lang  =
  case lang of 
      En -> "Hostel Zrenjanin"
      Pt -> "Hostel Zrenjanin"
      Rs -> "Hostel Zrenjanin"

hostelZrenjaninDesc: Lang -> String
hostelZrenjaninDesc lang  =
  case lang of 
      En -> "most affordable accommodation option with price per bed at "
      Pt -> "O estabelecimento mais económico, com preço por noite desde "
      Rs -> "O estabelecimento mais económico, com preço por noite desde "

airbnb: Lang -> String
airbnb lang  =
  case lang of 
      En -> "Airbnb"
      Pt -> "Airbnb"
      Rs -> "Airbnb"

airbnbDesc: Lang -> String
airbnbDesc lang  =
  case lang of 
      En -> "if you are looking for a more home like option, there are several options ranging 15-40€ a night scattered around the city. Type in Zrenjanin, Serbia as location."
      Pt -> "Há várias opçōes entre 15€-40€ por noite espalhadas pela cidade. Procura por alojamento em Zrenjanin."
      Rs -> "Há várias opçōes entre 15€-40€ por noite espalhadas pela cidade. Procura por alojamento em Zrenjanin."

booking: Lang -> String
booking lang  =
  case lang of 
      En -> "Booking.com"
      Pt -> "Booking.com"
      Rs -> "Booking.com"

bookingDesc: Lang -> String
bookingDesc lang  =
  case lang of 
      En -> "varying prices and accommodation types."
      Pt -> "Várias opçōes para todos os preços."
      Rs -> "Várias opçōes para todos os preços."

limba: Lang -> String
limba lang  =
  case lang of 
      En -> "Limba"
      Pt -> "Limba"
      Rs -> "Limba"

limbaDesc: Lang -> String
limbaDesc lang  =
  case lang of 
      En -> "local version of booking.com, thankfully English friendly."
      Pt -> "Versão sérvia do booking.com, com site em Inglês."
      Rs -> "Versão sérvia do booking.com, com site em Inglês."

apartmani: Lang -> String
apartmani lang  =
  case lang of 
      En -> "Apartmani ZR"
      Pt -> "Apartmani ZR"
      Rs -> "Apartmani ZR"

apartmaniDesc: Lang -> String
apartmaniDesc lang  =
  case lang of 
      En -> "unfortunately not an ENglish friendly website. They offer several rooms, studios and apartments in the pedestrian zone starting at. Feel free to drop them an email inquiry."
      Pt -> "Infelizmente, o site está em sérvio, mas oferecem vários quartos e apartamentos no centro com preços desde (PRECO AQUI). Contacta-os por email."
      Rs -> "Infelizmente, o site está em sérvio, mas oferecem vários quartos e apartamentos no centro com preços desde (PRECO AQUI). Contacta-os por email."

rsvpTitle: Lang -> String
rsvpTitle lang  =
  case lang of 
      En -> "RSVP"
      Pt -> "RSVP"
      Rs -> "RSVP"

rsvp0: Lang -> String
rsvp0 lang  =
  case lang of 
      En -> "Please RSVP no later than the 1st of July."
      Pt -> "Preenche o RSVP até dia 1 de Julho, por favor."
      Rs -> "Preenche o RSVP até dia 1 de Julho, por favor."

rsvp1: Lang -> String
rsvp1 lang  =
  case lang of 
      En -> "Kindly provide dietary requirements/allergies in the NOTES section. "
      Pt -> "Se tiveres alergias ou dietas alternativas, informa-nos na secção das Notas. "
      Rs -> "Se tiveres alergias ou dietas alternativas, informa-nos na secção das Notas. "

rsvp2: Lang -> String
rsvp2 lang  =
  case lang of 
      En -> " Also let us know if you will you be needing transportation services to and from the airport/train station and on the day of the wedding (brides house - church - restaurant)."
      Pt -> "Avisa-nos também se precisas de transporte, para tentarmos organizar forma de te ir buscar ao aeroporto/estação, ou dar-te boleia para qualquer um dos lugares da festa (Casa do noivo - casa da noiva - Castelo)"
      Rs -> "Avisa-nos também se precisas de transporte, para tentarmos organizar forma de te ir buscar ao aeroporto/estação, ou dar-te boleia para qualquer um dos lugares da festa (Casa do noivo - casa da noiva - Castelo)"