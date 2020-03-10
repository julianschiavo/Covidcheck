//
//  CountryFlag.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

enum Region: CaseIterable {
    case africaMiddleEastAndIndia
    case asia
    case australasia
    case europe
    case northAmerica
    case southAmerica
    case restOfTheWorld
    
    var name: String {
        switch self {
        case .africaMiddleEastAndIndia: return "Africa, Middle East, and India"
        case .asia: return "Asia"
        case .australasia: return "Australasia"
        case .europe: return "Europe"
        case .northAmerica: return "North America"
        case .southAmerica: return "South America"
        case .restOfTheWorld: return "Rest of the World"
        }
    }
}

enum CountryData: String {
    case overall = "Overall"
    
    // Africa, Middle East, and India
    case algeria = "Algeria"
    case armenia = "Armenia"
    case bahrain = "Bahrain"
    case botswana = "Botswana"
    case cameroon = "Cameroon"
    case centralAfricanRepublic = "Central African Republic"
    case egypt = "Egypt"
    case equatorialGuinea = "Equatorial Guinea"
    case guineaBissau = "Guinea-Bissau"
    case guinea = "Guinea"
    case india = "India"
    case israel = "Israel"
    case ivoryCoast = "Ivory Coast (Côte d'Ivoire)"
    case jordan = "Jordan"
    case kenya = "Kenya"
    case kuwait = "Kuwait"
    case madagascar = "Madagascar"
    case mali = "Mali"
    case mauritius = "Mauritius"
    case morocco = "Morocco"
    case mozambique = "Mozambique"
    case niger = "Niger"
    case nigeria = "Nigeria"
    case occupiedPalestinianTerritory = "Occupied Palestinian territory"
    case oman = "Oman"
    case qatar = "Qatar"
    case saudiArabia = "Saudi Arabia"
    case senegal = "Senegal"
    case southAfrica = "South Africa"
    case togo = "Togo"
    case tunisia = "Tunisia"
    case uganda = "Uganda"
    case unitedArabEmirates = "United Arab Emirates"
    
    // Asia
    case mainlandChina = "Mainland China"
    case afghanistan = "Afghanistan"
    case azerbaijan = "Azerbaijan"
    case bangladesh = "Bangladesh"
    case bhutan = "Bhutan"
    case brunei = "Brunei"
    case cambodia = "Cambodia"
    case diamondPrincessCruiseShip = "Diamond Princess"
    case hongKong = "Hong Kong"
    case indonesia = "Indonesia"
    case iran = "Iran"
    case iraq = "Iraq"
    case japan = "Japan"
    case lebanon = "Lebanon"
    case macau = "Macau"
    case malaysia = "Malaysia"
    case maldives = "Maldives"
    case mongolia = "Mongolia"
    case nepal = "Nepal"
    case pakistan = "Pakistan"
    case philippines = "Philippines"
    case singapore = "Singapore"
    case sriLanka = "Sri Lanka"
    case korea = "South Korea"
    case taiwan = "Taiwan"
    case thailand = "Thailand"
    case vietnam = "Vietnam"
    case asia = "Rest of Asia"
    
    // Australasia
    case australasia = "Australasia"
    case australia = "Australia"
    case newZealand = "New Zealand"
    
    // Europe
    case europe = "Europe"
    case albania = "Albania"
    case andorra = "Andorra"
    case austria = "Austria"
    case belarus = "Belarus"
    case belgium = "Belgium"
    case bosniaAndHerzegovina = "Bosnia and Herzegovina"
    case bulgaria = "Bulgaria"
    case croatia = "Croatia"
    case cyprus = "Cyprus"
    case czechRepublic = "Czech Republic"
    case denmark = "Denmark"
    case estonia = "Estonia"
    case faroeIslands = "Faroe Islands"
    case germany = "Germany"
    case georgia = "Georgia"
    case gibraltar = "Gibraltar"
    case greece = "Greece"
    case finland = "Finland"
    case france = "France"
    case hungary = "Hungary"
    case iceland = "Iceland"
    case ireland = "Ireland"
    case italy = "Italy"
    case latvia = "Latvia"
    case liechtenstein = "Liechtenstein"
    case lithuania = "Lithuania"
    case luxembourg = "Luxembourg"
    case malta = "Malta"
    case moldova = "Moldova"
    case monaco = "Monaco"
    case montenegro = "Montenegro"
    case netherlands = "Netherlands"
    case northMacedonia = "North Macedonia"
    case norway = "Norway"
    case poland = "Poland"
    case portugal = "Portugal"
    case romania = "Romania"
    case russia = "Russia"
    case sanMarino = "San Marino"
    case serbia = "Serbia"
    case slovakia = "Slovakia"
    case slovenia = "Slovenia"
    case spain = "Spain"
    case sweden = "Sweden"
    case switzerland = "Switzerland"
    case turkey = "Turkey"
    case ukraine = "Ukraine"
    case unitedKingdom = "United Kingdom"
    case vaticanCity = "Vatican City"
    case vaticanCityAlternativeName = "Holy See"
    
    case northAmerica = "North America"
    case grandPrincessCruiseShip = "Grand Princess"
    case unitedStates = "United States"
    case canada = "Canada"
    
    // South America
    case southAmerica = "South America"
    case anguilla = "Anguilla"
    case antiguaAndBarbuda = "Antigua and Barbuda"
    case argentina = "Argentina"
    case barbados = "Barbados"
    case belize = "Belize"
    case bermuda = "Bermuda"
    case bolivia = "Bolivia"
    case brazil = "Brazil"
    case britishVirginIslands = "British Virgin Islands"
    case caymanIslands = "Cayman Islands"
    case chile = "Chile"
    case colombia = "Colombia"
    case costaRica = "Costa Rica"
    case dominica = "Dominica"
    case dominicanRepublic = "Dominican Republic"
    case ecuador = "Ecuador"
    case elSalvador = "El Salvador"
    case frenchGuiana = "French Guiana"
    case grenada = "Grenada"
    case guatemala = "Guatemala"
    case guyana = "Guyana"
    case honduras = "Honduras"
    case jamaica = "Jamaica"
    case mexico = "Mexico"
    case martinique = "Martinique"
    case montserrat = "Montserrat"
    case nicaragua = "Nicaragua"
    case panama = "Panama"
    case paraguay = "Paraguay"
    case peru = "Peru"
    case stKittsAndNevis = "St. Kitts and Nevis"
    case stLucia = "St. Lucia"
    case stVincentAndTheGrenadines = "St. Vincent and the Grenadines"
    case suriname = "Suriname"
    case theBahamas = "The Bahamas"
    case trinidadAndTobago = "Trinidad and Tobago"
    case turksAndCaicos = "Turks and Caicos Islands"
    case uruguay = "Uruguay"
    case venezuela = "Venezuela"
    
    case restOfTheWorld = "Rest of the world"
    
    var region: Region {
        switch self {
        case .algeria,
             .armenia,
             .bahrain,
             .botswana,
             .cameroon,
             .centralAfricanRepublic,
             .egypt,
             .equatorialGuinea,
             .guineaBissau,
             .guinea,
             .india,
             .israel,
             .ivoryCoast,
             .jordan,
             .kenya,
             .kuwait,
             .madagascar,
             .mali,
             .mauritius,
             .morocco,
             .mozambique,
             .niger,
             .nigeria,
             .occupiedPalestinianTerritory,
             .oman,
             .qatar,
             .saudiArabia,
             .senegal,
             .southAfrica,
             .togo,
             .tunisia,
             .uganda,
             .unitedArabEmirates:
            return .africaMiddleEastAndIndia
            
        case .mainlandChina, 
             .hongKong,
             .macau,
             .taiwan,
             .afghanistan,
             .azerbaijan,
             .bangladesh,
             .bhutan,
             .brunei,
             .cambodia,
             .diamondPrincessCruiseShip,
             .asia,
             .korea,
             .indonesia,
             .iran,
             .iraq,
             .japan,
             .lebanon,
             .malaysia,
             .maldives,
             .mongolia,
             .nepal,
             .pakistan,
             .philippines,
             .singapore,
             .sriLanka,
             .thailand,
             .vietnam:
            return .asia
            
        case .australasia,
             .australia,
             .newZealand:
            return .australasia
            
            
        // Europe
        case .europe,
             .albania,
             .andorra,
             .austria,
             .belarus,
             .belgium,
             .bosniaAndHerzegovina,
             .bulgaria,
             .croatia,
             .cyprus,
             .czechRepublic,
             .denmark,
             .estonia,
             .faroeIslands,
             .germany,
             .georgia,
             .gibraltar,
             .greece,
             .finland,
             .france,
             .hungary,
             .iceland,
             .ireland,
             .italy,
             .latvia,
             .liechtenstein,
             .lithuania,
             .luxembourg,
             .malta,
             .moldova,
             .monaco,
             .montenegro,
             .netherlands,
             .northMacedonia,
             .norway,
             .poland,
             .portugal,
             .romania,
             .russia,
             .sanMarino,
             .serbia,
             .slovakia,
             .slovenia,
             .spain,
             .sweden,
             .switzerland,
             .turkey,
             .ukraine,
             .unitedKingdom,
             .vaticanCity,
             .vaticanCityAlternativeName:
            return .europe
            
        case .northAmerica,
             .grandPrincessCruiseShip,
             .unitedStates,
             .canada:
            return .northAmerica
            
        case .southAmerica,
             .anguilla,
             .antiguaAndBarbuda,
             .argentina,
             .barbados,
             .belize,
             .bermuda,
             .bolivia,
             .brazil,
             .britishVirginIslands,
             .caymanIslands,
             .chile,
             .colombia,
             .costaRica,
             .dominica,
             .dominicanRepublic,
             .ecuador,
             .elSalvador,
             .frenchGuiana,
             .grenada,
             .guatemala,
             .guyana,
             .honduras,
             .jamaica,
             .martinique,
             .mexico,
             .montserrat,
             .nicaragua,
             .panama,
             .paraguay,
             .peru,
             .stKittsAndNevis,
             .stLucia,
             .stVincentAndTheGrenadines,
             .suriname,
             .theBahamas,
             .trinidadAndTobago,
             .turksAndCaicos,
             .uruguay,
             .venezuela:
            return .southAmerica
            
        case .overall, .restOfTheWorld:
            return .restOfTheWorld
        }
    }
    
    var code: String {
        switch self {
        // Africa, Middle East, and India
        case .algeria: return "dz"
        case .armenia: return "am"
        case .bahrain: return "bh"
        case .botswana: return "bw"
        case .cameroon: return "cm"
        case .centralAfricanRepublic: return "cf"
        case .egypt: return "eg"
        case .equatorialGuinea: return "gq"
        case .guineaBissau: return "gw"
        case .guinea: return "gw"
        case .india: return "in"
        case .israel: return "il"
        case .ivoryCoast: return "ci"
        case .jordan: return "jo"
        case .kenya: return "ke"
        case .kuwait: return "kw"
        case .madagascar: return "mg"
        case .mali: return "ml"
        case .mauritius: return "mu"
        case .morocco: return "ma"
        case .mozambique: return "mz"
        case .niger: return "ne"
        case .nigeria: return "ng"
        case .occupiedPalestinianTerritory: return "noflag"
        case .oman: return "om"
        case .qatar: return "qa"
        case .saudiArabia: return "sa"
        case .senegal: return "sn"
        case .southAfrica: return "za"
        case .togo: return "tg"
        case .tunisia: return "tn"
        case .uganda: return "ug"
        case .unitedArabEmirates: return "ae"
            
        case .mainlandChina: return "cn"
        case .hongKong: return "hk"
        case .macau: return "mo"
        case .taiwan: return "tw"
        case .afghanistan: return "af"
        case .azerbaijan: return "az"
        case .bangladesh: return "bd"
        case .bhutan: return "bt"
        case .brunei: return "bn"
        case .cambodia: return "kh"
        case .korea: return "kr"
        case .indonesia: return "id"
        case .iran: return "ir"
        case .iraq: return "iq"
        case .diamondPrincessCruiseShip, .japan: return "jp"
        case .lebanon: return "lb"
        case .malaysia: return "my"
        case .maldives: return "mv"
        case .mongolia: return "mn"
        case .nepal: return "np"
        case .pakistan: return "pk"
        case .philippines: return "ph"
        case .singapore: return "sg"
        case .sriLanka: return "lk"
        case .thailand: return "th"
        case .vietnam: return "vn"
            
        // Europe
        case .europe: return "eu"
        case .albania: return "al"
        case .andorra: return "ad"
        case .austria: return "at"
        case .belarus: return "by"
        case .belgium: return "be"
        case .bosniaAndHerzegovina: return "ba"
        case .bulgaria: return "bg"
        case .croatia: return "hr"
        case .cyprus: return "cy"
        case .czechRepublic: return "cz"
        case .denmark: return "dk"
        case .estonia: return "ee"
        case .faroeIslands: return "fo"
        case .germany: return "de"
        case .georgia: return "ge"
        case .gibraltar: return "gi"
        case .greece: return "gr"
        case .finland: return "fi"
        case .france, .frenchGuiana, .martinique: return "fr"
        case .hungary: return "hu"
        case .iceland: return "is"
        case .ireland: return "ie"
        case .italy: return "it"
        case .latvia: return "lv"
        case .liechtenstein: return "li"
        case .lithuania: return "lt"
        case .luxembourg: return "lu"
        case .malta: return "mt"
        case .moldova: return "md"
        case .monaco: return "mc"
        case .montenegro: return "me"
        case .netherlands: return "nl"
        case .northMacedonia: return "mk"
        case .norway: return "no"
        case .poland: return "pl"
        case .portugal: return "pt"
        case .romania: return "ro"
        case .russia: return "ru"
        case .sanMarino: return "sm"
        case .serbia: return "rs"
        case .slovakia: return "sk"
        case .slovenia: return "si"
        case .spain: return "es"
        case .sweden: return "se"
        case .switzerland: return "ch"
        case .turkey: return "tr"
        case .ukraine: return "ua"
        case .unitedKingdom: return "uk"
        case .vaticanCity, .vaticanCityAlternativeName: return "va"
            
        // South America
        case .southAmerica: return "america"
        case .anguilla: return "ai"
        case .antiguaAndBarbuda: return "ag"
        case .argentina: return "ar"
        case .barbados: return "bb"
        case .belize: return "bz"
        case .bermuda: return "bm"
        case .bolivia: return "bo"
        case .brazil: return "br"
        case .britishVirginIslands: return "vg"
        case .caymanIslands: return "ky"
        case .chile: return "cl"
        case .colombia: return "co"
        case .costaRica: return "cr"
        case .dominica: return "dm"
        case .dominicanRepublic: return "do"
        case .ecuador: return "ec"
        case .elSalvador: return "sv"
        case .grenada: return "gd"
        case .guatemala: return "gt"
        case .guyana: return "gy"
        case .honduras: return "hn"
        case .jamaica: return "jm"
        case .mexico: return "mx"
        case .montserrat: return "ms"
        case .nicaragua: return "ni"
        case .panama: return "pa"
        case .paraguay: return "py"
        case .peru: return "pe"
        case .stKittsAndNevis: return "kn"
        case .stLucia: return "lc"
        case .stVincentAndTheGrenadines: return "vc"
        case .suriname: return "sr"
        case .theBahamas: return "bs"
        case .trinidadAndTobago: return "tt"
        case .turksAndCaicos: return "tc"
        case .uruguay: return "uy"
        case .venezuela: return "ve"
            
        case .australasia, .australia: return "au"
        case .newZealand: return "nz"
        case .northAmerica: return "america"
        case .grandPrincessCruiseShip, .unitedStates: return "us"
        case .canada: return "ca"
//        default: return "default"
        case .overall:
            return "world"
        case .asia:
            return "asia"
        case .restOfTheWorld:
            return "world"
        }
    }
    
    var image: Image {
        Image(code)
    }
}
