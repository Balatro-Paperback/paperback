return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "Paper Deck",
        text = {
          "{C:legendary}Paperback{C:attention} Jokers{} are {C:attention}3X",
          "more likely to appear,",
          "start run with the",
          "{C:attention,T:j_paperback_shopping_center}#1#{} Joker"
        }
      },
      b_paperback_proud = {
        name = "Proud Deck",
        text = {
          "Start with a full set of",
          "{C:hearts}Hearts{}, {C:diamonds}Diamonds{}, {C:spades}Spades",
          "{C:clubs}Clubs{}, {C:paperback_crowns}Crowns{} and {C:paperback_stars}Stars"
        }
      },
      b_paperback_silver = {
        name = "Silver Deck",
        text = {
          "Start run with the",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{} voucher",
          "and a {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      b_paperback_dreamer = {
        name = "Dreamer Deck",
        text = {
          "Start run with a {C:paperback_temporary}temporary",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:attention}#2#{} Joker slot"
        }
      },
      b_paperback_antique = {
        name = "Antique Deck",
        text = {
          "{C:tarot}Arcana Packs{} no longer",
          "appear in the shop",
          "{C:paperback_minor_arcana}Minor Arcana Packs",
          "are {C:attention}3X{} more common"
        }
      },
      b_paperback_passionate = {
        name = "Passionate Deck",
        text = {
          "After defeating each",
          "{C:attention}Boss Blind{}, gain a",
          "{C:attention,T:tag_paperback_high_risk}#1#",
          "Earn no {C:money}Interest"
        }
      },
    },
    Blind = {
      bl_paperback_quarter = {
        name = "The Quarter",
        text = {
          "#1# in #2# cards",
          "are debuffed"
        },
      },
      bl_paperback_half = {
        name = 'The Half',
        text = {
          'Halves all listed',
          'probabilities'
        }
      },
      bl_paperback_whole = {
        name = 'The Whole',
        text = {
          'Ranks scored previously',
          'this Ante are debuffed'
        }
      },
      bl_paperback_rest = {
        name = 'The Rest',
        text = {
          '#1# in #2# numbered cards',
          'are drawn face down'
        }
      },
      bl_paperback_flat = {
        name = 'The Flat',
        text = {
          'Decrease rank of',
          'played cards'
        }
      },

      bl_paperback_sharp = {
        name = 'The Sharp',
        text = {
          'Increase rank of',
          'played cards'
        }
      },
      bl_paperback_natural = {
        name = 'The Natural',
        text = {
          'Cards in poker hands',
          'above your lowest hand',
          'level are debuffed'
        }
      },
      bl_paperback_coda = {
        name = 'The Coda',
        text = {
          'Cards and Jokers',
          'cannot be moved',
        }
      },
      bl_paperback_taupe_treble = {
        name = 'Taupe Treble',
        text = {
          'Must play an',
          'Enhanced card'
        }
      },
    },
    Joker = {
      j_paperback_golden_egg = {
        name = "Golden Egg",
        text = {
          "When a {C:attention}secret hand{} is played,",
          "earn the sell value of",
          "the {C:attention}Joker{} to the right"
        },
        unlock = {
          "Win a run with a",
          "{C:attention}secret hand{} as your",
          "most played hand"
        }
      },
      j_paperback_burning_pact = {
        name = "Burning Pact",
        text = {
          "If a {C:attention}discard{} has only {C:attention}#1#{} card",
          "draw {C:attention}#2#{} additional cards"
        }
      },
      j_paperback_blade_dance = {
        name = "Blade Dance",
        text = {
          "When {C:attention}Blind{} is selected,",
          "create {C:attention}#1#{} random {C:paperback_temporary}temporary",
          "{C:attention}#2#s{} in your hand"
        }
      },
      j_paperback_claw = {
        name = "Claw",
        text = {
          "When a {C:attention}#1#{} is scored, scored {C:attention}#1#s{}",
          "give an additional {C:mult}+#2#{} Mult",
          "Resets at the {C:attention}end of round",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
        }
      },
      j_paperback_chaplin = {
        name = "Chaplin",
        text = {
          "When buying a {C:attention}Voucher{}, also",
          "gain the {C:attention}upgraded{} version"
        }
      },
      j_paperback_milk_tea = {
        name = "Milk Tea",
        text = {
          "{C:purple}Balance{} {C:attention}#1#%{} of {C:chips}Chips{} and {C:mult}Mult",
          "Reduces by {C:attention}#2#%{} if after balancing",
          "{C:mult}Mult{} ended up {C:attention}greater{} than {C:chips}Chips"
        }
      },
      j_paperback_nichola = {
        name = "Nichola",
        text = {
          "{C:attention}Face{} cards {C:attention}held in",
          "{C:attention}hand{} count in {C:attention}scoring"
        }
      },
      j_paperback_the_dynasty = {
        name = "The Dynasty",
        text = {
          "{X:mult,C:white}X#1#{} Mult if played",
          "hand contains",
          "a {C:attention}#2#"
        }
      },
      j_paperback_lurid_joker = {
        name = "Lurid Joker",
        text = {
          "{C:chips}+#1#{} Chips if played",
          "hand contains",
          "a {C:attention}#2#"
        }
      },
      j_paperback_zealous_joker = {
        name = "Zealous Joker",
        text = {
          "{C:mult}+#1#{} Mult if played",
          "hand contains",
          "a {C:attention}#2#"
        }
      },
      j_paperback_deviled_egg = {
        name = "Deviled Egg",
        text = {
          "The first scored card",
          "each round becomes {C:attention}Gold{}.",
          "Eaten in {C:attention}#1#{} rounds"
        }
      },
      j_paperback_pear = {
        name = "Pear",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips if played",
          "hand contains a {C:attention}#1#{}. Otherwise,",
          "this Joker loses {C:chips}-#3#{} Chips.",
          "Eaten if Chips are lower than 0",
          "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)"
        }
      },
      j_paperback_the_one_who_waits = {
        name = "The One Who Waits",
        text = {
          "If played hand has a {C:attention}scoring{} {V:1}#1#",
          "{C:green}#2# in #3#{} chance to gain {X:mult,C:white}X#4#{} Mult",
          "{C:green}#5# in #6#{} chance to spawn a {C:tarot}#7#{} Tarot",
          "{C:inactive}(Must have room) (Currently {X:mult,C:white}X#8#{C:inactive} Mult)",
        }
      },
      j_paperback_blood_rain = {
        name = "Blood Rain",
        text = {
          "{C:attention}#1#s{} give {C:mult}Mult{} equal",
          "to the {C:attention}rank{} of held cards",
          "instead of their {C:chips}chip value"
        }
      },
      j_paperback_pinot_noir = {
        name = "Pinot Noir",
        text = {
          "The next {C:attention}#1#{} times a {C:attention}#2#",
          "triggers, give {C:mult}#3#{} additional Mult"
        }
      },
      j_paperback_jestosterone = {
        name = "Jestosterone",
        text = {
          "Scored {C:attention}#1#s{} become {C:attention}#2#s{}"
        }
      },
      j_paperback_jestrogen = {
        name = "Jestrogen",
        text = {
          "Scored {C:attention}#1#s{} and {C:attention}#2#s{} become {C:attention}#3#s{}"
        }
      },
      j_paperback_langely = {
        name = "L'angely",
        text = {
          "Earns half the {C:money}sell value{} of all",
          "Jokers when defeating a {C:attention}Big Blind.",
          "When defeating a {C:attention}Boss Blind{}, earn",
          "the full {C:money}sell value{} of all Jokers"
        }
      },
      j_paperback_pedrillo = {
        name = "Pedrillo",
        text = {
          "If scoring hand contains a {C:attention}Queen{},",
          "upgrade the played {C:attention}poker hand{}"
        }
      },
      j_paperback_double_dutchman = {
        name = "Double Dutchman",
        text = {
          "Cards {C:attention}held in hand{} have a {C:green}#1# in #2#",
          "chance to gain random",
          "{C:attention}enhancements{}, {C:attention}seals{} or {C:attention}editions",
          "for the next {C:attention}#3#{} hands"
        }
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds = {
        name = "One Sin and Hundreds of Good Deeds",
        text = {
          "Scored {C:attention}3s{} and {C:attention}Rankless Cards{}",
          "give {C:mult}+#1#{} Mult when scored",
          "{C:inactive}''It feeds on evil''",
        },
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds_fed = {
        name = "{C:red}One Sin and Hundreds of Good Deeds{}",
        text = {
          "Scored {C:attention}3s{} and {C:attention}Rankless Cards{}",
          "give {C:mult}+Mult{} for each",
          "remaining card in deck when scored",
          "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive})",
        },
      },
      j_paperback_white_night = {
        name = "WhiteNight",
        text = {
          "Destroy all scored non-{C:attention}Apostle{} cards",
          "at the end of the hand. Scored {C:attention}Apostles{}",
          "give {X:mult,C:white}X#1#{} Mult. Playing a hand containing",
          "no {C:attention}Apostles destroys{} a random Joker.",
          "Discarded {C:attention}Apostles{} are {C:attention}destroyed{}"
        },
        unlock = {
          "Have #1# or more",
          "{C:attention}Apostles{} in",
          "your deck"
        }
      },
      j_paperback_as_above_so_below = {
        name = "As Above, So Below",
        text = {
          "Playing a five-card poker hand with an",
          "{C:attention}Apostle{} creates a {C:purple}Tarot{} card,",
          "if poker hand also contains a {C:attention}Straight{}",
          "create a {C:spectral}Spectral{} card instead",
          "{C:inactive}(Must have room)"
        },
        unlock = {
          "Play a {C:attention}Rapture{}"
        }
      },
      j_paperback_plague_doctor = {
        name = "Plague Doctor",
        text = {
          "If played hand is a High Card,",
          "convert the scoring card into",
          "an {C:attention}Apostle{}. Each {C:attention}Apostle{}",
          "held in hand gives {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_paperback_king_me = {
        name = "King Me",
        text = {
          "Scored {V:1}#1#{} increase",
          "their rank by {C:attention}#2#"
        }
      },
      j_paperback_gambit = {
        name = "Gambit",
        text = {
          "If played hand contains a scoring {V:1}#1#,",
          "the first scored {V:1}#1#{} {C:attention}destroys{}",
          "the first non-{V:1}#1#{} held in hand",
          "and gains its {C:chips}Chip value{}",
        }
      },
      j_paperback_solar_eclipse = {
        name = "Solar Eclipse",
        text = {
          "Scored {C:paperback_light_suit}light suits",
          "become {V:1}#1#"
        }
      },
      j_paperback_prism = {
        name = "Prism",
        text = {
          "If played hand contains a {C:attention}#1#,",
          "convert all {C:attention}scored cards{} into",
          "random {C:attention}different suits"
        }
      },
      j_paperback_master_spark = {
        name = "Master Spark",
        text = {
          "If played hand contains a {C:attention}Spectrum{},",
          "destroy all cards {C:attention}held in hand{} and",
          "all played cards gain {C:dark_edition}Polychrome",
          "{S:1.1,C:red,E:2}self destructs",
        }
      },
      j_paperback_j_and_js = {
        name = "J&J's",
        text = {
          "If played hand contains a",
          "{C:attention}Spectrum{}, create {C:attention}#1#{} random {C:attention}Tags",
          "Consumed in {C:attention}#2#{} rounds",
          "{C:inactive}(Resets when a {C:attention}Tag{C:inactive} is acquired)"
        }
      },
      j_paperback_blue_star = {
        name = "Blue Star",
        text = {
          "Gains {X:chips,C:white}X#1#{} Chips when a {V:1}#2#{} scores",
          "Loses {X:chips,C:white}X#3#{} Chips when a {V:2}#4#{} scores",
          "{C:inactive}(Currently {X:chips,C:white}X#5#{C:inactive} Chips)"
        }
      },
      j_paperback_shadowmantle = {
        name = "ShadowMantle", -- Not a typo, equipment in deltarune is written without a space
        text = {
          "Scored {V:1}#1#{} have a",
          "{C:green}#2# in #3#{} chance to create",
          "a {C:dark_edition}Negative {C:attention}Tag{}",
        }
      },
      j_paperback_shooting_star = {
        name = "Shooting Star",
        text = {
          "Scored {V:1}#1#{} have a",
          "{C:green}#2# in #3#{} chance to",
          "create the {C:planet}Planet{} card",
          "for played {C:attention}poker hand"
        }
      },
      j_paperback_black_star = {
        name = "Black Star",
        text = {
          "Scored {C:paperback_dark_suit}dark suits",
          "become {V:1}#1#"
        }
      },
      j_paperback_high_speed_rail = {
        name = "High Speed Rail",
        text = {
          "This Joker {C:blue}gains{} Mult equal to",
          "the {C:money}cost{} of {C:blue}bought{} {C:attention}Jokers{}",
          "This Joker {C:red}loses{} Mult equal to",
          "the {C:money}sell value{} of {C:red}sold{} {C:attention}Jokers{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      j_paperback_aurora_borealis = {
        name = "Aurora Borealis",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "for each {C:attention}editioned Joker{} card",
          "{s:0.9,C:dark_edition}Negatives{s:0.9,C:inactive} are excluded{}",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },
      j_paperback_joke_master = {
        name = "Joke Master",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult if",
          "played hand is a {C:attention}#2#{}",
          "{s:0.8}hand changes every round",
          "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
        }
      },
      j_paperback_ultra_rare = {
        name = "Ultra Rare",
        text = {
          "When {C:attention}Blind{} is selected, create",
          "random {C:blue}Common{}, {C:green}Uncommon",
          "and {C:red}Rare{} Temporary {C:dark_edition}Negative",
          "{C:attention}Jokers{} with {C:money}$#1#{} sell value"
        }
      },
      j_paperback_manilla_folder = {
        name = "Manilla Folder",
        text = {
          "Earn {C:money}$#1#{} at end of round",
          "for each {C:attention}unique",
          "{C:attention}Clip{} in your full deck",
          "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
        }
      },
      j_paperback_clippy = {
        name = "Clippy",
        text = {
          "Add a random {C:attention}Clip{} to a",
          "random card in your deck",
          "when {C:attention}Blind{} is selected",
        }
      },
      j_paperback_jimbos_joyous_joker_jamboree = {
        name = "Jimbo's Joyous Joker Jamboree",
        text = {
          "Create a random {C:paperback_minor_arcana}Minor Arcana{}",
          "card for every {C:attention}#1#{C:inactive} [#2#]{} scored cards",
        },
        unlock = {
          "Have {C:attention}#1#{} or more",
          "{C:attention}suits{} in",
          "your deck"
        }
      },
      j_paperback_the_normal_joker = {
        name = "The Normal Joker",
        text = {
          "Retrigger all",
          "{C:blue}Common {C:attention}Jokers"
        }
      },
      j_paperback_better_call_jimbo = {
        name = "Better Call Jimbo",
        text = {
          "{X:mult,C:white}X#1#{} Mult for",
          "every {C:money}$#2#{} owned",
          "Earn no {C:money}Interest{}",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },
      j_paperback_touch_tone_joker = {
        name = "Touch Tone Joker",
        text = {
          "When opening an {C:tarot}Arcana{},",
          "{C:planet}Celestial{} or {C:spectral}Spectral{} pack,",
          "{C:attention}draw{} the {C:attention}first card{} in it",
          "to your consumables",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_joker_cd_i = {
        name = 'Joker CD-i',
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "a random {C:planet}Planet{} card if",
          "played hand has exactly {C:attention}#3#{} cards",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_determination = {
        name = 'Determination',
        text = {
          "Prevents death, on death",
          "{C:attention}#1#{} Ante, {C:attention}#1#{} hand size",
          "and {C:red}self destructs"
        }
      },
      j_paperback_blue_marble = {
        name = "Blue Marble",
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "a random {C:planet}Planet{} card if",
          "{C:attention}scoring hand{} contains a {V:3}#3#{}",
          "{C:inactive}(Must have room)",
        }
      },
      j_paperback_boundary_of_death = {
        name = "Boundary of Death",
        text = {
          "{C:attention}#1#s{} have a",
          "{C:green}#2# in #3#{} chance to",
          "additionally give {C:red}+#4#{} Mult"
        }
      },
      j_paperback_festive_joker = {
        name = "Festive Joker",
        text = {
          "{C:attention}#1#s{} have a {C:green}#2# in #3#",
          "chance to create a random",
          "{C:attention}Consumable{} when scored",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_spotty_joker = {
        name = "Spotty Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "if {C:attention}scoring hand{} contains a {C:attention}#2#,",
          "otherwise lose {X:mult,C:white}X#3#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#4#{}{C:inactive} Mult)"
        }
      },
      j_paperback_sommelier = {
        name = "Sommelier",
        text = {
          "If the {C:attention}first discard{}",
          "of a round contains",
          " a {C:attention}#1#{},",
          "the first discarded",
          "{C:attention}#1#{} gains",
          "a random {C:attention}seal",
        }
      },
      j_paperback_medic = {
        name = "Medic",
        text = {
          "{C:attention}#1#s{} retrigger",
          "cards an additional time",
        }
      },
      j_paperback_matcha = {
        name = "Matcha",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "when a card is scored",
          "{C:green}#2# in #3#{} chance to",
          "consume on {C:red}discard",
          "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)"
        }
      },
      j_paperback_you_are_a_fool = {
        name = "You Are a Fool!",
        text = {
          "If scored hand contains {C:attention}#1#",
          "or more {C:attention}face{} cards, convert",
          "{C:attention}all{} cards {C:attention}held in hand{} to",
          "the {C:attention}leftmost{} scored card",
          "{S:1.1,C:red,E:2}self destructs",
        }
      },
      j_paperback_kintsugi_joker = {
        name = "Kintsugi Joker",
        text = {
          "Increases the maximum payout",
          "of {C:attention}#2#s{} by {C:money}$#1#{} when",
          "a {C:attention}#2#{} is destroyed",
          "{C:inactive}(Currently increased by {C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_ddakji = {
        name = "Ddakji",
        text = {
          "{C:green}#1# in #2#{} cards get drawn",
          "face down, if scored hand",
          "contains a {C:attention}face up{} and",
          "{C:attention}face down{} card, create",
          "a random Consumable",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_weather_radio = {
        name = "Weather Radio",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult if",
          "{C:attention}poker hand{} contains a {C:attention}#2#{}.",
          "During {C:attention}Boss Blind{}, if this Joker has",
          "{X:mult,C:white}X#3#{} Mult or more, disable {C:attention}Boss Blind{}",
          "and this Joker loses {X:mult,C:white}X#4#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} Mult)",
          "{s:0.75}poker hand changes at end of round"
        }
      },
      j_paperback_power_surge = {
        name = "Power Surge",
        text = {
          "Played {C:attention}#1#s{} give {X:mult,C:white}X#2#{}",
          "Mult when scored and",
          "have a {C:green}#3# in #4#{}",
          "chance to {C:red}destroy{} a",
          "card {C:attention}held in hand{}",
        }
      },
      j_paperback_bismuth = {
        name = "Bismuth",
        text = {
          "Played {V:1}#1#{} and {V:2}#2#{} have",
          "a {C:green}#3# in #4#{} chance to gain {C:dark_edition}Foil{},",
          "{C:dark_edition}Holographic{} or {C:dark_edition}Polychrome",
        }
      },
      j_paperback_deadringer = {
        name = "Deadringer",
        text = {
          "Retrigger scored {C:attention}#1#s{} and {C:attention}#2#s",
          "once, and scored {C:attention}#3#s{} twice"
        }
      },
      j_paperback_ncj = {
        name = "NoCopyrightJokers",
        text = {
          "This Joker gives {C:chips}+#1#{} Chips for",
          "every {C:money}dollar{} of {C:attention}sell value",
          "from all owned Jokers",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      j_paperback_full_moon = {
        name = "Full Moon",
        text = {
          "{C:planet}Planet{} cards have",
          "a {C:green}#1# in #2#{} chance",
          "to level up {C:attention}again",
        }
      },
      j_paperback_sake_cup = {
        name = "Sake Cup",
        text = {
          "After a hand is played, {C:attention}#1#s",
          "{C:attention}held in hand{} have a {C:green}#2# in #3#",
          "chance to create the {C:planet}Planet",
          "card for played {C:attention}poker hand",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_resurrections = {
        name = "Resurrections",
        text = {
          "{C:green}#1# in #2#{} chance to {C:attention}return{}",
          "sold {C:attention}Jokers{} and create",
          "an {C:attention}extra{} {C:dark_edition}Negative{} copy",
          "with {C:money}-$#3#{} sell value",
          "{s:0.8}Chance increases by {s:0.8,C:green}#4#{s:0.8} on fail",
          "{S:1.1,C:red,E:2}self destructs",
        }
      },
      j_paperback_book_of_vengeance = {
        name = "Book of Vengeance",
        text = {
          "After defeating a {C:attention}Boss Blind{},",
          "destroys itself and the {C:attention}Joker{} to its left,",
          "then makes a copy of {C:attention}Joker{} to its right"
        }
      },
      j_paperback_b_soda = {
        name = "B-Soda",
        text = {
          "When {C:attention}Blind{} is selected,",
          "gain {C:blue}+#1#{} Hand",
          "Consumed if {C:attention}Blind{} is",
          "cleared with {C:blue}0{} hands",
          "remaining",
        }
      },
      j_paperback_angel_investor = {
        name = "Angel Investor",
        text = {
          "Skipping a {C:attention}Blind{} or defeating",
          "a {C:attention}Boss Blind{} gives",
          "an {C:money}Angel Investment Tag"
        }
      },
      j_paperback_ice_cube = {
        name = "Ice Cube",
        text = {
          "{X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}Food Joker{} you have",
          "{s:0.9}Melts if {s:0.9,C:attention}score catches fire",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },
      j_paperback_champagne = {
        name = "Champagne",
        text = {
          "During a {C:attention}Boss Blind{}, scored",
          "cards earn {C:money}$#1#{}, {C:attention}doubled{} if",
          "the card has a {C:attention}seal",
          "{C:attention}Consumed{} in {C:attention}#2#{} rounds"
        }
      },
      j_paperback_pocket_pair = {
        name = "Pocket Pair",
        text = {
          "Earn {C:money}$#1#{} per {C:attention}#2#{} drawn",
          "at the start of round"
        }
      },
      j_paperback_the_quiet = {
        name = "The Quiet",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each",
          "card below {C:attention}#2#{}",
          "in your full deck",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
        }
      },
      j_paperback_alert = {
        name = "Alert",
        text = {
          "If {C:attention}played hand{} is a single",
          "{C:attention}face card{}, destroy it",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Legacy",
        text = {
          "When a non-{C:attention}Enhanced card{} is",
          "destroyed, adds its {C:chips}Chip value",
          "as {C:mult}Mult{} to this Joker",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      j_paperback_telamon = {
        name = "Telamon",
        text = {
          "If {C:attention}final hand{} contains",
          "a {C:attention}#1#{}, create a random",
          "{C:attention}Swords{} {C:paperback_minor_arcana}Minor Arcana{} card",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_backpack = {
        name = "Backpack",
        text = {
          "{C:money}Shops{} have an additional",
          "free {C:attention}Buffoon Pack"
        }
      },
      j_paperback_mexican_train = {
        name = "Mexican Train",
        text = {
          "Scored {C:attention}#1#s{} give {C:money}$#2#",
          "for every scoring {C:attention}#1#{}",
          "{C:inactive}(Currently {C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_chocolate_joker = {
        name = "Chocolate Joker",
        text = {
          "This Joker gains {X:chips,C:white}X#1#{} Chips",
          "for each {C:attention}Joker{} card",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Jester of Nihil",
        text = {
          "{C:attention}Debuffs{} the suit of the",
          "{C:attention}last scored{} card",
          "{C:mult}+#1#{} Mult for every {C:attention}debuffed{}",
          "card in your full deck",
          "{C:inactive}(Currently {V:1}#2#{C:inactive} and {C:mult}+#3#{C:inactive} Mult)",
        }
      },
      j_paperback_forgery = {
        name = "Forgery",
        text = {
          "Copies ability of a random {C:attention}Joker",
          "every hand, if it provides {X:mult,C:white}XMult{},",
          "{C:mult}Mult{} or {C:chips}Chips{}, multiply its values",
          "between {X:attention,C:white}X#1#{} and {X:attention,C:white}X#2#",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive} at {X:attention,C:white}X#4#{C:inactive})"
        }
      },
      j_paperback_the_world = {
        name = "The World",
        text = {
          "All {C:blue}hands{} and {C:red}discards{} are",
          "considered the {C:attention}first{} and",
          "{C:attention}last{} of round"
        }
      },
      j_paperback_epic_sauce = {
        name = "Epic Sauce",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Destroy a random {C:attention}Joker{}",
          "if played hand is not",
          "the {C:attention}first hand{} of round"
        }
      },
      j_paperback_find_jimbo = {
        name = "Find Jimbo",
        text = {
          "Each played {C:attention}#1#{} of {V:1}#2#{}",
          "earns {C:money}$#3#{} when scored",
          "{s:0.8}Card changes every round"
        },
      },
      j_paperback_forlorn = {
        name = "Forlorn",
        text = {
          "If {C:attention}scoring hand{} contains only",
          "{V:1}#1#{}, destroy a random",
          "card {C:attention}held in hand",
        },
      },
      j_paperback_cream_liqueur = {
        name = "Cream Liqueur",
        text = {
          "{C:attention}Tags{} earn {C:money}$#1#{} when activated",
          "Consumed in {C:attention}#2#{} rounds",
          "{C:inactive}(Resets when a {C:attention}Tag{C:inactive} is acquired)"
        }
      },
      j_paperback_coffee = {
        name = "Coffee",
        text = {
          "{C:attention}+#1#{} hand size,",
          "increases by {C:attention}#2#{} when {C:attention}Blind{} is skipped.",
          "{C:green}#3# in #4#{} chance this card is consumed when",
          "{C:attention}Small Blind{} or {C:attention}Big Blind{} is selected",
        }
      },
      j_paperback_basic_energy = {
        name = "Basic Joker Energy",
        text = {
          "Using any {C:attention}Consumable{} has a",
          "{C:green}#1# in #2#{} chance to make a copy",
          "{C:inactive}(Cannot make copy of a copy)",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_big_misser = {
        name = "Big Misser",
        text = {
          "{X:mult,C:white}X#1#{} Mult for each empty",
          "consumable slot",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)"
        }
      },
      j_paperback_freezer = {
        name = "Freezer",
        text = {
          "Create a {C:dark_edition}Negative{} {C:attention}Food Joker{}",
          "after defeating a {C:attention}Boss Blind{}",
        },
        unlock = {
          "Acquire a {C:dark_edition}Negative{}",
          "{S:1.1,C:attention,E:2}Food Joker"
        }
      },
      j_paperback_everything_must_go = {
        name = "Everything Must Go!",
        text = {
          "Shops have {C:attention}#1#{} additional",
          "{C:attention}Voucher{} for sale"
        }
      },
      j_paperback_card_sleeve = {
        name = "Card Sleeve",
        text = {
          "Sell this card to make the {C:attention}Joker",
          "to the right {C:attention}Eternal{}",
        }
      },
      j_paperback_its_tv_time = {
        name = "It's TV Time!",
        text = {
          "{C:paperback_stars}Stars{} are considered {C:attention}Bonus Cards",
          "{C:attention}Bonus Cards{} are considered {C:paperback_stars}Stars{}",
        },
      },
      j_paperback_da_capo = {
        name = "Da Capo",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult and {C:attention}debuffs",
          "all but one {C:attention}suit{} every hand",
          "in the subsequent order:",
          "{C:clubs}Clubs{}, {C:spades}Spades{}, {C:diamonds}Diamonds{}, {C:hearts}Hearts{}, {C:inactive}None{}",
          "{C:inactive}(Currently: {V:1}#2#{C:inactive}){}",
        }
      },
      j_paperback_complete_breakfast = {
        name = "Complete Breakfast",
        text = {
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
          "{C:green}#3# in #4#{} chance this card is",
          "eaten after played hand",
          "Chance increases by {C:green}#5#{} after",
          "every played hand",
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Emergency Broadcast",
        text = {
          "Scored {C:attention}5s{} and {C:attention}8s{} give",
          "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
        },
      },
      j_paperback_moribund = {
        name = "Moribund",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult when a {C:attention}Blind",
          "is cleared with {C:attention}0{C:blue} hands{} remaining.",
          "This Joker {C:attention}doubles{} its {C:mult}Mult{} if",
          "{C:attention}Blind{} is not cleared",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Crispy Taco",
        text = {
          "{X:chips,C:white}X#1#{} Chips",
          "{C:green}#2# in #3#{} chance this card",
          "is eaten at end of round",
        },
      },
      j_paperback_furioso = {
        name = "Furioso",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult for",
          "each unique scored {C:attention}rank{}.",
          "Resets after defeating a {C:attention}Boss Blind",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
          "{C:inactive}(Ranks played:{C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_soft_taco = {
        name = "Soft Taco",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card",
          "is eaten at end of round",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Charred Marshmallow",
        text = {
          "Scored {C:spades}Spades{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_joker_cookie = {
        name = "Joker Cookie",
        text = {
          "Earn {C:money}$#1#{} at end of round",
          "Payout increases by {C:money}$#2#{} when cashing out",
          "{C:green}#3# in #4#{} chance this card",
          "is eaten at end of round",
        },
      },
      j_paperback_pop_stick = {
        name = "Pop-Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_pool_table = {
        name = "Pool Table",
        text = {
          "If first hand of round",
          "scores no {C:attention}face cards{},",
          "create the {C:planet}Planet{} card of",
          "the played {C:attention}poker hand",
          "{C:inactive}(Must have room)",
        },
      },
      j_paperback_bicycle = {
        name = "Bicycle",
        text = {
          "{C:attention}Wild Cards{} give {C:mult}Mult",
          "equal to their {C:chips}Chip value{},",
          "then {X:mult,C:white}X#1#{} Mult",
        },
      },
      j_paperback_stamp = {
        name = "Stamp",
        text = {
          "{C:green}#1# in #2#{} chance this",
          "Joker gains {C:chips}+#3#{} Chips when",
          "any card with a {C:attention}seal{} is scored",
          "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Sticky Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_shopping_center = {
        name = "Shopping Center",
        text = {
          "{C:money}Shops{} have an additional",
          "{C:attention}card slot",
        },
      },
      j_paperback_tutor = {
        name = "Tutor",
        text = {
          "{C:attention}Numbered cards{} have",
          "{C:attention}double{} their total {C:chips}Chip{} value",
        },
      },
      j_paperback_ghost_cola = {
        name = "Ghost Cola",
        text = {
          "Sell this card to create a {C:attention}#1#{}",
          "and a random {C:spectral}Spectral{} card",
          "{C:inactive}(Must have room)"
        },
      },
      j_paperback_river = {
        name = "River",
        text = {
          "If played hand contains {C:attention}5 scoring",
          "{C:attention}cards{}, earn half the lowest scoring",
          "card's {C:chips}Chip Bonus{} as {C:money}money",
          "{C:inactive}(Max of {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Solemn Lament",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "if scored hand contains both {C:paperback_dark_suit}dark suits{}",
          "and {C:paperback_light_suit}light suits{}",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_hole_in_one = {
        name = "Hole in One",
        text = {
          "If first {C:blue}hand{} of round cleared the",
          "{C:attention}Blind{}, double the {C:attention}sell value{} of all {C:attention}cards",
          "{C:inactive}(Max of {C:money}$#1#{C:inactive} per round)",
          "When this Joker is sold, set the",
          "{C:attention}sell value{} of all {C:attention}cards{} to {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Mismatched Sock",
        text = {
          "This Joker gains {X:mult,C:white}X#1#",
          "Mult if played hand does",
          "not contain a {C:attention}#2#",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
        },
      },
      j_paperback_wild_plus_four = {
        name = "Wild +4",
        text = {
          "{C:attention}+#1#{} hand size"
        }
      },
      j_paperback_quick_fix = {
        name = "Quick Fix",
        text = {
          "{C:attention}+#1#{} hand size",
          "{C:green}#2# in #3#{} chance this",
          "card is destroyed",
          "at end of round...",
        },
      },
      j_paperback_skydiver = {
        name = "Skydiver",
        text = {
          "{C:white,X:mult}X#1#{} Mult if {C:attention}all scored cards{}",
          "are {C:attention}less than or equal{} to the",
          "{C:attention}lowest rank{} scored this round",
          "{C:inactive}(Updates at end of played hand)",
          "{C:inactive}(Currently: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_surfer = {
        name = "Surfer",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "for every {C:attention}#3#{} held in hand",
          "at {C:attention}end of round{}, and {C:chips}+#2#",
          "Chips for every {C:attention}#3#{} scored",
          "{C:inactive}(Currently {C:chips}+#4#{C:inactive} chips)"
        }
      },
      j_paperback_blue_bonnets = {
        name = "Blue Bonnets",
        text = {
          "{C:clubs}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:clubs}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_great_wave = {
        name = "Great Wave",
        text = {
          "Retrigger {C:attention}rightmost{} scoring card",
          "{C:attention}once{} for every {C:attention}scoring card{}",
        },
      },
      j_paperback_caramel_apple = {
        name = "Caramel Apple",
        text = {
          "Scored {C:clubs}Clubs{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_nachos = {
        name = "Nachos",
        text = {
          "{X:chips,C:white}X#1#{} Chips,",
          "loses {X:chips,C:white}X#2#{} Chips",
          "per {C:attention}card{} discarded",
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "Pride Flag",
        text = {
          "Gains {C:chips}+#1#{} Chips if played",
          "hand contains a {C:attention}Spectrum",
          "Resets if played hand",
          "contains a {C:attention}Straight",
          "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips)"
        },
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "Pride Flag",
        text = {
          "Gains {C:mult}+#1#{} Mult if scored hand",
          "contains {C:attention}three{} unique suits",
          "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Sacrificial Lamb",
        text = {
          "Gains {C:mult}+#1#{} Mult for each",
          "card or Joker {C:attention}destroyed",
          "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Autumn Leaves",
        text = {
          "{C:diamonds}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:diamonds}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[WILD PRIZE!1!]]",
        text = {
          "{C:attention}Wild Cards{} have a {C:green}#1# in #2#{} chance",
          "to {C:attention}retrigger{} and a {C:green}#3# in #4#{} chance",
          "to earn between {C:money}#5#{} and {C:money}$#6#{} when scored",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Wish You Were Here",
        text = {
          "Gives {C:mult}Mult{} equal to {C:mult}#1#X{} the",
          "{C:attention}sell value{} of this card.",
          "Gains {C:money}$#2#{} of {C:attention}sell value{}",
          "at end of round",
          "{C:inactive}(Currently {C:mult}+#3# {C:inactive}Mult){}",
        },
      },
      j_paperback_calling_card = {
        name = "Calling Card",
        text = {
          "This Joker gains {X:red,C:white}X#1#{} Mult",
          "whenever you defeat a {C:attention}Boss Blind{}",
          "or trigger its {C:attention}ability{}",
          "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}",
        },
      },
      j_paperback_subterfuge = {
        name = "Subterfuge",
        text = {
          "Destroys the {C:attention}first played",
          "{C:attention}hand{} every round"
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Triple Moon Goddess",
        text = {
          "If played hand contains a {C:attention}Three of a Kind{},",
          "{C:green}#1# in #2#{} chance to create a random {C:planet}Planet{} card and",
          "{C:green}#3# in #4#{} chance to create a random {C:purple}Tarot{} card",
          "{C:inactive}(Must have room)"
        },
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "Triple Moon Goddess",
        text = {
          "If played hand contains a {C:attention}Three of a Kind{},",
          "{C:green}#1# in #2#{} chance to create a random {C:tarot}Tarot{} card and",
          "{C:green}#3# in #4#{} chance to create a random {C:paperback_minor_arcana}Minor Arcana{} card",
          "{C:inactive}(Must have room)"
        },
      },
      j_paperback_derecho = {
        name = "Derecho",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult if {C:attention}scored hand",
          "contains only {C:paperback_dark_suit}dark suits",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_jestrica = {
        name = "Jestrica",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult",
          "when an {C:attention}8{} is scored",
          "Resets if no {C:attention}8s{} are",
          "scored in a round",
          -- TODO might want to indicate if an 8 hasn't been scored
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Grand Strategy",
        text = {
          "{X:mult,C:white}X#1#{} Mult if",
          "{C:attention}#2#{} unique {C:attention}enhancements{}",
          "or {C:attention}seals{} are in your full deck",
          "{C:inactive}(Currently {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_ready_to_fly = {
        name = "Ready to Fly",
        text = {
          "This Joker gains {X:chips,C:white}X#2#{} Chips",
          "whenever an adjacent Joker is {C:attention}triggered",
          "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)",
        },
      },
      j_paperback_solar_system = {
        name = "Solar System",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for",
          "every {C:attention}level{} over 1 {C:attention}all{}",
          "9 base {C:planet}Planets{} share",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_reference_card = {
        name = "Reference Card",
        text = {
          "Gains {X:mult,C:white}X#1#{} Mult for every time {C:attention}all{} 9",
          "base {C:attention}poker hands{} have been played",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Dreamsicle",
        text = {
          "Scored {C:diamonds}Diamonds{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Jimbo Adventure",
        text = {
          "Skipping a {C:attention}Blind{} creates",
          "a random {C:attention}Tag{}",
        },
      },
      j_paperback_union_card = {
        name = "Union Card",
        text = {
          "Gives {X:mult,C:white}XMult{} equal to the number",
          "of scoring {C:paperback_light_suit}light suit{} cards.",
          "Locks {C:attention}sell value{} of all cards",
          "at {C:money}$0{} until this card is sold",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Cherry Blossoms",
        text = {
          "{C:hearts}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:hearts}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_paranoia = {
        name = "Paranoia",
        text = {
          "{C:paperback_light_suit}Light suits{} give {C:mult}+#1#{} Mult",
          "when {C:attention}scored{} for every {C:paperback_dark_suit}dark suit",
          "card {C:attention}destroyed{} this run",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        },
      },
      j_paperback_unholy_alliance = {
        name = "Unholy Alliance",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "when a card or Joker is {C:attention}destroyed{}",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Summoning Circle",
        text = {
          "If played hand contains a",
          "{C:attention}#1#{}, create a copy",
          "of a {C:attention}random consumable",
          "{C:inactive}(Must have room)",
        },
      },
      j_paperback_the_sun = {
        name = "The Sun",
        text = {
          "If played hand contains only",
          "{C:paperback_light_suit}Light Suits{} this Joker",
          "gains {C:mult}+#1#{}, lose {C:mult}+#1#{}",
          "when a {C:paperback_dark_suit}Dark Suit{} is scored",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Pointy Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Prince of Darkness",
        text = {
          "If scoring hand contains a {C:hearts}Heart{} and",
          "{C:attention}#1#{} other unique suits, this Joker gives",
          "{X:mult,C:white}X#2#{} Mult for {C:attention}this hand{} and {C:attention}the next #3#",
          "{C:inactive}(Currently the next {C:attention}#4#{C:inactive} hands)"
        },
      },
      j_paperback_giga_size = {
        name = "GIGA SIZE",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "for every hand played in current {C:attention}Blind{}",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
        },
      },
      j_paperback_popsicle_stick = {
        name = "Popsicle Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_let_it_happen = {
        name = "Let it Happen",
        text = {
          "If hand has not been played this",
          "{C:attention}Ante{}, {C:purple}balance{} {C:mult}Mult{} and {C:chips}Chips",
          "{C:inactive}(Hands played:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_in_case_i_make_it = {
        name = "In Case I Make It",
        text = {
          "Every played {C:attention}rankless card{}",
          "permanently gains",
          "{C:chips}+#1#{} Chips when scored",
        },
      },
      j_paperback_evergreens = {
        name = "Evergreens",
        text = {
          "{C:spades}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:spades}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_der_fluschutze = {
        name = "Der Fluschütze",
        text = {
          "If {C:attention}first{} played hand of round",
          "was a single {C:attention}face{} card, destroy it",
          "and give this joker {X:mult,C:white}X#1#{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)"
        }
      },
      j_paperback_the_wonder_of_you = {
        name = "The Wonder of You",
        text = {
          "When the joker to the {C:attention}right{}",
          "fails a {C:green}probability{} check,",
          "the {C:attention}rightmost{} card held",
          "in hand is {C:attention}destroyed{}"
        }
      },
      j_paperback_inner_peace = {
        name = "Inner Peace",
        text = {
          "{C:attention}+3{} hand size before",
          "the {C:attention}first{} hand",
          "of round is played"
        }
      },
      j_paperback_cakepop = {
        name = "Cakepop",
        text = {
          "Scored {C:hearts}Hearts{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_black_rainbows = {
        name = "Black Rainbows",
        text = {
          -- NOTE dark suits?
          "Scored {C:spades}Spades{} and {C:clubs}Clubs",
          "have a {C:green}#1# in #2#{} chance",
          "to become {C:dark_edition}Polychrome"
        }
      },
      j_paperback_meeple = {
        name = "Meeple",
        text = {
          "If played hand contains",
          "a scoring {C:attention}face{} card,",
          "{C:green}#1# in #2#{} chance to gain",
          "{C:mult}+#3#{} discard this round",
        }
      },
      j_paperback_apple = {
        name = "Apple",
        text = {
          "When buying a {C:attention}Consumable{}, has a",
          "{C:green}#1# in #2#{} chance to create a",
          "{C:dark_edition}Negative{} copy and {S:1.1,C:red,E:2}self destruct",
        }
      },
      j_paperback_heretical_joker = {
        name = "Heretical Joker",
        text = {
          "Played cards with",
          "{C:paperback_stars}Star{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "Fraudulent Joker",
        text = {
          "Played cards with",
          "{C:paperback_crowns}Crown{} suit give",
          "{C:mult}+#1#{} Mult when scored",
        },
      },
      j_paperback_rock_candy = {
        name = "Rock Candy",
        text = {
          "Scored {C:paperback_stars}Stars{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_rockin_stick = {
        name = "Rockin' Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_tanghulu = {
        name = "Tanghulu",
        text = {
          "Scored {C:paperback_crowns}Crowns{} give {C:mult}+#1#{} Mult",
          "{C:green}#2# in #3#{} chance this card is",
          "eaten at end of round",
        },
      },
      j_paperback_sweet_stick = {
        name = "Sweet Stick",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:attention}\"Stick\"{} Joker you have",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
        },
      },
      j_paperback_quartz = {
        name = "Quartz",
        text = {
          "Scored {C:paperback_stars}Stars{} give {X:chips,C:white}X1{} Chips,",
          "{X:chips,C:white}+X#1#{} for each other played {C:paperback_stars}Star"
        }
      },
      j_paperback_pyrite = {
        name = "Pyrite",
        text = {
          "Played {V:1}#1#{} have a {C:green}#2# in #3#{}",
          "chance to create a random",
          "{C:tarot}Tarot{} card when scored",
          "{C:inactive}(Must have room)"
        }
      },
      j_paperback_wheat_field = {
        name = "Wheat Field",
        text = {
          "{C:paperback_crowns}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:paperback_crowns}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_clothespin = {
        name = "Clothespin",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips at",
          "{C:attention}end of round{} for each",
          "{C:attention}Clip{} {C:attention}held in hand",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      j_paperback_watercolor_joker = {
        name = "Watercolor Joker",
        text = {
          "{C:attention}#1#s{} give",
          "{X:chips,C:white}X#2#{} Chips when scored",
        }
      },
      j_paperback_birches = {
        name = "Birches",
        text = {
          "{C:paperback_stars}#1#{} give {X:mult,C:white}X#2#{} Mult when scored.",
          "Increases by {X:mult,C:white}X#3#{} Mult for each",
          "consecutively scored {C:paperback_stars}#4#{}",
          "{C:inactive}(Resets after each hand played)",
        },
      },
      j_paperback_oracle = {
        name = "Oracle",
        text = {
          "This Joker gains {X:chips,C:white}X#1#",
          "Chips for every {C:attention}unique",
          "{C:paperback_minor_arcana}Minor Arcana{} card used",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)",
        },
      },
      j_paperback_punch_card = {
        name = "Punch Card",
        text = {
          "After {C:attention}#1#{} rounds,",
          "sell this card to",
          "gain {C:attention}#3#{} Ante",
          "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
        },
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
        name = "Apostle of Cups",
        text = {
          "Selected {C:attention}playing card",
          "becomes {C:dark_edition}Negative",
          "{C:attention}#1#{} Joker slot",
        }
      },
      c_paperback_apostle_of_wands = {
        name = "Apostle of Wands",
        text = {
          "Create a non-{C:legendary}Legendary{} Joker",
          "of {C:attention}your choice{}",
          "{C:inactive}(No duplicates)"
        }
      },
      c_paperback_apostle_of_swords = {
        name = "Apostle of Swords",
        text = {
          "Destroy selected {C:attention}Joker{}",
          "{C:attention}#1#{} Antes"
        }
      },
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "Ace of Cups",
        text = {
          "Add a {C:chips}Blue Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_two_of_cups = {
        name = "Two of Cups",
        text = {
          "Gives a {C:dark_edition}Polychrome{},",
          "{C:dark_edition}Holographic{}, {C:dark_edition}Foil{},",
          "{C:mult}Rare{} or {C:green}Uncommon{C:attention} Tag"
        }
      },
      c_paperback_three_of_cups = {
        name = "Three of Cups",
        text = {
          "Add a {C:paperback_black}Black Clip{} to",
          "{C:attention}#1#{} selected card"
        }
      },
      c_paperback_four_of_cups = {
        name = "Four of Cups",
        text = {
          "Remove {C:attention}enhancements{}, {C:attention}seals{} and {C:attention}editions{}",
          "from up to {C:attention}#1#{} selected cards.",
          "Earn {C:money}$#2#{} for each one removed"
        }
      },
      c_paperback_five_of_cups = {
        name = "Five of Cups",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_six_of_cups = {
        name = "Six of Cups",
        text = {
          "Earn {C:attention}half{} the {C:chips}Chip",
          "{C:chips}value{} of {C:attention}#1#{} selected",
          "card as {C:money}money",
          "{C:inactive}(Max of {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_seven_of_cups = {
        name = "Seven of Cups",
        text = {
          "Give a random {C:attention}enhancement",
          "to up to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_eight_of_cups = {
        name = "Eight of Cups",
        text = {
          "Converts up to {C:attention}#1#{} selected",
          "cards into a suit that is",
          "not {C:attention}currently selected"
        }
      },
      c_paperback_nine_of_cups = {
        name = "Nine of Cups",
        text = {
          "Destroy selected {C:attention}Joker{} and",
          "create a new {C:attention}Joker{} of equal",
          "{C:attention}rarity{}, or higher if possible",
          "{C:inactive}(Cannot create a {C:legendary}Legendary{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Ten of Cups",
        text = {
          "{C:green}#1# in #2#{} chance to add",
          "{C:dark_edition}Polychrome{} edition to",
          "{C:attention}1{} selected card"
        }
      },
      c_paperback_page_of_cups = {
        name = "Page of Cups",
        text = {
          "Add a {C:inactive}White Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_knight_of_cups = {
        name = "Knight of Cups",
        text = {
          "Select {C:attention}#1#{} cards, the {C:attention}left{} card",
          "copies {C:attention}everything{} from the {C:attention}right",
          "card except {C:attention}rank{} and {C:attention}suit",
          "Destroys the {C:attention}right{} card",
          "{C:inactive}(Drag to rearrange)"
        }
      },
      c_paperback_queen_of_cups = {
        name = "Queen of Cups",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_king_of_cups = {
        name = "King of Cups",
        text = {
          "Earn {C:money}$#1#{} for each suit with all",
          "13 {C:attention}base ranks{} that you have",
          "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_wands = {
        name = "Ace of Wands",
        text = {
          "Add a {C:mult}Red Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_two_of_wands = {
        name = "Two of Wands",
        text = {
          "Create the {C:planet}Planet{} card",
          "for your {C:attention}most{} and {C:attention}least",
          "played {C:attention}poker hands",
          "{C:inactive}(Must have room)"
        }
      },
      c_paperback_three_of_wands = {
        name = "Three of Wands",
        text = {
          "Create a copy of {C:attention}#1#",
          "selected card in",
          "your hand"
        }
      },
      c_paperback_four_of_wands = {
        name = "Four of Wands",
        text = {
          "Add a {C:paperback_pink}Pink Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_five_of_wands = {
        name = "Five of Wands",
        text = {
          "Destroys all cards",
          "{C:attention}held in hand{}, and",
          "sets money to {C:money}$0"
        }
      },
      c_paperback_six_of_wands = {
        name = "Six of Wands",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_seven_of_wands = {
        name = "Seven of Wands",
        text = {
          "Gives a {C:attention}Breaking Tag"
        }
      },
      c_paperback_eight_of_wands = {
        name = "Eight of Wands",
        text = {
          "Create a {C:dark_edition}Negative {C:attention}Tag{} and",
          "lose {C:money}$#1#{}, plus {C:money}$#2#{} for every",
          "Joker over {C:attention}#3#{} owned",
          "{C:inactive}(Currently {C:money}$#4#{C:inactive})"
        }
      },
      c_paperback_nine_of_wands = {
        name = "Nine of Wands",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_ten_of_wands = {
        name = "Ten of Wands",
        text = {
          "Select {C:attention}#1#{} cards, destroy the",
          "{C:attention}rightmost two{} and give their",
          "{C:chips}Chip value{} to the {C:attention}leftmost",
          "{C:inactive}(Drag to rearrange)"
        }
      },
      c_paperback_page_of_wands = {
        name = "Page of Wands",
        text = {
          "Add an {C:attention}Orange Clip{} to up",
          "to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_knight_of_wands = {
        name = "Knight of Wands",
        text = {
          "Gives a {C:mult}High Risk{C:attention} Tag"
        }
      },
      c_paperback_queen_of_wands = {
        name = "Queen of Wands",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "add {C:dark_edition}Dichrome{} edition",
          "to a random {C:attention}Joker"
        }
      },
      c_paperback_king_of_wands = {
        name = "King of Wands",
        text = {
          "Creates a random",
          "non-{C:chips}Common{C:attention} Joker",
          "{C:inactive}(Except {C:legendary}Legendary{C:inactive})"
        }
      },
      c_paperback_ace_of_swords = {
        name = "Ace of Swords",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        }
      },
      c_paperback_two_of_swords = {
        name = "Two of Swords",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to last {C:attention}scored{} suit",
          "{C:inactive}(Currently: {V:1}#2#{C:inactive})",
        }
      },
      c_paperback_three_of_swords = {
        name = "Three of Swords",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_four_of_swords = {
        name = "Four of Swords",
        text = {
          "Converts up to {C:attention}#1#",
          "selected cards to",
          "random {C:attention}Face{} cards"
        }
      },
      c_paperback_five_of_swords = {
        name = "Five of Swords",
        text = {
          "Select {C:attention}#1#{} cards, destroy the",
          "rightmost two and give the",
          "leftmost a random {C:attention}edition{},",
          "{C:attention}seal{} or {C:attention}enhancement",
          "{C:inactive}(Drag to rearrange)"
        }
      },
      c_paperback_six_of_swords = {
        name = "Six of Swords",
        text = {
          "Add a {C:attention}Yellow Clip{} to",
          "{C:attention}#1#{} selected cards"
        }
      },
      c_paperback_seven_of_swords = {
        name = "Seven of Swords",
        text = {
          "Add a {C:attention}Gold Clip{} to",
          "{C:attention}#1#{} selected card"
        }
      },
      c_paperback_eight_of_swords = {
        name = "Eight of Swords",
        text = {
          "Adds random {C:attention}Clips{} to",
          "up to {C:attention}#1#{} selected cards"
        }
      },
      c_paperback_nine_of_swords = {
        name = "Nine of Swords",
        text = {
          "Destroy selected Joker",
          "It is {C:red}unable{} to appear again",
          "for {C:attention}the remainder of the run{}"
        }
      },
      c_paperback_ten_of_swords = {
        name = "Ten of Swords",
        text = {
          "{C:attention}Destroy{} cards in deck",
          "with the same {C:attention}rank",
          "as selected card"
        }
      },
      c_paperback_page_of_swords = {
        name = "Page of Swords",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected cards to",
          "{C:attention}#2#s{}"
        }
      },
      c_paperback_knight_of_swords = {
        name = "Knight of Swords",
        text = {
          "Create a random {C:paperback_minor_arcana}Minor Arcana{} card",
          "and a random {C:tarot}Tarot{} card",
          "{C:inactive}(Must have room)"
        }
      },
      c_paperback_king_of_swords = {
        name = "King of Swords",
        text = {
          "Remove {C:money}Rental{} and {C:paperback_perishable}Perishable",
          "from a selected Joker"
        }
      },
      c_paperback_queen_of_swords = {
        name = "Queen of Swords",
        text = {
          "Converts {C:attention}#1#{} random cards in",
          "full deck with {C:attention}different suits",
          "to the selected card's {C:attention}suit"
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "Ace of Pentacles",
        text = {
          "Converts up to",
          "{C:attention}#1#{} selected cards",
          "to {V:1}#2#{}",
        }
      }
    },
    Voucher = {
      v_paperback_celtic_cross = {
        name = "Celtic Cross",
        text = {
          "When clearing a {C:attention}Boss",
          "{C:attention}Blind{}, the next shop will",
          "have an additional {C:attention}free",
          "{C:paperback_minor_arcana}Mega Minor Arcana Pack"
        }
      },
      v_paperback_soothsay = {
        name = "Soothsay",
        text = {
          "{C:paperback_minor_arcana}Minor Arcana{} cards may",
          "appear in the {C:money}Shop"
        }
      },
    },
    Tag = {
      tag_paperback_angel_investment = {
        name = "Angel Investment Tag",
        text = {
          "Earn {C:money}$#1#{} per {C:money}$#2#{} you have",
          "{C:inactive}(Max of {C:money}$#3#{C:inactive})",
          "{C:inactive}(Will give {C:money}$#4#{C:inactive})"
        }
      },
      tag_paperback_divination = {
        name = "Divination Tag",
        text = {
          "Gives a free",
          "{C:paperback_minor_arcana}Mega Minor Arcana Pack"
        }
      },
      tag_paperback_dichrome = {
        name = "Dichrome Tag",
        text = {
          "Next base edition shop",
          "Joker is free and",
          "becomes {C:dark_edition}Dichrome"
        }
      },
      tag_paperback_high_risk = {
        name = "High Risk Tag",
        text = {
          "When selecting {C:attention}Boss",
          "{C:attention}Blind{}, {C:attention}double{} its",
          "score requirement",
          "and gain {C:money}$#1#"
        }
      },
      tag_paperback_breaking = {
        name = "Breaking Tag",
        text = {
          "Disables the",
          "{C:attention}Boss Blind"
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
        name = "Ceramic Card",
        text = {
          "Earns between {C:money}$#1#{}",
          "and {C:money}$#2#{} when scored,",
          "{C:red}Shatter{} card if",
          "{C:mult}Mult{} ended up ",
          "{C:attention}greater{} than {C:chips}Chips",
          "while played or held"
        }
      },
      m_paperback_soaked = {
        name = "Soaked Card",
        text = {
          "When scored, cards {C:attention}held in hand{}",
          "score their {C:chips}Chip value{}.",
          "{C:green}#1# in #2#{} chance to",
          "{C:red}destroy{} card on {C:red}discard",
        }
      },
      m_paperback_wrapped = {
        name = "Wrapped Card",
        text = {
          "Earn {C:money}$#1#{} when scored",
          "no rank or suit"
        }
      },
      m_paperback_bandaged = {
        name = "Bandaged Card",
        text = {
          "Retrigger {C:attention}adjacent{} cards",
          "{C:green}#1# in #2#{} chance to",
          "{C:red}break{} when scored"
        }
      },
      m_paperback_domino = {
        name = "Domino Card",
        text = {
          "Gives {C:mult}+#1#{} Mult for every played",
          "or discarded rank this round",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      m_paperback_stained = {
        name = "Stained Card",
        text = {
          "If {C:attention}held in hand{} after a",
          "hand is played, scored cards",
          "permanently gain {C:mult}#1#{} Mult"
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "Dichrome",
        text = {
          "When {C:attention}Blind{} is selected",
          "gain {C:attention}+#1#{C:blue} Hand{} or {C:red}Discard",
          "{C:inactive}(Whichever is lower)"
        }
      }
    },
    Other = {
      undiscovered_paperback_minor_arcana = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
          "this card in an",
          "unseeded run to",
          "learn what it does",
        },
      },
      paperback_light_suits = {
        name = "Light Suits",
        text = {
          "{C:diamonds}Diamonds{}, {C:hearts}Hearts{}"
        }
      },
      paperback_dark_suits = {
        name = "Dark Suits",
        text = {
          "{C:spades}Spades{}, {C:clubs}Clubs{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "Requires Custom Suits",
        text = {
          "Removed from pool due",
          "to {C:attention}Custom Suits{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_enhancements = {
        name = "Requires Enhancements",
        text = {
          "Removed from pool due",
          "to {C:attention}Enhancements{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_paperclips = {
        name = "Requires Paperclips",
        text = {
          "Removed from pool due",
          "to {C:attention}Paperclips{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_minor_arcana = {
        name = "Requires Minor Arcana",
        text = {
          "Removed from pool due",
          "to {C:paperback_minor_arcana}Minor Arcana{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_tags = {
        name = "Requires Tags",
        text = {
          "Removed from pool",
          "due to {C:attention}Tags{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_editions = {
        name = "Requires Editions",
        text = {
          "Removed from pool",
          "due to {C:dark_edition}Editions{} being",
          "disabled in {C:legendary}Paperback",
        }
      },
      paperback_requires_ranks = {
        name = "Requires Ranks",
        text = {
          "Removed from pool due",
          "to {C:dark_edition}Ranks{} being",
          "disabled in {C:legendary}Paperback",
        }
      },

      -- Stickers
      paperback_energized = {
        name = "Energized",
        text = {
          "Cannot be copied by",
          "{C:attention}#1#{}"
        }
      },
      paperback_temporary = {
        name = "Temporary",
        text = {
          "Will be {C:mult}destroyed",
          "when round ends"
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "Blue Clip",
        text = {
          "{X:chips,C:white}X#1#{} Chips when",
          "{C:attention}scored{} for each",
          "{C:attention}Clip{} in {C:attention}held hand",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive})"
        }
      },
      paperback_red_clip = {
        name = "Red Clip",
        text = {
          "{C:mult}+#1#{} Mult when",
          "{C:attention}scored{} for each",
          "{C:attention}Clip{} in {C:attention}held hand",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      paperback_orange_clip = {
        name = "Orange Clip",
        text = {
          "Earn {C:money}$#1#{} when",
          "{C:attention}scored{} for every {C:attention}#2#",
          "{C:attention}Clips{} in {C:attention}held hand",
          "{C:inactive}(Currently {C:money}$#3#{C:inactive})"
        }
      },
      paperback_black_clip = {
        name = "Black Clip",
        text = {
          "Retriggers when",
          "{C:attention}scored{} if a {C:attention}Clip",
          "is {C:attention}held in hand",
        }
      },
      paperback_yellow_clip = {
        name = "Yellow Clip",
        text = {
          "If {C:attention}scored{} while a {C:attention}Clip",
          "is {C:attention}held in hand{} it has",
          "a {C:green}#1# in #2#{} chance for {C:red}+#3#{} Mult,",
          "a {C:green}#4# in #5#{} chance for {X:mult,C:white}X#6#{} Mult",
          "and a {C:green}#7# in #8#{} chance for {C:money}$#9#{}",
        }
      },
      paperback_gold_clip = {
        name = "Gold Clip",
        text = {
          "Earn {C:money}$#1#{} for each scored {C:attention}Clip{}",
          "if this card is {C:attention}held in hand",
          "at the end of round",
          "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
        }
      },
      paperback_white_clip = {
        name = "White Clip",
        text = {
          "If {C:attention}held in hand{} at {C:attention}end of",
          "{C:attention}round{}, gains {C:chips}+#1#{} Chips for",
          "each {C:attention}Clip{} scored this round",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      paperback_pink_clip = {
        name = "Pink Clip",
        text = {
          "{X:mult,C:white}X#1#{} Mult when {C:attention}held in",
          "{C:attention}hand{}, increases by {X:mult,C:white}X#2#",
          "for each scored {C:attention}Clip",
          "{C:inactive}(Resets after played hand)"
        }
      },

      -- Minor Arcana
      p_paperback_minor_arcana_normal = {
        name = "Minor Arcana Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#",
          "{C:paperback_minor_arcana}Minor Arcana{} cards",
          "to be used immediately"
        }
      },
      p_paperback_minor_arcana_jumbo = {
        name = "Jumbo Minor Arcana Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#",
          "{C:paperback_minor_arcana}Minor Arcana{} cards",
          "to be used immediately"
        }
      },
      p_paperback_minor_arcana_mega = {
        name = "Mega Minor Arcana Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#",
          "{C:paperback_minor_arcana}Minor Arcana{} cards",
          "to be used immediately"
        }
      },
    },
    Partner = {
      pnr_paperback_virtual = {
        name = "Virtual",
        text = {
          "Retrigger the {C:attention}first scoring",
          "{C:paperback_light_suit}Light Suit{} in each played hand",
          "if no {C:paperback_dark_suit}Dark Suits{} were played",
        }
      },
      pnr_paperback_aftermath = {
        name = "Aftermath",
        text = {
          "Scored {C:attention}face cards{}",
          "gain {C:chips}+#1#{} Chips",
          "when scored",
        }
      },
      pnr_paperback_faker = {
        name = "Faker",
        text = {
          "{C:attention}Once a round{} if",
          "a played hand was a",
          "{C:attention}single card{}, destroy it",
        }
      },
      pnr_paperback_faker_buffed = {
        text = {
          "If a played hand was",
          "a {C:attention}single card{}, destroy it",
        }
      },
    },
    Sleeve = {
      sleeve_paperback_paper = {
        name = "Paper Sleeve",
        text = {
          "{C:legendary}Paperback{C:attention} Jokers{} are {C:attention}3X",
          "more likely to appear,",
          "start run with the",
          "{C:attention,T:j_paperback_shopping_center}#1#{} Joker"
        }
      },
      sleeve_paperback_paper_buff = {
        name = "Paper Sleeve",
        text = {
          "Start with a {C:dark_edition}Negative{}",
          "{C:attention,T:j_paperback_shopping_center}#1#{} Joker"
        }
      },

      sleeve_paperback_proud = {
        name = "Proud Sleeve",
        text = {
          "Start with a full set of",
          "{C:hearts}Hearts{}, {C:diamonds}Diamonds{}, {C:spades}Spades",
          "{C:clubs}Clubs{}, {C:paperback_crowns}Crowns{} and {C:paperback_stars}Stars"
        }
      },
      sleeve_paperback_proud_buff = {
        name = "Proud Sleeve",
        text = {
          "All starting {C:attention}Aces",
          "are {C:dark_edition}Polychrome"
        }
      },

      sleeve_paperback_silver = {
        name = "Silver Sleeve",
        text = {
          "Start run with the",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{} voucher",
          "and a {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      sleeve_paperback_silver_buff = {
        name = "Silver Sleeve",
        text = {
          "Start run with the",
          "{C:paperback_minor_arcana,T:v_paperback_soothsay}#1#{} voucher"
        }
      },

      sleeve_paperback_dreamer = {
        name = "Dreamer's Sleeve",
        text = {
          "Start run with a {C:paperback_temporary}temporary",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:attention}#2#{} Joker slot"
        }
      },
      sleeve_paperback_dreamer_buff = {
        name = "Dreamer's Sleeve",
        text = {
          "Start with an {C:attention}#1#",
          "of each suit"
        }
      },

      sleeve_paperback_antique = {
        name = "Antique Sleeve",
        text = {
          "{C:tarot}Arcana Packs{} no longer",
          "appear in the shop",
          "{C:paperback_minor_arcana}Minor Arcana Packs",
          "are {C:attention}3X{} more common"
        }
      },
      sleeve_paperback_antique_buff = {
        name = "Antique Sleeve",
        text = {
          "{C:paperback_minor_arcana}Minor Arcana Packs{} are {C:money}free",
        }
      },

      sleeve_paperback_passionate = {
        name = "Passionate Sleeve",
        text = {
          "After defeating each",
          "{C:attention}Boss Blind{}, gain a",
          "{C:attention,T:tag_paperback_high_risk}#1#",
          "Earn no {C:money}Interest"
        }
      },
      sleeve_paperback_passionate_buff = {
        name = "Passionate Sleeve",
        text = {
          "Every other {C:attention}Boss Blind{} is",
          "replaced with a {C:attention}Showdown Blind",
          "Defeating a {C:attention}Showdown Blind",
          "gives a {C:dark_edition,T:tag_negative}Negative{} Tag"
        }
      }
    }
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Minor Arcana",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Minor Arcana",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "Minor Arcana Pack",

      paperback_confessed_ex = "Confessed!",
      paperback_polychrome_ex = "Polychrome!",
      paperback_destroyed_ex = "Destroyed!",
      paperback_doubled_ex = "Doubled!",
      paperback_too_late_ex = "TOO LATE!",
      paperback_broken_ex = "Broken!",
      paperback_none = "None",
      paperback_downgrade_ex = "Downgrade!",
      paperback_copy_ex = "Copy!",
      paperback_consumed_ex = "Consumed!",
      paperback_too_hot_ex = "Too Hot!",
      paperback_inactive = "Inactive",
      paperback_supplies_ex = "Supplies!",
      paperback_melted_ex = "Melted!",
      paperback_investment_ex = "Investment!",
      paperback_plus_minor_arcana = "+1 M. Arcana",
      paperback_plus_consumable = "+1 Consumable",
      paperback_plus_tag = "+1 Tag",
      paperback_edition_ex = "Edition!",
      paperback_rare_ex = "Rare!",
      paperback_saved_unholy_alliance = "Saved by Unholy Alliance",
      paperback_saved_determination = "Saved by Determination",
      paperback_reduced_ex = "Reduced!",
      paperback_determination_ex = "NGAAAHH!",
      paperback_forlorn_destruction = "Sorry...",
      paperback_freezer_ex = "Dinner Time!",
      paperback_jestosterone_ex = "Masc!",
      paperback_jestrogen_ex = "Fem!",
      paperback_punch_card_active = "Tell your friends!",
      paperback_punch_card_ex = "Wrong Warp!",

      paperback_ui_requires_restart = "Requires Restart",
      paperback_ui_no_requires_restart = "Doesn't Require Restart",
      paperback_ui_enable_blinds = "Enable Blinds",
      paperback_ui_enable_minor_arcana = "Enable Minor Arcana",
      paperback_ui_enable_enhancements = "Enable Enhancements",
      paperback_ui_enable_editions = "Enable Editions",
      paperback_ui_enable_paperclips = "Enable Paperclips",
      paperback_ui_custom_suits_enabled = "Enable Custom Suits",
      paperback_ui_enable_vouchers = "Enable Vouchers",
      paperback_ui_enable_tags = "Enable Tags",
      paperback_ui_enable_ranks = "Enable Ranks",
      paperback_ui_developers = "Developers",
      paperback_ui_artists = "Artists",
      paperback_ui_localization = "Localization",
      paperback_ui_paperclips = "Paperclips",
      paperback_ui_enable_spectrals = "Enable Spectral Cards",
      paperback_ui_plague_doctor_quotes = "Plague Doctor Quotes",
      paperback_ui_select = "Select",

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
      paperback_clippy_msg_1 = "Save file?",
      paperback_clippy_msg_2 = "i'm Clippy!",
      paperback_clippy_msg_3 = "Hi!",
      paperback_clippy_msg_4 = "Keyboard is on!",
      paperback_clippy_msg_5 = "I'll help!",
      paperback_clippy_msg_6 = "Ask me!",
      paperback_clippy_msg_7 = "Should I leave?",
      paperback_clippy_msg_8 = "Mouse is on!",
      paperback_clippy_msg_full = "Storage full!",

      -- Da Capo messages
      paperback_da_capo_Clubs = "Movement 1",
      paperback_da_capo_Spades = "Movement 2",
      paperback_da_capo_Diamonds = "Movement 3",
      paperback_da_capo_Hearts = "Movement 4",
      paperback_da_capo_None = "Finale!",
    },
    v_dictionary = {
      paperback_a_discards = "+#1# Discards",
      paperback_a_discards_minus = "-#1# Discards",
      paperback_a_hands_minus = "-#1# Hands",
      paperback_prince_of_darkness = "+#1# Mult, +#2# Chips",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# Round",
      paperback_a_plus_cards = "+#1# #2#s",
    },
    ranks = {
      paperback_Apostle = 'Apostle',
    },
    suits_singular = {
      paperback_Crowns = "Crown",
      paperback_Stars = 'Star'
    },
    suits_plural = {
      paperback_Crowns = "Crowns",
      paperback_Stars = 'Stars'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "Spectrum",
      ['paperback_Straight Spectrum'] = "Straight Spectrum",
      ['paperback_Straight Spectrum (Royal)'] = "Royal Spectrum",
      ['paperback_Spectrum House'] = "Spectrum House",
      ['paperback_Spectrum Five'] = "Spectrum Five",
      ['paperback_Straight Flush (Rapture)'] = "Rapture",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5 cards with different suits"
      },
      ['paperback_Straight Spectrum'] = {
        "5 cards in a row (consecutive ranks),",
        "each with a different suit"
      },
      ['paperback_Spectrum House'] = {
        "A Three of a Kind and a Pair with",
        "each card having a different suit"
      },
      ['paperback_Spectrum Five'] = {
        "5 cards with the same rank,",
        "each with a different suit"
      },
    },
    labels = {
      paperback_blue_clip = "Blue Clip",
      paperback_red_clip = "Red Clip",
      paperback_orange_clip = "Orange Clip",
      paperback_pink_clip = "Pink Clip",
      paperback_black_clip = "Black Clip",
      paperback_yellow_clip = "Yellow Clip",
      paperback_gold_clip = "Gold Clip",
      paperback_white_clip = "White Clip",
      paperback_dichrome = "Dichrome",
      paperback_energized = "Energized",
      paperback_temporary = "Temporary",
    }
  }
}
