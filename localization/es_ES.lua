return { -- Español
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "Baraja de Papel",
        text = {
          "Los {C:attention}Comodines{} de {C:legendary}Paperback{}",
          "son {C:attention}3X nás comunes,",
          "Comienza la partida con el",
          "Comodín {C:attention,T:j_paperback_shopping_center}#1#{}"
        }
      },
      b_paperback_proud = {
        name = "Baraja Arcoiris",
        text = {
          "Tu baraja comienza con",
          "{C:hearts}Corazones{}, {C:diamonds}Diamantes{},",
          "{C:spades}Espadas{}, {C:clubs}Tréboles{}",
          "{C:paperback_crowns}Coronas{} y {C:paperback_stars}Estrellas"
        }
      },
      b_paperback_silver = {
        name = "Baraja de Plata",
        text = {
          "Comienza la partida con",
          "el vale {C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}",
          "y un {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      b_paperback_dreamer = {
        name = "Baraja Soñadora",
        text = {
          "Comienza con un",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:paperback_temporary}Temporal",
          "{C:attention}#2#{} Ranura de comodín"
        }
      },
      b_paperback_antique = {
        name = "Baraja Antigua",
        text = {
          "Los {C:tarot}Paquetes Arcanos{} no",
          "aparecerán en la tienda",
          "Los {C:paperback_minor_arcana}Paquetes de Arcana Menor",
          "son {C:attention}3X{} más comunes"
        }
      },
      b_paperback_passionate = {
        name = "Baraja Apasionada",
        text = {
          "Después de derrotar una",
          "{C:attention}Ciega Jefe{}, gana una",
          "{C:attention,T:tag_paperback_high_risk}#1#",
          "No puedes ganar {C:money}interés"
        }
      },
    },
    Blind = {
      bl_paperback_quarter = {
        name = "La Corchea",
        text = {
          "#1# en #2# cartas",
          "son debilitadas"
        },
      },
      bl_paperback_half = {
        name = 'La Mitad',
        text = {
          'Reduce todas las',
          'posibilidades a la mitad'
        }
      },
      bl_paperback_whole = {
        name = 'La Entera',
        text = {
          'Las Categorias usadas',
          'anteriormente en esta',
          'son debilitadas'
        }
      },
      bl_paperback_rest = {
        name = 'La Pausa',
        text = {
          '#1# en #2# posibilidades de',
          'que las cartas de números',
          'salgan boca abajo'
        }
      },
      bl_paperback_flat = {
        name = 'El Bemol',
        text = {
          'Reduce la categoría',
          'de las cartas jugadas'
        }
      },

      bl_paperback_sharp = {
        name = 'La Sostenida',
        text = {
          'Aumenta la categoría',
          'de las cartas jugadas'
        }
      },
      bl_paperback_natural = {
        name = 'La Natural',
        text = {
          'Jugar manos por encima',
          'del nivel más bajo',
          'debilita las cartas'
        }
      },
      bl_paperback_coda = {
        name = 'La Coda',
        text = {
          'No puedes mover',
          'las cartas ni',
          'los comodines'
        }
      },
      bl_paperback_taupe_treble = {
        name = 'Clave de sol',
        text = {
          'Debes anotar una',
          'carta mejorada',
        }
      },
    },
    Joker = {
      j_paperback_showdown = {
        name = "Confrontación",
        text = {
          "Cada {V:1}#1#{} y {V:2}#2#{} en {C:attention}mano{}",
          "tienen una prob. de {C:green}#3# en #4#",
          "de otorgar {C:money}$#5#",
        }
      },
      j_paperback_golden_egg = {
        name = "Huevo de Oro",
        text = {
          "Jugar una {C:attention}mano secreta{}",
          "otorga el valor de venta",
          "del {C:attention}Comodín{} a la derecha"
        },
        unlock = {
          "Win a run with a",
          "{C:attention}secret hand{} as your",
          "most played hand"
        }
      },
      j_paperback_insurance_policy = {
        name = "Politica de Seguros",
        text = {
          "Ganas {C:mult}+#1#{} Multi por cada {C:attention}Jota{}",
          "y pierdes {C:mult}-#1#{} Multi por cada {C:attention}Rey{}",
          "en tu baraja",
          "{C:inactive}(Actualmente {C:mult}#2#{C:inactive} Multi){}",
        }
      },
      j_paperback_burning_pact = {
        name = "Pacto Ardiente",
        text = {
          "Si {C:attention}descartas{} una sola {C:attention}#1#{} carta",
          "saca {C:attention}#2#{} cartas de la baraja"
        }
      },
      j_paperback_blade_dance = {
        name = "Danza de Espadas",
        text = {
          "Al seleccionar una {C:attention}Ciega{},",
          "crea {C:attention}#1#{} {C:attention}Castar de acero{}",
          "{C:paperback_temporary}temporales"
        }
      },
      j_paperback_claw = {
        name = "Garras",
        text = {
          "Anotar un {C:attention}#1#{} hace que todos los {C:attention}#1#{}",
          "otorgen {C:mult}+#2#{} Multi adicional por",
          "por cada {C:attention}#1#{} anotado",
          "Se reinicia al {C:attention}final de la ronda",
          "{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)"
        }
      },
      j_paperback_chaplin = {
        name = "Chaplin",
        text = {
          "Al comprar un {C:attention}Vale{} tambien",
          "consigues su {C:attention}Mejora{}"
        }
      },
      j_paperback_milk_tea = {
        name = "Té con Leche",
        text = {
          "{C:purple}Balancea{} el {C:attention}#1#%{} de las {C:chips}Fichas{} y {C:mult}Multi",
          "Se reduce un {C:attention}#2#%{} si el {C:mult}Multi{}",
          "es {C:attention}mayor{} a las {C:chips}Fichas"
        }
      },
      j_paperback_nichola = {
        name = "Nichola",
        text = {
          "Las Cartas {C:attention}Figura{} {C:attention}en mano",
          "cuentan como {C:attention}anotadas"
        }
      },
      j_paperback_the_dynasty = {
        name = "La Dinastía",
        text = {
          "{X:mult,C:white}X#1#{} Multi si",
          "la mano jugada contiene",
          "un {C:attention}#2#"
        }
      },
      j_paperback_lurid_joker = {
        name = "Comodín tenebroso",
        text = {
          "Otorga {C:chips}+#1#{} Fichas si",
          "la mano jugada contiene",
          "un {C:attention}#2#"
        }
      },
      j_paperback_zealous_joker = {
        name = "Comodín Ferviente",
        text = {
          "Otorga {C:mult}+#1#{} Multi si",
          "la mano jugada contiene",
          "un {C:attention}#2#"
        }
      },
      j_paperback_deviled_egg = {
        name = "Huevo Endiablado",
        text = {
          "La primera carta {C:attention}anotada{} en",
          "la ronda se vuelve de {C:attention}Oro{}.",
          "Se consume en {C:attention}#1#{} rondas"
        }
      },
      j_paperback_pear = {
        name = "Pera",
        text = {
          "Gana {C:chips}+#2#{} Fichas si la mano",
          "contiene un {C:attention}#1#{}.",
          "Pierde {C:chips}-#3#{} Fichas si la",
          "mano no contiene {C:attention}#1#{}",
          "Se consume al llegar a 0",
          "{C:inactive}(Actualmente {C:chips}+#4#{C:inactive} Fichas)"
        }
      },
      j_paperback_teapot = {
        name = "Tetera",
        text = {
          "Gana {C:blue}+#1#{} fichas al cuando",
          "una {C:attention}#2#{} anota",
          "{C:inactive}(Actualmente {C:blue}+#3#{C:inactive} Fichas)"
        }
      },
      j_paperback_the_one_who_waits = {
        name = "El Que Espera",
        text = {
          "Si la mano {C:attention}anota{} {V:1}#1#s{}:",
          -- error: missing an "este Comodín"
          "Prob. de {C:green}#2# en #3#{} de ganar {X:mult,C:white}X#4#{} Multi",
          "Prob. de {C:green}#5# en #6#{} de crear {C:tarot}#7#{}",
          "{C:inactive,s:0.8}(Debe haber espacio) (Actualmente {X:mult,C:white,s:0.8}X#8#{C:inactive,s:0.8} Multi)",
        }
      },
      j_paperback_blood_rain = {
        name = "Lluvia de Sangre",
        text = {
          "Las {C:attention}Cartas Mojadas{} otorgan {C:mult}Multi{}",
          "en vez de {C:chips}fichas{} de las cartas{C:attention} en mano{}",
        }
      },
      j_paperback_pinot_noir = {
        name = "Pinot Noir",
        text = {
          "Las siguientes {C:attention}#1#{} veces que",
          "una {C:attention}#2#{} se activa",
          "otorga {C:mult}#3#{} multi adicional"
        }
      },
      j_paperback_jestosterone = {
        name = "Testocomodín",
        text = {
          "{C:attention}#1#s{} anotadas se",
          "convierten en {C:attention}#2#es{}"
        }
      },
      j_paperback_jestrogen = {
        name = "Estromodín",
        text = {
          "{C:attention}#1#es{} y {C:attention}#2#s{} anotados",
          "se convierten en {C:attention}#3#s{}"
        }
      },
      j_paperback_langely = {
        name = "L'angely",
        text = {
          "Ganas la mitad del {C:money}valor de venta{} de",
          -- error: entrar -> derrotar
          "tus comodines al derrotar una {C:attention}Ciega Grande{}.",
          "Ganas todo el {C:money}valor de venta{}",
          "al derrotar una {C:attention}Ciega Jefe{}"
        }
      },
      j_paperback_pedrillo = {
        name = "Pedrillo",
        text = {
          "Anotar una {C:attention}Reina{} crea",
          "la carta de {C:planet}Planeta{} de",
          "la {C:attention}mano jugada{}",
        }
      },
      j_paperback_double_dutchman = {
        name = "Dutchman Doble",
        text = {
          "Por las siguientes {C:attention}#3#{} {C:blue}manos{}:",
          "Cada carta {C:attention}mano{} tiene una prob. de",
          "{C:green}#1# en #2#{} de ganar una {C:attention}mejora{} al azar y una",
          "prob. de {C:green}#1# en #2#{} de ganar un {C:attention}sello{} al azar"
        }
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds = {
        name = "Un pecado y cientos de buenas obras",
        text = {
          "Los {C:attention}3{} y cartas {C:attention}sin categoria{}",
          "otorgan {C:mult}+#1#{} Multi al anotar",
          "{C:inactive}''Se alimenta del mal''",
        },
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds_fed = {
        name = "{C:red}Un pecado y cientos de buenas obras{}",
        text = {
          "Los {C:attention}3{} y cartas {C:attention}sin categoria{}",
          "otorgan {C:mult}+Mult{} por cada",
          "carta en carta en tu baraja al anotar",
          "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive})",
        },
      },
      j_paperback_white_night = {
        name = "WhiteNight",
        text = {
          "Destruye las cartas anotadas que no son {C:attention}Apostoles{}",
          "después de jugar la mano. Los {C:attention}Apostoles{} anotados",
          "otorgan {X:mult,C:white}X#1#{} Multi. Jugar una mano sin",
          "{C:attention}Apostoles destruye{} un comodín al azar.",
          "Descartar {C:attention}Apostoles{} los {C:attention}destruye{}"
        },
        unlock = {
          "Debes tener #1# o más",
          "{C:attention}Apostoles{} en",
          "tu baraja"
        }
      },
      j_paperback_as_above_so_below = {
        name = "Tanto arriba, como abajo",
        text = {
          "Jugar una mano de 5 cartas con un",
          "{C:attention}Apóstol{} crea una carta del {C:purple}Tarot{},",
          "Si la mano es una {C:attention}Escalera{} crea",
          "una carta {C:spectral}Espectral{} en su lugar",
          "{C:inactive}(Debe haber espacio)"
        },
        unlock = {
          "Juega un {C:attention}Rapto{}"
        }
      },
      j_paperback_plague_doctor = {
        name = "Doctor de la Plaga",
        text = {
          "Jugar Carta más Alta",
          "convierte la carta anotada",
          "en un {C:attention}Apóstol{}. Cada {C:attention}Apóstol{}",
          "en mano otorga {X:mult,C:white}X#1#{} Multi"
        }
      },
      j_paperback_king_me = {
        name = "¡Coroname!",
        text = {
          "Anotar {V:1}#1#{} aumenta",
          "su {C:attention}categoria{} hasta",
          "llegar a {C:attention}Rey{C:inactive}"
        }
      },
      j_paperback_gambit = {
        name = "Gambito",
        text = {
          "Anotar {V:1}#1#s{} hace que la",
          "primera {V:1}#1#{} {C:attention}destruya{}",
          "la primera carta en mano",
          "que no es una {V:1}#1#{}",
          "y obtiene el {C:attention}doble{} de sus {C:chips}Fichas{}",
        }
      },
      j_paperback_solar_eclipse = {
        name = "Eclipse Solar",
        text = {
          "Anotar cartas de",
          "{C:paperback_light_suit}Palo claro{} las",
          "convierte en {V:1}#1#"
        }
      },
      j_paperback_prism = {
        name = "Prisma",
        text = {
          "Si la mano jugada contiene {C:attention}#1#{},",
          "las {C:attention}cartas anotadas{} cambian",
          "a un {C:attention}palo{} al azar",
        }
      },
      j_paperback_master_spark = {
        name = "Chispa Maestra",
        text = {
          "Al jugar un {C:attention}Espectro{}, destruye",
          "las cartas {C:attention}en mano{} y las",
          "{C:attention}cartas jugadas{} ganan {C:dark_edition}Policroma",
          "{S:1.1,C:red,E:2}Se autodestruye{} al activarse",
        }
      },
      j_paperback_j_and_js = {
        name = "J&J's",
        text = {
          "Si la mano jugada contiene un",
          "{C:attention}Espectro{}, crea {C:attention}#1#{} {C:attention}Etiquetas{}",
          "al azar.",
          "Se consume {C:attention}#2#{} rondas",
        }
      },
      j_paperback_blue_star = {
        name = "Blue Star",
        text = {
          "Gana {X:chips,C:white}X#1#{} Fichas cuando anotas {V:1}#2#{}",
          "Pierde {X:chips,C:white}X#3#{} Fichas cuando anotas {V:2}#4#{}",
          "{C:inactive}(Actualmente {X:chips,C:white}X#5#{C:inactive} Fichas)"
        }
      },
      j_paperback_shadowmantle = {
        name = "Manto de Sombras", -- Not a typo, equipment in deltarune is written without a space | "I never played those games so spaces here we go -Marffe"
        text = {
          "Prob. de {C:green}#2# en #3#{} de crear",
          "una {C:dark_edition}Etiqueta Negativa{}",
          "al anotar {V:1}#1#{}",
        }
      },
      j_paperback_shooting_star = {
        name = "Estrella Fugaz",
        text = {
          "Anotar {V:1}#1#{} tiene",
          "{C:green}#2# en #3#{} de crear una",
          "carta {C:planet}Planeta{} de la",
          "{C:attention}mano jugada",
        }
      },
      j_paperback_black_star = {
        name = "Estrella Negra",
        text = {
          "Anotar cartas de",
          "{C:paperback_dark_suit}palo oscuro{} las",
          "convierte en {V:1}#1#",
        }
      },
      j_paperback_high_speed_rail = {
        name = "Ferrocarril de alta velocidad",
        text = {
          "{C:blue}Gana{} Multi igual a el {C:money}coste{}",
          "de {C:attention}Comodines{} {C:blue}comprados{}",
          "{C:red}Pierde{} Multi igual a el {C:money}valor{}",
          "{C:money}de venta{} de {C:attention}Comodines{} {C:red}vendidos{}",
          "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
        }
      },
      j_paperback_small_scale_onshore_wind = {
        name = "Energía eólica terrestre",
        text = {
          "Gana {C:mult}+#1#{} Multi cada vez que",
          "descartas exactamente {C:attention}#2#{} cartas",
          "{C:inactive}(Actualmente {C:mult}+#3# {C:inactive}Multi)"
        }
      },
      j_paperback_aurora_borealis = {
        name = "Aurora Boreal",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín con {C:attention}Edción{} que poseas",
          "{s:0.9,C:dark_edition}Negativos{s:0.9,C:inactive} excluidos{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)"
        }
      },
      j_paperback_joke_master = {
        name = "Maestro de la Comedia",
        text = {
          "Gana {C:mult}+#1#{} Multi si la mano",
          "jugada {C:attention}#2#{}",
          "{s:0.8}La mano cambia cada ronda",
          "{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)"
        }
      },
      j_paperback_ultra_rare = {
        name = "Ultra Raro",
        text = {
          "Al seleccionar una {C:attention}Ciega{}, crea",
          "al azar un {C:attention}Comodín{} {C:blue}Común{},",
          "{C:green}Inusual{} y {C:red}Raro{} que son",
          "{C:paperback_temporary}Temporales{} y {C:dark_edition}Negativos",
          "sin {C:money}valor de venta{}"
        }
      },
      j_paperback_manilla_folder = {
        name = "Folder Manila",
        text = {
          "Gana {C:money}$#1#{} al terminar",
          "la ronda por cada {C:attention}Clip{}",
          "{C:attention}único{} en tu baraja",
          "{C:inactive}(Actualmente {C:money}$#2#{C:inactive})"
        }
      },
      j_paperback_clippy = {
        name = "Clippy",
        text = {
          "Añade un {C:attention}Clip{} a una",
          "carta en la baraja al",
          "seleccionar una {C:attention}Ciega{}",
        }
      },
      j_paperback_jimbos_joyous_joker_jamboree = {
        name = "Jimbo's Joyous Joker Jamboree",
        text = {
          "Crear una carta de {C:paperback_minor_arcana}Arcana menor{}",
          "al azar cada {C:attention}#1#{C:inactive} [#2#]{} cartas jugadas",
        },
        unlock = {
          "Have {C:attention}#1#{} or more",
          "{C:attention}suits{} in",
          "your deck"
        }
      },
      j_paperback_the_normal_joker = {
        name = "El Comodín Normal",
        text = {
          "Reactiva todos los",
          "Comodines {C:blue}Comunes{C:attention}"
        }
      },
      j_paperback_jimbos_inferno = {
        name = "El infierno de Jimbo",
        text = {
          "Las cartas de {C:paperback_dark_suit}palos oscuro{} anotadas",
          "otorgan {C:mult}+#1#{} Multi por cada carta de",
          "{C:paperback_dark_suit}palo oscuro{} {C:attention}en mano{}",
          "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi){}",
        }
      },
      j_paperback_tome = {
        name = "Tomo de Cartas",
        text = {
          "{C:attention}+#1#{} Ranura de Consumibles",
          "por cada {C:attention}rareza de comodín{}",
          "que poseas",
          "{C:inactive}(Actualmente {C:attention}+#2#{C:inactive} Slot#3#){}",
        }
      },
      j_paperback_better_call_jimbo = {
        name = "Mejor llama a Jimbo",
        text = {
          "{X:mult,C:white}X#1#{} Multi por",
          "cada {C:money}$#2#{} poseidos.",
          "No ganas {C:money}interes{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} Multi)"
        }
      },
      j_paperback_touch_tone_joker = {
        name = "Comodín Touch Tone",
        text = {
          "Al abrir paquetes de {C:attention}Consumibles{},",
          "obtén la carta del {C:attention}extremo izquierdo{}",
          "{C:green}gratis{} y se agrega a tus consumibles",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_joker_cd_i = {
        name = 'Comodín CD-i',
        text = {
          "{C:green}#1# in #2#{} de crear una",
          "carta de {C:planet}Planeta{} si juegas",
          "exactamente {C:attention}#3#{} cartas",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_determination = {
        name = 'Determinación',
        text = {
          "Previene la muerte, y después",
          "{C:attention}#1#{} Apuesta y {C:attention}#1#{} al tamaño de mano",
          "{C:red}Se destruye al activarse"
        }
      },
      j_paperback_blue_marble = {
        name = "Marmol Azul",
        text = {
          "Gana {C:mult}+#1#{} Multi al usar una",
          "carta de {C:planet}Planeta{}",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
        }
      },
      j_paperback_boundary_of_death = {
        name = "Umbral de la Muerte",
        text = {
          "Cada {C:attention}#1#{} tiene una",
          "prob. de {C:green}#2# en #3#{} de otorgar",
          "adicionalmente {C:red}+#4#{} Multi"
        }
      },
      j_paperback_festive_joker = {
        name = "Comodín Festivo",
        text = {
          "Las {C:attention}Cartas Envueltas{}",
          "tienen una prob. de {C:green}#2# en #3#",
          "de crear un {C:attention}Consumable{}",
          "al azar cuando anotan",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_collector = {
        name = "Comodín Coleccionista",
        text = {
          "Ganas {C:money}$#1#{} al final de la",
          "ronda por cada {C:attention}#2#{}",
          "en tu baraja",
          "{C:inactive}(Actualmente {C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_spotty_joker = {
        name = "Comodín de puntitos",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi",
          "al {C:attention}anotar{} una",
          "{C:attention}#2#{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#4#{}{C:inactive} Multi)"
        }
      },
      j_paperback_sommelier = {
        name = "Comodín Sumiller",
        text = {
          "Si el {C:attention}primer descarte{}",
          "de la ronda contiene",
          "una {C:attention}#1#{}, la",
          "primera {C:attention}#1#{}",
          "gana un sello al azar",
        }
      },
      j_paperback_medic = {
        name = "Comodín Médico",
        text = {
          "Las {C:attention}Cartas Vendadas{} reactivan",
          "otras cartas una vez más",
        }
      },
      j_paperback_matcha = {
        name = "Té de Matcha",
        text = {
          "Gana {C:chips}+#1#{} Fichas al",
          "anotar cartas, prob. de ",
          "{C:green}#2# en #3#{} de consumirse",
          "al {C:red}descartar",
          "{C:inactive}(Actualmente {C:chips}+#4#{C:inactive} Fichas)"
        }
      },
      j_paperback_you_are_a_fool = {
        name = "¡Eres un tonto!",
        text = {
          "Si la mano anota {C:attention}#1# o más",
          "cartas de {C:attention}figura{}, convierte",
          "{C:attention}todas{} las cartas {C:attention}en mano{} en",
          "la carta del {C:attention}extremo izquierdo{}",
          "se {S:1.1,C:red,E:2}autodestruye{} al activarse",
        }
      },
      j_paperback_kintsugi_joker = {
        name = "Comodín Kintsugi",
        text = {
          "Aumenta el valor máximo que",
          "las {C:attention}Cartas de cerámica{}",
          "pueden otorgar en {C:money}$#1#{} si una",
          "{C:attention}Cartas de cerámica{} es destruida",
          "{C:inactive}(Incremento actual: {C:money}$#3#{C:inactive})",
        }
      },
      j_paperback_ddakji = {
        name = "Ddakji",
        text = {
          "{C:green}#1# de cada #2#{} cartas salen",
          "boca abajo, anotar una carta",
          "{C:attention}boca arriba{} y una {C:attention}boca abajo{}",
          "crea un {C:attention}consumible{} a azar",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_weather_radio = {
        name = "Radio del Clima",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi si la {C:attention}mano anotada{}",
          "contiene {C:attention}#2#{}.",
          "Si tienes {X:mult,C:white}X#3#{} Multi o más,",
          "desactiva la {C:attention}Ciega Jefe{}",
          "a cambio de perder {X:mult,C:white}X#4#{} Multi",
          "{C:inactive}(Actualmente {X:mult,C:white}X#5#{C:inactive} Multi)",
          "{s:0.75}La mano a jugar cambia al final de cada ronda"
        }
      },
      j_paperback_power_surge = {
        name = "Sobrecarga",
        text = {
          "Los {C:attention}#1#{} otorgan {X:mult,C:white}X#2#{}",
          "Multi al anotar.",
          "Probabilidad {C:green}#3# en #4#{}",
          "de {C:red}destruir{} una carta",
          "{C:attention}en mano{}",
        }
      },
      j_paperback_time_regression_mix = {
        name = "Mezcla de regresión temporal",
        text = {
          "Gana {C:mult}+#2#{} Multi si la mano {C:attention}anota{}",
          "al menos {C:attention}#1#{} palos diferentes,",
          "{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)",
        }
      },
      j_paperback_bismuth = {
        name = "Bismuto",
        text = {
          "Anotar {V:1}#1#{} o {V:2}#2#{} les",
          "otorga una prob. de {C:green}#3# en #4#{} de",
          "obtener edición {C:dark_edition}Laminada{},",
          "{C:dark_edition}Holografica{} o {C:dark_edition}Policroma{}",
        }
      },
      j_paperback_deadringer = {
        name = "Deadringer",
        text = {
          "Reactiva los {C:attention}#1#es{} y {C:attention}#2#{} anotados",
          "una vez y dos veces los {C:attention}#3#{}"
        }
      },
      j_paperback_penumbra_phantasm = {
        name = "Fantasma de la Penumbra",
        text = {
          "Gana {C:red}+#1#{} Multi cada vez que una",
          "carta {C:attention}sin categoría{} es {C:attention}anotada",
          "{C:inactive}(Actualmente {C:red}+#2#{C:inactive} Multi)"
        }
      },
      j_paperback_ncj = {
        name = "NoCopyrightJokers",
        text = {
          "Otorga {C:chips}+#1#{} fichas por cada",
          "{C:money}dólar{} en el {C:attention}valor de venta",
          "de todos los comodines",
          "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
        }
      },
      j_paperback_full_moon = {
        name = "Luna llena",
        text = {
          "Las cartas de {C:planet}Planeta{}",
          "tienen una prob. {C:green}#1# en #2#{} de",
          "subir de nivel la mano {C:attention}de nuevo",
        }
      },
      j_paperback_sake_cup = {
        name = "Copa de Sake",
        text = {
          "Después de jugar una mano, los {C:attention}#1#{}",
          "{C:attention}en mano{} tienen una prob. de",
          "{C:green}#2# en #3#{} de crear la carta de",
          "{C:planet}Planeta{} de la mano {C:attention}jugada",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_resurrections = {
        name = "Resurrecciones",
        text = {
          "{C:green}#1# en #2#{} de {C:attention}devolver{} {C:attention}Comodines{}",
          "vendidos y crear una {C:attention}copia{}",
          "{C:dark_edition}Negativa{} con {C:money}-$#3#{} de valor",
          "de venta",
          "{s:0.8}La prob. aumenta en {s:0.8,C:green}#4#{s:0.8} si fracasa",
          "{s:0.8}y se {s:0.8,C:red,E:2}autodestruye{}{s:0.8} al activarse",
        }
      },
      j_paperback_book_of_vengeance = {
        name = "Libro de venganza",
        text = {
          "Al derrotar la {C:attention}Ciega Jefe{}:",
          "Se {C:red}destruye{} y al {C:attention}comodín{} a su izquierda",
          "y luego copia el {C:attention}comodín{} de la derecha"
        }
      },
      j_paperback_b_soda = {
        name = "B-Soda",
        text = {
          "Al seleccionar la {C:attention}Ciega{},",
          "gana {C:blue}+#1#{} mano, se",
          "consume si la {C:attention}Ciega{}",
          "es derrotada con",
          "{C:blue}0{} manos restantes",
        }
      },
      j_paperback_angel_investor = {
        name = "Angel Inversionista",
        text = {
          "Saltar una {C:attention}Ciega{} o derrotar",
          "una {C:attention}Ciega Jefe{} otorga",
          "una {C:money}etiqueta de angel",
          "{C:money}inversionista"
        }
      },
      j_paperback_marble_soda = {
        name = "Soda de Marmol",
        text = {
          "Las {C:attention}Cartas de Vidrio{} otorgan",
          "{X:mult,C:white}X#2#{} Multi adicional al anotar",
          "Se consume si {C:attention}#3#{} carta#4#",
          "anotada#4# se {C:attention}destruyen{}"
          -- Would be cool to have a way to get rid of the -n- in "destruyen" in the same way as with the -s-, god love language barriers
        }
      },
      j_paperback_vacation_juice = {
        name = "Bebida Vacacional",
        text = {
          "La primera vez que derrotes",
          "una {C:attention}Ciega{}, no avanzas a la",
          "siguiente {C:attention}Ciega{}.",
          "{s:0.8} Se consume al activarse {C:attention,s:0.8}#1#{} {s:0.8}veces",
        }
      },
      j_paperback_black_forest_cake = {
        name = "Torta Negra",
        text = {
          "Gana {C:mult}+#2#{} Multi por cada",
          "{C:attention}Ciega{} derrotada.",
          "Se {C:red}Consume{} si {C:money}vendes{} o",
          "{C:attention}destruyes{} una carta o comodín",
          "{C:inactive}(Actualmen {C:mult}+#1#{C:inactive} Multi)"
        }
      },
      j_paperback_ice_cube = {
        name = "Cubo de Hielo",
        text = {
          "Otorga {C:blue}+#1#{} mano adicional al seleccionar",
          "la {C:attention}Ciega{} y se derrite si",
          "la puntuación se prende en {C:attention}llamas",
        }
      },
      j_paperback_champagne = {
        name = "Champaña",
        text = {
          "Durante la {C:attention}Ciega Jefe{}, las cartas",
          "anotadas otorgan {C:money}$#1#{} y el {C:attention}doble{}",
          "para las cartas con {C:attention}sello",
          "{C:attention}Se consume{} en {C:attention}#2#{} rondas"
        }
      },
      j_paperback_pocket_pair = {
        name = "Par de bolsillo",
        text = {
          "Gana {C:money}$#1#{} por cada {C:attention}#2#{} en tu",
          "mano al comenzar la ronda"
        }
      },
      j_paperback_the_quiet = {
        name = "El Silencio",
        text = {
          "{X:mult,C:white}X#1#{} Multi por cada",
          "carta debajo de {C:attention}#2#{}",
          "en tu baraja",
          "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} Multi)"
        }
      },
      j_paperback_alert = {
        name = "Alerta",
        text = {
          "Si la {C:attention}mano jugada{} es una sola",
          "{C:attention}carta de figura{}, destruyela",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Legado",
        text = {
          "Al {S:1.1,C:red,E:2}destruir{} cartas sin {C:attention}Mejoras{}",
          "gana sus {C:chips}Fichas{} como {C:mult}Multi{}",
          "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
        }
      },
      j_paperback_telamon = {
        name = "Telamón",
        text = {
          "Si la {C:attention}mano final{} contiene",
          "un {C:attention}#1#{}, crea al azar una",
          "carta de {C:paperback_minor_arcana}Arcana menor{}",
          "de {C:spades}Espadas{}",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_backpack = {
        name = "Mochila",
        text = {
          "La {C:money}Tienda{} tiene un",
          "{C:attention}Paquete de Bufón{} gratis"
        }
      },
      j_paperback_roulette = {
        name = "Ruleta de Casino",
        text = {
          -- error: ronda -> hand? -- My bad, did not read properly, Marffe
          "Cada mano, se escoge al azar una",
          "{C:attention}categoría{} y {C:attention}palo{}. Al anotar:",
          "{C:money}$#1#{} si acierta el palo,",
          "{C:money}$#2#{} si acierta la categoría,",
          "{C:money}$#3#{} si aciertas ambos",
        }
      },
      j_paperback_mexican_train = {
        name = "Tren Mexicano",
        text = {
          "Las {C:attention}Cartas de Dominó{} anotadas",
          "otorgan {C:money}$#2#{} por cada",
          "{C:attention}#1#{} anotada",
          "{C:inactive}(Actualmente {C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_chocolate_joker = {
        name = "Comodín de Chocolate",
        text = {
          "Gana {X:chips,C:white}X#1#{} Fichas por cada",
          "{C:attention}Comodín{} en tu posesión",
          "{C:inactive}(Actualmente {X:chips,C:white}X#2#{C:inactive} Fichas)"
        }
      },
      j_paperback_mandela_effect = {
        name = "Efecto Mandela",
        text = {
          "Otorga una {C:attention}mejora{} al azar a la",
          "primera {C:attention}carta de figura{} anotada"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Bufón de Nihil",
        text = {
          "{C:attention}Debilita{} el último palo",
          "{C:attention}anotado{} y otorga {C:mult}+#1#{}",
          "Multi por carta {C:attention}debilitada{}",
          "en tu baraja",
          "{C:inactive,s:0.8}(Actualmente {V:1,s:0.8}#2#{C:inactive,s:0.8} and {C:mult,s:0.8}+#3#{C:inactive,s:0.8} Multi)",
        }
      },
      j_paperback_forgery = {
        name = "Falsificación",
        text = {
          "Copia un {C:attention}Comodín{} al azar,",
          "si ortoga {X:mult,C:white}XMulti{}, {C:mult}+Multi{}",
          "o {C:chips}Fichas{}, multiplica estos",
          "valores entre {X:attention,C:white}X#1#{} y {X:attention,C:white}X#2#",
          "{C:inactive,s:0.8}Cambia tras jugar una mano{}",
          "{C:inactive,s:0.8}(Actualmente {C:attention,s:0.8}#3#{C:inactive,s:0.8} {X:attention,C:white,s:0.8}X#4#{C:inactive,s:0.8})"
        }
      },
      j_paperback_the_world = {
        name = "El Mundo",
        text = {
          "Todas las {C:blue}manos{} y {C:red}descartes{} se",
          "consideran como el {C:attention}primer{} y",
          "{C:attention}último{} de la ronda"
        }
      },
      j_paperback_epic_sauce = {
        name = "Salsa Épica",
        text = {
          "{X:mult,C:white}X#1#{} Multi.",
          "destruye un {C:attention}Comodín{}",
          "al azar si ya jugaste",
          "la {C:attention}primera mano{}",
          "de la ronda",
        }
      },
      j_paperback_find_jimbo = {
        name = "Encuentra a Jimbo",
        text = {
          "Cada {C:attention}#1#{} de {V:1}#2#{}",
          "anotado otorga {C:money}$#3#{}",
          "{s:0.8}La carta cambia cada ronda"
        },
      },
      j_paperback_joker_crossing = {
        name = "Jimbo Crossing",
        text = {
          "Las cartas {C:attention}Mejoradas{}",
          "tienen una prob. de {C:green}#1# en #2#{}",
          "de reactivarse"
        }
      },
      j_paperback_jimbocards = {
        name = "La Jimbocarta",
        text = {
          "Al Obtenerse {C:red}destruye{} todos tus comodines.",
          "Crea {C:attention}#1#{} comodines {C:dark_edition}Negativos{} al azar.",
          "Todos los precios se reducen en {C:money}$#2#{}.",
          "Si no ganas la {C:attention}Apuesta{} en {C:attention}#3#{} manos",
          "{S:1.1,C:red,E:2}PIERDES{}",
          "{C:inactive}(Te quedan {C:attention}#4#{C:inactive} manos)",
        }
      },
      j_paperback_jimbocards_collection = {
        name = "La Jimbocarta",
        text = {
          "Al Obtenerse {C:red}destruye{} todos tus comodines.",
          "Crea {C:attention}#1#{} comodines {C:dark_edition}Negativos{} al azar.",
          "Todos los precios se reducen en {C:money}$#2#{}.",
          "Si no ganas la {C:attention}Apuesta{} en {C:attention}#3#{} manos",
          "{S:1.1,C:red,E:2}PIERDES{}",
          "{C:inactive}(Te quedan {C:attention}#4#{C:inactive} manos)",
          "Siempre aparece {C:paperback_eternal}Eterno",
        }
      },
      j_paperback_forlorn = {
        name = "Abandonado",
        text = {
          "Si la {C:attention}mano jugada{} sólo contiene",
          "{V:1}Espadas{}, destruye una carta",
          "{C:attention}en mano{} al azar",
        },
      },
      j_paperback_protocol = {
        name = "Protocolo",
        text = {
          "Los {C:attention}paquetes potenciadores{}",
          "tienen {C:attention}+#1#{} carta adicional"
        }
      },
      j_paperback_cream_liqueur = {
        name = "Licor de crema",
        text = {
          "Las {C:attention}etiquetas{} otorgan {C:money}$#1#{}",
          "cuando se activan.",
          "Se consume en {C:attention}#2#{} rondas",
          "{C:inactive,s:0.8}(Se reinicia al obtener una {C:attention,s:0.8}Etiqueta{C:inactive,s:0.8})",
        }
      },
      j_paperback_coffee = {
        name = "Café",
        text = {
          "{C:attention}+#1#{} tamaño de mano, aumenta en {C:attention}#2#{}",
          "cada vez que saltas una {C:attention}ciega{}, prob. de",
          "{C:green}#3# en #4#{} de ser consumido al seleccionar la",
          "{C:attention}Ciega Pequeña{} o la {C:attention}Ciega Grande{}",
        }
      },
      j_paperback_basic_energy = {
        name = "Energía de Comodín Básica",
        text = {
          "Usar {C:attention}Consumibles{} tiene una",
          "prob. de {C:green}#1# en #2#{} de crear una copia",
          "{C:inactive}(No puedes copiar una copia)",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_big_misser = {
        name = "Big Misser",
        text = {
          "{X:mult,C:white}X#1#{} Multi por cada",
          "espacio de consumible vacío",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{}{C:inactive} Multi)"
        }
      },
      j_paperback_fodder = {
        name = "Prescindible",
        text = {
          "Vende esta carta para {C:paperback_ego_gift}Corroer{}",
          "el {C:paperback_ego_gift}Regalo E.G.O.{} del extremo derecho",
        }
      },
      j_paperback_the_strongest = {
        name = "El más Fuerte",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi cuando",
          "un {C:paperback_ego_gift}Regalo E.G.O.{} es",
          "vendido o se corroe",
          "{C:paperback_ego_gift}Corroe{} un {C:paperback_ego_gift}Regalo E.G.O.",
          "al derrotar la {C:attention}Ciega Jefe",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)"
        }
      },
      j_paperback_freezer = {
        name = "Heladera",
        text = {
          "Obtén un {C:attention}Comodín de Comida{} {C:dark_edition}Negativo{}",
          "Después de ganarle a la {C:attention}Ciega Jefe{}",
        },
        unlock = {
          "Acquire a {C:dark_edition}Negative{}",
          "{S:1.1,C:attention,E:2}Food Joker"
        }
      },
      j_paperback_everything_must_go = {
        name = "¡Liquidación!",
        text = {
          "La Tienda tiene",
          "{C:attention}#1#{} {C:attention}Vale{} adicional"
        }
      },
      j_paperback_card_sleeve = {
        name = "Funda de Carta",
        text = {
          "Vende esto para hacer que el",
          "{C:attention}Comodín{} de la derecha sea {C:attention}Eterno{}",
        }
      },
      j_paperback_percussion_ensemble = {
        name = "Sesión de percusión",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi por",
          "cada {C:attention}Mejora{} única en tu",
          "Baraja",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi){}",
        }
      },
      j_paperback_its_tv_time = {
        name = "¡Es hora de la TV!!",
        text = {
          "Las {C:paperback_stars}Estrellas{} se consideran",
          "{C:attention}Cartas adicionales{} y",
          "las {C:attention}Cartas adicionales{}",
          "se consideran {C:paperback_stars}Estrellas{}",
        },
      },
      j_paperback_da_capo = {
        name = "Da Capo",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi y {C:attention}debilita todos menos un",
          "{C:attention}palo{} cada mano en el sigiente orden:", -- The line below goes crazy XD
          "{C:clubs,s:0.8}Tréboles{}{s:0.8},{} {C:spades,s:0.8}Espadas{}{s:0.8},{} {C:diamonds,s:0.8}Diamantes{}{s:0.8},{} {C:hearts,s:0.8}Corazones{}{s:0.8},{} {C:inactive,s:0.8}Ninguno{}",
          "{C:inactive}(Debilitando: {V:1}#2#{C:inactive}){}",
        }
      },
      j_paperback_complete_breakfast = {
        name = "Desayuno completo",
        text = {
          "{C:mult}+#1#{} Multi y {C:chips}+#2#{} Fichas",
          "{C:green}#3# en #4#{} de ser comido al",
          "final de cada mano jugada",
          "las posibilidades aumentan",
          "en {C:green}#5#{} por cada mano jugada",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Transmisión de emergencia",
        text = {
          "Los {C:attention}5{} y {C:attention}8{} otorgan",
          "{C:mult}+#1#{} Multi y {C:chips}+#2#{} Fichas",
        },
      },
      j_paperback_moribund = {
        name = "Comodín Moribundo",
        text = {
          "Gana {C:mult}+#1#{} Multi si derrotas la",
          "{C:attention}ciega{} con {C:attention}0 {}{C:blue}manos{} restantes.",
          "{C:attention}Duplica{} su {C:mult}Multi{} si",
          "no vences la {C:attention}Ciega{}",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Taco Crujiente",
        text = {
          "{X:chips,C:white}X#1#{} Fichas, prob. de",
          "{C:green}#2# en #3#{} de ser comido",
          "al final de la ronda",
        },
      },
      j_paperback_furioso = {
        name = "Furioso",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi por cada",
          "{C:attention}categoria{} anotada. Se reinicia",
          "al derrotar una {C:attention}Ciega Jefe",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
          "{C:inactive}(Categrias jugadas:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Taco Suave",
        text = {
          "{X:mult,C:white}X#1#{} Multi, prob. de",
          "{C:green}#2# en #3#{} de ser comido",
          "al final de la ronda",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Malvavisco Chamuscado",
        text = {
          "Las {C:spades}Espadas{} anotadas otorgan {C:mult}+#1#{}",
          "de Multi, {C:green}#2# en #3#{} de derretirse",
          "al final de la ronda",
        },
      },
      j_paperback_joker_cookie = {
        name = "Comodín Galleta",
        text = {
          "Gana {C:money}$#1#{} al final de la ronda el",
          "pago aumenta en {C:money}$#2#{} al entrar",
          "a la tienda, prob. de {C:green}#4# en #3#{}",
          "de ser comido al final de la ronda",
        },
      },
      j_paperback_pop_stick = {
        name = "Palito de Chupeta",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_pool_table = {
        name = "Mesa de Billar",
        text = {
          "Si la primera mano no anota",
          "{C:attention}cartas de figuras{}, crea",
          "una carta de {C:planet}Planeta{} de la",
          "{C:attention}mano jugada",
          "{C:inactive}(Debe haber espacio)",
        },
      },
      j_paperback_bicycle = {
        name = "Comodín en Bicicleta",
        text = {
          "Las {C:attention}Cartas Vesátiles{} otorgan",
          "{C:mult}Multi{} igual a sus {C:chips}Fichas{}",
        },
      },
      j_paperback_stamp = {
        name = "Estampilla",
        text = {
          "Prob. de {C:green}#1# en #2#{} de",
          "ganar {C:chips}+#3#{} fichas cuando",
          "cualquier {C:attention}sello{} anota",
          "{C:inactive}(Actualmente {C:chips}+#4#{C:inactive} Fichas)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Palito Pegajoso",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_shopping_center = {
        name = "Centro Comercial",
        text = {
          "La {C:money}Tienda{} tiene una",
          "{C:attention}Ranura{} adicional",
        },
      },
      j_paperback_tutor = {
        name = "Tutor",
        text = {
          "Las {C:attention}Cartas de Números{}",
          "{C:attention}duplican{} sus {C:chips}Fichas{} totales",
        },
      },
      j_paperback_ghost_cola = {
        name = "Refresco Fantasma",
        text = {
          "Vende este Comodín para",
          "crear una {C:attention}#1#{}",
          "y una carta {C:spectral}Espectral{}",
          "{C:inactive}(Debe haber espacio)",
        },
      },
      j_paperback_river = {
        name = "Un Río",
        text = {
          "Jugar una mano con {C:attention}5 cartas{} anotadas",
          "te otorga la mitad de las {C:chips}fichas{}",
          "de la carta más baja como {C:money}dinero",
          "{C:inactive}(Máximo {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Lamento Solemne",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi si la mano",
          "contiene {C:paperback_dark_suit}Palos oscuros{}",
          "y {C:paperback_light_suit}Palos claros{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Hoyo en Uno",
        text = {
          "Si la primera {C:blue}mano{} de la ronda le gana",
          "a la {C:attention}Ciega{}, duplica el {C:attention}valor de venta{}",
          "de todas los {C:attention}Comodines{} y {C:attention}Consumibles{}",
          "{C:inactive}(Máximo {C:money}$#1#{C:inactive} por ronda)",
          "Al ser vendido todos los",
          "{C:attention}Comodines{} y {C:attention}Consumibles{}",
          "tendrán un valor de {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Media inpar",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi si",
          "{C:red}descartas{} solamente",
          "{C:attention}1{} carta",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_wild_plus_four = {
        name = "+4 Salvaje",
        text = {
          "{C:attention}+#1#{} al tamaño",
          "de la mano",
        }
      },
      j_paperback_quick_fix = {
        name = "Arreglo rápido",
        text = {
          "{C:attention}+#1#{} tamaño de mano, prob.",
          "de {C:green}#2# en #3#{} de que se rompa",
          "al final de la ronda..."
        },
      },
      j_paperback_skydiver = {
        name = "Paracaidista",
        text = {
          "{C:white,X:mult}X#1#{} Multi si {C:attention}todas las cartas{} anotadas",
          "son {C:attention}menores o iguales{} a la carta de",
          "{C:attention}menor rango{} anotada esta ronda",
          "{C:inactive}(Se actualiza despues de cada mano)",
          "{C:inactive}(Actualmente: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_surfer = {
        name = "Surfista",
        text = {
          "Gana {C:chips}+#1#{} Fichas por",
          "cada {C:attention}#3#{} en mano al",
          "final de la {C:attention}ronda{} y {C:chips}+#2#",
          "por cada {C:attention}#3#{} anotado",
          "{C:inactive}(Actualmente {C:chips}+#4#{C:inactive} Fichas)"
        }
      },
      j_paperback_blue_bonnets = {
        name = "Lupinos azules",
        text = {
          "Los {C:clubs}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:clubs}#4#{} anotado de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_great_wave = {
        name = "La Gran Ola",
        text = {
          "Reactiva la carta del {C:attention}extremo derecho{}",
          "por cada {C:attention}carta anotada{}",
        },
      },
      j_paperback_caramel_apple = {
        name = "Manzana de Caramelo",
        text = {
          "Los {C:clubs}Tréboles{} anotados otorgan {C:mult}+#1#{}",
          "de Multi, prob. de  {C:green}#2# en #3#{} de derretirse",
          "al final de la ronda",
        },
      },
      j_paperback_nachos = {
        name = "Nachos",
        text = {
          "{X:chips,C:white}X#1#{} Fichas,",
          "pierde {X:chips,C:white}X#2#{} Fichas por",
          "cada {C:attention}carta{} descartada",
        },
      },
      j_paperback_trans_flag = {
        name = "Bandera Trans",
        text = {
          "Otorga {C:red}+#1#{} Multi por",
          "cada {C:attention}descarte{}",
          "{C:inactive}(Actualmente {C:red}+#2#{} {C:inactive}Multi)"
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "Bandera del Orgullo",
        text = {
          "Gana {C:chips}+#1#{} Fichas si la mano",
          "contiene un {C:attention}Espectro{}, se",
          "reinicia si juegas una {C:attention}Escalera{}", -- The straight joke don't work in Spanish, fix pls
          "{C:inactive}(Actualmente {C:chips}+#2#{} {C:inactive}Fichas)"
        },
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "Bandera del Orgullo",
        text = {
          "Gana {C:mult}+#1#{} Multi si la mano",
          "contiene {C:attention}tres{} palos diferentes",
          "{C:inactive}(Actualmente {C:mult}+#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Cordero de sacrificio",
        text = {
          "Gana {C:mult}+#1#{} Multi por cada",
          "Carta o Comodín {C:attention}destruido",
          "{C:inactive}(Actualmente {C:mult}+#2# {C:inactive}Multi)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Hojas de Otoño",
        text = {
          "Los {C:diamonds}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:diamonds}#4#{} anotado de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[PREMIO SALVAJE!1!]]",
        text = {
          "Cada {C:attention}Carta versátil{} tiene una prob. de",
          "{C:green}#1# en #2#{} de {C:attention}reactivarse{} y una prob.",
          "{C:green}#3# en #4#{} de ganar {C:money}#5#{} o {C:money}$#6#{} al anotar",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Recuerdo Vacacional",
        text = {
          "Otorga {C:mult}+Multi{} igual a",
          "{C:mult}x#1#{} su {C:attention}valor de venta{}.",
          "Gana {C:money}$#2#{} de {C:money}valor de venta{}",
          "al final de la ronda",
          "{C:inactive}(Actualmente {C:mult}+#3# {C:inactive}Multi){}",
        },
      },
      j_paperback_calling_card = {
        name = "Tarjeta de Jefe",
        text = {
          "Gana {X:red,C:white}X#1#{} Multi cada vez",
          "que derrotas una {C:attention}Ciega Jefe{}",
          "o activas su {C:attention}efecto{}",
          "{C:inactive}(Actualmente {}{X:red,C:white}X#2#{}{C:inactive} Multi){}",
        },
      },
      j_paperback_greeting_card = {
        name = "Comodín Navideño",
        text = {
          "Gana {C:money}$#1#{} al {C:attention}valor de venta{} cuando",
          "una {C:attention}#2#{} anota",
        },
      },
      j_paperback_subterfuge = {
        name = "Subterfugio",
        text = {
          "Destroye las cartas de la",
          "{C:attention}primera{} {C:attention}mano{} cada ronda"
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Diosa de la Triple Luna",
        text = {
          "Si la mano anota una {C:attention}Tercia{}:",
          "Prob. de {C:green}#1# en #2#{} de crear una carta {C:planet}Planeta{}.",
          "Prob. de {C:green}#3# en #4#{} de crear una carta del {C:purple}Tarot{}",
          "{C:inactive}(Debe haber espacio)"
        },
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "Diosa de la Triple Luna",
        text = {
          "Si la mano anota una {C:attention}Tercia{}:",
          "Prob. de {C:green}#1# en #2#{} de crear una carta del {C:purple}Tarot{}.",
          "Prob. de {C:green}#3# en #4#{} crear una carta {C:paperback_minor_arcana}Arcana menor{}.",
          "{C:inactive}(Debe haber espacio)"
        },
      },
      j_paperback_derecho = {
        name = "Derecho",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi si la mano",
          "no anota cartas de {C:paperback_light_suit}palo claro",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_the_sun_rises = {
        name = "El Sol se Levanta",
        text = {
          "Las cartas sólo tienen {C:chips}#1#{} ficha",
          "Los {C:paperback_light_suit}palos claros{} ganan {C:chips}+#3#{} Ficha",
          "por cada {C:paperback_light_suit}palo claro{} anotado",
          "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} fichas)",
        },
      },
      j_paperback_jestrica = {
        name = "Jestrica",
        text = {
          "Gana {C:mult}+#1#{} Multi al anotar",
          "un {C:attention}8{}. Se reinicia si",
          "no anotas un {C:attention}8{}",
          -- TODO might want to indicate if an 8 hasn't been scored
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Estrategia Maestra",
        text = {
          "{X:mult,C:white}X#1#{} Multi si tienes",
          "{C:attention}#2#{} o más {C:attention}mejoras{}",
          "únicas en tu baraja",
          "{C:inactive}(Actualmente {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_moving_out = {
        name = "Moving Out",
        text = {
          "Gana {C:mult}+#1#{} Multi si tu",
          "mano {C:attention}ganadora{} no es",
          "tu mano más jugada",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
        },
      },
      j_paperback_ready_to_fly = {
        name = "Listo para volar",
        text = {
          "Gana {X:chips,C:white}X#2#{} Fichas cada vez que",
          "un comodín adjacente se {C:attention}activa",
          "{C:inactive}(Actualmente {X:chips,C:white}X#1#{C:inactive} Fichas)",
        },
      },
      j_paperback_solar_system = {
        name = "Sistema Solar",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi por cada {C:planet}nivel{}",
          "que {C:attention}compartan{} los 9 {C:planet}Planetas{} base",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_reference_card = {
        name = "Tarjeta de Referencia",
        text = {
          "Gana {X:mult,C:white}X#1#{} Multi cada vez que",
          "hayas jugado las {C:attention}9 manos base{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Helado de Naranja",
        text = {
          "Los {C:diamonds}Diamantes{} anotados otorgan {C:mult}+#1#{}",
          "de Multi, prob. de  {C:green}#2# en #3#{} de derretirse",
          "al final de la ronda",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "La Aventura de Jimbo",
        text = {
          "Saltar {C:attention}Ciegas{} crea",
          "{C:attention}Etiquetas{} al azar",
        },
      },
      j_paperback_union_card = {
        name = "Tarjeta de la Unión",
        text = {
          "Otorga {X:mult,C:white}XMulti{} igual a la cantidad",
          "de cartas de {C:paperback_light_suit}Palo claro{} anotadas.",
          "Bloquea el {C:attention}valor de venta{} de todo",
          "a {C:money}$0{} hasta ser vendido",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Flores de Cerezo",
        text = {
          "Los {C:hearts}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:hearts}#4#{} anotado de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_paranoia = {
        name = "Paranoia",
        text = {
          "Los {C:paperback_light_suit}Palos claros{} otorgan {C:mult}+#1#{} Multi",
          "al {C:attention}anotar{} por cada carta de",
          "{C:paperback_dark_suit}Palo oscuro{} {C:attention}destruida{}",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
        },
      },
      j_paperback_unholy_alliance = {
        name = "Alianza impía",
        text = {
          "Gana {C:chips}+#1#{} Fichas por cada",
          "Carta o Comodín {C:attention}destruido",
          "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Círculo de Invocación",
        text = {
          "Si la mano jugada es una",
          "{C:attention}#1#{}, crea una copia de",
          "un {C:attention}consumible{} al azar",
          "{C:inactive}(Debe haber espacio){}"
        }
      },
      j_paperback_the_sun = {
        name = "El Sol",
        text = {
          "Si la mano no contiene {C:paperback_dark_suit}Palos oscuros{}",
          "gana {C:mult}+#1#{} Multi,",
          "pierde {C:mult}+#1#{} Multi por",
          "cada {C:paperback_dark_suit}Palo oscuro{} anotado",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Palito Puntiagudo",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Principe de la Oscuridad",
        text = {
          "Si la mano anota un {C:hearts}Corazón{} y otros",
          "{C:attention}#1#{} palos diferentes, este comodín otorga",
          "{X:mult,C:white}X#2#{} Multi y en las siguientes {C:blue}2{} manos",
          "{C:inactive}({C:attention}#4#{C:inactive} manos restantes)"
        },
      },
      j_paperback_giga_size = {
        name = "GIGA TAMAÑO",
        text = {
          "Gana {X:mult,C:white}X#2#{} Multi por mano",
          "jugada en esta {C:attention}Ciega{}",
          "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Multi)"
        },
      },
      j_paperback_popsicle_stick = {
        name = "Palito de Helado",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Let It Happen",
        text = {
          "{C:purple}Balancea{} el {C:mult}Multi{} y {C:chips}Fichas{}",
          "si es la primera vez que usas",
          "una mano en esta {C:attention}Apuesta{}",
          "{C:inactive}(Manos jugadas:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_in_case_i_make_it = {
        name = "In case I make it",
        text = {
          "Las {C:attention}Cartas sin categoría{}",
          "ganan {C:chips}+#1#{} al anotarse",
        },
      },
      j_paperback_evergreens = {
        name = "Perennifolios",
        text = {
          "Las {C:spades}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:spades}#4#{} anotado de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_der_fluschutze = {
        name = "Der Fluschütze",
        text = {
          "Si la {C:attention}primera{} mano de la ronda es",
          "una sola {C:attention}carta de figura{} destruyela",
          "y gana {X:mult,C:white}X#1#{} Multi",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)"
        }
      },
      j_paperback_the_wonder_of_you = {
        name = "The Wonder of You",
        text = {
          "Al seleccionar la {C:attention}Ciega Jefe{}",
          "crea 2 {C:green}etiquetas{} al azar",
        }
      },
      j_paperback_inner_peace = {
        name = "Paz Interior",
        text = {
          "{C:attention}+3{} al tamaño de mano",
          "hasta que juegues tu",
          "{C:attention}primera{} mano"
        }
      },
      j_paperback_shopkeep = {
        name = "Tendero",
        text = {
          "Gana una {C:attention}Etiqueta de cupón{} al derrotar",
          "una ciega, al derrotar la {C:attention}Ciega{} {C:attention}Jefe{}",
          "gana una {C:attention}Etiqueta de Vale{}"
        },
      },
      j_paperback_cakepop = {
        name = "Chupeta de fresa",
        text = {
          "Los {C:hearts}Corazones{} anotados otorgan {C:mult}+#1#{}",
          "de Multi, prob. de {C:green}#2# en #3#{} de ser comido",
          "al final de la ronda",
        },
      },
      j_paperback_black_rainbows = {
        name = "Arcoiris negro",
        text = {
          "Las {C:spades}Espadas{} y {C:clubs}Tréboles",
          "anotados tienen una prob. de",
          "{C:green}#1# en #2#{} de volverse {C:dark_edition}Policroma"
        }
      },
      j_paperback_meeple = {
        name = "Meeple",
        text = {
          "Si la mano anota una carta",
          "de {C:attention}figura{}, prob. de {C:green}#1# en #2#{} de",
          "obtener {C:mult}+#3#{} descarte esta ronda",
        }
      },
      j_paperback_apple = {
        name = "Manzana",
        text = {
          "Al comprar {C:attention}Consumibles{}:",
          "Prob. de {C:green}#1# en #2#{} crear una copia {C:dark_edition}Negativa{}",
          "Prob. de {C:green}#3# en #4#{} de {C:red,E:2}destruir{} este comodín",
        }
      },
      j_paperback_heretical_joker = {
        name = "Comodín Herético",
        text = {
          "Las cartas jugadas",
          "del palo {C:paperback_stars}Estrella{} otorgan",
          "{C:mult}+#1#{} Multi al anotar",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "Comodín Fraudulento",
        text = {
          "Las cartas jugadas del",
          "palo {C:paperback_crowns}Corona{} otorgan",
          "{C:mult}+#1#{} Multi al anotar",
        },
      },
      j_paperback_rock_candy = {
        name = "Caramelo de Piedra",
        text = {
          "Las {C:paperback_stars}Estrellas{} anotadas otorgan {C:mult}+#1#{}",
          "de Multi, prob. de  {C:green}#2# en #3#{} de ser comido al final",
          "de la ronda",
        },
      },
      j_paperback_rockin_stick = {
        name = "Palito Rockero",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_tanghulu = {
        name = "Tanghulu",
        text = {
          "Las {C:paperback_crowns}Coronas{} anotadas otorgan {C:mult}+#1#{}",
          "de Multi, prob. de  {C:green}#2# en #3#{} de ser comido",
          "al final de la ronda",
        },
      },
      j_paperback_sweet_stick = {
        name = "Palito dulce",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "Comodín {C:attention}\"Palito\"{} que poseas",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
        },
      },
      j_paperback_quartz = {
        name = "Cuarzo",
        text = {
          "Anotar {C:paperback_stars}Estrellas{} otorga {X:chips,C:white}X1{} Fichas,",
          "{X:chips,C:white}+X#1#{} por cada {C:paperback_stars}Estrella{} jugada"
        }
      },
      j_paperback_pyrite = {
        name = "Pirita",
        text = {
          "Jugar {V:1}#1#{} tiene {C:green}#2# en #3#{}",
          "de crear una carta del",
          "{C:tarot}Tarot{} al azar al anotar",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      j_paperback_wheat_field = {
        name = "Campo de trigo",
        text = {
          "Las {C:paperback_crowns}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:paperback_crowns}#4#{} anotada de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_clothespin = {
        name = "Gancho de ropa",
        text = {
          "Gana {C:chips}+#1#{} Fichas al",
          "{C:attention}final de la ronda{}",
          "por cada {C:attention}Clip{} {C:attention}en mano",
          "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
        }
      },
      j_paperback_watercolor_joker = {
        name = "Comodín de Acuarela",
        text = {
          "Las {C:attention}Cartas Mojadas{} otorgan",
          "{X:chips,C:white}X#2#{} Fichas al anotar",
        }
      },
      j_paperback_birches = {
        name = "Abedules",
        text = {
          "Las {C:paperback_stars}#1#{} otorgan {X:mult,C:white}X#2#{} Multi",
          "al anotar y aumenta {X:mult,C:white}X#3#{} por cada",
          "{C:paperback_stars}#4#{} anotado de forma consecutiva",
          "{C:inactive,s:0.8}(Se reinicia después de jugar la mano)",
        },
      },
      j_paperback_oracle = {
        name = "Oráculo",
        text = {
          "Gana {X:chips,C:white}X#1#{} Fichas por cada",
          "carta de {C:paperback_minor_arcana}Arcana Menor{}",
          "{C:attention}única{} que hayas usado",
          "{C:inactive}(Actualmente {X:chips,C:white}X#2#{C:inactive} Fichas)",
        },
      },
      j_paperback_punch_card = {
        name = "Tarjeta perforada",
        text = {
          "Después de {C:attention}#1#{} rondas,",
          "vende esta tarjeta para",
          "retroceder una {C:attention}Apuesta{}",
          "{C:inactive}(Actualmente {C:attention}#2#{C:inactive}/#1#)",
        },
      },
      j_paperback_eyelander = {
        name = "La Intuertal",
        text = {
          "Anotar cartas de {C:attention}figura{} las destruye.",
          "Después de anotar {C:attention}#1#{} cartas de {C:attention}figura{}",
          "{C:attention}vender{} este comodín otorga edición",
          "{C:dark_edition}negativa{} a un comodín {C:attention}al azar{}",
          "{C:inactive}(Actualmente {C:attention}#2#{C:inactive} Decapitaciones)"
        }
      },
      j_paperback_banana_man = {
        name = "Hombre Plátano",
        text = {
          "Los comodines tienen una prob.",
          " de {C:green}#1# en #2#{} de otorgar {X:mult,C:white}X#3#{} Multi"
        },
        unlock = {
          "Acquire",
          "{C:attention}Cavendish",
          "in a run"
        }
      },
      j_paperback_guns_blazin = {
        name = "Calibrated Aces",
        text = {
          "Los {C:attention}Ases{} otorgan",
          "{X:mult,C:white} X#1# {} Multi al",
          "anotar",
        },
      },
      j_paperback_satellite_array = {
        name = "Conjunto de satélites",
        text = {
          "Gana {C:chips}+#1#{} Fichas por",
          "cada carta de {C:planet}Planeta{} ",
          "usada y pierde {C:chips}#2#{} Fichas",
          "por al jugar una mano",
          "{C:inactive}(Actualmente {C:chips}+#3#{C:inactive} Fichas)",
        }
      },
      j_paperback_rosary_beads = {
        name = "Rosario Rojo",
        text = {
          "Si la mano jugada contiene",
          "{C:attention}#1#{} o más {C:hearts}Corazones{}, ganas {C:money}$#2#{}"
        }
      },
      j_paperback_tian_tian = {
        name = "Tian Tian",
        text = {
          'Gana {X:mult,C:white}X#1#{} Multi por',
					'cada {C:attention}carta{} destruida',
          "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
        }
      },
      j_paperback_disco = {
        name = "Comodín Disco",
        text = {
          "Gana {C:mult}+#1#{} Multi cuando compras",
          "teniendo {C:money}$#2#{} o menos",
          "{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)"
        }
      },
      j_paperback_a_balatro_movie = {
        name = "Una Película de Balatro",
        text = {
          "Jugar la misma {C:blue}mano{} de forma",
          "{C:attention}consecutiva{} otorga {C:money}$#2#{}",
          "{C:inactive}(Última mano: {C:attention}#1#{C:inactive})"
        }
      },
      j_paperback_unionized_labor = {
        name = "Sindicalizado", -- Some things are kinda tricky to translate properly
        text = {
          "Triplica las {C:green,E:1,S:1.1}probabilidades",
          "cuando tienes menos de {C:money}$#1#{}, reduce",
          "las prob. a la {C:attention}mitad{} de lo contrario",
          "{C:inactive}(ej: {C:green}1 en 3{C:inactive} -> {C:green}#2# en #3#{C:inactive})"
        }
      },
      -- Cross-Mod jokers start here
      j_paperback_moon_waltz = {
        name = "Moon Waltz",
        text = {
          "This Joker has a {C:green}#3#{} in {C:green}#4#{} chance of gaining",
          "half of a used {C:planet}Moon{} or",
          "{C:planet}Asteroid{} card's {C:mult}+Mult{} or {C:chips}+Chips{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult and {C:chips}+#2#{C:inactive} Chips)",
        },
      },
      },
    Spectral = {
      c_paperback_apostle_of_cups = {
        name = "Apóstol de Copas",
        text = {
          "Selecciona una {C:attention}Carta",
          "para hacerla {C:dark_edition}Negativa",
          "{C:attention}#1#{} Ranura de comodín",
        }
      },
      c_paperback_apostle_of_wands = {
        name = "Apóstol de Varas",
        text = {
          "Crea un comodín no",
          "{C:legendary}Legendario{} de tu {C:attention}elección{}",
          "{C:inactive}(No puedes duplicar)"
        }
      },
      c_paperback_apostle_of_swords = {
        name = "Apóstol de Espadas",
        text = {
          "Destruye un {C:attention}Comodín{}",
          "y retrocede {C:attention}#1#{} Apuestas"
        }
      },
      c_paperback_apostle_of_pentacles = {
        name = "Apóstol de Pentáculos",
        text = {
          "Añade el {C:paperback_platinum}Clip de Platino{}",
          "a {C:attention}#1#{} carta seleccionada"
        }
      },
      c_paperback_golden_bough = {
        name = "Rama Dorada",
        text = {
          "Crea un {C:paperback_ego_gift}Regalo E.G.O.{}",
          "{C:dark_edition}Negativo{} después",
          "de cada {C:attention}Ciega Jefe",
          "{C:red}#1#{} Ranura de comodín"
        }
      },
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "As de Copas",
        text = {
          "Añade un {C:chips}Clip Azul{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_two_of_cups = {
        name = "Dos de Copas",
        text = {
          "Otorga una etiqueta {C:dark_edition}Policroma{},",
          "{C:dark_edition}Holgrafíca{}, {C:dark_edition}Laminada{},",
          "{C:mult}Rara{} o {C:green}Inusual{C:attention}"
        }
      },
      c_paperback_three_of_cups = {
        name = "Tres de Copas",
        text = {
          "Añade un {C:paperback_black}Clip Negro{} a",
          "{C:attention}#1#{} carta seleccionada"
        }
      },
      c_paperback_four_of_cups = {
        name = "Cuatro de Copas",
        text = {
          "Remueve {C:attention}mejoras{}, {C:attention}sellos{} y {C:attention}ediciones{}",
          "de {C:attention}#1#{} cartas seleccionadas.",
          "Gana {C:money}$#2#{} por cada una"
        }
      },
      c_paperback_five_of_cups = {
        name = "Cinco de Copas",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_six_of_cups = {
        name = "Seis de Copas",
        text = {
          "Gana la {C:attention}mitad{} de las {C:chips}Fichas",
          "de {C:attention}#1#{} carta sleccionada",
          "como {C:money}dinero",
          "{C:inactive}(Hasta {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_seven_of_cups = {
        name = "Siete de Copas",
        text = {
          "Otorga una {C:attention}mejora{} al azar",
          "a {C:attention}#1#{} cartas sleccionadas"
        }
      },
      c_paperback_eight_of_cups = {
        name = "Ocho de Copas",
        text = {
          "Convierta hasta {C:attention}#1#{} cartas",
          "seleccionadas a un palo que",
          "no ha ha sido {C:attention}seleccionado"
        }
      },
      c_paperback_nine_of_cups = {
        name = "Nueve de Copas",
        text = {
          "Destruye un {C:attention}Comodín{} seleccionado",
          "y crea un {C:attention}Comodín{} de misma",
          "{C:attention}rareza{} o superior",
          "{C:inactive}(No puede crear {C:legendary}Legendarios{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Diez de Copas",
        text = {
          "Prob. de {C:green}#1# en #2#{} de agregar",
          "edición {C:dark_edition}Policroma{} a",
          "{C:attention}1{} carta seleccionada"
        }
      },
      c_paperback_page_of_cups = {
        name = "Sota de Copas",
        text = {
          "Añade {C:inactive}Clip Blanco{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_knight_of_cups = {
        name = "Caballero de Copas",
        text = {
          "Selecciona {C:attention}#1#{} cartas, la carta de",
          "la {C:attention}izquierda{} copia {C:attention}todo{} de la",
          "carta de la {C:attention}derecha{} menos",
          "su {C:attention}categoría{} y {C:attention}palo.",
          "Detruye la carta de la {C:attention}derecha{}",
        }
      },
      c_paperback_queen_of_cups = {
        name = "Reina de Copas",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_king_of_cups = {
        name = "Rey de Copas",
        text = {
          "Gana {C:money}$#1#{} por cada palo completo",
          "con las 13 {C:attention}categorías{} que poseas",
          "{C:inactive}(Actualmente {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_wands = {
        name = "As de Varas",
        text = {
          "Añade {C:mult}Clips Rojos{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_two_of_wands = {
        name = "Dos de Varas",
        text = {
          "Crea las cartas de {C:planet}Planeta{}",
          "de tus manos {C:attention}más{} y {C:attention}menos{}",
          "{C:attention}jugadas{}",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      c_paperback_three_of_wands = {
        name = "Tres de Varas",
        text = {
          "Crea {C:attention}#1#{} copia de una",
          "carta seleccionada"
        }
      },
      c_paperback_four_of_wands = {
        name = "Cuatro de Varas",
        text = {
          "Añade {C:paperback_pink}Clips Rosados{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_five_of_wands = {
        name = "Cinco de Varas",
        text = {
          "Destruye todas las cartas",
          "{C:attention}en manos{} y deja el",
          "dinero en {C:money}$0"
        }
      },
      c_paperback_six_of_wands = {
        name = "Seis de Varas",
        text = {
          "Mejora {C:attention}#1#{} Cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_seven_of_wands = {
        name = "Siete de Varas",
        text = {
          "Otorga una",
          "{C:attention}Etiqueta Quebradora"
        }
      },
      c_paperback_eight_of_wands = {
        name = "Ocho de Varas",
        text = {
          "Crea una {C:attention}Etiqueta {C:dark_edition}Negativa{} y",
          "pierde {C:money}$#1#{}, más {C:money}$#2#{} por cada",
          "Comodín encima de {C:attention}#3#{}",
          "{C:inactive}(Actualmente {C:money}$#4#{C:inactive})"
        }
      },
      c_paperback_nine_of_wands = {
        name = "Nueve de Varas",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_ten_of_wands = {
        name = "Diez de Varas",
        text = {
          "Selecciona {C:attention}#1#{} cartas, destruye",
          "las {C:attention}2 de la derecha{} y la carta",
          "de la {C:attention}izquierda{} gana sus {C:chips}Fichas{}",
          "{C:inactive}(Arrastra para reordenar)"
        }
      },
      c_paperback_page_of_wands = {
        name = "Sota de Varas",
        text = {
          "Añade {C:attention}Clips Naranjas{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_knight_of_wands = {
        name = "Caballero de Varas",
        text = {
          "Otorga una {C:attention}Eiqueta",
          "de {C:mult}Riesgo"
        }
      },
      c_paperback_queen_of_wands = {
        name = "Reina de Varas",
        text = {
          "Prob. de {C:green}#1# en #2#{} de otorgar",
          "edición {C:dark_edition}Dicromática{} a un",
          "{C:attention}Comodín{} al azar"
        }
      },
      c_paperback_king_of_wands = {
        name = "Rey de Varas",
        text = {
          "Crea al azar un {C:attention}Comodín{}",
          "{C:green}Inusual{} o {C:red}Raro{}",
        }
      },
      c_paperback_ace_of_swords = {
        name = "As de Espadas",
        text = {
          "Convierte hasta {C:attention}#1#{} cartas",
          "seleccionadas en {V:1}#2#{}",
        }
      },
      c_paperback_two_of_swords = {
        name = "Dos de Espadas",
        text = {
          "Convierta {C:attention}#1#{} cartas",
          "seleccionadas al último",
          "palo {C:attention}anotado{}",
          -- slight error? says last hand, should be the last suit
          "{C:inactive,s:0.8}(Última mano: {V:1,s:0.8}#2#{C:inactive,,s:0.8})",
        }
      },
      c_paperback_three_of_swords = {
        name = "Tres de Espadas",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_four_of_swords = {
        name = "Cuatro de Espadas",
        text = {
          "Convierte {C:attention}#1#{} seleccionadas",
          "en cartas de {C:attention}Figura{}",
          "al azar"
        }
      },
      c_paperback_five_of_swords = {
        name = "Cinco de Espadas",
        text = {
          "Otorga una {C:attention}edición{},",
          "{C:attention}sello{} o {C:attention}mejora{}",
          "al azar",
        }
      },
      c_paperback_six_of_swords = {
        name = "Seis de Espadas",
        text = {
          "Añade {C:attention}Clips Amarillos{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_seven_of_swords = {
        name = "Siete de Espadas",
        text = {
          "Añade un {C:attention}Clip Dorado{} a",
          "{C:attention}#1#{} carta seleccionada"
        }
      },
      c_paperback_eight_of_swords = {
        name = "Ocho de Espadas",
        text = {
          "Añade al azar {C:attention}Clips{} a",
          "{C:attention}#1#{} cartas seleccionadas"
        }
      },
      c_paperback_nine_of_swords = {
        name = "Nueve de Espadas",
        text = {
          "Destruye el Comodín seleccionado",
          "y no {C:red}puede{} aparecer de nuevo",
          "por el {C:attention}resto de la partida{}"
        }
      },
      c_paperback_ten_of_swords = {
        name = "Diez de Espadas",
        text = {
          "{C:red}Destruye{} todas las cartas",
          "con la {C:attention}categoría{} de",
          "la carta seleccionada"
        }
      },
      c_paperback_page_of_swords = {
        name = "Sota de Espadas",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}Cartas de Dominó{}"
        }
      },
      c_paperback_knight_of_swords = {
        name = "Caballero de Espadas",
        text = {
          "Crea al azar una carta de",
          "{C:paperback_minor_arcana}Arcana menor{} y del {C:tarot}Tarot{}",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      c_paperback_king_of_swords = {
        name = "Rey de Espadas",
        text = {
          "Remueve los stickers de {C:money}Alquiler{} y",
          "{C:paperback_perishable}Perecedero{} del comodín seleccionado"
        }
      },
      c_paperback_queen_of_swords = {
        name = "Reina de Espadas",
        text = {
          "Convierte {C:attention}#1#{} cartas al azar",
          "en tu baraja con{C:attention} palo diferente",
          "al {C:attention}palo{} de la carta seleccionada"
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "As de Pentáculos",
        text = {
          "Convierte hasta {C:attention}#1#{} cartas",
          "seleccionadas en {V:1}#2#{}",
        }
      },
      c_paperback_two_of_pentacles = {
        name = "Dos de Pentáculos",
        text = {
          "Agrega o Remueve {C:paperback_eternal}Eterno{}",
          "del {C:attention}Comodín{} sleccionado"
        }
      },
      c_paperback_three_of_pentacles = {
        name = "Tres de Pentáculos",
        text = {
          "Selecciona {C:attention}#1#{} cartas, las",
          "2 cartas de la {C:attention}derecha{} copian la",
          "{C:attention}mejora{} de la carta de la{C:attention}izquierda{}",
          "{C:inactive}(Arrastra para reordenar)"
        }
      },
      c_paperback_four_of_pentacles = {
        name = "Cuatro de Pentáculos",
        text = {
          "Seleciona {C:attention}#1#{} cartas.",
          "Prob. de {C:green}#2# en #3#{} de {C:red}destruir{}",
          "las cartas {C:attention}no seleccionadas{}",
        }
      },
      c_paperback_five_of_pentacles = {
        name = "Cinco de Pentáculos",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_six_of_pentacles = {
        name = "Seis de Pentáculos",
        text = {
          "Otorga una etiqueta de",
          "{C:money}Inversión{}, {C:money}Economía{}, {C:red}Cupón{},",
          "{C:green}D6{} o de {C:attention}Malabar{}"
        }
      },
      c_paperback_seven_of_pentacles = {
        name = "Siete de Pentáculos",
        text = {
          "Añade {C:green}Clip Verde{} a {C:attention}#1#{}",
          "cartas seleccionadas"
        }
      },
      c_paperback_eight_of_pentacles = {
        name = "Ocho de Pentáculos",
        text = {
          "Ganas {C:money}$#1#{} por cada carta del",
          "{C:tarot}Tarot{} o {C:paperback_minor_arcana}Arcana menor{}",
          "única que hayas usado",
          "{C:inactive}(Actualmente {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_nine_of_pentacles = {
        name = "Nueve de Pentáculos",
        text = {
          "Añade un {C:purple}Clip Morado{} a",
          "{C:attention}#1#{} carta seleccionada"
        }
      },
      c_paperback_ten_of_pentacles = {
        name = "Diez de Pentáculos",
        text = {
          "Ganas entre {C:money}$#1#{} y {C:money}$#2#{}",
          "al usarla"
        }
      },
      c_paperback_page_of_pentacles = {
        name = "Sota de Pentáculos",
        text = {
          "Mejora {C:attention}#1#{} cartas",
          "seleccionadas a",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_knight_of_pentacles = {
        name = "Caballero de Pentáculos",
        text = {
          "Reinicia el coste de las",
          "{C:green}renovaciones{} a {C:money}$#1#{}"
        }
      },
      c_paperback_queen_of_pentacles = {
        name = "Reina de Pentáculos",
        text = {
          "Selecciona {C:attention}#1#{} cartas, convierte",
          "las cartas a la {C:attention}categoría{} de", 
          "la carta {C:attention}extremo izquierdo{}",
          "{C:inactive}(Arrastra para reordenar)"
        }
      },
      c_paperback_king_of_pentacles = {
        name = "Rey de Pentáculos",
        text = {
          "Ganas {C:money}$#1#{} por cada carta",
          "de {C:attention}figura{} en tu baraja",
          "{C:inactive}(Actualmente {C:money}$#2#{C:inactive})"
        }
      },
    },
    paperback_ego_gift = {
      c_paperback_dark_vestige = {
        name = "Vestigio oscuro",
        text = {
          "El resultado de intentar",
          "duplicar {C:paperback_ego_gift}regalos E.G.O{}...",
        }
      },
      c_paperback_imposed_weight = {
        name = "Peso Impuesto",
        text = {
          "Reactiva la carta del {C:attention}extremo{}",
          "{C:attention}derecho{} {C:attention}#1#{} vez por cada",
          "ranura de comodín {C:attention}vacia{}"
        }
      },
      c_paperback_phlebotomy_pack = {
        name = "Paquete de flebotomía",
        text = {
          "{C:blue}+#1#{} mano adiconal al",
          "empezar la ronda"
        }
      },
      c_paperback_smokes_and_wires = {
        name = "Alambres y humo",
        text = {
          "{X:red,C:white}X#1#{} Multi en la última",
          "{C:blue}mano{} {C:attention}de la ronda{}",
        }
      },
      c_paperback_coffee_and_cranes = {
        name = "Café y grullas",
        text = {
          "Ganas {C:money}$#1#{} al final",
          "de la ronda",
        }
      },
      c_paperback_fiery_down = {
        name = "Pluma ígnea",
        text = {
          "Después de descartar {C:attention}#1#{} {C:inactive}(#2#){}",
          "cartas, sube de nivel tu",
          "próxima {C:attention}mano jugada"
        }
      },
      c_paperback_decamillennial_stewpot = {
        name = "Olla decamilenial",
        text = {
          "Si tu {C:attention}primera mano{} es una",
          "{C:attention}sola{} carta, destrúyela",
        }
      },
      c_paperback_downpour = {
        name = "Diluvio",
        text = {
          "Las {C:blue}manos{} jugadas {C:attention}reducen{} la",
          "puntucación requerida en {C:attention}#1#%",
        }
      },
      c_paperback_rusty_coin = {
        name = "Moneda conmemorativa oxidada",
        text = {
          "Si tu {C:attention}primera mano{} es una {C:attention}sola{}",
          "carta, obtiene un {C:attention}sello{} al azar",
        }
      },
      c_paperback_ragged_umbrella = {
        name = "Paraguas harapiento",
        text = {
          "Gana {C:chips}+#1#{} Fichas por cada",
          "{C:attention}mano{} que no derrota la {C:attention}Ciega{}",
          "{C:inactive}(Actuamente {C:chips}+#2#{C:inactive} Fichas)",
        }
      },
      c_paperback_thrill = {
        name = "Estremecer",
        text = {
          "Otorga {X:mult,C:white}X#1#{} Multi por cada",
          "{C:attention}descarte{} usado y se activa",
          "en la {C:attention}primera{} mano jugada",
          "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
        }
      },
      c_paperback_disk_fragment = {
        name = "Fragmento de Disco",
        text = {
          "Si no posees cartas de {C:planet}Planeta{}",
          "crea {C:attention}#1#{} cartas de {C:planet}Planeta{} {C:dark_edition}negativas{}",
          "al seleccionar la {C:attention}Ciega pequeña{} o {C:attention}Grande{}",
        }
      },
      c_paperback_death_seeker = {
        name = "Buscamuertos",
        text = {
          "Las cartas {C:attention}mejoradas{} otorgan {C:mult}+Multi{}",
          "igual a su {C:attention}categoría{} al anotar",
        }
      },
      c_paperback_pendant_of_nostalgia = {
        name = "Colgante de nostalgia",
        text = {
          "Cuando se {C:red}destruye{} una {C:attention}carta{}, crea una",
          "carta del {C:tarot}Tarot{} o de {C:paperback_minor_arcana}Arcana menor{}",
          "{C:inactive}(Debe haber espacio)"
        }
      },
      c_paperback_blue_lighter = {
        name = "Encendedor Azul",
        text = {
          "Al seleccionar una {C:attention}ciega{}, destruye",
          "un consumible que no sea {C:paperback_ego_gift}E.G.O.{}",
          "y gana {X:mult,C:white}X#1#{} Multi",
          "{C:inactive}(actualmente {X:mult,C:white}X#2#{C:inactive} Multi)"
        }
      },
      c_paperback_broken_glasses = {
        name = "Lentes rotos",
        text = {
          "Cuando {C:attention}destruyes{} exactamente {C:attention}1{} o {C:attention}2{} cartas",
          "crea {C:attention}2 copias{} de las cartas destruidas.",
          "Prob. de {C:green}#1# en #2#{} de {C:red}autodestruirse{}",
          "{C:inactive,s:0.8}al autodestruirse no activa su pecado"
        }
      },
      c_paperback_nebulizer = {
        name = "Nebulizador",
        text = {
          "Las cartas anotadas tienen una prob.",
          "de {C:green}#1# en #2#{} de otorgan {X:mult,C:white}X#3#{} Multi"
        }
      },
      c_paperback_tomorrow_fortune = {
        name = "La fortuna del mañana",
        text = {
          "Los {C:attention}Paquetes potenciadores{}",
          "tienen {C:attention}1{} carta adicional"
        }
      },
      c_paperback_fluorescent_lamp = {
        name = "Lámpara Fluorecente",
        text = {
          "{C:red}+#1#{} descarte, y ganas {C:red}+#1#{}",
          "descarte adicional por cada",
          "{C:attention}#2#{} ranuras de {C:attention}comodín{} vacías",
          "{C:inactive}(Actualmente {C:red}+#3#{C:inactive} descartes)"
        }
      },
      c_paperback_lightning_rod = {
        name = "Pararrayos",
        text = {
          "Las cartas {C:attention}en mano{}",
          "tienen una prob. de",
          "{C:green}#1# en #2#{} de reactivarse"
        }
      },
      c_paperback_chalice_of_trickle_down = {
        name = "Cáliz de goteo",
        text = {
          "Durante la {C:attention}ciega jefe{}",
          "otorga {C:money}${} igual a la cateogría",
          "más baja en la {C:attention}mano anotada"
        }
      },
      c_paperback_patrolling_flashlight = {
        name = "Linterna de Patrulla",
        text = {
          "El primer consumible usado en la",
          "{C:attention}apuesta{} crea una {C:attention}copia energizada{}"
        }
      },
    },
    Voucher = {
      v_paperback_celtic_cross = {
        name = "Cruz Celta",
        text = {
          "La tienda tiene un",
          "{C:paperback_minor_arcana}Mega Paquete de Arcana Menor{}",
          "{C:attention}gratis{} al principio de cada",
          "apuesta",
        }
      },
      v_paperback_soothsay = {
        name = "Adivinación",
        text = {
          "Las cartas de {C:paperback_minor_arcana}Arcana menor{}",
          "pueden aparecer en la {C:money}Tienda"
        }
      },
      v_paperback_second_trumpet = {
        name = "Segunda Trompeta",
        text = {
          "Tu primer {C:paperback_ego_gift}Regalo E.G.O{}",
          "otorga {C:attention}+#1#{} ranura de consumibles"
        }
      },
      v_paperback_rabbit_protocol = {
        name = "Protocolo del Conejo",
        text = {
          "La primera vez que {C:attention}vendas{} un",
          "{C:paperback_ego_gift}Regalo E.G.O{}, {C:attention}desactiva{}",
          "la {C:attention}Ciega Jefe"
        },
        unlock = {
          "Vende {C:attention}#1#{} {C:paperback_ego_gift}Regalos E.G.O{}",
          "en una partida"
        }
      },
    },
    Tag = {
      tag_paperback_angel_investment = {
        name = "Etiqueta de Angel Inversionista",
        text = {
          "Gana {C:money}$#1#{} por cada {C:money}$#2#{} que tengas",
          "{C:inactive}(Maximo {C:money}$#3#{C:inactive})",
          "{C:inactive}(Actualmente {C:money}$#4#{C:inactive})"
        }
      },
      tag_paperback_divination = {
        name = "Etiqueta de Divinidad",
        text = {
          "Otorga un {C:paperback_minor_arcana}Mega Paquete",
          "{C:paperback_minor_arcana}de Arcana Menor"
        }
      },
      tag_paperback_dichrome = {
        name = "Etiqueta Dicromático",
        text = {
          "El siguiente comodín de la tienda",
          "es gratis y se vuelve",
          "{C:dark_edition}Dicromático"
        }
      },
      tag_paperback_high_risk = {
        name = "Etiqueta de Riesgo",
        text = {
          "Seleccionar la {C:attention}Ciega",
          "{C:attention}Jefe{} {C:attention}duplica{} sus",
          "requisitos y ganas {C:money}$#1#",
        }
      },
      tag_paperback_breaking = {
        name = "Etiqueta Quebradora",
        text = {
          "Desactiva la",
          "{C:attention}Ciega Jefe"
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "Quaoar",
      },
      c_paperback_haumea = {
        name = "Haumea",
      },
      c_paperback_sedna = {
        name = "Sedna",
      },
      c_paperback_makemake = {
        name = "Makemake",
      },
    },
    Enhanced = {
      m_paperback_ceramic = {
        name = "Carta de Cerámica",
        text = {
          "Gana entre {C:money}$#1#{} y {C:money}$#2#{} al anotar.",
          "Se {C:red}Rompen{} si el {C:mult}Multi{} es {C:attention}mayor{} a",
          "las {C:chips}Fichas{} al jugarse o estar en mano",
        }
      },
      m_paperback_soaked = {
        name = "Carta Mojada",
        text = {
          "Al anotar, las cartas en",
          "{C:attention}mano{} anotan sus {C:chips}Fichas{}.",
          "Prob. de {C:green}#1# en #2#{} de",
          "{C:red,E:2}destruirse{} si se {C:red}descarta",
        }
      },
      m_paperback_wrapped = {
        name = "Carta envuelta",
        text = {
          "Gana {C:money}$#1#{} al anotar",
          "No tiene categoría ni palo"
        }
      },
      m_paperback_bandaged = {
        name = "Carta vendada",
        text = {
          "Reactiva cartas {C:attention}adjacentes{}",
          "prob. de {C:green}#1# en #2#{} de {C:red}romperse{}",
          "al anotar"
        }
      },
      m_paperback_domino = {
        name = "Carta de Dominó",
        text = {
          "Otorga {C:mult}+#1#{} Multi por cada",
          "categoria descartada esta ronda",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
        }
      },
      m_paperback_stained = {
        name = "Carta Manchada",
        text = {
          "Si está en {C:attention}mano{} las",
          "cartas que anotan obtienen",
          "permanentemente {C:mult}#1#{} Multi"
        }
      },
      m_paperback_sleeved = {
        name = "Carta Enmicada",
        text = {
          "No se puede",
          "{C:attention}debilitar{} o {C:attention}voltear{}",
          "Ganas {C:money}$#1#{} al destruirse"
        }
      },
      m_paperback_antique = {
        name = "Carta Antigua",
        text = {
          "{X:chips,C:white}X#1#{} Fichas,",
          "Aumenta en {X:chips,C:white}X#2#{} cada",
          "vez que se juega y anota",
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "Dicromático",
        text = {
          "Al seleccionar la {C:attention}Ciega{}",
          "gana {C:attention}+#1#{C:blue} Mano{} o {C:red}Descarte",
          "{C:inactive}(El que sea menor)"
        }
      }
    },
    Other = {
      undiscovered_paperback_minor_arcana = {
        name = "No se Descubrió",
        text = {
          "Compra o usa",
          "esta carta en una",
          "partida sin códigos",
          "para saber lo que hace",
        },
      },
      paperback_light_suits = {
        name = "Palos Claros",
        text = {
          "{C:diamonds}Diamantes{}, {C:hearts}Corazones{}"
        }
      },
      paperback_dark_suits = {
        name = "Palos Oscuros",
        text = {
          "{C:spades}Espadas{}, {C:clubs}Tréboles{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "Requiere Palos Personalizados",
        text = {
          "Excluido del juego.",
          "Activa {C:attention}Palos Personalizados{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_enhancements = {
        name = "Requiere Mejoras",
        text = {
          "Excluido del juego.",
          "Activa {C:attention}Mejoras{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_paperclips = {
        name = "Requiere Clips de papel",
        text = {
          "Excluido del juego.",
          "Activa {C:attention}Clips de papel{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_minor_arcana = {
        name = "Requiere Arcana Menor",
        text = {
          "Excluido del juego.",
          "Activa {C:paperback_minor_arcana}Arcana Menor{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_tags = {
        name = "Requiere Etiquetas",
        text = {
          "Excluido del juego.",
          "Activa {C:attention}Etiquetas{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_editions = {
        name = "Requiere Ediciones",
        text = {
          "Excluido del juego.",
          "Activa {C:dark_edition}Ediciones{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },
      paperback_requires_ranks = {
        name = "Requiere Categorias",
        text = {
          "Excluido del juego.",
          "Activa {C:dark_edition}Categorias{}",
          "en la configuración de {C:legendary}Paperback",
        }
      },

      -- Stickers
      paperback_energized = {
        name = "Energizado",
        text = {
          "No puede ser copiado por",
          "{C:attention}#1#{}"
        }
      },
      paperback_temporary = {
        name = "Temporal",
        text = {
          "Será {C:mult}destruido",
          "al final de la ronda"
        }
      },

      paperback_corroded = {
        name = "Corroida",
        text = {
          "No se puede {C:money}vender{} sin",
          "sin activar un {C:paperback_ego_gift}Pecado{}.",
          "{C:red}Se destruye{} y activa",
          "su {C:paperback_ego_gift}pecado{} dentro",
          "de {C:attention}#1#{} rondas",
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "Clip Azul",
        text = {
          "{X:chips,C:white}X#1#{} Fichas al {C:attention}anotar{}",
          " por cada {C:attention}Clip{} en {C:attention}mano",
          "{C:inactive}(Actualmente {X:chips,C:white}X#2#{C:inactive})"
        }
      },
      paperback_purple_clip = {
        name = "Clip Morado",
        text = {
          "Reactiva cartas adjacentes",
          "si tienen un {C:attention}Clip{}",
        }
      },
      paperback_red_clip = {
        name = "Clip Rojo",
        text = {
          "{C:mult}+#1#{} Multi al {C:attention}anotar{}",
          "por cada {C:attention}Clip{} en {C:attention}mano",
          "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
        }
      },
      paperback_orange_clip = {
        name = "Clip Naranja",
        text = {
          "Gana {C:money}$#1#{} al {C:attention}anotar{}",
          " por cada {C:attention}#2#{} {C:attention}Clips{} en {C:attention}mano",
          "{C:inactive}(Actualmente {C:money}$#3#{C:inactive})"
        }
      },
      paperback_black_clip = {
        name = "Clip Negro",
        text = {
          "Reactiva la carta {C:attention}anotada{}",
          "si hay {C:attention}Clips{} en la {C:attention}mano",
        }
      },
      paperback_yellow_clip = {
        name = "Clip Amarillo",
        text = {
          "Si {C:attention}anota{} y hay {C:attention}Clips{} en {C:attention}mano{}:",
          "{C:green}#1# en #2#{} de otorgar {C:red}+#3#{} Multi,",
          "{C:green}#4# en #5#{} de otorgar {X:mult,C:white}X#6#{} Multi",
          "{C:green}#7# en #8#{} de ganar {C:money}$#9#{}",
        }
      },
      paperback_gold_clip = {
        name = "Clip Dorado",
        text = {
          "Gana {C:money}$#1#{} por cada {C:attention}Clip{} anotado",
          "si esta carta está en {C:attention}mano",
          "al final de la ronda",
          "{C:inactive}(Actualmente {C:money}$#2#{C:inactive})"
        }
      },
      paperback_green_clip = {
        name = "Clip Verde",
        text = {
          "Gana {C:mult}+#2#{} Multi por cada {C:attention}2{} Clips",
          "anotados y {C:mult}#3#{} Multi por cada",
          "{C:attention}Clip{} descartado",
          "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
        }
      },
      paperback_white_clip = {
        name = "Clip Blanco",
        text = {
          "Si está en {C:attention}mano{} al {C:attention}final{} de",
          "la {C:attention}ronda{}, gana {C:chips}+#1#{} Fichas por",
          "cada {C:attention}Clip{} anotado en la ronda",
          "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
        }
      },
      paperback_pink_clip = {
        name = "Clip Rosado",
        text = {
          "{X:mult,C:white}X#1#{} Multi al estar en la {C:attention}mano{}",
          " aumenta {X:mult,C:white}X#2#{} por cada {C:attention}Clip{} anotado",
          "{C:inactive,s:0.8}(Se reinicia al jugar una mano)"
        }
      },
      paperback_platinum_clip = {
        name = "Clip de Platino",
        text = {
          "Al {C:attention}anotar{}, fuerza a los",
          "{C:attention}Clips{} a activarse si están",
          "{C:attention}en mano{}"
        }
      },

      -- Regalos E.G.O. Pecados
      paperback_sin_none = {
        name = "Vestigio",
        text = {
          "Siempre se vende por {C:money}$#1#{}"
        }
      },
      paperback_sin_wrath = {
        name = "Ira",
        text = {
          "Al venderse, {C:attention}destruye{}",
          "todos tus {C:attention}consumibles"
        }
      },
      paperback_sin_lust = {
        name = "Lujuría",
        text = {
          "Al venderse, reduce {C:attention}#1# niveles{}",
          "a tu mano {C:attention}más jugada{}"
        }
      },
      paperback_sin_sloth = {
        name = "Pereza",
        text = {
          "Sólo lo puedes vender",
          "al salta una {C:attention}ciega"
        }
      },
      paperback_sin_gluttony = {
        name = "Gula",
        text = {
          "Al venderse agrega {C:paperback_perishable}pedecedero{}",
          "a un {C:attention}comodín{}"
        }
      },
      paperback_sin_gloom = {
        name = "Melancolía",
        text = {
          "Al venderse multiplica el tamaño",
          "de las {C:attention}ciegas{} por {C:attention}X#1#{}"
        }
      },
      paperback_sin_pride = {
        name = "Orgullo",
        text = {
          "Se vende por {C:money}#2#{}"
        }
      },
      paperback_sin_envy = {
        name = "Envidia",
        text = {
          "Al venderse, {C:attention}-#1#{} al",
          "tamaño de mano"
        }
      },
      paperback_sin_madness = {
        name = "Locura",
        text = {
          "Al venderse, {C:attention}destruye{}",
          "un {C:attention}Comodín"
        }
      },
      -- EGO GIFTS
      p_paperback_ego_gift_normal = {
        name = "Extractión de Regalos E.G.O.",
        text = {
          "Escoge {C:attention}#1#{} de {C:attention}#2#{} {C:paperback_ego_gift}Regalos E.G.O{}",
        },
      },
      -- Minor Arcana Packs
      p_paperback_minor_arcana_normal = {
        name = "Paquete de Arcana Menor",
        text = {
          "Elige {C:attention}#1#{} de {C:attention}#2#{} cartas de",
          "{C:paperback_minor_arcana}Arcana Menor{} para usar",
          "inmediatamente"
        }
      },
      p_paperback_minor_arcana_jumbo = {
        name = "Paquete Jumbo de Arcana Menor",
        text = {
          "Elige {C:attention}#1#{} de {C:attention}#2#{} cartas de",
          "{C:paperback_minor_arcana}Arcana Menor{} para usar",
          "inmediatamente"
        }
      },
      p_paperback_minor_arcana_mega = {
        name = "Mega Paquete de Arcana Menor",
        text = {
          "Elige {C:attention}#1#{} de {C:attention}#2#{} cartas de",
          "{C:paperback_minor_arcana}Arcana Menor{} para usar",
          "inmediatamente"
        }
      },
    },
    Partner = {
      pnr_paperback_virtual = {
        name = "Virtual",
        text = {
          "Reactiva la {C:attention}primera carta",
          "de {C:paperback_light_suit}Palo claro{} que anota",
          "si no juegas {C:paperback_dark_suit}Palos oscuros{}",
        }
      },
      pnr_paperback_aftermath = {
        name = "Secuela",
        text = {
          "Las {C:attention}Cartas de Figura{}",
          "ganan {C:chips}+#1#{} fichas",
          "al anotar",
        }
      },
      pnr_paperback_faker = {
        name = "Farsante",
        text = {
          "{C:attention}Una vez por ronda{}",
          "jugar una {C:attention}sola carta{}",
          "la destruye",
        }
      },
      pnr_paperback_faker_buffed = {
        text = {
          "Jugar una {C:attention}sola carta{}",
          "la destruye",
        }
      },
    },
    Sleeve = {
      sleeve_paperback_paper = {
        name = "Funda de Papel",
        text = {
          "Los {C:attention}Comodines{} de {C:legendary}Paperback{}",
          "son {C:attention}3X nás comunes,",
          "Comienza la partida con el",
          "Comodín {C:attention,T:j_paperback_shopping_center}#1#{}"
        }
      },
      sleeve_paperback_paper_buff = {
        name = "Funda de Papel",
        text = {
          "Comienzas con {C:attention,T:j_paperback_shopping_center}#1#{}",
          "{C:dark_edition}Negativo{}"
        }
      },

      sleeve_paperback_proud = {
        name = "Funda Arcoiris",
        text = {
          "Tu baraja comienza con",
          "{C:hearts}Corazones{}, {C:diamonds}Diamantes{},",
          "{C:spades}Espadas{}, {C:clubs}Tréboles{}",
          "{C:paperback_crowns}Coronas{} y {C:paperback_stars}Estrellas"
        }
      },
      sleeve_paperback_proud_buff = {
        name = "Funda Arcoiris",
        text = {
          "Todos tus {C:attention}Ases",
          "tienen edición {C:dark_edition}Policroma"
        }
      },

      sleeve_paperback_silver = {
        name = "Funda de Plata",
        text = {
          "Comienza la partida con",
          "el vale {C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}",
          "y un {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      sleeve_paperback_silver_buff = {
        name = "Funda de Plata",
        text = {
          "Comienzas con el Vale",
          "{C:paperback_minor_arcana,T:v_paperback_soothsay}#1#{}"
        }
      },

      sleeve_paperback_dreamer = {
        name = "Funda Soñadora",
        text = {
          "Comienza con un",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:paperback_temporary}Temporal",
          "{C:attention}#2#{} Ranura de comodín"
        }
      },
      sleeve_paperback_dreamer_buff = {
        name = "Funda Soñadora",
        text = {
          "Tu Baraja contiene",
          "{C:attention}Apostoles"
        }
      },

      sleeve_paperback_antique = {
        name = "Funda Antigua",
        text = {
          "Los {C:tarot}Paquetes Arcanos{} no",
          "aparecerán en la tienda",
          "Los {C:paperback_minor_arcana}Paquetes de Arcana Menor",
          "son {C:attention}3X{} más comunes"
        }
      },
      sleeve_paperback_antique_buff = {
        name = "Funda Antigua",
        text = {
          "Los Paquetes de",
          "{C:paperback_minor_arcana}Arcana menor{} son {C:money}Gratis"
        }
      },

      sleeve_paperback_passionate = {
        name = "Funda Apasionada",
        text = {
          "Después de derrotar una",
          "{C:attention}Ciega Jefe{}, gana una",
          "{C:attention,T:tag_paperback_high_risk}#1#",
          "No puedes ganar {C:money}interés"
        }
      },
      sleeve_paperback_passionate_buff = {
        name = "Funda Apasionada",
        text = {
          "Todas las {C:attention}Ciegas Jefe{} son",
          "reemplazadas con {C:attention}Ciegas Finales",
          "Al derrotar una {C:attention}Ciega Final",
          "gana una Etiqueta {C:dark_edition,T:tag_negative}Negativa{}"
        }
      }
    }
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Arcana menor",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Arcana menor",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "Paquete de Arcana menor",

      -- Badge under gifts
      k_paperback_ego_gift = "Regalos E.G.O.",
      -- Name of consumable type in collection
      b_paperback_ego_gift_cards = "Regalos E.G.O.",
      -- Text shown at the bottom while opening booster
      paperback_ego_gift_pack = "Extracción de Regalo E.G.O.",

      -- Badge under E.G.O. Gifts based on sins
      k_paperback_ego_sin_none = "Vestigio",
      k_paperback_ego_sin_pride = "Orgullo",
      k_paperback_ego_sin_wrath = "Ira",
      k_paperback_ego_sin_gloom = "Melancolía",
      k_paperback_ego_sin_sloth = "Pereza",
      k_paperback_ego_sin_lust = "Lujuría",
      k_paperback_ego_sin_envy = "Envidia",
      k_paperback_ego_sin_gluttony = "Gula",
      k_paperback_ego_sin_madness = "Locura",

      paperback_confessed_ex = "¡Confesó!",
      paperback_polychrome_ex = "¡Policroma!",
      paperback_destroyed_ex = "¡Destruido!",
      paperback_doubled_ex = "¡Doble!",
      paperback_too_late_ex = "¡MUY TARDE!",
      paperback_broken_ex = "¡Se Rompió!",
      paperback_none = "Nada",
      paperback_downgrade_ex = "¡Degradado!",
      paperback_copy_ex = "¡Copiado!",
      paperback_consumed_ex = "Consumido!",
      paperback_too_hot_ex = "¡Muy Caliente!",
      paperback_inactive = "Inactivo",
      paperback_supplies_ex = "Suministros!",
      paperback_melted_ex = "¡Derretido!",
      paperback_investment_ex = "¡Inversión!",
      paperback_plus_minor_arcana = "¡+1 Arcana!",
      paperback_plus_consumable = "¡+1 Consumable!",
      paperback_plus_tag = "+1 Etiqueta",
      paperback_edition_ex = "Edición!",
      paperback_rare_ex = "¡Raro!",
      paperback_saved_unholy_alliance = "Salvado por Alianza Impía",
      paperback_saved_determination = "Salvado por Determinacion",
      paperback_reduced_ex = "Reducido!",
      paperback_determination_ex = "NGAAAHH!",
      paperback_forlorn_destruction = "Disculpa...",
      paperback_freezer_ex = "¡Hora de comer!",
      paperback_corroded_ex = "¡Corroida!",
      paperback_jestosterone_ex = "¡Masc!",
      paperback_jestrogen_ex = "¡Fem!",
      paperback_punch_card_active = "¡Dile a tus amigos!",
      paperback_punch_card_ex = "Wrong Warp!",

      paperback_ui_requires_restart = "Requiere Reinicio",
      paperback_ui_no_requires_restart = "No Requiere Reinicio",
      paperback_ui_enable_blinds = "Activar Ciegas",
      paperback_ui_enable_minor_arcana = "Activar Arcana Menor",
      paperback_ui_enable_ego_gifts = "Activar regalos E.G.O.",
      paperback_ui_enable_enhancements = "Activar Mejoras",
      paperback_ui_enable_editions = "Activar Ediciones",
      paperback_ui_enable_paperclips = "Activar Clips de papel",
      paperback_ui_custom_suits_enabled = "Activar Palos nuevos",
      paperback_ui_enable_vouchers = "Activar Vales",
      paperback_ui_enable_tags = "Activar Etiquetas",
      paperback_ui_enable_ranks = "Activar Categorias",
      paperback_ui_developers = "Desarrolladores",
      paperback_ui_artists = "Artistas",
      paperback_ui_localization = "Traducción",
      paperback_ui_paperclips = "Clips de Papel",
      paperback_ui_enable_spectrals = "Activar Cartas Espectrales",
      paperback_ui_plague_doctor_quotes = "Fraces del Doctor de la Plaga",
      paperback_ui_select = "Seleccionar",

      -- Plague Doctor's quotes
      paperback_plague_quote_1_1 = 'On this rock I will build my church, and the',
      paperback_plague_quote_1_2 = 'gates of hell shall not prevail against it...',

      paperback_plague_quote_2_1 = 'Tell us, when will this happen, and what will be',
      paperback_plague_quote_2_2 = 'the sign of your coming and the end of an age?',

      paperback_plague_quote_3_1 = 'Do you wish us to call fire down',
      paperback_plague_quote_3_2 = 'from heaven to destroy them?',

      paperback_plague_quote_4_1 = 'To the apostles he gave the name Boanerges,',
      paperback_plague_quote_4_2 = 'which means "Sons of Thunder".',

      paperback_plague_quote_5_1 = 'Show us the father, and that',
      paperback_plague_quote_5_2 = 'will be enough for us.',

      paperback_plague_quote_6_1 = 'He saw a man. "Follow me," he told him,',
      paperback_plague_quote_6_2 = 'and the Apostle got up and followed him.',

      paperback_plague_quote_7_1 = 'Now for some time the Apostle had',
      paperback_plague_quote_7_2 = 'practiced sorcery and amazed all people.',

      paperback_plague_quote_8_1 = 'Then the Apostle said to the rest of the disciples,',
      paperback_plague_quote_8_2 = '"Let us also go, that we may die with him."',

      paperback_plague_quote_9_1 = 'Then the Apostle declared, "You are',
      paperback_plague_quote_9_2 = 'the son of him, you are the king."',

      paperback_plague_quote_10_1 = 'Then the Apostle said, "But why do you intend',
      paperback_plague_quote_10_2 = 'to show yourself to us and not the world?"',

      paperback_plague_quote_11_1 = 'From now on, let no one cause me trouble,',
      paperback_plague_quote_11_2 = 'for I bear on my body the marks of him.',

      paperback_plague_quote_12_1 = 'Have I not chosen you, the Twelve?',
      paperback_plague_quote_12_2 = 'Yet one of you is a devil.',

      -- Clippy messages
      paperback_clippy_msg_1 = "¿Guardo el archivo?",
      paperback_clippy_msg_2 = "¡Soy Clippy!",
      paperback_clippy_msg_3 = "¡Hola!",
      paperback_clippy_msg_4 = "¡La Planta acecha!",
      paperback_clippy_msg_5 = "¡Te ayudaré!",
      paperback_clippy_msg_6 = "¿Te ayudo?",
      paperback_clippy_msg_7 = "¿Linux es mejor?",
      paperback_clippy_msg_8 = "¡El mouse funciona!",
      paperback_clippy_msg_full = "¡Memoria llena!",

      -- Da Capo messages
      paperback_da_capo_Clubs = "Movimiento 1",
      paperback_da_capo_Spades = "Movimiento 2",
      paperback_da_capo_Diamonds = "Movimiento 3",
      paperback_da_capo_Hearts = "Movimiento 4",
      paperback_da_capo_None = "¡Final!",
    },
    v_dictionary = {
      paperback_a_discards = "+#1# Descarte",
      paperback_a_discards_minus = "-#1# Descarte",
      paperback_a_hands_minus = "-#1# Mano",
      paperback_prince_of_darkness = "+#1# Multi, +#2# Fichas",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# Ronda",
      paperback_a_plus_cards = "+#1# #2#s",
      paperback_a_plus_tags = "+#1# Etiqueta",
    },
    ranks = {
      paperback_Apostle = 'Apóstol',
    },
    suits_singular = {
      paperback_Crowns = "Corona",
      paperback_Stars = 'Estrella'
    },
    suits_plural = {
      paperback_Crowns = "Coronas",
      paperback_Stars = 'Estrellas'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "Espectro",
      ['paperback_Straight Spectrum'] = "Escalera Espectral",
      ['paperback_Straight Spectrum (Royal)'] = "Espectro Real",
      ['paperback_Spectrum House'] = "Full Espectral",
      ['paperback_Spectrum Five'] = "Quintilla Espectral",
      ['paperback_Straight Flush (Rapture)'] = "Rapto",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5 cartas de palo diferente"
      },
      ['paperback_Straight Spectrum'] = {
        "5 cartas seguidas",
        "de palo diferente"
      },
      ['paperback_Spectrum House'] = {
        "Una Tercia y un Par y cada",
        "carta de palo diferente"
      },
      ['paperback_Spectrum Five'] = {
        "5 cartas de la misma categoría y",
        "cada carta de palo diferente"
      },
    },
    labels = {
      paperback_blue_clip = "Clip Azul",
      paperback_red_clip = "Clip Rojo",
      paperback_orange_clip = "Clip Naranja",
      paperback_pink_clip = "Clip Rosado",
      paperback_black_clip = "Clip Negro",
      paperback_yellow_clip = "Clip Amarillo",
      paperback_gold_clip = "Clip Dorado",
      paperback_white_clip = "Clip Blanco",
      paperback_green_clip = "Clip Verde",
      paperback_purple_clip = "Clip Morado",
      paperback_platinum_clip = "Clip de Platino",
      paperback_dichrome = "Dicromático",
      paperback_energized = "Energizado",
      paperback_temporary = "Temporal",
      paperback_corroded = "Corroida",

    }
  }
}