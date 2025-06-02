return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "Бумажная колода",
        text = {
          "{C:attention}Джокеры{} из мода {C:legendary}Paperback{}",
          "появляются {C:attention}втрое{} чаще",
          "Начинает с джокером {C:attention,T:j_paperback_shopping_center}#1#{}"
        }
      },
      b_paperback_proud = {
        name = "Радужная колода",
        text = {
          "Содержит полный набор",
          "{C:hearts}Червей{}, {C:diamonds}Бубен{}, {C:spades}Пик",
          "{C:clubs}Треф{}, {C:paperback_crowns}Корон{} и {C:paperback_stars}Звёзд"
        }
      },
      b_paperback_silver = {
        name = "Серебристая колода",
        text = {
          "Начинает с",
          "купоном {C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}",
          "и картой {C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      }
    },
    Joker = {
      j_paperback_festive_joker = {
        name = "Праздничный джокер",
        text = {
          "{C:attention}Подарочные карты{} с шансом {C:green}#2# к #3#",
          "создают случайную",
          "{C:attention}расходуемую карту{} при подсчёте",
          "{C:inactive}(должно быть место)"
        }
      },
      j_paperback_medic = {
        name = "Доктор",
        text = {
          "Все эффекты {C:attention}Перевязанных карт{}",
          "срабатывают ещё раз",
        }
      },
      j_paperback_matcha = {
        name = "Матча",
        text = {
          "Получает {C:chips}+#1#{} фишек при",
          "подсчёте каждой карты",
          "С шансом {C:green}#2# к #3#{}",
          "исчезает при {C:mult}сбросе",
          "{C:inactive}(сейчас: {C:chips}+#4#{C:inactive} фишек)"
        }
      },
      j_paperback_you_are_a_fool = {
        name = "Ты - дурак!",
        text = {
          "Если сыгранная рука содержит {C:attention}#1#",
          "или больше карт {C:attention}с лицом{}, преобразует",
          "все карты в {C:attention}удерживаемой руке{}",
          "в {C:attention}самую левую{} подсчитываемую карту",
          "{S:1.1,C:red,E:2}самоуничтожится",
        }
      },
      j_paperback_kintsugi_joker = {
        name = "Кинцуги джокер",
        text = {
          "Увеличивает максимум выплаты",
          "{C:attention}Керамических карт{} на {C:money}$#1#{} когда",
          "{C:attention}#2#{} уничтожается",
          "{C:inactive}(сейчас увеличено на: {C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_ddakji = {
        name = "Ттакчи",
        text = {
          "{C:green}#1# к #2#{} карт тянутся",
          "рубашкой вверх, если подсчитана",
          "карта {C:attention}рубашкой вверх{} и",
          "карта {C:attention}рубашкой вниз{}, создаёт",
          "случайную расходуемую карту",
          "{C:inactive}(Должно быть место)"
        }
      },
      j_paperback_weather_radio = {
        name = "Метеорадио",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ. если",
          "{C:attention}сыгранная рука содержит {C:attention}#2#{},",
          "если набралось {X:mult,C:white}X#3#{} множ. или больше, отключает",
          "{C:attention}Босс Блайнд{} и теряет {X:mult,C:white}X#4#{} множ.",
          "{C:inactive}(сейчас: {X:mult,C:white}X#5#{C:inactive} множ.)",
          "{s:0.75}комбинация меняется каждый раунд"
        }
      },
      j_paperback_power_surge = {
        name = "Перенапряжение",
        text = {
          "Сыгранные {C:attention}#1#-ки{} дают {X:mult,C:white}X#2#{}",
          "множ. при подсчёте",
          "и с шансом {C:green}#3# к #4#{}",
          "{C:red}уничтожают{} случайную",
          "карту {C:attention}удерживаемую в руке{}",
        }
      },
      j_paperback_bismuth = {
        name = "Висмут",
        text = {
          "Сыгранные {V:1}#1#{} и {V:2}#2#{} с шансом",
          "{C:green}#3# к #4#{} получают {C:dark_edition}Фольговое",
          "{C:dark_edition}Голографическое{} или {C:dark_edition}Полихромное{} издание",
        }
      },
      j_paperback_deadringer = {
        name = "Смертоносец",
        text = {
          "Все эффекты подсчитываемых {C:attention}#1#{} и {C:attention}#2#",
          "срабатывают ещё раз, все эффекты подсчитываемых",
		  "{C:attention}#3#s{} срабатывают ещё два раза"
        }
      },
      j_paperback_full_moon = {
        name = "Полнолуние",
        text = {
          "Карты {C:planet}планет{}",
          "с шансом {C:green}#1# к #2#{}",
          "срабатывают {C:attention}дважды",
        }
      },
      j_paperback_sake_cup = {
        name = "Чашка для сакэ",
        text = {
          "{C:attention}9-ки{} {C:attention}удерживаемые в руке{}",
          "c шансом {C:green}#2# к #3#",
          "создают карту {C:planet}планеты",
          "соответствующую {C:attention}сыгранной комбинации",
          "{C:inactive}(должно быть место)"
        }
      },
      j_paperback_resurrections = {
        name = "Возрождение",
        text = {
          "Проданные {C:attention}джокеры{} имеют",
          "шанс {C:green}#1# к #2#{} создать",
          "свою {C:dark_edition}негативную{} копию",
          "стоимостью в {C:money}-$#3#{}",
          "{s:0.8}Шанс повышается на {s:0.8,C:green}#4#{s:0.8} при неудаче",
          "{s:0.8}Шанс обновляется при срабатывании"
        }
      },
      j_paperback_book_of_vengeance = {
        name = "Книга возмездия",
        text = {
          "Если {C:attention}первая рука{} раунда",
          "побеждает {C:attention}Босс Блайнд{},",
          "самоуничтожается и создаёт копию",
          "{C:attention}джокера{} справа от себя"
        }
      },
      j_paperback_b_soda = {
        name = "B-содовая",
        text = {
          "При выборе {C:attention}блайнда{}",
          "даёт {C:chips}+#1#{} руку",
          "Сьедается если {C:attention}блайнд{} был",
          "побеждён с {C:chips}0{}",
          "оставшимися руками",
        }
      },
      j_paperback_angel_investor = {
        name = "Ангел капитализма",
        text = {
          "Пропуск {C:attention}блайнда{} даёт",
          "{C:attention}#1#{} {C:money}жетона ангельского инвестрования"
        }
      },
      j_paperback_ice_cube = {
        name = "Кубик льда",
        text = {
          "{X:mult,C:white}X#1#{} множ. за каждого",
          "вашего {C:attention}пищевого джокера{}",
          "Тает через {C:attention}#2#{} раунда",
          "{C:inactive}(сейчас: {X:mult,C:white}X#3#{C:inactive} множ.)"
        }
      },
      j_paperback_champagne = {
        name = "Шампанское",
        text = {
          "Во время {C:attention}Босс Блайнда{}, подсчитываемые",
          "карты дают {C:money}$#1#{}, {C:attention}вдвое больше{} если",
          "на карте есть {C:attention}печать",
          "{C:attention}Исчезнет{} через {C:attention}#2#{} раунда"
        }
      },
      j_paperback_pocket_pair = {
        name = "Карманная пара",
        text = {
          "Даёт {C:money}$#1#{} за каждую {C:attention}#2#{}",
          "вытянутую в начале раунда"
        }
      },
      j_paperback_the_quiet = {
        name = "Тишина",
        text = {
          "{X:mult,C:white}X#1#{} множ. за каждую",
          "недостающую карту в вашей",
          "полной колоде ({C:attention}#2#{} карт)",
          "{C:inactive}(сейчас: {X:mult,C:white}X#3#{C:inactive} множ.)"
        }
      },
      j_paperback_alert = {
        name = "Тревога",
        text = {
          "Если {C:attention}сыгранная рука{} содержит",
          "только одну {C:attention}карту с лицом{}, уничтожает её",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_legacy = {
        name = "Наследие",
        text = {
          "Если карта {C:attention}без улучшения{}",
          "уничтожается, {C:chips}количество фишек",
          "карты добавляется как {C:mult}множ.{} к этому джокеру",
          "{C:inactive}(сейчас: {C:mult}+#1#{C:inactive} множ.)"
        }
      },
      j_paperback_backpack = {
        name = "Рюкзак",
        text = {
          "В {C:money}магазинах{} есть дополнительный",
          "бесплатный {C:attention}Шутовской набор"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "Шут пустоты",
        text = {
          "{C:attention}Ослабляет{} масть {C:attention}последней",
          "{C:attention}подсчитанной{} карты и даёт {C:mult}+#1#{} множ.",
          "за каждую {C:attention}ослабленну{} карту",
          "{C:inactive}(сейчас: {V:1}#2#{C:inactive} и {C:mult}+#3#{C:inactive} множ.)",
        }
      },
      j_paperback_forgery = {
        name = "Подделка",
        text = {
          "Копирует способность случайного",
          "{C:attention}джокера{}, дающего {X:mult,C:white}Xмнож.{},",
          "{C:mult}множ.{} или {C:chips}фишки{}, умножает его значения",
          "на число от {X:attention,C:white}X#1#{} до {X:attention,C:white}X#2#",
          "{C:inactive}(сейчас: {C:attention}#3#{C:inactive} c {X:attention,C:white}X#4#{C:inactive})"
        }
      },
      j_paperback_the_world = {
        name = "Зе ворлд",
        text = {
          "Все {C:chips}руки{} и {C:mult}сбросы{}",
          "считаются сразу и {C:attention}первыми{},",
          "и {C:attention}последними{} в раунде"
        }
      },
      j_paperback_epic_sauce = {
        name = "Эпический соус",
        text = {
          "{X:mult,C:white}X#1#{} множ.",
          "Уничтожает случайного {C:attention}джокера{}",
          "если сыгранная рука не является",
          "{C:attention}первой рукой{} раунда"
        }
      },
      j_paperback_find_jimbo = {
        name = "Найди Джимбо",
        text = {
          "Каждая подсчитанная {C:attention}#1#{} {V:1}#2#{}",
          "даёт {C:money}$#3#{}",
          "{s:0.8}Карта меняется каждый раунд"
        },
      },
      j_paperback_cream_liqueur = {
        name = "Сливочный ликёр",
        text = {
          "{C:attention}Жетоны{} дают {C:money}$#1#{} при срабатывании",
          "Исчезнет через {C:attention}#2#{} раундов",
          "{C:inactive}(Счётчик раундов сбрасывается когда вы получаете {C:attention}жетон{C:inactive})"
        }
      },
      j_paperback_coffee = {
        name = "Кофе",
        text = {
          "{C:attention}+#1#{} к размеру руки,",
          "увеличивается на {C:attention}#2#{} при пропуске {C:attention}блайнда{},",
          "исчезает с шансом {C:green}#3# к #4#{} при выборе",
          "{C:attention}Малого{} или {C:attention}Большого Блайнда{}",
        }
      },
      j_paperback_basic_energy = {
        name = "Единица энергии джокера",
        text = {
          "При использовании любой {C:attention}расходумой карты{}",
          "создаёт её копию с шансом {C:green}#1# к #2#{}",
          "{C:inactive}(Не может создать копию копии)",
          "{C:inactive}(Должно быть место)"
        }
      },
      j_paperback_big_misser = {
        name = "Большой провал",
        text = {
          "{X:mult,C:white}X#1#{} множ. за каждый пустой",
          "слот для расходуемых карт",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{}{C:inactive} множ.)"
        }
      },
      j_paperback_complete_breakfast = {
        name = "Полный завтрак",
        text = {
          "{C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек",
          "съедается с шансом {C:green}#3# к #4#{} после",
          "каждой сыгранной руки",
          "Шанс увеличивается на {C:attention}#5#{} каждую руку"
        },
      },
      j_paperback_emergency_broadcast = {
        name = "Штормовое предупреждение",
        text = {
          "Сыгранные {C:attention}5-ки{} и {C:attention}8-ки{} дают",
          "{C:mult}+#1#{} множ. и {C:chips}+#2#{} фишек при подсчёте",
        },
      },
      j_paperback_moribund = {
        name = "При смерти",
        text = {
          "Получает {C:mult}+#1#{} множ. если {C:attention}блайнд",
          "побеждён с оставшимися {C:attention}0 {C:chips}руками{}.",
          "Удваивает свой {C:mult}множ.{} если блайнд не побеждён",
          "{C:inactive}(сейчас: {C:mult}+#2#{C:inactive} множ.)",
        },
      },
      j_paperback_crispy_taco = {
        name = "Хрустящее тако",
        text = {
          "{X:chips,C:white}X#1#{} фишек",
          "С шансом {C:green}#2# к #3#{} съедается в конце раунда",
        },
      },
      j_paperback_furioso = {
        name = "Фуриозо",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ. за каждое уникальное",
          "{C:attention}достоинство{} сыгранное в этом анте",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{} {C:inactive}множ.)",
          "{C:inactive}(сыгранные достоинства:{C:attention}#3#{C:inactive})"
        },
      },
      j_paperback_soft_taco = {
        name = "Мягкое тако",
        text = {
          "{X:mult,C:white}X#1#{} множ.",
          "С шансом {C:green}#2# к #3#{} съедается в конце раунда",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "Подгоревший зефир",
        text = {
          "Сыгранные {C:spades}Пики{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_joker_cookie = {
        name = "Пряничный джокер",
        text = {
          "Даёт {C:money}$#1#{} в конце раунда",
          "Увеличивается на {C:money}$#2#{} при обналичивании",
          "С шансом {C:green}#3# к #4#{} будет",
          "съеден в конце раунда",
        },
      },
      j_paperback_pop_stick = {
        name = "Полая палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_pool_table = {
        name = "Бильярдный стол",
        text = {
          "Если в первой руке раунда",
          "нет подсчитываемых {C:attention}карт с лицом{},",
          "создаёт карту {C:planet}планеты{}",
          "для сыгранной {C:attention}покерной комбинации",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_bicycle = {
        name = "Bicycle™",
        text = {
          "{C:attention}Дикие карты{} дают {C:mult}множ. равный",
          "количеству {C:chips}фишек{}, которые они дают",
          "и {X:mult,C:white}X#1#{} множ. при подсчёте",
        },
      },
      j_paperback_stamp = {
        name = "Штамп",
        text = {
          "С шансом {C:green}#1# к #2#{}",
          "получает {C:chips}+#3#{} фишек за каждую",
          "карту с {C:attention}печатью{} при подсчёте",
          "{C:inactive}(сейчас: {C:chips}+#4#{C:inactive} фишек)",
        },
      },
      j_paperback_sticky_stick = {
        name = "Липкая палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_shopping_center = {
        name = "Торговый центр",
        text = {
          "{C:attention}+1{} слот для карт,",
          "продаваемых в магазине",
        },
      },
      j_paperback_ghost_cola = {
        name = "Призрачная кола",
        text = {
          "При продаже этого джокера создаёт {C:attention}#1#{}",
          "и случайную {C:dark_edition}негативную{} {C:spectral}спектральную{} карту",
        },
      },
      j_paperback_river = {
        name = "Река",
        text = {
          "Если сыграно {C:attention}5 подсчитанных карт{C:attention},",
          "даёт столько {C:money}денег{}, сколько",
          "{C:chips}фишек{} даёт карта, дающая меньше",
		  "всего фишек из карт в руке",
          "{C:inactive}(макс. {C:money}$#1#{C:inactive})",
        },
      },
      j_paperback_solemn_lament = {
        name = "Торжественный траур",
        text = {
          "Всё эффекты {C:attention}первой{} подсчитанной",
          "карты срабатывают по одному {C:attention}доп. разу{} за",
          "каждую оставшуюся {C:chips}руку{} и {C:mult}сброс"
        },
      },
      j_paperback_hole_in_one = {
        name = "За один удар",
        text = {
          "Если первая рука раунда побеждает",
          "{C:attention}блайнд{}, удваивает {C:attention}стоимость продажи{} всех {C:attention}карт",
          "{C:inactive}(Макс. {C:money}$#1#{C:inactive} за раунд)",
          "При продаже этого джокера, {C:attention}цена{} всех",
          "карт станет равна {C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "Непарный носок",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ.",
          "если сыгранная рука не содержит {C:attention}#2#",
          "{C:inactive}(сейчас: {X:mult,C:white}X#3#{C:inactive} множ.)",
        },
      },
      j_paperback_quick_fix = {
        name = "Изолента",
        text = {
          "{C:attention}+#1#{} к размеру руки,",
          "с шансом {C:green}#2# к #3#{}",
          "исчезнет в конце раунда"
        },
      },
      j_paperback_skydiver = {
        name = "Парашютист",
        text = {
          "{C:white,X:mult}X#1#{} множ. если все {C:attention}подсчитанные карты{}",
          "имеют достоинство равное или меньшее чем {C:attention}наименьшее",
          "достоинство, сыгранное в этом раунде",
          "{C:inactive}(сейчас: {C:attention}#2#{C:inactive})",
        },
      },
      j_paperback_surfer = {
        name = "Сёрфер",
        text = {
          "Получает {C:chips}+#1#{} фишек",
          "за каждую {C:attention}10-ку{} удерживаемую",
          "в руке {C:attention}в конце раунда{}, и {C:chips}+#2#",
          "фишек за каждую подсчитанную {C:attention}10-ку{}",
          "{C:inactive}(сейчас: {C:chips}+#4#{C:inactive} фишек)"
        }
      },
      j_paperback_blue_bonnets = {
        name = "Голубые люпины",
        text = {
          "Подсчитанные {C:clubs}Трефы{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
      j_paperback_great_wave = {
        name = "Цунами",
        text = {
          "Все эффекты {C:attention}самой правой{} подсчитанной карты",
          "срабатывают {C:attention}ещё раз{} за",
		  "каждую {C:attention}сыгранную карту"
        },
      },
      j_paperback_caramel_apple = {
        name = "Карамельное яблоко",
        text = {
          "Сыгранные {C:clubs}Трефы{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_nachos = {
        name = "Начос",
        text = {
          "{X:chips,C:white}X#1#{} фишек,",
          "теряет {X:chips,C:white}X#2#{} фишек",
          "за каждую {C:attention}сброшенную{} карту",
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "ЛГБТ флаг",
        text = {
          "Получает {C:chips}+#1#{} фишек если сыгранная",
          "рука содержит {C:attention}спектр",
          "Обнуляется если сыгранная рука",
          "содержит {C:attention}стрит",
          "{C:inactive}(сейчас: {C:chips}+#2#{} {C:inactive}фишек)"
        },
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "ЛГБТ флаг",
        text = {
          "Получает {C:mult}+#1#{} множ. если сыгранная",
          "комбинация содержит {C:attention}три{} разные масти",
          "{C:inactive}(сейчас {C:mult}+#2#{} {C:inactive}множ.)",
        },
      },
      j_paperback_sacrificial_lamb = {
        name = "Жертвенный агнец",
        text = {
          "Получает {C:mult}+#1#{} множ. за",
          "каждую {C:attention}уничтоженную{} карту или джокера",
          "{C:inactive}(сейчас: {C:mult}+#2# {C:inactive})",
        },
      },
      j_paperback_autumn_leaves = {
        name = "Осенние листья",
        text = {
          "Подсчитанные {C:diamonds}Бубны{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
      j_paperback_wild_prize = {
        name = "[[ДИКАЯ НАГРАДА!1!]]",
        text = {
          "Все эффекты {C:attention}диких карт{} срабатывают {C:attention}ещё раз",
          "с шансом {C:green}#1# к #2#{} и с шансом {C:green}#1# к #3#{}",
          "дают от {C:money}$#4#{} до {C:money}$#5#{} при подсчёте",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "Открытка",
        text = {
          "Даёт {C:mult}множ.{} равный {C:mult}#1#X{} от",
          "{C:attention}стимости продажи{} этого джокера.",
          "Получает {C:money}$#2#{} к {C:attention}стоимости{}",
          "в конце раунда",
          "{C:inactive}(сейчас: {C:mult}+#3# {C:inactive}множ.){}",
        },
      },
      j_paperback_calling_card = {
        name = "Визитная карточка",
        text = {
          "Получает {X:red,C:white}X#1#{} множ.",
          "при победе {C:attention}Босс Блайнда{} или если",
          "сыгранная рука запускает его {C:attention}способность{}",
          "{C:inactive}(сейчас: {}{X:red,C:white}X#2#{}{C:inactive} множ.){}",
        },
      },
      j_paperback_subterfuge = {
        name = "Уловка",
        text = {
          "Уничтожает {C:attention}первую сыгранную",
          "{C:attention}руку{} в раунде"
        },
      },
      j_paperback_triple_moon_goddess = {
        name = "Триединая Богиня луны",
        text = {
          "Если сыгранная рука содержит {C:attention}сет{},",
          "{C:green}#1# к #2#{} шанс создать случайную карту {C:planet}планеты{} и",
          "{C:green}#1# к #3#{} шанс создать случайную карту{C:purple}таро{}",
          "{C:inactive}(Должно быть место)"
        },
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "Триединая Богиня луны",
        text = {
          "Если сыгранная рука содержит {C:attention}сет{},",
          "{C:green}#1# к #2#{} шанс создать случайную карту {C:tarot}таро{} и",
          "{C:green}#1# к #3#{} шанс создать случайную карту {C:paperback_minor_arcana}младшего аркана{}",
          "{C:inactive}(Должно быть место)"
        },
      },
      j_paperback_derecho = {
        name = "Шторм",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ. если {C:attention}сыгранная комбинация",
          "содержит только карты {C:paperback_dark_suit}тёмных мастей",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ.)",
        },
      },
      j_paperback_jestrica = {
        name = "Джестрика",
        text = {
          "Получает {C:mult}+#1#{} множ. при подсчитывании {C:attention}8-ки{}",
          "Обнуляется если ни одна {C:attention}8-ка{}",
          "не была подсчитана в раунде",
          "{C:inactive}(сейчас: {C:mult}+#2#{C:inactive} множ.)"
        },
      },
      j_paperback_grand_strategy = {
        name = "Выигрышная стратегия",
        text = {
          "{X:mult,C:white}X#1#{} множ. если в колоде",
          "присутствует {C:attention}#2#{} уникальных {C:attention}улучшений{},",
          "{C:attention}изданий{} или {C:attention}печатей{}",
          "{C:inactive}(сейчас: {C:attention}#3#{C:inactive})",
        },
      },
      j_paperback_solar_system = {
        name = "Солнечная система",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждый",
          "{C:attention}уровень{}, который есть",
          "у каждой из 9 {C:attention}базовых комбинаций",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{} {C:inactive}множ.)",
        },
      },
      j_paperback_reference_card = {
        name = "Памятка",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ. за каждый раз когда {C:attention}все{}",
          "9 {C:attention}базовых комбинаций{} были сыграны",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{} {C:inactive}множ.)",
        },
      },
      j_paperback_dreamsicle = {
        name = "Эскимо",
        text = {
          "Сыгранные {C:diamonds}Бубны{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "Приключение Джимбо",
        text = {
          "Пропуск {C:attention}блайнда{} создаёт",
          "случайный {C:attention}жетон{}",
        },
      },
      j_paperback_union_card = {
        name = "Союзная карта",
        text = {
          "{C:attention}Стоимость{} всех {C:attention}карт{} равна {C:money}$0",
          "пока этот джокер не будет продан",
          "Даёт {X:mult,C:white}X{} множ. равный количеству",
          "подсчитанных карт {C:paperback_light_suit}светлой масти{} в руке"
        },
      },
      j_paperback_cherry_blossoms = {
        name = "Цветение сакуры",
        text = {
          "Подсчитанные {C:hearts}Червы{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
      j_paperback_paranoia = {
        name = "Паранойя",
        text = {
          "{C:paperback_light_suit}Светлые масти{} дают {C:mult}+#1#{} множ.",
          "при {C:attention}подсчёте{} за каждую  карту",
          "{C:paperback_dark_suit}тёмной масти{} {C:attention}уничтоженную{} в партии",
          "{C:inactive}(сейчас: {C:mult}+#2#{C:inactive} множ.)"
        },
      },
      j_paperback_unholy_alliance = {
        name = "Нечестивый союз",
        text = {
          "Получает {X:mult,C:white}X#1#{} множ. за",
          "каждую {C:attention}уничтоженную{} карту или джокера",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ.)",
        },
      },
      j_paperback_summoning_circle = {
        name = "Круг призыва",
        text = {
          "Если сыгранная рука содержит",
          "{C:attention}#1#{}, копирует",
          "случаную {C:attention}расходуемую карту",
          "{C:inactive}(Должно быть место)",
        },
      },
      j_paperback_pointy_stick = {
        name = "Острая палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_prince_of_darkness = {
        name = "Принц из тьмы",
        text = {
          "Если сыгранная комбинация содержит {C:hearts}Червы{}",
          "и {C:attention}#1#{} другие масти, этот джокер даёт",
          "{X:mult,C:white}X#2#{} множ. следующие {C:chips}#3#{} руки",
          "{C:inactive}(сейчас: следующие {C:chips}#4#{C:inactive} руки)",
        },
      },
      j_paperback_popsicle_stick = {
        name = "Плоская палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_let_it_happen = {
        name = "Будь что будет",
        text = {
          "Если комбинация не была сыграна в этом",
          "{C:attention}анте{}, {C:mult}множ.{} и {C:chips}фишки{} балансируются",
          "{C:inactive}(Сыгранные руки:{C:attention}#1#{C:inactive})",
        },
      },
      j_paperback_evergreens = {
        name = "Хвойный лес",
        text = {
          "Подсчитанные {C:spades}Пики{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
      j_paperback_cakepop = {
        name = "Кейк-поп",
        text = {
          "Сыгранные {C:hearts}Червы{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_black_rainbows = {
        name = "Чёрная радуга",
        text = {
          "{C:spades}Пики{} и {C:clubs}Трефы",
          "имеют шанс {C:green}#1# к #2#{}",
          "стать {C:dark_edition}полихромными"
        }
      },
      j_paperback_meeple = {
        name = "Мипл",
        text = {
          "Если в сыгранной руке есть",
          "подсчитываемая {C:attention}карта с лицом{}",
          "даёт {C:mult}+#1#{} сброс до конца раунда",
        }
      },
      j_paperback_apple = {
        name = "Яблоко",
        text = {
          "{C:hearts}Червы{} имеют шанс",
          "{C:green}#1# к #2#{} создать",
          "{C:dark_edition}негативную {C:attention}расходуемую карту",
          "{S:1.1,C:red,E:2}самоуничтожится",
        }
      },
      j_paperback_heretical_joker = {
        name = "Еретический джокер",
        text = {
          "Сыгранные карты с",
          "мастью {C:paperback_stars}Здвёзды{} дают",
          "{C:mult}+#1#{} множ. при подсчёте",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "Мошеннический джокер",
        text = {
          "Сыгранные карты с",
          "мастью {C:paperback_crowns}Короны{} дают",
          "{C:mult}+#1#{} множ. при подсчёте",
        },
      },
      j_paperback_rock_candy = {
        name = "Леденец",
        text = {
          "Сыгранные {C:paperback_stars}Звёзды{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_rockin_stick = {
        name = "Барабанная палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_tanghulu = {
        name = "Фрукты в стекле",
        text = {
          "Сыгранные {C:paperback_crowns}Короны{} дают {C:mult}+#1#{} множ.",
          "Имеет шанс {C:green}#2# к #3#{}",
          "быть съеденным в конце раунда",
        },
      },
      j_paperback_sweet_stick = {
        name = "Фруктовая палочка",
        text = {
          "Даёт {X:mult,C:white}X#1#{} множ. за каждую",
          "другую вашу {C:attention}палочку{}",
          "{C:inactive}(сейчас: {X:mult,C:white}X#2#{C:inactive} множ)"
        },
      },
      j_paperback_quartz = {
        name = "Кварц",
        text = {
          "Сыгранные карты с мастью {C:paperback_stars}Звёзды{}",
		  "дают {X:chips,C:white}X#1#{} фишек за",
          "каждую другую сыгранную карту",
		  "масти {C:paperback_stars}Звёзды{} при подсчёте"
        }
      },
      j_paperback_pyrite = {
        name = "Пирит",
        text = {
          "Сыгранные карты с мастью {C:paperback_crowns}Короны",
          "создают случайную карту {C:tarot}таро",
          "с шансом {C:green}#2# к #3#{}",
          "{C:inactive}(Должно быть место)"
        }
      },
      j_paperback_wheat_field = {
        name = "Пшеничное поле",
        text = {
          "Подсчитанные {C:paperback_crowns}Короны{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
      j_paperback_clothespin = {
        name = "Прищепка",
        text = {
          "Получает {C:chips}+#1#{} фишек за каждую карту",
          "cо {C:attention}скрепкой{}, удерживаемую в руке в конце раунда",
          "{C:inactive}(сейчас: {C:chips}+#2#{C:inactive} фишек)"
        }
      },
      j_paperback_watercolor_joker = {
        name = "Акварельный джокер",
        text = {
          "{C:attention}Промокшие карты{} дают",
          "{X:chips,C:white}X#2#{} фишек при подсчёте",
        }
      },
      j_paperback_birches = {
        name = "Берёзовая роща",
        text = {
          "Подсчитанные {C:paperback_stars}Звёзды{} дают {X:mult,C:white}X#1#{} множ.",
          "Увеличивается на {X:mult,C:white}X#2#{} множ. при срабатывании",
          "{C:inactive}(Сбрасывается после розыгрыша руки)",
        },
      },
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "Туз Кубков",
        text = {
          "Добавляет {C:chips}синюю скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_two_of_cups = {
        name = "Двойка Кубков",
        text = {
          "Даёт {C:dark_edition}Полихромный{},",
          "{C:dark_edition}Голографический{}, {C:dark_edition}Фольговый{},",
          "{C:mult}Редкий{} или {C:green}Необычный{C:attention} жетон"
        }
      },
      c_paperback_three_of_cups = {
        name = "Тройка Кубков",
        text = {
          "Добавляет {C:paperback_black}чёрную скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_four_of_cups = {
        name = "Четвёрка Кубков",
        text = {
          "Выберите до {C:attention}#1#{} карт,",
          "удаляет {C:attention}улучшения{}, {C:attention}печати{} и {C:attention}издания{}",
          "с выбранных карт, даёт {C:money}$#2#{} за каждую"
        }
      },
      c_paperback_five_of_cups = {
        name = "Пятёрка Кубков",
        text = {
          "Улучшает {C:attention}#1#{}",
          "выбранные карты до",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_six_of_cups = {
        name = "Шестёрка Кубков",
        text = {
          "Даёт {C:attention}половину{} {C:chips}фишек",
          "{C:attention}#1#{} выбранной карты",
          "как {C:money}деньги",
          "{C:inactive}(Максимум {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_seven_of_cups = {
        name = "Семёрка Кубков",
        text = {
          "Даёт случайное {C:attention}улучшение",
          "выбранным картам (макс. {C:attention}#1#{} карты)"
        }
      },
      c_paperback_eight_of_cups = {
        name = "Восьмёрка Кубков",
        text = {
          "Меняет масть до {C:attention}#1#{} выбранных",
          "карт на масть, которой нет",
		  "среди выбранных карт"
        }
      },
      c_paperback_nine_of_cups = {
        name = "Девятка Кубков",
        text = {
          "Уничтожает выбранного {C:attention}джокера{},",
          "создаёт случайного {C:attention}джокера{} той же",
          "{C:attention}редкости{}, или выше",
          "{C:inactive}(Не улучшает до {C:legendary}легендарного{C:inactive})"
        }
      },
      c_paperback_ten_of_cups = {
        name = "Десятка Кубков",
        text = {
          "{C:green}#1# к #2#{} шанс добавить",
          "{C:dark_edition}полихромное{} издание",
          "выбранной карте"
        }
      },
      c_paperback_page_of_cups = {
        name = "Посол Кубков",
        text = {
          "Добавляет {C:inactive}белую скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_knight_of_cups = {
        name = "Рыцарь Кубков",
        text = {
          "Выберите {C:attention}#1#{} карты, {C:attention}левая{} карта",
          "копирует {C:attention}всё{} из {C:attention}правой карты",
          "кроме достоинства и масти,",
          "уничтожает {C:attention}правую{} карту",
          "{C:inactive}(Перетащите карты для измения их порядка)"
        }
      },
      c_paperback_queen_of_cups = {
        name = "Королева Кубков",
        text = {
          "Улучшает {C:attention}#1#{}",
          "выбранные карты до",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_king_of_cups = {
        name = "Король Кубков",
        text = {
          "Даёт {C:money}$#1#{} за каждую масть, все",
          "достоинства которой присутствуют в вашей колоде",
          "{C:inactive}(сейчас: {C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_wands = {
        name = "Туз Жезлов",
        text = {
          "Добавляет {C:mult}красную скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_two_of_wands = {
        name = "Двойка Жезлов",
        text = {
          "Создаёт карту {C:planet}планеты{}",
          "ваших {C:attention}наиболее{} и {C:attention}наименее",
          "играемых {C:attention}покерных комбинаций",
          "{C:inactive}(Должно быть место)"
        }
      },
      c_paperback_three_of_wands = {
        name = "Тройка Жезлов",
        text = {
          "Создаёт копию {C:attention}#1#",
          "выбранной карты",
          "в руке"
        }
      },
      c_paperback_four_of_wands = {
        name = "Четвёрка Жезлов",
        text = {
          "Добавляет {C:paperback_pink}розовую скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_five_of_wands = {
        name = "Пятёрка Жезлов",
        text = {
          "Уничтожает все карты в руке,",
          "устанавливает деньги на {C:money}$0"
        }
      },
      c_paperback_six_of_wands = {
        name = "Шестёрка Жезлов",
        text = {
          "Улучшает {C:attention}#1#{}",
          "выбранных карт до",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_seven_of_wands = {
        name = "Семёрка Жезлов",
        text = {
          "Даёт {C:attention}жетон разрушения"
        }
      },
      c_paperback_eight_of_wands = {
        name = "Восьмёрка Жезлов",
        text = {
          "Создаёт {C:dark_edition}негативный {C:attention}жетон{},",
          "тратит {C:money}$#1#{} и ещё по {C:money}$#2#{} за каждого",
          "вашего джокера кроме {C:attention}пяти{} первых",
          "{C:inactive}(сейчас: {C:money}$#4#{C:inactive})"
        }
      },
      c_paperback_nine_of_wands = {
        name = "Девятка Жезлов",
        text = {
          "Улучшает {C:attention}#1#{}",
          "выбранные карты до",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_ten_of_wands = {
        name = "Десятка Жезлов",
        text = {
          "Выберите {C:attention}#1#{} карты, уничтожает",
          "{C:attention}две правые{} и добавляет их базовые {C:chips}фишки",
          "к {C:attention}самой левой{} карте",
          "{C:inactive}(Перетащите карты для изменения их порядка)"
        }
      },
      c_paperback_page_of_wands = {
        name = "Посол Жезлов",
        text = {
          "Добавляет {C:attention}оранжевую скрепку{}",
          "к {C:attention}#1#{} выбранным картам"
        }
      },
      c_paperback_knight_of_wands = {
        name = "Рыцарь Жезлов",
        text = {
          "Создаёт {C:mult}волатильный{C:attention} жетон"
        }
      },
      c_paperback_queen_of_wands = {
        name = "Королева Жезлов",
        text = {
          "{C:green}#1# к #2#{} шанс добавить",
          "{C:dark_edition}дихромное{} издание",
          "случайному {C:attention}джокеру"
        }
      },
      c_paperback_king_of_wands = {
        name = "Король Жезлов",
        text = {
          "Создаёт случайного не {C:chips}обычного",
          "и не {C:legendary}легедарного{} джокера"
        }
      },
      c_paperback_ace_of_swords = {
        name = "Туз Мечей",
        text = {
          "Меняет масть",
          "до {C:attention}#1#{} выбранных карт",
          "на {V:1}#2#{}",
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "Туз Пентаклей",
        text = {
          "Меняет масть",
          "до {C:attention}#1#{} выбранных карт",
          "на {V:1}#2#{}",
        }
      }
    },
    Voucher = {
      v_paperback_celtic_cross = {
        name = "Кельтский крест",
        text = {
          "В магазинах после {C:attention}каждого",
          "{C:attention}Босс Блайнда{} будет бесплатный",
          "{C:paperback_minor_arcana}Мега-набор младших арканов"
        }
      },
      v_paperback_soothsay = {
        name = "Предсказание",
        text = {
          "Карты {C:paperback_minor_arcana}Младших Арканов{} могут",
          "появляться в {C:money}Магазине"
        }
      },
    },
    Tag = {
      tag_paperback_angel_investment = {
        name = "Жетон ангельского инвестирования",
        text = {
          "Даёт {C:money}$#1#{} за каждые ваши {C:money}$#2#{}",
          "{C:inactive}(Даст {C:money}$#3#{C:inactive})"
        }
      },
      tag_paperback_divination = {
        name = "Жетон пророчества",
        text = {
          "Даёт бесплатный",
          "{C:paperback_minor_arcana}Мега-набор младших арканов"
        }
      },
      tag_paperback_dichrome = {
        name = "Дихромный жетон",
        text = {
          "Следующий стандартный джокер",
          "в магазине становится бесплатным",
          "и {C:dark_edition}Дихромным"
        }
      },
      tag_paperback_high_risk = {
        name = "Волатильный жетон",
        text = {
          "При выборе {C:attention}Босс Блайнда{} удваивает",
          "требование по очкам и даёт {C:money}$#1#"
        }
      },
      tag_paperback_breaking = {
        name = "Жетон разрушения",
        text = {
          "Отключает {C:attention}Босс Блайнд"
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "Квавар",
      },
      c_paperback_haumea = {
        name = "Хаумеа",
      },
      c_paperback_sedna = {
        name = "Седна",
      },
      c_paperback_makemake = {
        name = "Макемаке",
      },
    },
    Enhanced = {
      m_paperback_ceramic = {
        name = "Керамическая карта",
        text = {
          "Даёт от {C:money}$#1#{} до {C:money}$#2#{}",
          "Имеет шанс {C:green}#3# к #4#{},",
		  "что будет уничтожена"
        }
      },
      m_paperback_soaked = {
        name = "Промокшая карта",
        text = {
          "При подсчёте этой карты, {C:attention}удерживаемые в руке",
          "карты добавляют свои базовые фишки к счёту",
          "Уничтожается с шансом {C:green}#1# к #2#{} при сбросе"
        }
      },
      m_paperback_wrapped = {
        name = "Подарочная карта",
        text = {
          "Даёт {C:money}$#1#{}",
          "без достоинства и масти"
        }
      },
      m_paperback_bandaged = {
        name = "Перевязанная карта",
        text = {
          "Все эффекты {C:attention}соседних карт{} срабатывают ещё раз",
          "Имеет шанс {C:green}#1# к #2#{},",
		  "что будет уничтожена"
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "Дихромный",
        text = {
          "При выборе {C:attention}блайнда{}",
          "даёт {C:attention}+#1#{C:chips} руку{} или {C:mult}сброс",
          "{C:inactive}(Даёт то, чего меньше)"
        }
      }
    },
    Other = {
      paperback_energized = {
        name = "Заряженный",
        text = {
          "Невозможно скопировать с помощью",
          "{C:attention}Единицы энергии джокера{}"
        }
      },
      paperback_light_suits = {
        name = "Светлые масти",
        text = {
          "{C:diamonds}Бубны{}, {C:hearts}Червы{}"
        }
      },
      paperback_dark_suits = {
        name = "Тёмные масти",
        text = {
          "{C:spades}Пики{}, {C:clubs}Трефы{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "Требуются доп. масти",
        text = {
          "Карта удалена по причине",
          "отключения {C:attention}дополнительных мастей{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },
      paperback_requires_enhancements = {
        name = "Требуются улучшения карт",
        text = {
          "Карта удалена по причине",
          "отключения {C:attention}улучшений карт{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },
      paperback_requires_paperclips = {
        name = "Требуются скрепки",
        text = {
          "Карта удалена по причине",
          "отключения {C:attention}скрепок{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },
      paperback_requires_minor_arcana = {
        name = "Требуются младшие арканы",
        text = {
          "Карта удалена по причине",
          "отключения {C:paperback_minor_arcana}Младших Арканов{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },
      paperback_requires_tags = {
        name = "Требуются жетоны",
        text = {
          "Карта удалена по причине",
          "оключения {C:attention}жетонов{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },
      paperback_requires_editions = {
        name = "Требуются издания карт",
        text = {
          "Карта удалена по причине",
          "отключения {C:dark_edition}изданий карт{}",
          "в настройках мода {C:legendary}Paperback",
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "Синяя скрепка",
        text = {
          "{X:chips,C:white}X#1#{} фишек за каждую карту",
          "со {C:attention}скрепкой{}, удерживаемую в руке",
          "{C:inactive}(сейчас: {X:chips,C:white}X#2#{C:inactive} фишек)"
        }
      },
      paperback_red_clip = {
        name = "Красная скрепка",
        text = {
          "{C:mult}+#1#{} множ. за каждую карту",
          "со {C:attention}скрепкой{}, удерживаемую в руке",
          "{C:inactive}(сейчас: {C:mult}+#2#{C:inactive} множ.)"
        }
      },
      paperback_orange_clip = {
        name = "Оранжевая скрепка",
        text = {
          "Даёт {C:money}$#1#{} за каждые",
          "{C:attention}#2# карты со{C:attention} скрепкой{},",
          "удерживаемые в руке",
          "{C:inactive}(сейчас: {C:money}$#3#{C:inactive})"
        }
      },
      paperback_black_clip = {
        name = "Чёрная скрепка",
        text = {
          "При {C:attention}подсчёте{} все эффекты карты срабатывают",
          "ещё раз, если другая карта со скрепкой",
          "есть {C:attention}в сыгранной руке{} и ещё раз, если",
          "карта со скрепкой {C:attention}удерживается в руке"
        }
      },
      paperback_white_clip = {
        name = "Белая скрепка",
        text = {
          "Если {C:attention}удерживается в руке{} в конце раунда,",
          "{C:attention}навсегда{} получает {C:chips}+#1#{} фишку за каждую",
          "подсчитанную в раунде карту со {C:attention}скрепкой{}",
          "{C:inactive}(сейчас: {C:chips}+#2#{C:inactive} фишек)"
        }
      },
      paperback_pink_clip = {
        name = "Розовая скрепка",
        text = {
          "{X:mult,C:white}X#1#{} множ, пока удерживается",
          "в руке, +{X:mult,C:white}X#2#{} за каждую",
          "подсчитанную карту со {C:attention}скрепкой",
		  "{C:inactive}(Эффект не накапливается)"
        }
      },

      -- Minor Arcana
      p_paperback_minor_arcana_normal = {
        name = "Набор младших арканов",
        text = {
          "Выберите и используйте {C:attention}#1#{} из {C:attention}#2#",
          "карт {C:paperback_minor_arcana}Младших Арканов{}"
        }
      },
      p_paperback_minor_arcana_jumbo = {
        name = "Набор младших арканов Джамбо",
        text = {
          "Выберите и используйте {C:attention}#1#{} из {C:attention}#2#",
          "карт {C:paperback_minor_arcana}Младших Арканов{}"
        }
      },
      p_paperback_minor_arcana_mega = {
        name = "Мега-набор младших арканов",
        text = {
          "Выберите и используйте {C:attention}#1#{} из {C:attention}#2#",
          "карт {C:paperback_minor_arcana}Младших Арканов{}"
        }
      },
    },
  },
  misc = {
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "Младший аркан",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "Младшие арканы",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "Набор младших арканов",

      paperback_polychrome_ex = "Полихромный!",
      paperback_destroyed_ex = "Уничтожен!",
      paperback_doubled_ex = "Удвоен!",
      paperback_too_late_ex = "СЛИШКОМ ПОЗДНО!",
      paperback_broken_ex = "Сломан!",
      paperback_none = "Нет",
      paperback_downgrade_ex = "Ухудшен!",
      paperback_copy_ex = "Скопирован!",
      paperback_consumed_ex = "Съеден!",
      paperback_too_hot_ex = "Слишком горячо!",
      paperback_inactive = "Отключён",
      paperback_supplies_ex = "Восстановлен!",
      paperback_melted_ex = "Расплавился!",
      paperback_investment_ex = "Прибыль!",
      paperback_plus_minor_arcana = "+1 Мл. Аркан",
      paperback_plus_consumable = "+1 расходник",
      paperback_edition_ex = "Издание!",

      paperback_ui_requires_restart = "Требуется перезапуск",
      paperback_ui_enable_jokers = "Добавление джокеров",
      paperback_ui_enable_minor_arcana = "Добавление младших арканов",
      paperback_ui_enable_enhancements = "Добавление улучшений карт",
      paperback_ui_enable_editions = "Добавление изданий карт",
      paperback_ui_enable_paperclips = "Добавление скрепок",
      paperback_ui_custom_suits_enabled = "Добавление дополнительных мастей",
      paperback_ui_enable_vouchers = "Добавление купонов",
      paperback_ui_enable_tags = "Добавление жетонов",
      paperback_ui_developers = "Разработчики",
      paperback_ui_artists = "Художники",
      paperback_ui_localization = "Переводчики",
      paperback_ui_paperclips = "Скрепки",
    },
    v_dictionary = {
      paperback_a_discards = "+#1# сброс",
      paperback_a_discards_minus = "-#1# сброс",
      paperback_a_hands_minus = "-#1# рука",
      paperback_prince_of_darkness = "+#1# множ., +#2# фишек",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1# раунд"
    },
    suits_singular = {
      paperback_Crowns = "Корона",
      paperback_Stars = 'Звезда'
    },
    suits_plural = {
      paperback_Crowns = "Короны",
      paperback_Stars = 'Звёзды'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "Спектр",
      ['paperback_Straight Spectrum'] = "Стрит-спектр",
      ['paperback_Straight Spectrum (Royal)'] = "Спектр-рояль",
      ['paperback_Spectrum House'] = "Спектр-хаус",
      ['paperback_Spectrum Five'] = "Спектр-покер",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5 карт разных мастей"
      },
      ['paperback_Straight Spectrum'] = {
        "5 карт в ряд (по достоинству),",
        "все разных мастей"
      },
      ['paperback_Spectrum House'] = {
        "Сет и пара, все карты разных мастей",
      },
      ['paperback_Spectrum Five'] = {
        "5 карт с одинаковым достоинством,",
        "все разных мастей"
      },
    },
    labels = {
      paperback_blue_clip = "Синяя скрепка",
      paperback_red_clip = "Красная скрепка",
      paperback_orange_clip = "Оранжевая скрепка",
      paperback_pink_clip = "Розовая скрепка",
      paperback_black_clip = "Чёрная скрепка",
      paperback_white_clip = "Белая скрепка",
      paperback_dichrome = "Дихромный",
    }
  }
}
