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