//
//  CountryFlag.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/*
 INFO
 This file contains data on regions/continents and countries
 generated based on the ISO-3166(-1) specification. Where
 the data source uses a different name for the place, the
 original name has been commented and replaced.
 
 *Original Data:* https://gist.github.com/julianschiavo/efdac8b2799ef2809719e89ade27a4a7
 */

/*
 FLAGS
 Note that while flags have been added/downloaded for most countries,
 some countries may still be missing flags, including:
 
 Aland Islands (AX), Antarctica (AQ), Benin (BJ), British Indian Ocean
 Territory (IO), Burundi (BI), Cocos (Keeling) Islands (CC), Comoros (KM),
 Democratic People's Republic of Korea (North Korea) (KP), Djibouti (DJ),
 Eritrea (ER), French Southern Territories (TF), Kiribati (KI),
 Libya (LY), Malawi (MW), Marshall Islands (MH), Niue (NU), Palau (PW),
 Pitcairn Islands (PN), Sao Tome and Principe ST, South Sudan (SS),
 Syrian Arab Republic (SY), Timor Leste (TL), Tokelau (TK), Tuvalu (TV),
 Wallis and Futuna (WF), Western Samara (EH), Yemen (YE).
 
 Feel free to create a Pull Request to add any of the above countries' flag
 to Flags.xcassets, using the following format:
 - Round Flag 30x30 named CountryCode.png
 - Round Flag 60x60 named CountryCode@2x.png
 If you add a flag, remove the country from the list above.
 */

enum Region: String, CaseIterable {
    case overall = "Overall"
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case latinAmericaAndTheCaribbean = "Latin America and the Caribbean"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case restOfTheWorld = "Rest of the World"
    
    var name: String { rawValue }
}

enum CountryData: String {
    case overall = "Overall"
    case afghanistan = "Afghanistan"
    case alandIslands = "Åland Islands"
    case albania = "Albania"
    case algeria = "Algeria"
    case americanSamoa = "American Samoa"
    case andorra = "Andorra"
    case angola = "Angola"
    case anguilla = "Anguilla"
    case antarctica = "Antarctica"
    case antiguaAndBarbuda = "Antigua and Barbuda"
    case argentina = "Argentina"
    case armenia = "Armenia"
    case aruba = "Aruba"
    case australia = "Australia"
    case austria = "Austria"
    case azerbaijan = "Azerbaijan"
    case bahamas = "Bahamas"
    case bahrain = "Bahrain"
    case bangladesh = "Bangladesh"
    case barbados = "Barbados"
    case belarus = "Belarus"
    case belgium = "Belgium"
    case belize = "Belize"
    case benin = "Benin"
    case bermuda = "Bermuda"
    case bhutan = "Bhutan"
    case boliviaPlurinationalStateOf = "Bolivia (Plurinational State of)"
    case bonaireSintEustatiusAndSaba = "Bonaire, Sint Eustatius and Saba"
    case bosniaAndHerzegovina = "Bosnia and Herzegovina"
    case botswana = "Botswana"
    case bouvetIsland = "Bouvet Island"
    case brazil = "Brazil"
    case britishIndianOceanTerritory = "British Indian Ocean Territory"
    case bruneiDarussalam = "Brunei Darussalam"
    case bulgaria = "Bulgaria"
    case burkinaFaso = "Burkina Faso"
    case burundi = "Burundi"
    case caboVerde = "Cabo Verde"
    case cambodia = "Cambodia"
    case cameroon = "Cameroon"
    case canada = "Canada"
    case caymanIslands = "Cayman Islands"
    case centralAfricanRepublic = "Central African Republic"
    case chad = "Chad"
    case chile = "Chile"
    case china = "China"
    case christmasIsland = "Christmas Island"
    case cocosKeelingIslands = "Cocos (Keeling) Islands"
    case colombia = "Colombia"
    case comoros = "Comoros"
    case congo = "Congo"
    case congoDemocraticRepublicOfThe = "Congo, Democratic Republic of the"
    case cookIslands = "Cook Islands"
    case costaRica = "Costa Rica"
    case coteDIvoire = "Côte d'Ivoire"
    case croatia = "Croatia"
    case cuba = "Cuba"
    case curacao = "Curaçao"
    case cyprus = "Cyprus"
    case czechia = "Czechia"
    case denmark = "Denmark"
    case djibouti = "Djibouti"
    case dominica = "Dominica"
    case dominicanRepublic = "Dominican Republic"
    case ecuador = "Ecuador"
    case egypt = "Egypt"
    case elSalvador = "El Salvador"
    case equatorialGuinea = "Equatorial Guinea"
    case eritrea = "Eritrea"
    case estonia = "Estonia"
    case eswatini = "Eswatini"
    case ethiopia = "Ethiopia"
    case falklandIslandsMalvinas = "Falkland Islands (Malvinas)"
    case faroeIslands = "Faroe Islands"
    case fiji = "Fiji"
    case finland = "Finland"
    case france = "France"
    case frenchGuiana = "French Guiana"
    case frenchPolynesia = "French Polynesia"
    case frenchSouthernTerritories = "French Southern Territories"
    case gabon = "Gabon"
    case gambia = "Gambia"
    case georgia = "Georgia"
    case germany = "Germany"
    case ghana = "Ghana"
    case gibraltar = "Gibraltar"
    case greece = "Greece"
    case greenland = "Greenland"
    case grenada = "Grenada"
    case guadeloupe = "Guadeloupe"
    case guam = "Guam"
    case guatemala = "Guatemala"
    case guernsey = "Guernsey"
    case guinea = "Guinea"
    case guineaBissau = "Guinea-Bissau"
    case guyana = "Guyana"
    case haiti = "Haiti"
    case heardIslandAndMcDonaldIslands = "Heard Island and McDonald Islands"
    case holySee = "Holy See"
    case honduras = "Honduras"
    case hongKong = "Hong Kong"
    case hungary = "Hungary"
    case iceland = "Iceland"
    case india = "India"
    case indonesia = "Indonesia"
    case iranIslamicRepublicOf = "Iran (Islamic Republic of)"
    case iraq = "Iraq"
    case ireland = "Ireland"
    case isleOfMan = "Isle of Man"
    case israel = "Israel"
    case italy = "Italy"
    case jamaica = "Jamaica"
    case japan = "Japan"
    case jersey = "Jersey"
    case jordan = "Jordan"
    case kazakhstan = "Kazakhstan"
    case kenya = "Kenya"
    case kiribati = "Kiribati"
    case koreaDemocraticPeopleSRepublicOf = "Korea (Democratic People's Republic of)"
    case koreaRepublicOf = "Korea, Republic of"
    case kuwait = "Kuwait"
    case kyrgyzstan = "Kyrgyzstan"
    case laoPeopleSDemocraticRepublic = "Lao People's Democratic Republic"
    case latvia = "Latvia"
    case lebanon = "Lebanon"
    case lesotho = "Lesotho"
    case liberia = "Liberia"
    case libya = "Libya"
    case liechtenstein = "Liechtenstein"
    case lithuania = "Lithuania"
    case luxembourg = "Luxembourg"
    case macao = "Macao"
    case madagascar = "Madagascar"
    case malawi = "Malawi"
    case malaysia = "Malaysia"
    case maldives = "Maldives"
    case mali = "Mali"
    case malta = "Malta"
    case marshallIslands = "Marshall Islands"
    case martinique = "Martinique"
    case mauritania = "Mauritania"
    case mauritius = "Mauritius"
    case mayotte = "Mayotte"
    case mexico = "Mexico"
    case micronesiaFederatedStatesOf = "Micronesia (Federated States of)"
    case moldovaRepublicOf = "Moldova, Republic of"
    case monaco = "Monaco"
    case mongolia = "Mongolia"
    case montenegro = "Montenegro"
    case montserrat = "Montserrat"
    case morocco = "Morocco"
    case mozambique = "Mozambique"
    case myanmar = "Myanmar"
    case namibia = "Namibia"
    case nauru = "Nauru"
    case nepal = "Nepal"
    case netherlands = "Netherlands"
    case newCaledonia = "New Caledonia"
    case newZealand = "New Zealand"
    case nicaragua = "Nicaragua"
    case niger = "Niger"
    case nigeria = "Nigeria"
    case niue = "Niue"
    case norfolkIsland = "Norfolk Island"
    case northMacedonia = "North Macedonia"
    case northernMarianaIslands = "Northern Mariana Islands"
    case norway = "Norway"
    case oman = "Oman"
    case pakistan = "Pakistan"
    case palau = "Palau"
    case palestineStateOf = "Palestine, State of"
    case panama = "Panama"
    case papuaNewGuinea = "Papua New Guinea"
    case paraguay = "Paraguay"
    case peru = "Peru"
    case philippines = "Philippines"
    case pitcairn = "Pitcairn"
    case poland = "Poland"
    case portugal = "Portugal"
    case puertoRico = "Puerto Rico"
    case qatar = "Qatar"
    case reunion = "Réunion"
    case romania = "Romania"
    case russianFederation = "Russian Federation"
    case rwanda = "Rwanda"
    case saintBarthelemy = "Saint Barthélemy"
    case saintHelenaAscensionAndTristanDaCunha = "Saint Helena, Ascension and Tristan da Cunha"
    case saintKittsAndNevis = "Saint Kitts and Nevis"
    case saintLucia = "Saint Lucia"
    case saintMartinFrenchPart = "Saint Martin (French part)"
    case saintPierreAndMiquelon = "Saint Pierre and Miquelon"
    case saintVincentAndTheGrenadines = "Saint Vincent and the Grenadines"
    case samoa = "Samoa"
    case sanMarino = "San Marino"
    case saoTomeAndPrincipe = "Sao Tome and Principe"
    case saudiArabia = "Saudi Arabia"
    case senegal = "Senegal"
    case serbia = "Serbia"
    case seychelles = "Seychelles"
    case sierraLeone = "Sierra Leone"
    case singapore = "Singapore"
    case sintMaartenDutchPart = "Sint Maarten (Dutch part)"
    case slovakia = "Slovakia"
    case slovenia = "Slovenia"
    case solomonIslands = "Solomon Islands"
    case somalia = "Somalia"
    case southAfrica = "South Africa"
    case southGeorgiaAndTheSouthSandwichIslands = "South Georgia and the South Sandwich Islands"
    case southSudan = "South Sudan"
    case spain = "Spain"
    case sriLanka = "Sri Lanka"
    case sudan = "Sudan"
    case suriname = "Suriname"
    case svalbardAndJanMayen = "Svalbard and Jan Mayen"
    case sweden = "Sweden"
    case switzerland = "Switzerland"
    case syrianArabRepublic = "Syrian Arab Republic"
    case taiwanProvinceOfChina = "Taiwan, Province of China"
    case tajikistan = "Tajikistan"
    case tanzaniaUnitedRepublicOf = "Tanzania, United Republic of"
    case thailand = "Thailand"
    case timorLeste = "Timor-Leste"
    case togo = "Togo"
    case tokelau = "Tokelau"
    case tonga = "Tonga"
    case trinidadAndTobago = "Trinidad and Tobago"
    case tunisia = "Tunisia"
    case turkey = "Turkey"
    case turkmenistan = "Turkmenistan"
    case turksAndCaicosIslands = "Turks and Caicos Islands"
    case tuvalu = "Tuvalu"
    case uganda = "Uganda"
    case ukraine = "Ukraine"
    case unitedArabEmirates = "United Arab Emirates"
    case unitedKingdomOfGreatBritainAndNorthernIreland = "United Kingdom of Great Britain and Northern Ireland"
    case unitedStatesOfAmerica = "United States of America"
    case unitedStatesMinorOutlyingIslands = "United States Minor Outlying Islands"
    case uruguay = "Uruguay"
    case uzbekistan = "Uzbekistan"
    case vanuatu = "Vanuatu"
    case venezuelaBolivarianRepublicOf = "Venezuela (Bolivarian Republic of)"
    case vietNam = "Viet Nam"
    case virginIslandsBritish = "Virgin Islands (British)"
    case virginIslandsUS = "Virgin Islands (U.S.)"
    case wallisAndFutuna = "Wallis and Futuna"
    case westernSahara = "Western Sahara"
    case yemen = "Yemen"
    case zambia = "Zambia"
    case zimbabwe = "Zimbabwe"
    
    // Special/Additional Cases
    case diamondPrincessCruiseShip = "Diamond Princess"
    case grandPrincessCruiseShip = "Grand Princess"
    case kosovo = "Kosovo"
    
    var name: String { rawValue }
    
    var image: Image { Image(code.lowercased()) }
    
    var code: String {
        switch self {
        case .overall: return "world"
        case .afghanistan: return "AF"
        case .alandIslands: return "AX"
        case .albania: return "AL"
        case .algeria: return "DZ"
        case .americanSamoa: return "AS"
        case .andorra: return "AD"
        case .angola: return "AO"
        case .anguilla: return "AI"
        case .antarctica: return "AQ"
        case .antiguaAndBarbuda: return "AG"
        case .argentina: return "AR"
        case .armenia: return "AM"
        case .aruba: return "AW"
        case .australia: return "AU"
        case .austria: return "AT"
        case .azerbaijan: return "AZ"
        case .bahamas: return "BS"
        case .bahrain: return "BH"
        case .bangladesh: return "BD"
        case .barbados: return "BB"
        case .belarus: return "BY"
        case .belgium: return "BE"
        case .belize: return "BZ"
        case .benin: return "BJ"
        case .bermuda: return "BM"
        case .bhutan: return "BT"
        case .boliviaPlurinationalStateOf: return "BO"
        case .bonaireSintEustatiusAndSaba: return "NL" // "BQ"
        case .bosniaAndHerzegovina: return "BA"
        case .botswana: return "BW"
        case .bouvetIsland: return "NO" // "BV"
        case .brazil: return "BR"
        case .britishIndianOceanTerritory: return "IO"
        case .bruneiDarussalam: return "BN"
        case .bulgaria: return "BG"
        case .burkinaFaso: return "BF"
        case .burundi: return "BI"
        case .caboVerde: return "CV"
        case .cambodia: return "KH"
        case .cameroon: return "CM"
        case .canada: return "CA"
        case .caymanIslands: return "KY"
        case .centralAfricanRepublic: return "CF"
        case .chad: return "TD"
        case .chile: return "CL"
        case .china: return "CN"
        case .christmasIsland: return "CX"
        case .cocosKeelingIslands: return "CC"
        case .colombia: return "CO"
        case .comoros: return "KM"
        case .congo: return "CG"
        case .congoDemocraticRepublicOfThe: return "CD"
        case .cookIslands: return "CK"
        case .costaRica: return "CR"
        case .coteDIvoire: return "CI"
        case .croatia: return "HR"
        case .cuba: return "CU"
        case .curacao: return "CW"
        case .cyprus: return "CY"
        case .czechia: return "CZ"
        case .denmark: return "DK"
        case .djibouti: return "DJ"
        case .dominica: return "DM"
        case .dominicanRepublic: return "DO"
        case .ecuador: return "EC"
        case .egypt: return "EG"
        case .elSalvador: return "SV"
        case .equatorialGuinea: return "GQ"
        case .eritrea: return "ER"
        case .estonia: return "EE"
        case .eswatini: return "SZ"
        case .ethiopia: return "ET"
        case .falklandIslandsMalvinas: return "FK"
        case .faroeIslands: return "FO"
        case .fiji: return "FJ"
        case .finland: return "FI"
        case .france: return "FR"
        case .frenchGuiana: return "FR" //"GF"
        case .frenchPolynesia: return "FR" //"PF"
        case .frenchSouthernTerritories: return "FR" //"TF"
        case .gabon: return "GA"
        case .gambia: return "GM"
        case .georgia: return "GE"
        case .germany: return "DE"
        case .ghana: return "GH"
        case .gibraltar: return "GI"
        case .greece: return "GR"
        case .greenland: return "GL"
        case .grenada: return "GD"
        case .guadeloupe: return "GP"
        case .guam: return "GU"
        case .guatemala: return "GT"
        case .guernsey: return "GG"
        case .guinea: return "GN"
        case .guineaBissau: return "GW"
        case .guyana: return "GY"
        case .haiti: return "HT"
        case .heardIslandAndMcDonaldIslands: return "AU" // "HM"
        case .holySee: return "VA"
        case .honduras: return "HN"
        case .hongKong: return "HK"
        case .hungary: return "HU"
        case .iceland: return "IS"
        case .india: return "IN"
        case .indonesia: return "ID"
        case .iranIslamicRepublicOf: return "IR"
        case .iraq: return "IQ"
        case .ireland: return "IE"
        case .isleOfMan: return "IM"
        case .israel: return "IL"
        case .italy: return "IT"
        case .jamaica: return "JM"
        case .japan, .diamondPrincessCruiseShip: return "JP"
        case .jersey: return "JE"
        case .jordan: return "JO"
        case .kazakhstan: return "KZ"
        case .kenya: return "KE"
        case .kiribati: return "KI"
        case .koreaDemocraticPeopleSRepublicOf: return "KP"
        case .koreaRepublicOf: return "KR"
        case .kosovo: return "XK"
        case .kuwait: return "KW"
        case .kyrgyzstan: return "KG"
        case .laoPeopleSDemocraticRepublic: return "LA"
        case .latvia: return "LV"
        case .lebanon: return "LB"
        case .lesotho: return "LS"
        case .liberia: return "LR"
        case .libya: return "LY"
        case .liechtenstein: return "LI"
        case .lithuania: return "LT"
        case .luxembourg: return "LU"
        case .macao: return "MO"
        case .madagascar: return "MG"
        case .malawi: return "MW"
        case .malaysia: return "MY"
        case .maldives: return "MV"
        case .mali: return "ML"
        case .malta: return "MT"
        case .marshallIslands: return "MH"
        case .martinique: return "FR" //"MQ"
        case .mauritania: return "MR"
        case .mauritius: return "MU"
        case .mayotte: return "FR" // "YT"
        case .mexico: return "MX"
        case .micronesiaFederatedStatesOf: return "FM"
        case .moldovaRepublicOf: return "MD"
        case .monaco: return "MC"
        case .mongolia: return "MN"
        case .montenegro: return "ME"
        case .montserrat: return "MS"
        case .morocco: return "MA"
        case .mozambique: return "MZ"
        case .myanmar: return "MM"
        case .namibia: return "NA"
        case .nauru: return "NR"
        case .nepal: return "NP"
        case .netherlands: return "NL"
        case .newCaledonia: return "NC"
        case .newZealand: return "NZ"
        case .nicaragua: return "NI"
        case .niger: return "NE"
        case .nigeria: return "NG"
        case .niue: return "NU"
        case .norfolkIsland: return "NF"
        case .northMacedonia: return "MK"
        case .northernMarianaIslands: return "MP"
        case .norway: return "NO"
        case .oman: return "OM"
        case .pakistan: return "PK"
        case .palau: return "PW"
        case .palestineStateOf: return "PS"
        case .panama: return "PA"
        case .papuaNewGuinea: return "PG"
        case .paraguay: return "PY"
        case .peru: return "PE"
        case .philippines: return "PH"
        case .pitcairn: return "PN"
        case .poland: return "PL"
        case .portugal: return "PT"
        case .puertoRico: return "PR"
        case .qatar: return "QA"
        case .reunion: return "RE"
        case .romania: return "RO"
        case .russianFederation: return "RU"
        case .rwanda: return "RW"
        case .saintBarthelemy: return "BL"
        case .saintHelenaAscensionAndTristanDaCunha: return "GB" // "SH"
        case .saintKittsAndNevis: return "KN"
        case .saintLucia: return "LC"
        case .saintMartinFrenchPart: return "MF"
        case .saintPierreAndMiquelon: return "PM"
        case .saintVincentAndTheGrenadines: return "VC"
        case .samoa: return "WS"
        case .sanMarino: return "SM"
        case .saoTomeAndPrincipe: return "ST"
        case .saudiArabia: return "SA"
        case .senegal: return "SN"
        case .serbia: return "RS"
        case .seychelles: return "SC"
        case .sierraLeone: return "SL"
        case .singapore: return "SG"
        case .sintMaartenDutchPart: return "SX"
        case .slovakia: return "SK"
        case .slovenia: return "SI"
        case .solomonIslands: return "SB"
        case .somalia: return "SO"
        case .southAfrica: return "ZA"
        case .southGeorgiaAndTheSouthSandwichIslands: return "GB" // "GS"
        case .southSudan: return "SS"
        case .spain: return "ES"
        case .sriLanka: return "LK"
        case .sudan: return "SD"
        case .suriname: return "SR"
        case .svalbardAndJanMayen: return "SJ"
        case .sweden: return "SE"
        case .switzerland: return "CH"
        case .syrianArabRepublic: return "SY"
        case .taiwanProvinceOfChina: return "TW"
        case .tajikistan: return "TJ"
        case .tanzaniaUnitedRepublicOf: return "TZ"
        case .thailand: return "TH"
        case .timorLeste: return "TL"
        case .togo: return "TG"
        case .tokelau: return "TK"
        case .tonga: return "TO"
        case .trinidadAndTobago: return "TT"
        case .tunisia: return "TN"
        case .turkey: return "TR"
        case .turkmenistan: return "TM"
        case .turksAndCaicosIslands: return "TC"
        case .tuvalu: return "TV"
        case .uganda: return "UG"
        case .ukraine: return "UA"
        case .unitedArabEmirates: return "AE"
        case .unitedKingdomOfGreatBritainAndNorthernIreland: return "GB"
        case .unitedStatesOfAmerica, .grandPrincessCruiseShip: return "US"
        case .unitedStatesMinorOutlyingIslands: return "US" // "UM"
        case .uruguay: return "UY"
        case .uzbekistan: return "UZ"
        case .vanuatu: return "VU"
        case .venezuelaBolivarianRepublicOf: return "VE"
        case .vietNam: return "VN"
        case .virginIslandsBritish: return "VG"
        case .virginIslandsUS: return "VI"
        case .wallisAndFutuna: return "WF"
        case .westernSahara: return "EH"
        case .yemen: return "YE"
        case .zambia: return "ZM"
        case .zimbabwe: return "ZW"
        }
    }
        
    var region: Region {
        switch self {
        case .overall:
            return .overall
            
        case .antarctica:
            return .antarctica
            
        case .algeria,
             .angola,
             .benin,
             .botswana,
             .britishIndianOceanTerritory,
             .burkinaFaso,
             .burundi,
             .caboVerde,
             .cameroon,
             .centralAfricanRepublic,
             .chad,
             .comoros,
             .congo,
             .congoDemocraticRepublicOfThe,
             .coteDIvoire,
             .djibouti,
             .egypt,
             .equatorialGuinea,
             .eritrea,
             .eswatini,
             .ethiopia,
             .frenchSouthernTerritories,
             .gabon,
             .gambia,
             .ghana,
             .guinea,
             .guineaBissau,
             .kenya,
             .lesotho,
             .liberia,
             .libya,
             .madagascar,
             .malawi,
             .mali,
             .mauritania,
             .mauritius,
             .mayotte,
             .morocco,
             .mozambique,
             .namibia,
             .niger,
             .nigeria,
             .reunion,
             .rwanda,
             .saintHelenaAscensionAndTristanDaCunha,
             .saoTomeAndPrincipe,
             .senegal,
             .seychelles,
             .sierraLeone,
             .somalia,
             .southAfrica,
             .southSudan,
             .sudan,
             .tanzaniaUnitedRepublicOf,
             .togo,
             .tunisia,
             .uganda,
             .westernSahara,
             .zambia,
             .zimbabwe:
            return .africa
            
        case .afghanistan,
             .armenia,
             .azerbaijan,
             .bahrain,
             .bangladesh,
             .bhutan,
             .bruneiDarussalam,
             .cambodia,
             .china,
             .cyprus,
             .diamondPrincessCruiseShip,
             .georgia,
             .hongKong,
             .india,
             .indonesia,
             .iranIslamicRepublicOf,
             .iraq,
             .israel,
             .japan,
             .jordan,
             .kazakhstan,
             .koreaDemocraticPeopleSRepublicOf,
             .koreaRepublicOf,
             .kuwait,
             .kyrgyzstan,
             .laoPeopleSDemocraticRepublic,
             .lebanon,
             .macao,
             .malaysia,
             .maldives,
             .mongolia,
             .myanmar,
             .nepal,
             .oman,
             .pakistan,
             .palestineStateOf,
             .philippines,
             .qatar,
             .saudiArabia,
             .singapore,
             .sriLanka,
             .syrianArabRepublic,
             .taiwanProvinceOfChina,
             .tajikistan,
             .thailand,
             .timorLeste,
             .turkey,
             .turkmenistan,
             .unitedArabEmirates,
             .uzbekistan,
             .vietNam,
             .yemen:
            return .asia
            
        case .alandIslands,
             .albania,
             .andorra,
             .austria,
             .belarus,
             .belgium,
             .bosniaAndHerzegovina,
             .bulgaria,
             .croatia,
             .czechia,
             .denmark,
             .estonia,
             .faroeIslands,
             .finland,
             .france,
             .germany,
             .gibraltar,
             .greece,
             .guernsey,
             .holySee,
             .hungary,
             .iceland,
             .ireland,
             .isleOfMan,
             .italy,
             .jersey,
             .kosovo,
             .latvia,
             .liechtenstein,
             .lithuania,
             .luxembourg,
             .malta,
             .moldovaRepublicOf,
             .monaco,
             .montenegro,
             .netherlands,
             .northMacedonia,
             .norway,
             .poland,
             .portugal,
             .romania,
             .russianFederation,
             .sanMarino,
             .serbia,
             .slovakia,
             .slovenia,
             .spain,
             .svalbardAndJanMayen,
             .sweden,
             .switzerland,
             .ukraine,
             .unitedKingdomOfGreatBritainAndNorthernIreland:
            return .europe
            
        case .bermuda,
             .canada,
             .grandPrincessCruiseShip,
             .greenland,
             .saintPierreAndMiquelon,
             .unitedStatesOfAmerica:
            return .northAmerica
            
        case .americanSamoa,
             .australia,
             .christmasIsland,
             .cocosKeelingIslands,
             .cookIslands,
             .fiji,
             .frenchPolynesia,
             .guam,
             .heardIslandAndMcDonaldIslands,
             .kiribati,
             .marshallIslands,
             .micronesiaFederatedStatesOf,
             .nauru,
             .newCaledonia,
             .newZealand,
             .niue,
             .norfolkIsland,
             .northernMarianaIslands,
             .palau,
             .papuaNewGuinea,
             .pitcairn,
             .samoa,
             .solomonIslands,
             .tokelau,
             .tonga,
             .tuvalu,
             .unitedStatesMinorOutlyingIslands,
             .vanuatu,
             .wallisAndFutuna:
            return .oceania
            
        case .anguilla,
             .antiguaAndBarbuda,
             .argentina,
             .aruba,
             .bahamas,
             .barbados,
             .belize,
             .boliviaPlurinationalStateOf,
             .bonaireSintEustatiusAndSaba,
             .bouvetIsland,
             .brazil,
             .caymanIslands,
             .chile,
             .colombia,
             .costaRica,
             .cuba,
             .curacao,
             .dominica,
             .dominicanRepublic,
             .ecuador,
             .elSalvador,
             .falklandIslandsMalvinas,
             .frenchGuiana,
             .grenada,
             .guadeloupe,
             .guatemala,
             .guyana,
             .haiti,
             .honduras,
             .jamaica,
             .martinique,
             .mexico,
             .montserrat,
             .nicaragua,
             .panama,
             .paraguay,
             .peru,
             .puertoRico,
             .saintBarthelemy,
             .saintKittsAndNevis,
             .saintLucia,
             .saintMartinFrenchPart,
             .saintVincentAndTheGrenadines,
             .sintMaartenDutchPart,
             .southGeorgiaAndTheSouthSandwichIslands,
             .suriname,
             .trinidadAndTobago,
             .turksAndCaicosIslands,
             .uruguay,
             .venezuelaBolivarianRepublicOf,
             .virginIslandsBritish,
             .virginIslandsUS:
            return .latinAmericaAndTheCaribbean
        }
    }
}
