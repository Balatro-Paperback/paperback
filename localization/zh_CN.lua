return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "纸质牌组",
        text = {
          "{C:legendary}Paperback{}模组{C:attention}小丑{}",
          "出现频率{C:attention}X3",
          "开局带有",
          "{C:attention,T:j_paperback_shopping_center}#1#{}小丑"
        }
      },
      b_paperback_proud = {
        name = "骄傲牌组",
        text = {
          "初始牌组带有一整副",
          "{C:hearts}红桃{}、{C:diamonds}方片{}、{C:spades}黑桃",
          "{C:clubs}梅花{}、{C:paperback_crowns}皇冠{}和{C:paperback_stars}银星"
        },
        unlock = {
          "打出一手{C:attention}光谱"
        }
      },
      b_paperback_silver = {
        name = "银色牌组",
        text = {
          "开局拥有",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}优惠券",
          "和一张{C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        },
        unlock = {
          "发现{C:attention}#1#{}张",
          "{C:paperback_minor_arcana,E:1}塔罗辅牌"
        },
      },
      b_paperback_dreamer = {
        name = "逐梦者牌组",
        text = {
          "开局带有一张",
          "{C:paperback_temporary}临时{}的{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "小丑牌槽位{C:attention}#2#{}"
        },
        unlock = {
          "在{V:1}#1#{}或以上",
          "难度以任一牌组",
          "赢得一局",
        }
      },
      b_paperback_antique = {
        name = "古董牌组",
        text = {
          "{C:tarot}秘术包{}不再",
          "出现在商店中",
          "{C:paperback_minor_arcana}秘仪包",
          "出现频率{C:attention}X3{}"
        },
        unlock = {
          "发现所有",
          "{C:paperback_minor_arcana,E:1}塔罗辅牌"
        },
      },
      b_paperback_passionate = {
        name = "激昂牌组",
        text = {
          "每次击败{C:attention}Boss盲注{}后",
          "获得一个{C:attention,T:tag_paperback_high_risk}#1#",
          "不再赚取{C:money}利息"
        },
        unlock = {
          "在{V:1}#1#{}或以上",
          "难度以任意牌组",
          "赢得一局",
        }
      },
      b_paperback_shimmering = {
        name = "微光牌组",
        text = {
           "小丑牌槽位{C:red}#2#",
          "每持有一种{C:attention}罪名",
          "使消耗牌槽位{C:attention}+#1#",
          "{C:paperback_ego_gift}E.G.O提取包{}出现频率{C:attention}X5",
        },
        unlock = {
          "售出{C:attention}#1#{}个",
          "{C:paperback_ego_gift}E.G.O饰品{}"
        },
      },
    },
    Blind = {
      bl_paperback_quarter = {
        name = "四分",
        text = {
          "#1#/#2#的牌",
          "被削弱"
        },
      },
      bl_paperback_half = {
        name = '二分',
        text = {
          '所有标出',
          '的几率减半'
        }
      },
      bl_paperback_whole = {
        name = '全音符',
        text = {
          '本底注未计分的',
          '点数被削弱'
        }
      },
      bl_paperback_rest = {
        name = '休止',
        text = {
          '#1#/#2#的数字牌',
          '以背面朝上抽取'
        }
      },
      bl_paperback_flat = {
        name = '降号',
        text = {
          '降低打出的',
          '牌的点数'
        }
      },

      bl_paperback_sharp = {
        name = '升号',
        text = {
          '升高打出的',
          '牌的点数'
        }
      },
      bl_paperback_natural = {
        name = '还原',
        text = {
          '请出最低等级的牌型',
          '否则削弱所有记分牌',
        }
      },
      bl_paperback_coda = {
        name = '尾声',
        text = {
          '所有种类的',
          '卡牌无法移动',
        }
      },
      bl_paperback_hold = {
        name = "延停",
        text = {
          "所有卡牌背面朝上抽取",
          "背面朝上的卡牌",
          "打出后回到手牌并翻面"
        }
      },
      bl_paperback_glissando = {
        name = "滑音",
        text = {
          "低于本回合",
          "计分的最高点数的",
          "点数的牌被削弱"
        }
      },
      bl_paperback_misty_bass = {
        name = "雾隐低声",
        text = {
          "洗乱所有小丑牌",
          "并固定最左侧的"
        }
      },
      bl_paperback_taupe_treble = {
        name = '褐调高声',
        text = {
          '所有无增强的',
          '卡牌被削弱'
        }
      },
    },
    Joker = {
      j_paperback_showdown = {
        name = "决战",
        text = {
          "留在手牌中的",
          "每一张{V:1}#1#{}牌和{V:2}#2#{}牌",
          "有{C:green}#3#/#4#{}的几率给予{C:money}$#5#",
        }
      },
      j_paperback_golden_egg = {
        name = "金蛋",
        text = {
          "打出{C:attention}隐藏牌型{}时",
          "获得等于右侧{C:attention}小丑牌",
          "售价的资金"
        },
        unlock = {
          "赢一局且",
          "最常用牌型是",
          "{C:attention,E:1}隐藏牌型"
        }
      },
      j_paperback_burning_pact = {
        name = "燃烧契约",
        text = {
          "如果只弃掉{C:attention}#1#{}张牌",
          "额外抽取{C:attention}#2#{}张牌"
        }
      },
      j_paperback_blade_dance = {
        name = "刀刃之舞",
        text = {
          "选择{C:attention}盲注{}时",
          "将{C:attention}#1#{}张{C:paperback_temporary}临时{}的{C:attention}#2#",
          "添加到手牌中"
        }
      },
      j_paperback_claw = {
        name = "爪击",
        text = {
          "计分的{C:attention}#1#{}给予{C:mult}+#3#{}倍率",
          "本回合每有一张{C:attention}#1#{}计分",
          "提高{C:mult}+#2#{}倍率",
        }
      },
      j_paperback_chaplin = {
        name = "卓别林",
        text = {
          "购买{C:attention}优惠券{}时",
          "同时兑换它的",
          "{C:attention}升级版本"
        },
        unlock = {
          "{E:1,s:1.3}?????",
        }
      },
      j_paperback_milk_tea = {
        name = "奶茶",
        text = {
          "{C:purple}平衡{}{C:attention}#1#%{}的{C:chips}筹码{}与{C:mult}倍率",
          "如果一手牌的最终的",
          "{C:mult}倍率{}超过{C:chips}筹码{}",
          "此牌的数值降低{C:attention}#2#%"
        }
      },
      j_paperback_nichola = {
        name = "尼科拉",
        text = {
          "打出的牌计分后",
          "使{C:attention}{C:attention}手牌中{}的",
          "人头牌计分"
        },
        unlock = {
          "{E:1,s:1.3}?????",
        }
      },
      j_paperback_the_dynasty = {
        name = "王朝",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#2#",
          "{X:mult,C:white}X#1#{}倍率"
        }
      },
      j_paperback_lurid_joker = {
        name = "艳丽小丑",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#2#",
          "{C:chips}+#1#{}筹码"
        }
      },
      j_paperback_zealous_joker = {
        name = "热情小丑",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#2#",
          "{C:mult}+#1#{}倍率"
        }
      },
      j_paperback_deviled_egg = {
        name = "调味蛋",
        text = {
          "回合的第一张",
          "记分牌变成{C:attention}黄金牌",
          "{C:attention}#1#{}回合后吃完"
        }
      },
      j_paperback_golden_apple = {
        name = "金苹果",
        text = {
          "接下来的{C:attention}#2#{}个回合中",
          "牌组中每有一张{C:attention}增强牌",
          "回合结束时获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#3#{C:inactive}）",
        },
        unlock = {
          "牌组中有{C:attention}#1#{}张",
          "或更多的{C:attention}黄金A",
        }
      },
      j_paperback_pear = {
        name = "梨子",
        text = {
          "如果打出的牌中包含{C:attention}#1#",
          "这张小丑牌获得{C:chips}+#2#筹码",
          "否则{C:chips}-#3#{}筹码",
          "筹码在0以下会被吃完",
          "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码）"
        }
      },
      j_paperback_teapot = {
        name = "茶壶",
        text = {
          "每有一张{C:attention}#2#{}计分",
          "这张小丑牌获得{C:blue}+#1#{}筹码",
          "{C:inactive}（当前为{C:blue}+#3#{C:inactive}筹码）"
        }
      },
      j_paperback_the_one_who_waits = {
        name = "待终冠主",
        text = {
          "当一张{V:1}#1#{}牌计分时，这张",
          "小丑牌有{C:green}#2#/#3#{}的几率获得{X:mult,C:white}X#4#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#8#{C:inactive}倍率）",
          "以及{C:green}#5#/#6#{}的几率生成一张{C:tarot}#7#",
          "{C:inactive}（必须有空位）",
        }
      },
      j_paperback_blood_rain = {
        name = "血雨",
        text = {
          "将{C:attention}#1#{}的效果改为",
          "手牌给予等于自身点数的",
          "{C:mult}倍率{}，而不再给予{C:chips}筹码"
        }
      },
      j_paperback_pinot_noir = {
        name = "黑皮诺",
        text = {
          "在接下来的{C:attention}#1#{}次",
          "{C:attention}#2#{}触发时",
          "给予的永久倍率再{C:mult}+#3#{}"
        }
      },
      j_paperback_jestosterone = {
        name = "雄激素",
        text = {
          "计分的{C:attention}#1#",
          "变成{C:attention}#2#"
        }
      },
      j_paperback_jestrogen = {
        name = "雌激素",
        text = {
          "计分的{C:attention}#1#{}和{C:attention}#2#",
          "变成{C:attention}#3#"
        }
      },
      j_paperback_langely = {
        name = "朗热利",
        text = {
          "击败{C:attention}大盲注{}时，获得",
          "拥有小丑牌{C:money}售价{}一半的资金",
          "击败{C:attention}Boss盲注{}时，获得",
          "拥有小丑牌{C:money}售价{}总和的资金",
        },
        unlock = {
          "{E:1,s:1.3}?????",
        }

      },
      j_paperback_pedrillo = {
        name = "佩德里洛",
        text = {
          "打出的{C:attention}Q",
          "在计分时生成一张",
          "打出{C:attention}牌型{}的{C:planet}星球牌",
          "{C:inactive}（必须有空位）"
        },
        unlock = {
          "{E:1,s:1.3}?????",
        }
      },
      j_paperback_double_dutchman = {
        name = "双层芝士肉堡",
        text = {
          "在接下来的{C:attention}#3#{}次出牌中",
          "{C:attention}手牌中{}的每张牌",
          "都有{C:green}#1#/#2#{}的几率获得一种随机{C:attention}增强",
          "以及{C:green}#1#/#2#{}的几率获得一种随机{C:attention}蜡封"
        }
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds = {
        name = "一罪与百善",
        text = {
          "计分的{C:attention}3{}和{C:attention}无点数{}牌",
          "给予{C:mult}+#1#{}倍率",
          '{C:inactive}"它以罪孽为食"',
        },
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds_fed = {
        name = "{C:red}一罪与百善{}",
        text = {
          "牌组内每{C:attention}剩余{}一张牌",
          "计分的{C:attention}3{}和{C:attention}无点数{}牌",
          "给予{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_paperback_white_night = {
        name = "白夜",
        text = {
          "计分的{C:attention}使徒{}给予{X:mult,C:white}X#1#{}倍率",
          "{C:red}摧毁{}计分的非{C:attention}使徒{}牌",
          "{C:red}摧毁{}所有弃掉的{C:attention}使徒",
          "如果打出的牌中没有{C:attention}使徒",
          "随机{C:red}摧毁{}一张小丑牌"
        },
        unlock = {
          "牌组中拥有",
          "{C:attention}#1#{}张或更多{C:attention,E:1}使徒",
        }
      },
      j_paperback_as_above_so_below = {
        name = "天上人间",
        text = {
          "打出带有{C:attention}使徒{}的{C:attention}5牌{}牌型时",
          "生成一张{C:purple}塔罗牌",
          "如果牌型中同时还包含{C:attention}顺子",
          "改为生成一张{C:spectral}幻灵牌",
          "{C:inactive}（必须有空位）"
        },
        unlock = {
          "打出一手",
          "{C:attention,E:1}被提同花顺"
        }
      },
      j_paperback_plague_doctor = {
        name = "瘟疫医生",
        text = {
          "如果打出#2#",
          "将记分牌变成{C:attention}使徒",
          "留在手牌中的每张{C:attention}使徒",
          "都给予{X:mult,C:white}X#1#{}倍率"
        },
        unlock = {
          "发现{C:attention}#1#{}个",
          "{C:paperback_ego_gift,E:1}E.G.O饰品"
        },
      },
      j_paperback_king_me = {
        name = "升格为王",
        text = {
          "使计分的",
          "非{C:attention}K{V:1}#1#{}牌",
          "的点数提高{C:attention}#2#",
        }
      },
      j_paperback_gambit = {
        name = "弃子开局",
        text = {
          "如果记分牌中包含{V:1}#1#{}牌",
          "{C:attention}摧毁{}手牌中{}第一张非{V:1}#1#{}牌",
          "将其自身{C:chips}筹码{}的两倍",
          "加到第一张计分的{V:1}#1#{}牌上",
        }
      },
      j_paperback_solar_eclipse = {
        name = "日食",
        text = {
          "将计分的{C:paperback_light_suit}亮花色{}牌",
          "的花色转为{V:1}#1#"
        }
      },
      j_paperback_prism = {
        name = "棱镜",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#1#",
          "将所有{C:attention}记分牌{}的",
          "花色转为随机{C:attention}花色"
        },
        unlock = {
          "一次出牌",
          "打出{C:attention,E:1}#1#{}张",
          "万能牌"
        }
      },
      j_paperback_master_spark = {
        name = "极限火花",
        text = {
          "如果打出的牌中包含{C:attention}光谱",
          "为所有打出的牌",
          "在计分后添加{C:dark_edition}多彩{}版本",
          "并摧毁所有{C:attention}手牌中{}的牌",
          "{S:1.1,C:red,E:2}自毁",
        }
      },
      j_paperback_j_and_js = {
        name = "J&J软糖",
        text = {
          "如果打出的牌中",
          "包含{C:attention}光谱",
          "生成{C:attention}#1#{}个随机{C:attention}标签",
          "{C:attention}#2#{}回合后吃完",
        }
      },
      j_paperback_blue_star = {
        name = "碧蓝新星",
        text = {
          "每有一张{V:1}#2#{}牌计分",
          "这张小丑牌获得{X:chips,C:white}X#1#{}筹码",
          "每有一张{V:2}#4#{}牌计分",
          "这张小丑牌失去{X:chips,C:white}X#3#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#5#{C:inactive}筹码）"
        }
      },
      j_paperback_shadowmantle = {
        name = "暗影斗篷", -- 原注：英文版并未拼错，三角符文中该装备拼写即无空格
        text = {
          "打出的{V:1}#1#{}牌在计分时",
          "有{C:green}#2#/#3#{}的几率",
          "生成一个{C:dark_edition}负片{}标签",
        }
      },
      j_paperback_shooting_star = {
        name = "流星",
        text = {
          "打出的{V:1}#1#{}牌在计分时",
          "有{C:green}#2#/#3#{}的几率生成",
          "一张打出牌型的{C:planet}星球牌",
        }
      },
      j_paperback_black_star = {
        name = "黑星",
        text = {
          "将计分的{C:paperback_dark_suit}暗花色{}牌",
          "的花色转为{V:1}#1#"
        }
      },
      j_paperback_high_speed_rail = {
        name = "高速铁路",
        text = {
          "这张小丑牌",
          "{C:blue}获得{}等于{C:blue}购买{}小丑牌",
          "所花费{C:money}资金{}的倍率",
          "{C:red}失去{}等于{C:red}售出{}小丑牌",
          "所赚取{C:money}资金{}的倍率",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
        }
      },
      j_paperback_small_scale_onshore_wind = {
        name = "小型陆上风电",
        text = {
          "弃牌张数为{C:attention}#2#{}时",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "若张数不是{C:attention}#2#{}则{C:red}重置{}倍率",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
        }
      },
      j_paperback_aurora_borealis = {
        name = "北极光",
        text = {
          "每有一张{C:attention}带有版本{}的小丑牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "不包括{C:dark_edition}负片{}版本",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        },
        unlock = {
          "同时拥有{E:1,C:attention}#1#{}张",
          "{C:dark_edition}多彩{}版本的",
          "小丑牌",
        },
      },
      j_paperback_joke_master = {
        name = "玩笑大师",
        text = {
          "如果出牌牌型为{C:attention}#2#",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "回合结束时改变牌型",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
        }
      },
      j_paperback_jokers_11 = {
        name = "小丑十一人",
        text = {
          "击败{C:attention}Boss盲注{}时",
          "手牌中每留有一张{C:attention}A",
          "随机生成一个{C:attention}标签",
        },
        unlock = {
          "牌组中有",
          "{C:attention}#1#{}张A",
        }
      },
      j_paperback_book_of_life = {
        name = "生命之书",
        text = {
          "跳过或击败{C:attention}盲注{}时",
          "有{C:green}#1#/#2#{}的几率",
          "复制所获得的{C:attention}标签",
        }
      },
      j_paperback_hamsa = {
        name = "法蒂玛之手",
        text = {
          "每回合的{C:attention}第一次出牌{}中",
          "重新触发",
          "打出的前{C:attention}#1#{}张牌…",
        },
        unlock = {
          "输掉一局"
        }
      },
      j_paperback_hamsa_r = {
        name = "法蒂玛之手（倒置）",
        text = {
          "…每回合的{C:attention}最后一次{}出牌中",
          "所有{C:green}标出的几率{}中",
          "分子{C:green}+#1#",
        },
        unlock = {
          "带有{C:attention}#1#{}",
          "{C:attention}#2#{}个回合",
        }
      },
      j_paperback_hamsa_r_collection = {
        name = "法蒂玛之手（倒置）",
        text = {
          "…回合的{C:attention}最后一次{}出牌中",
          "所有{C:green}标出的几率{}中",
          "分子{C:green}+#1#",
        },
        unlock = {
          "带有{C:attention}#1#{}",
          "{C:attention}#2#{}个回合",
        }
      },
      j_paperback_nazar = {
        name = "邪眼",
        text = {
          "每使用一张",
          "{C:paperback_minor_arcana}塔罗辅牌{}或{C:tarot}塔罗牌",
          "这张小丑牌获得{C:chips}+#1#{}筹码", 
          "{C:inactive}（当前为{C:chips}+#2#{}{C:inactive}筹码）",
        },
        unlock = {
          "发现所有{E:1,C:tarot}塔罗牌",
          "和{E:1,C:paperback_minor_arcana}塔罗辅牌",
        }
      },
      j_paperback_oujia_board = {
        name = "占卜板",
        text = {
          "商店中可能",
          "出现{C:spectral}幻灵牌",
          "在计分前",
          "{C:attention}洗乱{}所有小丑牌",
        },
        unlock = {
          "使用一次{C:attention}占卜",
          "{C:spectral}幻灵牌",
        }
      },
      j_paperback_planchette = {
        name = "通灵板指针",
        text = {
          "每使用一张{C:spectral}幻灵牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
        unlock = {
          "一局内使用",
          "{C:attention}#1#{}张{C:spectral}幻灵牌",
        }
      },
      j_paperback_prescript = {
        name = "预先规定",
        text = {
          "如果回合的{C:attention}第一次出牌",
          "包含{C:attention}#1#{}，{C:attention}本回合{}所有",
          "记分牌都会被重新触发",
          "回合结束时改变牌型",
          "{C:inactive}（{V:1}#2#{C:inactive}）",
        },
      },
      j_paperback_ultra_rare = {
        name = "超稀有",
        text = {
          "选择{C:attention}盲注{}时",
          "随机生成售价为{C:money}$#1#{}的",
          "{C:blue}普通{}、{C:green}罕见{}和{C:red}稀有{}小丑牌各一张",
          "并为它们添加{C:dark_edition}负片{}版本和{C:paperback_temporary}临时",
        }
      },
      j_paperback_manilla_folder = {
        name = "黄皮文件夹",
        text = {
          "完整牌组中",
          "每有一种{C:attention}别针",
          "回合结束时获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
        }
      },
      j_paperback_clippy = {
        name = "大眼夹",
        text = {
          "选择{C:attention}盲注{}时",
          "为牌组中一张随机的卡牌",
          "加上随机{C:attention}别针",
        }
      },
      j_paperback_jimbos_joyous_joker_jamboree = {
        name = "金宝的快乐小丑狂欢会",
        text = {
          "每有{C:attention}#1#{C:inactive}[#2#]{}张牌计分",
          "生成一张随机的{C:paperback_minor_arcana}塔罗辅牌",
          "{C:inactive}（必须有空间）",
        },
        unlock = {
          "牌组中有",
          "{C:attention,E:1}#1#{}种或更多",
          "{C:attention,E:1}花色"
        }
      },
      j_paperback_one_shift_more = {
        name = "轮班之歌",
        text = {
          "每有{C:attention}#2#{C:inactive}[#3#]{}张{C:hearts}#5#{}牌计分",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#4#{C:inactive}倍率）",
        },
      },
      j_paperback_the_normal_joker = {
        name = "平凡小丑",
        text = {
          "重新触发所有",
          "{C:blue}普通{C:attention}小丑牌"
        }
      },
      j_paperback_insurance_policy = {
        name = "保险单",
        text = {
          "完整牌组中",
          "每有一张{C:attention}J{}则{C:mult}+#1#{}倍率",
          "每有一张{C:attention}K{}则{C:mult}-#1#{}倍率",
          "{C:inactive}（当前为{C:mult}#2#{C:inactive}倍率）",
        }
      },
      j_paperback_jimbos_inferno = {
        name = "金宝的地狱",
        text = {
          "打出的{C:paperback_dark_suit}暗花色{}牌",
          "在计分时给予{C:mult}+#2#{}倍率",
          "每有一张{C:paperback_dark_suit}暗花色{}牌",
          "{C:attention}留在手牌中",
          "提高{C:mult}+#1#{}倍率",
        }
      },
      j_paperback_tome = {
        name = "大部头书",
        text = {
          "你的小丑牌",
          "每有一种{C:attention}稀有度",
          "消耗牌槽位{C:attention}+#1#",
          "{C:inactive}（当前槽位{C:attention}+#2#{C:inactive}）",
        }
      },
      j_paperback_better_call_jimbo = {
        name = "风骚金宝",
        text = {
          "每拥有{C:money}$#2#",
          "获得{X:mult,C:white}X#1#{}倍率",
          "不再赚取{C:money}利息",
          "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）"
        }
      },
      j_paperback_touch_tone_joker = {
        name = "按键电话小丑",
        text = {
          "打开{C:tarot}秘术{C:paperback_minor_arcana}(仪){C:tarot}包{}、",
          "{C:planet}天体包{}或{C:spectral}幻灵包{}时",
          "将其中的{C:attention}第一张牌",
          "转移到你的消耗栏",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_joker_cd_i = {
        name = '小丑CD-i',
        text = {
          "如果打出的牌正好是{C:attention}#3#{}张牌",
          "有{C:green}#1#/#2#{}的几率生成一张",
          "随机的{C:planet}星球牌",
          "{C:inactive}（必须有空间）"
        }
      },
      j_paperback_determination = {
        name = '决心',
        text = {
          "避免一次死亡",
          "之后手牌上限{C:attention}#1#{}",
          "底注{C:attention}#1#{}并{C:red}自毁"
        }
      },
      j_paperback_blue_marble = {
        name = "蓝色大理石",
        text = {
          "每使用一张{C:planet}星球牌",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        }
      },
      j_paperback_boundary_of_death = {
        name = "生死界限",
        text = {
          "{C:attention}#1#{}有",
          "{C:green}#2#/#3#{}的几率",
          "额外给予{C:red}+#4#{}倍率"
        }
      },
      j_paperback_festive_joker = {
        name = "节日小丑",
        text = {
          "{C:attention}#1#{}在计分时",
          "有{C:green}#2#/#3#{}的几率生成",
          "一张随机的{C:attention}消耗牌",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_collector = {
        name = "收藏家",
        text = {
          "完整牌组中",
          "每有一张{C:attention}#2#",
          "回合结束时获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#3#{C:inactive}）"
        }
      },
      j_paperback_spotty_joker = {
        name = "斑点小丑",
        text = {
          "每打出一张计分的{C:attention}#2#",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#3#{}{C:inactive}倍率）"
        }
      },
      j_paperback_sommelier = {
        name = "侍酒师",
        text = {
          "如果回合的{C:attention}第一次弃牌",
          "包含一张{C:attention}#1#{}",
          "给它加上随机{C:attention}蜡封",
        },
        unlock = {
          "打出一张",
          "带有{C:attention,E:1}红色蜡封{}的",
          "{C:attention,E:1}污渍牌",
        },
      },
      j_paperback_medic = {
        name = "医护兵",
        text = {
          "{C:attention}#1#",
          "额外再触发一次",
          "相邻卡牌"
        }
      },
      j_paperback_matcha = {
        name = "抹茶",
        text = {
          "每有一张牌计分",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "{C:red}弃牌{}时有{C:green}#2#/#3#{}的几率喝完",
          "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码）"
        }
      },
      j_paperback_you_are_a_fool = {
        name = "你这个傻瓜!",
        text = {
          "如果记分牌中包含{C:attention}#1#{}张",
          "或更多{C:attention}人头牌",
          "将{C:attention}所有{}留在手牌中的牌",
          "变成{C:attention}最左侧{}的记分牌",
          "{S:1.1,C:red,E:2}自毁",
        }
      },
      j_paperback_kintsugi_joker = {
        name = "金缮小丑",
        text = {
          "每摧毁一张{C:attention}#2#",
          "使{C:attention}#2#{}的收益增加{C:money}$#1#",
          "{C:inactive}（当前已增加{C:money}$#3#{C:inactive}）"
        }
      },
      j_paperback_ddakji = {
        name = "翻纸牌",
        text = {
          "{C:green}#1#/#2#{}的卡牌以背面朝上抽取",
          "如果记分牌中包含一张{C:attention}正面朝上",
          "的牌和一张{C:attention}背面朝上{}的牌",
          "则随机生成一张消耗牌",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_weather_radio = {
        name = "天气收音机",
        text = {
          "如果打出的牌中包含{C:attention}#2#",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "在{C:attention}Boss盲注{}中，如果已有{X:mult,C:white}X#3#{}倍率或更高",
          "则失去{X:mult,C:white}X#4#{}倍率，然后消除{C:attention}Boss盲注{}的限制",
          "回合结束时改变牌型",
          "{C:inactive}（当前为{X:mult,C:white}X#5#{C:inactive}倍率）",
        }
      },
      j_paperback_power_surge = {
        name = "电能激增",
        text = {
          "打出的{C:attention}#1#{}在计分时",
          "给予{X:mult,C:white}X#2#{}倍率",
          "并且有{C:green}#3#/#4#{}的几率",
          "随机{C:red}摧毁{}一张手牌"  -- 译者注：一次删牌的上限为4
        }
      },
      j_paperback_time_regression_mix = {
        name = "时光回溯MIX",
        text = {
          "如果打出的牌中包含",
          "至少{C:attention}#1#{}种花色的记分牌",
          "这张小丑牌获得{C:mult}+#2#{}倍率",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）",
        }
      },

      j_paperback_bismuth = {
        name = "铋矿",
        text = {
          "打出的{V:1}#1#{}牌和{V:2}#2#{}牌",
          "有{C:green}#3#/#4#{}的几率获得",
          "{C:dark_edition}闪箔{}、{C:dark_edition}镭射{}或{C:dark_edition}多彩{}版本",
        },
        unlock = {
          "发现一种",
          "{C:paperback_crowns,E:1}新{C:paperback_stars,E:1}花色",
        }
      },
      j_paperback_deadringer = {
        name = "夺命双铃",
        text = {
          "重新触发一次",
          "计分的{C:attention}#1#{}和{C:attention}#2#",
          "重新触发两次",
          "计分的{C:attention}#3#"
        }
      },
      j_paperback_penumbra_phantasm = {
        name = "半影幻象",
        text = {
          "{C:attention}人头牌{}被视为{C:attention}无点数牌",
          "每有一张{C:attention}无点数牌{}计分",
          "这张小丑牌获得{C:red}+#1#{}倍率",
          "{C:inactive}（当前为{C:red}+#2#{C:inactive}倍率）"
        }
      },
      j_paperback_ncj = {
        name = "无版权小丑",
        text = {
          "所有其他小丑",
          "每有{C:money}$1{}的{C:attention}售价",
          "获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      j_paperback_full_moon = {
        name = "满月",
        text = {
          "使用{C:planet}星球牌{}时",
          "有{C:green}#1#/#2#{}的几率",
          "{C:attention}再升级{}一次牌型",
        }
      },
      j_paperback_sake_cup = {
        name = "清酒杯",
        text = {
          "出牌时，{C:attention}留在手牌{}中的",
          "每张{C:attention}#1#{}有{C:green}#2#/#3#{}的几率",
          "生成一张与打出{C:attention}牌型",
          "对应的{C:planet}星球牌",
          "{C:inactive}（必须有空位）"
        },
        unlock = {
          "Get any {C:attention,E:1}poker hand{}",
          "to level {C:attention,E:1}#1#{}"
        }
      },
      j_paperback_resurrections = {
        name = "复苏",
        text = {
          "每次售出{C:attention}小丑牌{}时",
          "这张小丑牌有{C:green}#1#/#2#{}的几率",
          "永久{C:attention}变成{}被售出的小丑牌",
          "并再生成一张售价为{C:money}-$#3#{}的",
          "{C:dark_edition}负片{}版本的被售出的小丑牌",
          "未成功触发时，分子{C:green}+#4#",
        }
      },
      j_paperback_book_of_vengeance = {
        name = "复仇账簿",
        text = {
          "击败{C:attention}Boss盲注{}后",
          "摧毁左侧的{C:attention}小丑牌",
          "复制右侧的{C:attention}小丑牌",
          "然后自毁"
        }
      },
      j_paperback_b_soda = {
        name = "喷射汽水",
        text = {
          "选择{C:attention}盲注{}时",
          "出牌次数{C:blue}+#1#",
          "以剩余{C:blue}0{}次出牌",
          "击败{C:attention}盲注{}时喝完",
        }
      },
      j_paperback_angel_investor = {
        name = "天使投资人",
        text = {
          "跳过{C:attention}盲注{}或",
          "击败{C:attention}Boss盲注{}时",
          "生成一个{C:money}天使投资标签"
        }
      },
      j_paperback_der_freischutz = {
        name = "魔弹射手",
        text = {
          "如果打出的牌型中仅包含{C:attention}7",
          "在完整牌组中摧毁一张",
          "自身筹码{C:attention}最低{}的非{C:attention}7{}牌",
          "{C:inactive}避开第七颗魔弹… #1#/#2#",
        }
      },
      j_paperback_marble_soda = {
        name = "弹珠汽水",
        text = {
          "计分的{C:attention}#1#{}",
          "额外给予{X:mult,C:white}X#2#{}倍率",
          "摧毁{C:attention}#3#{}张游戏牌后喝完"
        }
      },
      j_paperback_vacation_juice = {
        name = "度假果汁",
        text = {
          "第一次击败某个{C:attention}盲注{}后",
          "可以{C:attention}再次选择{}该盲注",
          "触发{C:attention}#1#{}次后喝完",
        },
        unlock = {
          "使用{C:attention}#1#",
          "赢一局"
        }
      },
      j_paperback_black_forest_cake = {
        name = "黑森林蛋糕",
        text = {
          "击败{C:attention}盲注{}时",
          "这张小丑牌获得{C:mult}+#2#{}倍率",
          "{C:attention}摧毁{}任意一张牌时{C:red,E:1}自毁",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
        }
      },
      j_paperback_ice_cube = {
        name = "冰块",
        text = {
          "选择{C:attention}盲注{}时",
          "出牌次数{C:blue}+#1#",
          "{C:attention}分数着火{}时融化",
        },
        unlock = {
          "同时拥有{C:attention,E:1}#1#{}张",
          "食物小丑牌"
        }
      },
      j_paperback_champagne = {
        name = "香槟",
        text = {
          "在{C:attention}Boss盲注{}中",
          "所有牌在计分时获得{C:money}$#1#{}",
          "如果带有{C:attention}蜡封{}则{C:attention}翻倍",
          "{C:attention}#2#{}回合后喝完"
        }
      },
      j_paperback_pocket_pair = {
        name = "口袋对子",
        text = {
          "回合开始时",
          "每抽出一组{C:attention}#2#",
          "获得{C:money}$#1#"
        },
        unlock = {
          "赢一局",
          "且最常用牌型是",
          "{C:attention,E:1}#1#"
        }
      },
      j_paperback_the_quiet = {
        name = "静谧",
        text = {
          "在牌组中",
          "每比完整的{C:attention}#2#{}张牌少一张",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）"
        },
        unlock = {
          "赢一局",
          "且{C:attention,E:1}消耗牌槽位",
          "{C:attention,E:1}从未{}有过一张牌"
        }
      },
      j_paperback_alert = {
        name = "警报",
        text = {
          "如果{C:attention}出牌{}只有",
          "一张单独的{C:attention}人头牌",
          "则摧毁这张人头牌",
          "{C:inactive}（#1#/#2#）？"
        }
      },
      j_paperback_legacy = {
        name = "遗产",
        text = {
          "当一张不带有{C:attention}增强{}的牌",
          "被摧毁时，这张小丑牌获得",
          "等于摧毁牌自身{C:chips}筹码{}的{C:mult}倍率",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
        },
        unlock = {
          "{E:1,s:1.3}?????",
        }
      },
      j_paperback_telamon = {
        name = "特拉蒙",
        text = {
          "如果{C:attention}击败盲注{}的出牌",
          "包含{C:attention}#1#{}",
          "随机生成一张",
          "{C:attention}宝剑{}花色的{C:paperback_minor_arcana}#2#",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_backpack = {
        name = "背包",
        text = {
          "每个{C:money}商店",
          "额外上架一个",
          "免费的{C:attention}小丑包"
        }
      },
      j_paperback_roulette = {
        name = "轮盘",
        text = {
          "每次出牌，这张小丑牌随机",
          "选择一种未知的{C:attention}点数{}与{C:attention}花色",
          "打出的牌在计分时，如果匹配花色",
          "则获得{C:money}$#1#{}，如果匹配点数则获得{C:money}$#2#",
          "二者都匹配则获得{C:money}$#3#",
        },
        unlock = {
          "打出一手",
          "{C:attention,E:1}光谱五条"
        }
      },
      j_paperback_mexican_train = {
        name = "墨西哥火车",
        text = {
          "打出的牌中",
          "每包含一张{C:attention}#1#",
          "计分的{C:attention}#1#{}给予{C:money}$#2#",
          "{C:inactive}（当前为{C:money}$#3#{C:inactive}）"
        }
      },
      j_paperback_chocolate_joker = {
        name = "巧克力小丑",
        text = {
          "每拥有一张{C:attention}小丑牌",
          "获得{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）"
        }
      },
      j_paperback_mandela_effect = {
        name = "曼德拉效应",
        text = {
          "每次出牌为{C:attention}第一张",
          "计分的{C:attention}人头牌",
          "添加随机{C:attention}增强"
        }
      },
      j_paperback_gauze = {
        name = "纱布",
        text = {
          "如果回合的最后一次",
          "弃牌只有一张牌",
          "将其变成{C:attention}#1#"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "虚无弄臣",
        text = {
          "{C:attention}削弱{}所有与{C:attention}最后一张",
          "记分牌花色相同的牌",
          "完整牌组中每有一张{C:attention}削弱牌",
          "获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前削弱{V:1}#2#{C:inactive}，{C:mult}+#3#{C:inactive}倍率）",
        },
        unlock = {
          "打出一手牌",
          "其中包含{C:attention,E:1}#1#{}张",
          "{C:attention,E:1}削弱牌"
        }
      },
      j_paperback_forgery = {
        name = "赝品",
        text = {
          "每次出牌复制一张随机{C:attention}小丑牌",
          "如果它给予{X:mult,C:white}X倍率{}、",
          "{C:mult}倍率{}或{C:chips}筹码{}，将其数值",
          "{X:attention,C:white}X#1#{}至{X:attention,C:white}X#2#",
          "{C:inactive}（当前为{C:attention}#3#{C:inactive}的数值{X:attention,C:white}X#4#{C:inactive}）"
        },
        unlock = {
          "拥有{C:attention,E:1}2{}张",
          "相同{C:attention,E:1}小丑牌"
        }
      },
      j_paperback_the_world = {
        name = "世界",
        text = {
          "每次{C:blue}出牌{}和{C:red}弃牌",
          "都同时被视为回合的",
          "{C:attention}第一次{}和{C:attention}最后一次"
        },
        unlock = {
          "到达",
          "底注{E:1,C:attention}#1#",
        }
      },
      j_paperback_epic_sauce = {
        name = "史诗辣酱",
        text = {
          "{X:mult,C:white}X#1#{}倍率",
          "如果某次出牌",
          "不是该回合的{C:attention}第一次出牌",
          "随机{C:red}摧毁{}一张{C:attention}小丑牌",
          "{C:inactive}（也可能摧毁自身）"
        }
      },
      j_paperback_find_jimbo = {
        name = "找到金宝",
        text = {
          "打出的{V:1}#2#{}{C:attention}#1#",
          "在计分时给予{C:money}$#3#",
          "{s:0.8}每回合卡牌都会改变"
        },
        unlock = {
          "用{C:attention,E:1}#1#J",
          "{C:attention,E:1}击败{}一个盲注"
        }
      },
      j_paperback_joker_crossing = {
        name = "小丑森友会",
        text = {
          "有{C:green}#1#/#2#{}的几率",
          "重新触发{C:attention}增强牌",
        }
      },
      j_paperback_jimbocards = {
        name = "金宝卡",
        text = {
          "添加此牌到小丑栏时，摧毁所有小丑牌",
          "并随机生成{C:attention}#1#{}张{C:dark_edition}负片{}版本的小丑牌",
          "所有物品的售价降低{C:money}$#2#{C:inactive}（最低{C:money}$1{C:inactive}）",
          "每个{C:attention}底注{}只能出{C:blue}#3#{}次牌{C:inactive}（还剩{C:blue}#4#{C:inactive}次）",
        },
        unlock = {
          "到达",
          "底注{E:1,C:attention}#1#",
        }
      },
      j_paperback_jimbocards_collection = {
        name = "金宝卡",
        text = {
          "添加此牌到小丑栏时，摧毁所有小丑牌",
          "并随机生成{C:attention}#1#{}张{C:dark_edition}负片{}版本的小丑牌",
          "所有物品的售价降低{C:money}$#2#{C:inactive}（最低{C:money}$1{C:inactive}）",
          "每个{C:attention}底注{}只能出{C:blue}#3#{}次牌{C:inactive}（还剩{C:blue}#4#{C:inactive}次）",
          "总是带有{C:paperback_eternal}永恒",
        },
        unlock = {
          "到达",
          "底注{E:1,C:attention}#1#",
        }
      },
      j_paperback_forlorn = {
        name = "孤寂",
        text = {
          "如果打出的牌中",
          "只有{V:1}黑桃{}牌计分",
          "随机摧毁一张",
          "{C:attention}留在手牌中{}的牌"
        },
      },
      j_paperback_protocol = {
        name = "规程",
        text = {
          "所有的{C:attention}补充包{}中",
          "多{C:attention}#1#{}张可供选择的牌"
        }
      },
      j_paperback_cream_liqueur = {
        name = "奶油利口酒",
        text = {
          "{C:attention}标签{}生效时获得{C:money}$#1#",
          "{C:attention}#2#{}个回合后喝完",
          "{C:inactive}（获得{C:attention}标签{C:inactive}时重置）"
        }
      },
      j_paperback_coffee = {
        name = "咖啡",
        text = {
          "手牌上限{C:attention}+#1#",
          "跳过{C:attention}盲注{}时提高{C:attention}#2#{}",
          "选择{C:attention}小盲注{}或{C:attention}大盲注{}时",
          "有{C:green}#3#/#4#{}的几率喝完",
        }
      },
      j_paperback_basic_energy = {
        name = "小丑能量卡",
        text = {
          "使用{C:attention}消耗牌{}时",
          "有{C:green}#1#/#2#{}的几率",
          "生成一张复制牌",
          "无法生成复制的复制",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_big_misser = {
        name = "错失大王",
        text = {
          "每有一个空的",
          "消耗牌槽位",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{}{C:inactive}倍率）"
        },
        unlock = {
          "赢一局",
          "且{C:attention,E:1}消耗牌槽位",
          "{C:attention,E:1}从未{}有过一张牌"
        }
      },
      j_paperback_fodder = {
        name = "炮灰",
        text = {
          "售出此牌为",
          "最右侧的{C:paperback_ego_gift}E.G.O饰品",
          "添加{C:paperback_ego_gift}锈蚀"
        },
        unlock = {
          "售出一个",
          "{C:paperback_ego_gift,E:1}E.G.O饰品"
        }
      },
      j_paperback_the_strongest = {
        name = "最强之人",
        text = {
          "每有一个{C:paperback_ego_gift}E.G.O饰品{}被售出或被锈蚀",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "击败{C:attention}Boss盲注{}时",
          "随机为一个{C:paperback_ego_gift}E.G.O饰品{}添加{C:paperback_ego_gift}锈蚀",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        },
        unlock = {
          "售出一个",
          "{C:paperback_ego_gift,E:1}E.G.O饰品"
        }
      },
      j_paperback_freezer = {
        name = "冰柜",
        text = {
          "击败{C:attention}Boss盲注{}时",
          "生成一张",
          "{C:dark_edition}负片{}版本的{C:attention}食物小丑牌",
        },
        unlock = {
          "拥有一张",
          "{C:dark_edition}负片{}版本的",
          "{C:attention,E:1}食物小丑牌"
        }
      },
      j_paperback_everything_must_go = {
        name = "清仓大甩卖!",
        text = {
          "{C:money}商店{}有一个额外的",
          "{C:attention}优惠券槽位"
        },
        unlock = {
          "发现{C:attention,E:1}#1#{}张",
          "{C:attention,E:1}优惠券"
        },
      },
      j_paperback_card_sleeve = {
        name = "卡套",
        text = {
          "售出此牌给右侧",
          "{C:attention}小丑牌{}添加{C:attention}永恒",
        }
      },
      j_paperback_plastic_wrap = {
        name = "塑封",
        text = {
          "{C:attention}摧毁{}一张{C:attention}#2#{}时",
          "将牌组中随机{C:attention}#1#{}张",
          "{C:attention}无增强{}的牌变成{C:attention}#2#",
        }
      },
      j_paperback_percussion_ensemble = {
        name = "打击乐团",
        text = {
          "完整牌组中",
          "每有一种{C:attention}增强",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        }
      },
      j_paperback_its_tv_time = {
        name = "电视时间到!",
        text = {
          "打出的{C:paperback_stars}#1#{}牌",
          "在计分时",
          "给予{C:chips}+#2#{}筹码",
        },
      },
      j_paperback_trust_us = {
        name = "信任我们!",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#3#{}",
          "则{X:mult,C:white}X#1#{}倍率",
          "否则{X:mult,C:white}X#2#{}倍率"
        },
      },
      j_paperback_da_capo = {
        name = "再奏序章",
        text = {
          "{X:mult,C:white}X#1#{}倍率",
          "每次{C:attention}出牌{}保留一种{C:attention}花色",
          "{C:red}削弱{}其余花色的牌",
          "顺序：{C:clubs}梅花{}，{C:spades}黑桃{}，{C:diamonds}方片{}，{C:hearts}红桃{}，{C:inactive}无{}",
          "{C:inactive}（当前保留花色为{V:1}#2#{C:inactive}）",
        }
      },
      j_paperback_complete_breakfast = {
        name = "完整早餐",
        text = {
          "{C:mult}+#1#{}倍率以及{C:chips}+#2#{}筹码",
          "每次出牌后",
          "有{C:green}#3#/#4#{}的几率吃完",
          "若未吃完则分子{C:green}+#5#",
        },
        unlock = {
          "同时拥有{C:attention,E:1}#1#{}张",
          "食物小丑牌"
        }
      },
      j_paperback_emergency_broadcast = {
        name = "紧急广播",
        text = {
          "计分的{C:attention}5{}和{C:attention}8",
          "给予{C:mult}+#1#{}倍率",
          "以及{C:chips}+#2#{}筹码"
        },
      },
      j_paperback_moribund = {
        name = "垂死",
        text = {
          "以剩余{C:blue}0{}次出牌击败{C:attention}盲注{}时",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "如果出牌归{C:blue}0{}后没有达到",
          "分数要求，倍率{C:attention}翻倍",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_paperback_crispy_taco = {
        name = "脆皮塔可",
        text = {
          "{X:chips,C:white}X#1#{}筹码",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_furioso = {
        name = "狂怒",
        text = {
          "每有一种{C:attention}点数{}计分",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "击败{C:attention}Boss盲注{}后重置",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{}{C:inactive}倍率）",
          "{C:inactive}（已出点数为{C:attention}#3#{C:inactive}）",
        },
        unlock = {
          "第一次出牌就",
          "击败{C:attention,E:1}蔚蓝之铃",
        }
      },
      j_paperback_soft_taco = {
        name = "软式塔可",
        text = {
          "{X:mult,C:white}X#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_watermelon = {
        name = "西瓜",
        text = {
          "为一张游戏牌添加{C:attention}增强{}时",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:attention}摧毁{}一张游戏牌时",
          "失去{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{} {C:inactive}倍率）",
        },
      },
      j_paperback_charred_marshmallow = {
        name = "烤棉花糖",
        text = {
          "计分的{C:spades}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_joker_cookie = {
        name = "小丑曲奇",
        text = {
          "回合结束时获得{C:money}$#1#",
          "且有{C:green}#4#/#5#{}的几率吃完",
          "提现时金额增加{C:money}$#2#",
          "{C:inactive}（最高{C:money}$#3#{C:inactive}）",
        },
      },
      j_paperback_pop_stick = {
        name = "棒棒糖棍",
        text = {
          "如果拥有其他",
          "名字里带{C:attention}棍{}的小丑牌",
          "{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_pool_table = {
        name = "台球桌",
        text = {
          "如果回合的{C:attention}第一次出牌{}中",
          "没有计分的{C:attention}人头牌",
          "生成一张",
          "打出{C:attention}牌型{}的{C:planet}#1#",
          "{C:inactive}（必须有空位）",
        },
      },
      j_paperback_bicycle = {
        name = "自行车",
        text = {
          "{C:attention}#1#{}给予等于",
          "自身{C:chips}筹码值{}的{C:mult}倍率",
        },
      },
      j_paperback_stamp = {
        name = "邮票",
        text = {
          "带有{C:attention}蜡封{}的牌计分时",
          "这张小丑牌有{C:green}#1#/#2#{}的几率",
          "获得{C:chips}+#3#{}筹码",
          "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码）",
        },
        unlock = {
          "打出一手牌",
          "其中包含",
          "{C:attention,E:1}#1#{}张带有蜡封的",
          "记分牌"
        },
      },
      j_paperback_sticky_stick = {
        name = "黏糊棍",
        text = {
          "如果拥有其他",
          "名字里带{C:attention}棍{}的小丑牌",
          "{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_shopping_center = {
        name = "购物中心",
        text = {
          "{C:money}商店{}有一个额外的",
          "{C:attention}卡牌槽位",
        },
      },
      j_paperback_tutor = {
        name = "导师",
        text = {
          "{C:attention}数字牌{}自身的",
          "{C:chips}筹码{C:attention}翻倍",
        },
      },
      j_paperback_ghost_cola = {
        name = "幽灵可乐",
        text = {
          "售出此牌以生成",
          "一个{C:attention}#1#",
          "和一张随机的{C:spectral}幻灵牌",
          "{C:inactive}（必须有空位）"
        },
      },
      j_paperback_river = {
        name = "河流",
        text = {
          "如果打出的牌中有",
          "{C:attention}5{}张记分牌，获得",
          "等于记分牌中最低的",
          "自身{C:chips}筹码值{}一半的{C:money}资金",
          "{C:inactive}（最高{C:money}$#1#{C:inactive}）",
        },
      },
      j_paperback_solemn_lament = {
        name = "圣宣",
        text = {
          "如果打出的牌型中",
          "同时包含{C:paperback_dark_suit}暗花色{}和{C:paperback_light_suit}亮花色{}牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_hole_in_one = {
        name = "一杆进洞",
        text = {
          "如果{C:blue}一次出牌{}就击败",
          "{C:attention}盲注{}，所有卡牌的{C:attention}售价{}翻倍",
          "{C:inactive}（每回合不超过{C:money}$#1#{C:inactive}）",
          "售出此牌时，将所有卡牌的{C:attention}",
          "{C:attention}售价{}设为{C:money}$0"
        },
      },
      j_paperback_mismatched_sock = {
        name = "错配袜子",
        text = {
          "如果{C:attention}只弃掉一张牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_wild_plus_four = {
        name = "万能+4",
        text = {
          "手牌上限{C:attention}+#1#",
          "每回合出牌次数{C:blue}#2#"
        }
      },
      j_paperback_quick_fix = {
        name = "快速修补",
        text = {
          "{C:attention}+#1#{}手牌上限",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率",
          "摧毁此牌…",
        },
        unlock = {
          "拥有{C:attention,E:1}#1#{}或更多",
          "手牌上限",
        }
      },
      j_paperback_skydiver = {
        name = "跳伞者",
        text = {
          "如果所有记分牌的{C:attention}点数",
          "都{C:attention}不高于{}本回合",
          "计分的{C:attention}最低{}点数，则{C:white,X:mult}X#1#{}倍率",
          "每次出牌后更新点数",
          "{C:inactive}（当前为{C:attention}#2#{C:inactive}）",
        },
      },
      j_paperback_surfer = {
        name = "冲浪者",
        text = {
          "回合结束时",
          "每有一张{C:attention}#2#{}留在手牌中",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）"
        }
      },
      j_paperback_blue_bonnets = {
        name = "蓝帽花",
        text = {
          "计分的{C:clubs}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:clubs}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      j_paperback_great_wave = {
        name = "巨浪",
        text = {
          "打出的牌中",
          "每有一张其它{C:attention}记分牌",
          "重新触发一次",
          "{C:attention}最右侧{}的记分牌"
        },
      },
      j_paperback_caramel_apple = {
        name = "焦糖苹果",
        text = {
          "计分的{C:clubs}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_nachos = {
        name = "玉米片",
        text = {
          "{X:chips,C:white}X#1#{}筹码",
          "每{C:attention}弃掉{}一张牌",
          "失去{X:chips,C:white}X#2#{}筹码",
        },
      },
      j_paperback_trans_flag = {
        name = "跨性别旗",
        text = {
          "每剩余一次{C:attention}弃牌",
          "给予{C:red}+#1#{}倍率",
          "{C:inactive}（当前为{C:red}+#2#{}{C:inactive}倍率）"
        },
      },
      j_paperback_pride_flag_spectrums = {
        name = "骄傲旗",
        text = {
          "如果打出的牌中包含{C:attention}光谱",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "如果包含{C:attention}顺子{}则重置",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        },
        unlock = {
          "打出一手",
          "{E:1,C:attention,E:1}光谱"
        }
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "骄傲旗",
        text = {
          "如果打出的牌中至少",
          "包含{C:attention}3{}种计分的花色牌",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
        unlock = {
          "打出一手牌",
          "其中包含{C:attention,E:1}#1#{}种",
          "计分的花色牌",
          "和一张计分的{C:attention,E:1}万能牌"
        }
      },
      j_paperback_sacrificial_lamb = {
        name = "献祭羔羊",
        text = {
          "每{C:attention}摧毁{}一张牌",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
        unlock = {
          "一局内摧毁",
          "{C:attention,E:1}#1#{}张牌"
        }
      },
      j_paperback_autumn_leaves = {
        name = "秋叶",
        text = {
          "计分的{C:diamonds}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:diamonds}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      j_paperback_wild_prize = {
        name = "[[随机奖励!1!]]",
        text = {
          "{C:attention}#7#{}在计分时",
          "有{C:green}#1#/#2#{}的几率{C:attention}重新触发",
          "以及{C:green}#3#/#4#{}的几率获得",
          "{C:money}#5#{}至{C:money}+$#6#",
        },
      },
      j_paperback_wish_you_were_here = {
        name = "希望你也在",
        text = {
          "将自身{C:attention}售价{}的{C:attention}两倍",
          "添加至倍率",
          "回合结束时{C:attention}售价{}增加{C:money}$#2#",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）",
        },
      },
      j_paperback_greeting_card = {
        name = "贺卡",
        text = {
          "打出的{C:attention}#2#{}计分时",
          "这张小丑牌的{C:attention}售价",
          "增加{C:money}$#1#"
        },
      },
      j_paperback_calling_card = {
        name = "预告信",
        text = {
          "击败{C:attention}Boss盲注{}或",
          "触发它的{C:attention}能力{}时",
          "这张小丑牌获得{X:red,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{}{X:red,C:white}X#2#{}{C:inactive}倍率）",
        },
      },
      j_paperback_subterfuge = {
        name = "诡计",
        text = {
          "每回合的{C:attention}第一次出牌{}中",
          "{C:attention}摧毁{}所有打出的牌"
        },
        unlock = {
          "在一回合内",
          "摧毁至少{E:1,C:attention}#1#{}张",
          "游戏牌"
        }
      },
      j_paperback_triple_moon_goddess = {
        name = "三相女神",
        text = {
          "如果打出的牌中包含{C:attention}三条",
          "有{C:green}#1#/#2#{}的几率生成一张{C:planet}星球牌",
          "以及{C:green}#3#/#4#{}的几率生成一张{C:purple}塔罗牌",
          "{C:inactive}（必须有空位）"
        },
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "三相女神",
        text = {
          "如果打出的牌中包含{C:attention}三条",
          "有{C:green}#1#/#2#{}的几率生成一张{C:tarot}塔罗牌",
          "以及{C:green}#3#/#4#{}的几率生成一张{C:paperback_minor_arcana}塔罗辅牌",
          "{C:inactive}（必须有空位）"
        },
      },
      j_paperback_derecho = {
        name = "直线风暴",
        text = {
          "如果记分牌都是{C:paperback_dark_suit}暗花色{}牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_the_sun_rises = {
        name = "日出",
        text = {
          "将基础筹码设为{C:chips}#1#",
          "打出的{C:paperback_light_suit}亮花色{}牌",
          "在计分时给予{C:chips}+#2#{}筹码",
          "每有一张{C:paperback_light_suit}亮花色{}牌计分",
          "永久提高{C:chips}+#3#{}筹码",
        },
      },
      j_paperback_jestrica = {
        name = "丑斯特里卡",
        text = {
          "每有一张{C:attention}#3#{}计分",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "如果某个回合中",
          "没有{C:attention}#3#{}计分，则重置",
          -- 原注：待处理 可能需要标明本回合是否已经有8计分
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        },
      },
      j_paperback_grand_strategy = {
        name = "大战略",
        text = {
          "如果完整牌组中",
          "至少有{C:attention}#2#{}种{C:attention}增强",
          "则{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前有{C:attention}#3#{C:inactive}种）",
        },
      },
      j_paperback_moving_out = {
        name = "退场",
        text = {
          "如果{C:attention}击败盲注{}的牌型",
          "不是你最常用的牌型",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_paperback_ready_to_fly = {
        name = "准备飞行",
        text = {
          "每次相邻小丑牌{C:attention}触发{}时",
          "这张小丑牌获得{X:chips,C:white}X#2#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#1#{C:inactive}筹码）",
        },
      },
      j_paperback_solar_system = {
        name = "太阳系",
        text = {
          "9种基础{C:attention}牌型",
          "每共有一个{C:attention}等级",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{}{C:inactive}倍率）",
        },
        unlock = {
          "一局内使用",
          "{C:attention,E:1}#1#{}张不同的",
          "{C:planet}星球牌"
        }
      },
      j_paperback_reference_card = {
        name = "规则卡",
        text = {
          "本赛局每打出过一次",
          "{C:attention}所有{}9种基础{C:attention}牌型",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{}{C:inactive}倍率）",
        },
      },
      j_paperback_dreamsicle = {
        name = "梦幻雪糕",
        text = {
          "计分的{C:diamonds}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_jimbo_adventure = {
        name = "金宝大冒险",
        text = {
          "跳过{C:attention}盲注{}时",
          "随机生成一个{C:attention}标签",
        },
      },
      j_paperback_union_card = {
        name = "工会会员证",
        text = {
          "如果记分牌中包含{C:paperback_light_suit}亮花色{}牌",
          "则给予等于计分的{C:paperback_light_suit}亮花色{}牌",
          "的数量的{X:mult,C:white}X倍率",
          "将所有卡牌的{C:attention}售价{}锁定为{C:money}$0",
          "直到此牌被售出或摧毁",
        },
      },
      j_paperback_cherry_blossoms = {
        name = "樱花",
        text = {
          "计分的{C:hearts}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:hearts}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      -- Suit Drinks
      j_paperback_grenadine = {
        name = "红石榴糖浆",
        text = {
          "计分的{C:hearts}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每次{C:green}几率检测{}失败时",
          "提高{X:mult,C:white}X#3#{}倍率"
        },
      },
      j_paperback_stout = {
        name = "司陶特",
        text = {
          "计分的{C:spades}#1#{}牌给予{X:chips,C:white}X#2#{}筹码",
          "如果打出的牌中",
          "有{C:attention}#4#{}张计分的{C:spades}#1#{}牌",
          "提高{X:chips,C:white}X#3#{}筹码",
        },
      },
      j_paperback_aperol = {
        name = "阿佩罗",
        text = {
          "每拥有{C:money}$#2#",
          "计分的{C:diamonds}#3#{}牌给予{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#4#{C:inactive}倍率）",
        },
      },
      j_paperback_blue_curacao = {
        name = "蓝库拉索",
        text = {
          "计分的{C:clubs}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "如果打出的牌中",
          "有{C:attention}#4#{}张或更多计分的{C:clubs}#1#{}牌",
          "提高{X:mult,C:white}X#3#{}倍率",
        },
      },
      j_paperback_nigori = {
        name = "浊酒",
        text = {
          "打出的{C:paperback_stars}#1#{}牌",
          "在计分时给予{C:chips}+#2#{}筹码",
          "每次有{X:chips,C:white}X筹码{}触发时",
          "提高{C:chips}+#3#{}筹码",
        },
      },
      j_paperback_lager = {
        name = "拉格啤酒",
        text = {
          "消耗牌槽位{C:attention}+#1#",
          "如果打出的牌中",
          "包含{C:attention}#3#{}张计分的{C:paperback_crowns}#4#{}牌",
          "槽位再{C:attention}+#2#"
        },
      },
      j_paperback_paranoia = {
        name = "偏执狂",
        text = {
          "打出的{C:paperback_light_suit}亮花色{}牌",
          "在计分时给予{C:mult}+#2#{}倍率",
          "本赛局每{C:attention}摧毁{}一张",
          "{C:paperback_dark_suit}暗花色{}牌，提高{C:mult}+#1#{}倍率"
        },
      },
      j_paperback_unholy_alliance = {
        name = "邪恶联盟",
        text = {
          "每{C:attention}摧毁{}一张牌",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_paperback_summoning_circle = {
        name = "召唤法阵",
        text = {
          "如果打出的牌中包含{C:attention}#1#",
          "随机复制一张{C:attention}消耗牌",
          "{C:inactive}（必须有空位）",
        },
      },
      j_paperback_the_sun = {
        name = "太阳",
        text = {
          "如果所有记分牌都是{C:paperback_light_suit}亮花色{}牌",
          "这张小丑牌{C:mult}+#1#{}倍率",
          "每有一张非{C:paperback_light_suit}亮花色{}牌计分",
          "这张小丑牌{C:mult}-#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率",
        },
      },
      j_paperback_pointy_stick = {
        name = "尖锐棍",
        text = {
          "如果拥有其他",
          "名字里带{C:attention}棍{}的小丑牌",
          "{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_prince_of_darkness = {
        name = "黑暗王子",
        text = {
          "如果计分牌中包含一张",
          "{C:hearts}#5#{}牌和{C:attention}#1#{}张其它花色牌",
          "{C:attention}本次{}和{C:attention}接下来两次{}出牌时",
          "{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}（剩余{C:attention}#4#{C:inactive}次出牌）"
        },
        unlock = {
          "打出一手牌",
          "其中有{C:attention,E:1}#1#{}种",
          "花色牌计分"
        }
      },
      j_paperback_giga_size = {
        name = "千兆力量",
        text = {
          "{C:attention}本回合{}每出一次牌",
          "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}（将{X:mult,C:white}X#1#{C:inactive}倍率）"
        },
        unlock = {
          "打出一张带有",
          "{C:attention,E:1}50{}额外{C:attention,E:1}筹码{}的牌",
        },
      },
      j_paperback_the_batter = {
        name = "击球手",
        text = {
          "摧毁所有计分的{C:attention}#3#",
          "{C:inactive}（{C:attention}#1#{C:inactive}/{C:attention}#2#...{C:inactive}）",
          "{s:0.9,C:inactive}（无需空位…？）",
        }
      },
      j_paperback_off_switch = {
        name = "关机开关",
        text = {
          "每有一张{C:attention}游戏牌{}被摧毁",
          "尝试摧毁最左侧可摧毁的小丑牌",
          "如果成功，获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        }
      },
      j_paperback_off_alpha = {
        name = "阿尔法",
        text = {
          "每{C:attention}摧毁{}一张小丑牌",
          "获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_paperback_off_omega = {
        name = "奥米伽",
        text = {
          "每{C:attention}摧毁{}一张小丑牌",
          "获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_paperback_off_epsilon = {
        name = "艾普西隆",
        text = {
          "每{C:attention}摧毁{}一张小丑牌",
          "获得{C:gold}$#1#",
        },
      },
      j_paperback_photocopy = {
        name = "复印件",
        text = {
          "复制最右侧",
          "{C:attention}小丑牌{}的能力"
        },
        unlock = {
          "牌组中所有牌的",
          "{E:1,C:attention}点数{}与{E:1,C:attention}花色",
          "都相同"
        }
      },
      j_paperback_master_plan = {
        name = "总体规划",
        text = {
          "复制左侧",
          "{C:attention}小丑牌{}的能力"
        },
        unlock = {
          "完成{E:1,C:attention}15分钟都市",
          "挑战"
        }
      },
      j_paperback_56_leaf_clover = {
        name = "五十六叶草",
        text = {
          "如果击败{C:attention}Boss盲注",
          "的出牌中只有{C:clubs}梅花{}牌计分",
          "生成一个{C:dark_edition}负片{}标签",
        }
      },
      j_paperback_57_leaf_clover = {
        name = "五十七叶草",
        text = {
          "所有{C:green}标出的几率{}中分子{C:green}+#1#",
          "回合结束时这一数值提高{C:green}#2#",
          "击败{C:attention}Boss盲注{}后重置"
        }
      },
      j_paperback_popsicle_stick = {
        name = "雪糕棍",
        text = {
          "如果拥有其他",
          "名字里带{C:attention}棍{}的小丑牌",
          "{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_let_it_happen = {
        name = "任其发生",
        text = {
          "如果一种牌型",
          "在本{C:attention}底注{}还未打出",
          "计分时{C:purple}平衡{}{C:chips}筹码{}与{C:mult}倍率",
          "{C:inactive}（已出牌型为{C:attention}#1#{C:inactive}）",
        },
        unlock = {
          "使用{C:attention}#1#",
          "在{V:1}#2#{}或以上难度",
          "赢一局",
        }
      },
      j_paperback_in_case_i_make_it = {
        name = "假如我成功",
        text = {
          "打出的{C:attention}无点数牌",
          "在计分时",
          "永久获得{C:chips}+#1#{}筹码",
        },
      },
      j_paperback_evergreens = {
        name = "常青树",
        text = {
          "计分的{C:spades}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:spades}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      j_paperback_der_fluschutze = {
        name = "凶弹射手",
        text = {
          "如果回合的{C:attention}第一次出牌",
          "只有一张单独的{C:attention}人头牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "并摧毁这张人头牌",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{}{C:inactive}倍率）"
        }
      },
      j_paperback_deck_of_cards = {
        name = "一副牌",
        text = {
          "如果出牌只有",
          "一张单独的{C:attention}#1#",
          "则摧毁这张牌，然后",
          "这张小丑牌获得{X:chips,C:white}X#2#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#3#{}{C:inactive}筹码）"
        }
      },
      j_paperback_the_wonder_of_you = {
        name = "奇迹于你",
        text = {
          "选择{C:attention}Boss盲注{}时",
          "随机生成两个{C:attention}标签"
        }
      },
      j_paperback_inner_peace = {
        name = "内心宁静",
        text = {
          "在每回合的",
          "{C:attention}第一次出牌{}之前",
          "手牌上限{C:attention}+3"
        }
      },
      j_paperback_shopkeep = {
        name = "店主",
        text = {
          "每击败#1#{C:inactive}[#2#]{}个盲注",
          "生成一个{C:attention}#3#",
          "击败Boss盲注时",
          "生成一个{C:attention}#4#"
        },
        unlock = {
          "单个商店中",
          "花费{C:money,E:1}$50"
        }
      },
      j_paperback_cakepop = {
        name = "蛋糕棒棒糖",
        text = {
          "计分的{C:hearts}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_black_rainbows = {
        name = "黑色彩虹",
        text = {
          "计分的{C:spades}#3#{}牌和{C:clubs}#4#{}牌",
          "都有{C:green}#1#/#2#{}的几率",
          "变成{C:dark_edition}多彩{}版本"
        }
      },
      j_paperback_meeple = {
        name = "米宝",
        text = {
          "如果打出的牌中",
          "包含一张计分的{C:attention}人头牌",
          "有{C:green}#1#/#2#{}的几率",
          "获得{C:mult}#3#{}次临时弃牌",
        }
      },
      j_paperback_apple = {
        name = "苹果",
        text = {
          "购买{C:attention}消耗牌{}时",
          "有{C:green}#1#/#2#{}的几率生成",
          "一张{C:dark_edition}负片{}版本的复制牌",
          "同时有{C:green}#3#/#4#{}的几率{S:1.1,C:red,E:2}自毁",
        }
      },
      j_paperback_heretical_joker = {
        name = "异端小丑",
        text = {
          "打出的{C:paperback_stars}#2#{}牌",
          "在计分时",
          "给予{C:mult}+#1#{}倍率",
        },
      },
      j_paperback_fraudulent_joker = {
        name = "欺诈小丑",
        text = {
          "打出的{C:paperback_crowns}#2#{}牌",
          "在计分时",
          "给予{C:mult}+#1#{}倍率",
        },
      },
      j_paperback_rock_candy = {
        name = "水晶糖",
        text = {
          "计分的{C:paperback_stars}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_rockin_stick = {
        name = "糖晶棍",
        text = {
          "每拥有一张",
          "名字里带{C:attention}棍{}的小丑牌",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_tanghulu = {
        name = "糖葫芦",
        text = {
          "计分的{C:paperback_crowns}#4#{}牌给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}的几率吃完",
        },
      },
      j_paperback_sweet_stick = {
        name = "甜蜜棍",
        text = {
          "每拥有一张",
          "名字里带{C:attention}棍{}的小丑牌",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        },
      },
      j_paperback_quartz = {
        name = "石英",
        text = {
          "打出的{C:paperback_stars}银星{}牌",
          "在计分时给予{X:chips,C:white}X1{}筹码",
          "每有一张其他{C:paperback_stars}银星{}牌被同时打出",
          "提高{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}（每次出牌后重置）"
        }
      },
      j_paperback_pyrite = {
        name = "黄铁矿",
        text = {
          "打出的{V:1}#1#{}牌在计分时",
          "有{C:green}#2#/#3#{}的几率生成",
          "一张随机的{C:tarot}塔罗牌",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_wheat_field = {
        name = "麦田",
        text = {
          "计分的{C:paperback_crowns}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:paperback_crowns}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      j_paperback_chip_clip = {
        name = "票据夹",
        text = {
          "回合结束时",
          "每有一枚{C:attention}别针{}留在{C:attention}手牌中",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },

      j_paperback_clothespin = {
        name = "晾衣夹",
        text = {
          "这张小丑牌在你出牌时",
          "同时被视为一枚{C:attention}打出计分",
          "和{C:attention}留在手牌中{}的{C:attention}别针",
          "以加强其他别针的效果"
        }
      },
      j_paperback_happy_accident = {
        name = "幸运的意外",
        text = {
          "留在手牌中的{C:attention}#1#",
          "给予自身数值",
          "{C:attention}一半{}的{X:chips,C:white}X筹码{}"
        },
      },
      j_paperback_watercolor_joker = {
        name = "水彩小丑",
        text = {
          "计分的{C:attention}#1#",
          "给予{X:chips,C:white}X#2#{}筹码",
        },
        unlock = {
          "打出一张",
          "带有{C:attention,E:1}蓝色蜡封{}的",
          "{C:attention,E:1}水浸牌",
        },
      },
      j_paperback_birches = {
        name = "白桦树",
        text = {
          "{C:paperback_stars}#1#{}牌给予{X:mult,C:white}X#2#{}倍率",
          "每有一张{C:paperback_stars}#4#{}牌{C:attention}连续{}计分",
          "提高{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（每次出牌后重置）",
        },
      },
      j_paperback_oracle = {
        name = "先知",
        text = {
          "每使用一种{C:paperback_minor_arcana}#3#",
          "这张小丑牌获得{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）",
        },
      },
      j_paperback_punch_card = {
        name = "打孔卡",
        text = {
          "{C:attention}#1#{}回合后售出此牌",
          "使底注{C:attention}#3#{}",
          "{C:inactive}（当前为{C:attention}#2#{C:inactive}/#1#）",
        },
      },
      j_paperback_eyelander = {
        name = "魔眼阔剑",
        text = {
          "摧毁计分的{C:attention}人头牌",
          "在{C:attention}#1#{}张人头牌计分后",
          "{C:attention}售出{}此牌为一张随机",
          "{C:attention}小丑牌{}添加{C:dark_edition}负片{}版本",
          "{C:inactive}（当前{C:attention}#2#{C:inactive}张）"
        }
      },
      j_paperback_torii = {
        name = "鸟居",
        text = {
          "每跳过{C:attention}#2#{}{C:inactive}[#3#]{}个盲注",
          "底注{C:attention}#1#",
          "只在新的底注可用",
          "{C:inactive}（{V:1}#4#{C:inactive}）",
        }
      },
      j_paperback_freight = {
        name = "货物",
        text = {
          "击败{C:attention}盲注{}时，如果是Boss盲注",
          "售价增加{C:money}$#1#",
          "否则{C:attention}赚取{}等于此牌售价的资金",
          "售出时{C:attention}不获得{}资金",
          "而是获得等于售价一半的",
          "临时{C:red}弃牌次数",
        }
      },
      j_paperback_banana_man = {
        name = "香蕉人",
        text = {
          "每张小丑牌",
          "都有{C:green}#1#/#2#{}的几率",
          "给予{X:mult,C:white}X#3#{}倍率"
        },
        unlock = {
          "获得",
          "{C:attention,E:1}卡文迪什",
        }
      },
      j_paperback_guns_blazin = {
        name = "火力全开",
        text = {
          "打出的{C:attention}A",
          "在计分时",
          "给予{X:mult,C:white}X#1#{}倍率",
        },
        unlock = {
          "打出一手牌",
          "其中包含",
          "{C:attention,E:1}#1#{}张钢铁牌",
        }
      },
      j_paperback_satellite_array = {
        name = "卫星阵列",
        text = {
          "每使用一张{C:planet}#4#",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "每次出牌{C:chips}-#2#{}筹码",
          "{C:inactive}（当前为{C:chips}+#3#{C:inactive}筹码）",
        }
      },
      j_paperback_rosary_beads = {
        name = "玫瑰经念珠",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#1#{}张或更多",
          "计分的{C:hearts}#3#{}牌",
          "获得{C:money}$#2#"
        }
      },
      j_paperback_tian_tian = {
        name = "天天",
        text = {
          "每{C:attention}摧毁{}一张游戏牌",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      j_paperback_disco = {
        name = "迪斯科小丑",
        text = {
          "拥有{C:money}$#2#{}或更少资金时",
          "每购买一张小丑牌",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
        }
      },
      j_paperback_a_balatro_movie = {
        name = "小丑牌大电影",
        text = {
          "如果打出与{C:attention}上一次{}出牌",
          "{C:attention}相同{}的牌型",
          "则获得{C:money}$#2#",
          "{C:inactive}（上次打出{C:attention}#1#{C:inactive}）"
        }
      },
      j_paperback_unionized_labor = {
        name = "工会劳工",
        text = {
          "拥有{C:money}$#1#{}或更少资金时",
          "所有{C:green,E:1,S:1.1}标出的几率{}{C:green}X3",
          "否则{C:green}X0.5",
          "{C:inactive}（例如：{C:green}1/3{C:inactive}几率 -> {C:green}#2#/#3#{C:inactive}几率）"
        }
      },
      j_paperback_chocolate_coins = {
        name = "巧克力金币",
        text = {
          "回合结束时获得{C:money}$#1#",
          "每回合减少{C:money}$#2#"
        }
      },
      j_paperback_park_postcard = {
        name = "森林公园明信片",
        text = {
          "回合结束时",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:attention}添加{}或{C:attention}摧毁{}游戏牌",
          "会{C:red}重置{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      j_paperback_keycard = {
        name = "房卡",
        text = {
          "击败{C:attention}Boss盲注{}后",
          "这张小丑牌{C:red,E:1}自毁",
          "并给予{C:money}$#1#"
        }
      },
      j_paperback_mind_electric = {
        name = "心灵电流",
        text = {
          "{C:attention}摧毁{}计分的{C:mult}#3#",
          "每摧毁一张",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white} X#2# {C:inactive}倍率）"
        }
      },
      j_paperback_stella_octangula = {
        name = "星形八面体",
        text = {
          "每回合第一张",
          "计分的{V:1}#2#{}牌",
          "给予{X:chips,C:white}X#1#{}筹码"
        }
      },
      j_paperback_cast_iron = {
        name = "铸铁锅",
        text = {
          "{C:attention}完整牌组{}中每有{C:attention}#2#{}张#3#",
          "手牌上限{C:attention}+#6#",
          "{C:inactive}（当前{C:attention}+#4#{C:inactive}手牌上限，最高#5#）"
        }
      },
      j_paperback_first_contact = {
        name = "首次联络",
        text = {
          "每有{C:attention}#1#{C:inactive}[#2#]{}张",
          "{C:paperback_dark_suit}暗花色{}牌计分",
          "生成一张随机的{C:spectral}#3#牌",
          "{C:inactive}（必须有空位）",
        },
      },
      j_paperback_paralyzed = {
        name = "瘫痪",
        text = {
          "击败盲注时",
          "随机生成一张",
          "{C:tarot}#1#",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_coin_collection = {
        name = "硬币收藏集",
        text = {
          "每次赚取{C:money}资金{}时",
          "获得{C:money}$#1#"
        }
      },
      j_paperback_attacking_vertical = {
        name = "垂直进攻",
        text = {
          "打出的{C:attention}#1#{}和{C:attention}#2#{}在计分时",
          "给予{X:mult,C:white}X#3#{}倍率",
          "击败{C:attention}Boss盲注{}后",
          "提高{X:mult,C:white}X#4#{}倍率"
        }
      },
      j_paperback_emf_reader = {
        name = "电磁场测量仪",
        text = {
          "如果回合的{C:attention}第一次出牌",
          "包含{C:attention}#1#{}",
          "摧毁所有打出的牌",
          "并随机生成一张{C:spectral}幻灵牌"
        }
      },
      j_paperback_jester = {
        name = "弄臣",
        text = {
          "每{C:attention}摧毁{}一张游戏牌",
          "就{C:attention}随机{}摧毁",
          "牌组中的一张牌"
        }
      },
      j_paperback_journal = {
        name = "日记",
        text = {
          "这张小丑牌",
          "给予上一次出牌的",
          "{C:chips}筹码",
          "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）"
        }
      },
      j_paperback_silent_assassin = {
        name = "静默杀手",
        text = {
          "计分的{C:attention}#1#{}和{C:attention}#2#{}给予{C:mult}+#3#{}倍率",
          "每摧毁{C:attention}#5#{C:inactive}[#6#]{}张牌",
          "提高{C:mult}+#4#{}倍率"
        }
      },
      j_paperback_yacht_dice = {
        name = "快艇骰子",
        text = {
          "本赛局每打出一种{C:attention}牌型",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      j_paperback_stereoscopic_specs = {
        name = "立体眼镜",
        text = {
          "击败{C:attention}Boss盲注{}后",
          "生成上一次使用的标签",
          "{C:inactive}（当前为{C:attention}#1#{C:inactive}）"
        }
      },
      j_paperback_yacht = {
        name = "帆船",
        text = {
          "如果打出的牌中包含一张",
          "计分的{C:paperback_stars}#3#{}牌或{C:paperback_crowns}#4#{}牌",
          "这张小丑牌获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      j_paperback_towering_pillar_of_hats = {
        name = "戴帽高塔",
        text = {
          "完整牌组中",
          "每有{C:attention}#3#{}张{C:attention}J{}、{C:attention}Q{}或{C:attention}K{}",
          "计分的{C:paperback_crowns}#7#{}牌给予{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        },
      },
      j_paperback_joker_duty = {
        name = "小丑执勤",
        text = {
          "如果击败盲注时",
          "剩余{C:chips}出牌{}和{C:mult}弃牌{}次数相等",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        }
      },
      j_paperback_shuttle = {
        name = "航天飞机",
        text = {
          "回合的{C:attention}第一次出牌",
          "给予等于牌型等级",
          "{C:attention}两倍{}的{C:money}资金",
          "{C:inactive}（最高{C:money}$#1#{C:inactive}）"
        }
      },
      j_paperback_loaded_dice = {
        name = "作弊骰子",
        text = {
          "如果打出的牌中包含",
          "一张计分的{C:paperback_crowns}#2#{}牌",
          "所有{C:green,E:1,S:1.1}标出的几率{}中",
          "分子{C:green}#1#"
        }
      },
      j_paperback_tropic_birds = {
        name = "热带鸟儿",
        text = {
          "如果打出的牌中",
          "包含一张{C:attention}A",
          "重新触发{C:attention}第一张{}和",
          "{C:attention}最后一张{}记分牌"
        }
      },
      j_paperback_jacks = {
        name = "抓子游戏",
        text = {
          "每弃掉一张{C:attention}J",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率)"
        }
      },
      j_paperback_red_sun_in_the_sky = {
        name = "天上太阳红彤彤",
        text = {
          "打出的{C:paperback_light_suit}亮花色{}牌",
          "在计分时给予{C:mult}+#2#{}倍率",
          "本回合每有一张{C:paperback_light_suit}亮花色{}牌",
          "计分，提高{C:mult}+#1#{}倍率"
        }
      },
      -- Cross-Mod jokers start here
      j_paperback_moon_waltz = {
        name = "月之圆舞曲",
        text = {
          "使用{C:planet}卫星牌{}或{C:planet}小行星牌{}时",
          "这张小丑牌有{C:green}#3#/#4#{}的几率获得",
          "它们提供的{C:mult}倍率{}或{C:chips}筹码{}的一半",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率以及{C:chips}+#2#{C:inactive}筹码）",
        },
      },
    },
    Spectral = {
      c_paperback_apostle_of_cups = {
        name = "圣杯使徒",
        text = {
          "选定一张{C:attention}游戏牌",
          "变为{C:dark_edition}负片{}版本",
          "小丑牌槽位{C:attention}#1#",
        }
      },
      c_paperback_apostle_of_wands = {
        name = "权杖使徒",
        text = {
          "{C:attention}任选{}一张非{C:legendary}传奇",
          "的小丑牌并生成",
          "{C:inactive}（不可选择重复牌）"
        }
      },
      c_paperback_apostle_of_swords = {
        name = "宝剑使徒",
        text = {
          "摧毁一张选定的",
          "{C:attention}小丑牌{}，底注{C:attention}#1#{}"
        }
      },
      c_paperback_apostle_of_pentacles = {
        name = "星币使徒",
        text = {
          "给{C:attention}#1#{}张选定的牌",
          "加上{C:paperback_platinum}白金别针"
        }
      },
      c_paperback_golden_bough = {
        name = "金枝",
        text = {
          "击败{C:attention}Boss盲注{}时",
          "生成一个随机的",
          "{C:dark_edition}负片{}版本的{C:paperback_ego_gift}E.G.O饰品{}",
          "小丑牌槽位{C:red}#1#"
        }
      },
    },
    paperback_minor_arcana = {
      c_paperback_ace_of_cups = {
        name = "圣杯首牌",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:chips}蓝色别针"
        }
      },
      c_paperback_two_of_cups = {
        name = "圣杯二",
        text = {
          "生成一个{C:dark_edition}多彩{}、",
          "{C:dark_edition}镭射{}、{C:dark_edition}闪箔{}、",
          "{C:mult}稀有{}或{C:green}罕见{}标签"
        }
      },
      c_paperback_three_of_cups = {
        name = "圣杯三",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:paperback_black}黑色别针"
        }
      },
      c_paperback_four_of_cups = {
        name = "圣杯四",
        text = {
          "从最多{C:attention}#1#{}张选定卡牌",
          "移除{C:attention}增强{}、{C:attention}蜡封{}和{C:attention}版本",
          "每移除一种增益获得{C:money}$#2#"
        }
      },
      c_paperback_five_of_cups = {
        name = "圣杯五",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_six_of_cups = {
        name = "圣杯六",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "获得等于其自身{C:chips}筹码值",
          "一半的{C:money}资金",
          "{C:inactive}（最高{C:money}$#2#{C:inactive}）"
        }
      },
      c_paperback_seven_of_cups = {
        name = "圣杯七",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "添加随机{C:attention}增强"
        }
      },
      c_paperback_eight_of_cups = {
        name = "圣杯八",
        text = {
          "选定最多{C:attention}#1#{}张卡牌",
          "全部转为同一种",
          "{C:attention}不包含在内{}的花色"
        }
      },
      c_paperback_nine_of_cups = {
        name = "圣杯九",
        text = {
          "摧毁一张选定的{C:attention}小丑牌",
          "尽可能生成一张更高",
          "{C:attention}稀有度{}的新{C:attention}小丑牌",
          "否则生成相同稀有度的",
          "{C:inactive}（无法生成{C:legendary}传奇{C:inactive}）"
        }
      },
      c_paperback_ten_of_cups = {
        name = "圣杯十",
        text = {
          "有{C:green}#1#/#2#{}的几率",
          "为{C:attention}1{}张选定的手牌",
          "添加{C:dark_edition}多彩{}版本"
        }
      },
      c_paperback_page_of_cups = {
        name = "圣杯侍从",
        text = {
          "为最多{C:attention}#1#{}张选定卡牌",
          "加上{C:inactive}白色别针"
        }
      },
      c_paperback_knight_of_cups = {
        name = "圣杯骑士",
        text = {
          "选定{C:attention}#1#{}张卡牌， {C:attention}左侧{}的牌",
          "获得{C:attention}右侧{}的牌上的{C:attention}所有增益",
          "摧毁{C:attention}右侧{}的牌",
          "{C:inactive}（拖动来改变位置）"
        }
      },
      c_paperback_queen_of_cups = {
        name = "圣杯皇后",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_king_of_cups = {
        name = "圣杯国王",
        text = {
          "每套有完整{C:attention}13{}种",
          "原版点数的{C:attention}花色",
          "使你获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
        }
      },
      c_paperback_ace_of_wands = {
        name = "权杖首牌",
        text = {
          "为最多{C:attention}#1#{}张选定卡牌",
          "加上{C:mult}红色别针"
        }
      },
      c_paperback_two_of_wands = {
        name = "权杖二",
        text = {
          "生成你{C:attention}最常用",
          "和{C:attention}最不常用{}的",
          "牌型的{C:planet}星球牌",
          "{C:inactive}（必须有空位）"
        }
      },
      c_paperback_three_of_wands = {
        name = "权杖三",
        text = {
          "选定手牌中的{C:attention}#1#{}张卡牌",
          "生成一张复制牌",
        }
      },
      c_paperback_four_of_wands = {
        name = "权杖四",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:paperback_pink}粉色别针"
        }
      },
      c_paperback_five_of_wands = {
        name = "权杖五",
        text = {
          "摧毁所有{C:attention}手牌",
          "将资金变为{C:money}$0"
        }
      },
      c_paperback_six_of_wands = {
        name = "权杖六",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_seven_of_wands = {
        name = "权杖七",
        text = {
          "生成一个",
          "{C:attention}破坏标签"
        }
      },
      c_paperback_eight_of_wands = {
        name = "权杖八",
        text = {
          "生成一个{C:dark_edition}负片{}标签",
          "失去{C:red}$#1#",
          "如果小丑牌超过{C:attention}#3#{}张",
          "每多一张再增加{C:red}$#2#",
          "{C:inactive}（当前为{C:red}$#4#{C:inactive}）"
        }
      },
      c_paperback_nine_of_wands = {
        name = "权杖九",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_ten_of_wands = {
        name = "权杖十",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "摧毁{C:attention}右侧{}的两张牌",
          "将它们自身的{C:chips}筹码",
          "都加到{C:attention}最左侧{}的牌上",
          "{C:inactive}（拖动来改变位置）"
        }
      },
      c_paperback_page_of_wands = {
        name = "权杖侍从",
        text = {
          "为最多{C:attention}#1#{}张选定卡牌",
          "加上{C:attention}橙色别针"
        }
      },
      c_paperback_knight_of_wands = {
        name = "权杖骑士",
        text = {
          "生成一个",
          "{C:mult}高风险标签"
        }
      },
      c_paperback_queen_of_wands = {
        name = "权杖皇后",
        text = {
          "有{C:green}#1#/#2#{}的几率",
          "为一张随机{C:attention}小丑牌",
          "添加{C:dark_edition}双色{}版本"
        }
      },
      c_paperback_king_of_wands = {
        name = "权杖国王",
        text = {
          "生成一张随机的",
          "非{C:chips}普通{}小丑牌",
          "{C:inactive}（{C:legendary}传奇{C:inactive}除外）"
        }
      },
      c_paperback_ace_of_swords = {
        name = "宝剑首牌",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定卡牌的",
          "花色转为{V:1}#2#",
        }
      },
      c_paperback_two_of_swords = {
        name = "宝剑二",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定卡牌转为最近",
          "一张{C:attention}计分牌{}的花色",
          "{C:inactive}（当前为{V:1}#2#{C:inactive}）",
        }
      },
      c_paperback_three_of_swords = {
        name = "宝剑三",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_four_of_swords = {
        name = "宝剑四",
        text = {
          "将{C:attention}#1#{}张选定卡牌",
          "变为随机{C:attention}人头牌"
        }
      },
      c_paperback_five_of_swords = {
        name = "宝剑五",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上随机{C:attention}版本{}、",
          "{C:attention}蜡封{}或{C:attention}增强"
        }
      },
      c_paperback_six_of_swords = {
        name = "宝剑六",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:attention}黄色别针"
        }
      },
      c_paperback_seven_of_swords = {
        name = "宝剑七",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:attention}金色别针"
        }
      },
      c_paperback_eight_of_swords = {
        name = "宝剑八",
        text = {
          "为最多{C:attention}#1#{}张选定卡牌",
          "加上随机{C:attention}别针"
        }
      },
      c_paperback_nine_of_swords = {
        name = "宝剑九",
        text = {
          "选定一张小丑牌",
          "将其摧毁并{C:red}移出{}卡池",
          "获得{C:money}$#2#",
          "{C:inactive}（无视{C:paperback_eternal}永恒{C:inactive}）"
        }
      },
      c_paperback_ten_of_swords = {
        name = "宝剑十",
        text = {
          "选定一张卡牌",
          "在完整牌组中{C:attention}摧毁",
          "所有{C:attention}相同点数{}的牌"
        }
      },
      c_paperback_page_of_swords = {
        name = "宝剑侍从",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_knight_of_swords = {
        name = "宝剑骑士",
        text = {
          "随机生成一张{C:tarot}塔罗牌",
          "和一张{C:paperback_minor_arcana}塔罗辅牌",
          "{C:inactive}（必须有空位）"
        }
      },
      c_paperback_queen_of_swords = {
        name = "宝剑皇后",
        text = {
          "选定一张卡牌",
          "在完整牌组中将随机",
          "{C:attention}#1#{}张{C:attention}不同花色{}的牌",
          "转为选定牌的{C:attention}花色"
        }
      },
      c_paperback_king_of_swords = {
        name = "宝剑国王",
        text = {
          "为一张选定的小丑牌",
          "抹去{C:money}租赁{}和{C:paperback_perishable}易腐"
        }
      },
      c_paperback_king_of_swords_bunc = {
        name = "宝剑国王",
        text = {
          "为一张选定的小丑牌",
          "抹去除{C:paperback_eternal}永恒{}以外的",
          "所有贴纸"
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "星币首牌",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定卡牌的",
          "花色转为{V:1}#2#{}",
        }
      },
      c_paperback_two_of_pentacles = {
        name = "星币二",
        text = {
          "为一张选定的小丑牌",
          "加上或抹去{C:paperback_eternal}永恒"
        }
      },
      c_paperback_three_of_pentacles = {
        name = "星币三",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "{C:attention}右侧{}的两张牌获得",
          "{C:attention}最左侧{}的牌的{C:attention}增强",
          "{C:inactive}（拖动来改变位置）"
        }
      },
      c_paperback_four_of_pentacles = {
        name = "星币四",
        text = {
          "选定{C:attention}#1#{}张手牌",
          "每张{C:attention}未选{}的手牌",
          "都有{C:green}#2#/#3#{}的几率",
          "被摧毁"
        }
      },
      c_paperback_five_of_pentacles = {
        name = "星币五",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_six_of_pentacles = {
        name = "星币六",
        text = {
          "获得一个{C:money}投资{}、",
          "{C:money}经济{}、{C:red}代金券{}、",
          "{C:green}D6{}或{C:attention}杂耍{}标签"
        }
      },
      c_paperback_seven_of_pentacles = {
        name = "星币七",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:green}绿色别针"
        }
      },
      c_paperback_eight_of_pentacles = {
        name = "星币八",
        text = {
          "本赛局每使用一种",
          "{C:tarot}塔罗牌{}和{C:paperback_minor_arcana}塔罗辅牌",
          "获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
        }
      },
      c_paperback_nine_of_pentacles = {
        name = "星币九",
        text = {
          "为{C:attention}#1#{}张选定卡牌",
          "加上{C:purple}紫色别针"
        }
      },
      c_paperback_ten_of_pentacles = {
        name = "星币十",
        text = {
          "随机获得",
          "{C:money}$#1#{}至{C:money}$#2#"
        }
      },
      c_paperback_page_of_pentacles = {
        name = "星币侍从",
        text = {
          "增强{C:attention}#1#{}张",
          "选定卡牌成为",
          "{C:attention}#2#"
        }
      },
      c_paperback_knight_of_pentacles = {
        name = "星币骑士",
        text = {
          "将{C:green}重掷{}价格",
          "重置为{C:money}$#1#"
        }
      },
      c_paperback_queen_of_pentacles = {
        name = "星币皇后",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "将{C:attention}右侧{}的牌的{C:attention}点数",
          "转为{C:attention}左侧{}的牌的点数",
          "{C:inactive}（拖动来改变位置）"
        }
      },
      c_paperback_king_of_pentacles = {
        name = "星币国王",
        text = {
          "完整牌组中",
          "每有一张{C:attention}人头牌",
          "获得{C:money}$#1#",
          "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
        }
      },
    },
    paperback_ego_gift = {
      c_paperback_dark_vestige = {
        name = "黑暗残迹",
        text = {
          "尝试复制",
          "{C:paperback_ego_gift}E.G.O饰品{}的结果…",
        }
      },
      c_paperback_imposed_weight = {
        name = "强压的重担",
        text = {
          "每空出一个{C:attention}小丑牌槽位",
          "重新触发{C:attention}最右侧{}的",
          "记分牌{C:attention}#1#{}次",
        }
      },
      c_paperback_phlebotomy_pack = {
        name = "采血包",
        text = {
          "每回合出牌次数{C:blue}+#1#",
        }
      },
      c_paperback_smokes_and_wires = {
        name = "烟霾与铁丝网",
        text = {
          "每回合{C:attention}最后一次{}出牌",
          "{X:red,C:white}X#1#{}倍率",
        }
      },
      c_paperback_coffee_and_cranes = {
        name = "咖啡与纸鹤",
        text = {
          "回合结束时获得{C:money}$#1#{}",
        }
      },
      c_paperback_fiery_down = {
        name = "炽热的羽毛",
        text = {
          "弃掉{C:attention}#1#{}{C:inactive}[#2#]{}张牌之后",
          "升级下一次打出",
          "{C:attention}牌型{}的等级"
        }
      },
      c_paperback_decamillennial_stewpot = {
        name = "万年炖锅",
        text = {
          "如果回合的{C:attention}第一次出牌",
          "只有{C:attention}一张牌",
          "则摧毁这张牌",
        }
      },
      c_paperback_downpour = {
        name = "暴雨",
        text = {
          "每次出牌",
          "使{C:attention}盲注分数{}要求",
          "降低{C:attention}#1#%",
        }
      },
      c_paperback_rusty_coin = {
        name = "生锈的纪念币",
        text = {
          "如果回合的{C:attention}第一次出牌",
          "只有{C:attention}一张牌",
          "给它加上随机{C:attention}蜡封"
        }
      },
      c_paperback_ragged_umbrella = {
        name = "破伞",
        text = {
          "如果一次{C:attention}出牌",
          "未击败{C:attention}盲注",
          "这个{C:paperback_ego_gift}E.G.O饰品{}",
          "获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
        }
      },
      c_paperback_thrill = {
        name = "快感",
        text = {
          "在回合的{C:attention}第一次出牌{}中",
          "{C:attention}本回合{}每使用一次{C:attention}弃牌",
          "这个{C:paperback_ego_gift}E.G.O饰品{}",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
        }
      },
      c_paperback_thrill_inactive = {
        name = "快感",
        text = {
          "在回合的{C:attention}第一次出牌{}中",
          "{C:attention}本回合{}每使用一次{C:attention}弃牌",
          "这个{C:paperback_ego_gift}E.G.O饰品{}",
          "获得{X:mult,C:white}X#1#{}倍率",
        }
      },
      c_paperback_disk_fragment = {
        name = "星象盘碎片",
        text = {
          "选择{C:attention}小盲注{}或{C:attention}大盲注{}时",
          "若未持有{C:planet}星球牌",
          "则生成{C:attention}#1#{}张售价为{C:money}$1{}的",
          "{C:dark_edition}负片{}版本的{C:planet}星球牌",
        }
      },
      c_paperback_death_seeker = {
        name = "寻死者",
        text = {
          "{C:attention}增强牌{}在计分时给予",
          "等于牌的{C:attention}点数{}的{C:mult}倍率",
        }
      },
      c_paperback_pendant_of_nostalgia_minor_arcana = {
        name = "追忆吊坠",
        text = {
          "摧毁一张{C:attention}游戏牌{}时",
          "生成一张随机的",
          "{C:tarot}塔罗牌{}或{C:paperback_minor_arcana}塔罗辅牌",
          "{C:inactive}（必须有空间）"
        }
      },
      c_paperback_pendant_of_nostalgia = {
        name = "追忆吊坠",
        text = {
          "摧毁一张{C:attention}游戏牌{}时",
          "生成一张随机的{C:tarot}塔罗牌",
          "{C:inactive}（必须有空间）"
        }
      },
      c_paperback_blue_lighter = {
        name = "蓝色芝宝牌打火机",
        text = {
          "选择{C:attention}盲注{}时，摧毁一张",
          "非{C:paperback_ego_gift}E.G.O饰品{}的消耗牌",
          "这个{C:paperback_ego_gift}E.G.O饰品{}",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为 {X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      c_paperback_broken_glasses = {
        name = "破碎的眼镜",
        text = {
          "恰好摧毁{C:attention}1{}或{C:attention}2{}张牌时",
          "为{C:attention}每张{}被摧毁的牌",
          "生成{C:attention}两张复制牌",
          "然后有{C:green}#1#/#2#{}的几率{C:red}自毁"
        }
      },
      c_paperback_nebulizer = {
        name = "雾化吸入器",
        text = {
          "记分牌有{C:green}#1#/#2#{}的几率",
          "给予{X:mult,C:white}X#3#{}倍率"
        }
      },
      c_paperback_tomorrow_fortune = {
        name = "明日的运势",
        text = {
          "所有的{C:attention}补充包{}中",
          "多{C:attention}#1#{}张可供选择的牌"
        }
      },
      c_paperback_fluorescent_lamp = {
        name = "荧光灯",
        text = {
          "弃牌次数{C:red}+#1#{}",
          "每空出{C:attention}#2#{}个{C:attention}小丑牌槽位",
          "弃牌次数再{C:red}+#1#",
          "{C:inactive}（当前弃牌次数{C:red}+#3#{C:inactive}）"
        }
      },
      c_paperback_lightning_rod = {
        name = "避雷针",
        text = {
          "有{C:green}#1#/#2#{}的几率",
          "重新触发",
          "{C:attention}留在手牌中{}的牌的能力"
        }
      },
      c_paperback_chalice_of_trickle_down = {
        name = "涓滴之杯",
        text = {
          "在{C:attention}Boss盲注{}中",
          "每次出牌获得",
          "等于{C:attention}记分牌{}中",
          "最低点数的{C:money}资金{}"
        }
      },
      c_paperback_patrolling_flashlight = {
        name = "巡逻用手电筒",
        text = {
          "为每个{C:attention}底注",
          "使用的第一张消耗牌",
          "生成一张{C:attention}充能{}的复制牌"
        }
      },
    },
    Voucher = {
      v_paperback_celtic_cross = {
        name = "凯尔特十字",
        text = {
          "击败{C:attention}Boss盲注{}后",
          "商店会上架一个",
          "{C:attention}免费{}的{C:paperback_minor_arcana}超级秘仪包",
        }
      },
      v_paperback_soothsay = {
        name = "预言",
        text = {
          "{C:money}商店{}中可能出现",
          "{C:paperback_minor_arcana}塔罗辅牌"
        },
        unlock = {
          "在一场赛局中使用",
          "{C:attention,E:1}#1#{}张{C:paperback_minor_arcana,E:1}塔罗辅牌",
        }
      },
      v_paperback_second_trumpet = {
        name = "TT1协议",
        text = {
          "你的第一个{C:paperback_ego_gift}E.G.O饰品{}",
          "给予{C:attention}+#1#{}消耗牌槽位"
        }
      },
      v_paperback_rabbit_protocol = {
        name = "兔子协议",
        text = {
          "{C:attention}售出{}一个{C:paperback_ego_gift}E.G.O饰品{}",
          "可以{C:attention}消除{}当前",
          "{C:attention}Boss盲注{}的限制条件",
        },
        unlock = {
          "在一场赛局中售出",
          "{C:attention,E:1}#1#{}个{C:paperback_ego_gift,E:1}E.G.O饰品",
        }
      },
    },
    Tag = {
      tag_paperback_angel_investment = {
        name = "天使投资标签",
        text = {
          "你每拥有{C:money}$#2#{}，获得{C:money}$#1#",
          "{C:inactive}（最高{C:money}$#3#{C:inactive}）",
          "{C:inactive}（将获得{C:money}$#4#{C:inactive}）"
        }
      },
      tag_paperback_divination = {
        name = "占卜标签",
        text = {
          "获得一个免费的",
          "{C:paperback_minor_arcana}超级秘仪包"
        }
      },
      tag_paperback_dichrome = {
        name = "双色标签",
        text = {
          "商店里的下一张",
          "基础版本小丑牌",
          "将会免费且变为{C:dark_edition}双色"
        }
      },
      tag_paperback_high_risk = {
        name = "高风险标签",
        text = {
          "选择{C:attention}Boss盲注{}时",
          "分数要求{C:attention}翻倍",
          "然后获得{C:money}$#1#"
        }
      },
      tag_paperback_breaking = {
        name = "破坏标签",
        text = {
          "消除{C:attention}Boss盲注",
          "的能力"
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "创神星",
      },
      c_paperback_haumea = {
        name = "妊神星",
      },
      c_paperback_sedna = {
        name = "赛德娜",
      },
      c_paperback_makemake = {
        name = "鸟神星",
      },
    },
    Enhanced = {
      m_paperback_ceramic = {
        name = "陶瓷牌",
        text = {
          "计分时随机获得{C:money}$#1#{}至{C:money}$#2#",
          "无论留在手牌中还是打出",
          "如果一手牌最终的{C:mult}倍率",
          "超过{C:chips}筹码{}，则{C:red}自毁"
        }
      },
      m_paperback_soaked = {
        name = "水浸牌",
        text = {
          "计分前，所有{C:attention}留在手牌中",
          "的牌给予自身的{C:chips}筹码",
          "{C:red}弃掉{}时，有{C:green}#1#/#2#{}的几率",
          "{C:red}自毁",
        }
      },
      m_paperback_wrapped = {
        name = "礼物牌",
        text = {
          "计分时获得{C:money}$#1#",
          "无点数无花色"
        }
      },
      m_paperback_bandaged = {
        name = "绷带牌",
        text = {
          "重新触发{C:attention}相邻{}卡牌",
          "计分时有{C:green}#1#/#2#{}的几率",
          "{C:red}自毁"
        }
      },
      m_paperback_domino = {
        name = "多米诺牌",
        text = {
          "{C:mult}+#2#{}倍率",
          "本回合每打出",
          "或弃掉一种点数",
          "提高{C:mult}+#1#{}倍率"
        }
      },
      m_paperback_stained = {
        name = "污渍牌",
        text = {
          "{C:attention}留在手牌中{}时",
          "所有记分牌永久",
          "获得{C:mult}+#1#{}倍率"
        }
      },
      m_paperback_sleeved = {
        name = "封套牌",
        text = {
          "不会被{C:attention}削弱{}或{C:attention}翻面",
          "如果被摧毁",
          "则获得{C:money}$#1#"
        }
      },
      m_paperback_antique = {
        name = "古董牌",
        text = {
          "{X:chips,C:white}X#1#{}筹码",
          "作为记分牌被打出时",
          "永久提高{X:chips,C:white}X#2#{}筹码",
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "双色",
        text = {
          "选择{C:attention}盲注{}时",
          "{C:blue}出牌{}或{C:red}弃牌{}次数{C:attention}+#1#",
          "{C:inactive}（较少的次数优先）"
        }
      },
      e_paperback_dichrome_playing_card = {
        name = "双色",
        text = {
          "当这张牌被{C:attention}抽出{}时",
          "{C:blue}出牌{}或{C:red}弃牌{}次数{C:attention}+#1#",
          "{C:inactive}（较少的次数优先）"
        }
      }
    },
    Other = {
      undiscovered_paperback_minor_arcana = {
        name = "Not Discovered",
        text = {
          "在非预设局",
          "中购买或",
          "使用此牌",
          "以了解其效果",
        },
      },
      undiscovered_paperback_ego_gift = {
        name = "Not Discovered",
        text = {
          "在非预设局",
          "中购买此牌",
          "以了解其效果",
        },
      },
      paperback_light_suits = {
        name = "亮花色",
        text = {
          "{C:diamonds}方片{}，{C:hearts}红桃{}"
        }
      },
      paperback_dark_suits = {
        name = "暗花色",
        text = {
          "{C:spades}黑桃{}, {C:clubs}梅花{}"
        }
      },
      paperback_requires_custom_suits = {
        name = "需要新花色",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}新花色{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_enhancements = {
        name = "需要增强",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}增强{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_paperclips = {
        name = "需要别针",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}别针{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_minor_arcana = {
        name = "需要塔罗辅牌",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}塔罗辅牌{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_tags = {
        name = "需要标签",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}标签{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_editions = {
        name = "需要版本",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}版本{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_ranks = {
        name = "需要新点数",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}新点数{}",
          "无法出现在游戏中",
        }
      },
      paperback_requires_ego_gifts = {
        name = "需要E.G.O饰品",
        text = {
          "由于在{C:legendary}Paperback{}设置中",
          "禁用了{C:attention}E.G.O饰品{}",
          "无法出现在游戏中",
        }
      },
      paperback_upgrade_unlock = {
        name = "锁定",
        text = {
          "触发{C:attention,E:1}#1#{}的能力",
        }
      },

      -- Stickers
      paperback_energized = {
        name = "充能",
        text = {
          "无法被{C:attention}#1#{}",
          "或{C:attention}#2#{}复制",
        }
      },
      paperback_temporary = {
        name = "临时",
        text = {
          "回合结束时",
          "{C:red}自毁"
        }
      },
      paperback_corroded = {
        name = "锈蚀",
        text = {
          "{C:money}售出{}时",
          "不触发{C:paperback_ego_gift}罪名{}效果",
          "在{C:attention}#1#{}回合后{C:red}自毁",
          "并触发{C:paperback_ego_gift}罪名{}效果",
        }
      },

      -- Paperclips
      paperback_blue_clip = {
        name = "蓝色别针",
        text = {
          "{X:chips,C:white}X#2#{}筹码",
          "每有一枚{C:attention}别针{}留在手牌",
          "提高{X:chips,C:white}X#1#{}筹码"
        }
      },
      paperback_red_clip = {
        name = "红色别针",
        text = {
          "{C:mult}+#2#{}倍率",
          "每有一枚{C:attention}别针{}留在手牌",
          "提高{C:mult}+#1#{}倍率",
        }
      },
      paperback_orange_clip = {
        name = "橙色别针",
        text = {
          "计分时获得{C:money}$#3#",
          "每有{C:attention}2{}枚{C:attention}别针{}留在手牌",
          "提高{C:money}$#1#",
        }
      },
      paperback_black_clip = {
        name = "黑色别针",
        text = {
          "如果{C:attention}计分{}时手牌中有",
          "其他{C:attention}别针",
          "重新触发一次",
        }
      },
      paperback_yellow_clip = {
        name = "黄色别针",
        text = {
          "如果{C:attention}计分{}时手牌中有",
          "其他{C:attention}别针",
          "{C:green}#1#/#2#{}的几率{C:red}+#3#{}倍率",
          "{C:green}#4#/#5#{}的几率{X:mult,C:white}X#6#{}倍率",
          "{C:green}#7#/#8#{}的几率获得{C:money}$#9#{}",
        }
      },
      paperback_gold_clip = {
        name = "金色别针",
        text = {
          "如果在{C:attention}回合结束{}时",
          "仍{C:attention}留在手牌{}中，",
          "获得{C:money}$#2#{C:inactive}/最高$#3#",
          "本回合每有一枚{C:attention}别针{}计分",
          "金额增加{C:money}$#1#"
        }
      },
      paperback_white_clip = {
        name = "白色别针",
        text = {
          "如果在{C:attention}回合结束{}时",
          "仍{C:attention}留在手牌{}中，",
          "本回合每有一枚{C:attention}别针{}计分",
          "这枚别针获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      paperback_pink_clip = {
        name = "粉色别针",
        text = {
          "留在{C:attention}手牌{}中时，{X:mult,C:white}X#1#{}倍率",
          "每有一枚{C:attention}别针{}计分",
          "提高{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}（每次出牌后重置）"
        }
      },
      paperback_green_clip = {
        name = "绿色别针",
        text = {
          "每有{C:attention}2{}枚{C:attention}别针",
          "打出并计分，{C:mult}+#2#{}倍率",
          "每弃掉一枚{C:attention}别针{}，{C:mult}#3#{}倍率",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
        }
      },
      paperback_purple_clip = {
        name = "紫色别针",
        text = {
          "留在{C:attention}手牌{}中时，有{C:green}#1#/#2#{}的",
          "几率生成一张随机的{C:attention}塔罗牌",
          "每枚计分的{C:attention}别针{}使分子{C:green}+#3#",
          "{C:inactive}（每次出牌后重置）"
        }
      },
      paperback_platinum_clip = {
        name = "白金别针",
        text = {
          "{C:attention}计分{}时，强制触发",
          "手牌中所有",
          "非{C:paperback_platinum}白金{}{C:attention}别针{}的能力"
        }
      },
      -- E.G.O Gift Sins
      paperback_sin_none = {
        name = "残迹",
        text = {
          "售价总是{C:money}$#1#{}"
        }
      },
      paperback_sin_wrath = {
        name = "愤怒",
        text = {
          "售出时，{C:attention}摧毁{}所有",
          "持有的{C:attention}消耗牌"
        }
      },
      paperback_sin_lust = {
        name = "色欲",
        text = {
          "售出时，最常用的{C:attention}牌型",
          "降低{C:attention}#1#{}个等级"
        }
      },
      paperback_sin_sloth = {
        name = "怠惰",
        text = {
          "只能在跳过{C:attention}盲注",
          "之后立即售出"
        }
      },
      paperback_sin_gluttony = {
        name = "暴食",
        text = {
          "售出时，给一张随机",
          "{C:attention}小丑牌{}添加{C:paperback_perishable}易腐"
        }
      },
      paperback_sin_gloom = {
        name = "忧郁",
        text = {
          "售出时，所有{C:attention}盲注",
          "分数要求永久{C:attention}X#1#{}"
        }
      },
      paperback_sin_pride = {
        name = "傲慢",
        text = {
          "售价总是{C:money}#2#{}"
        }
      },
      paperback_sin_envy = {
        name = "嫉妒",
        text = {
          "售出时，手牌",
          "上限永久{C:attention}-#1#"
        }
      },
      paperback_sin_madness = {
        name = "疯狂",
        text = {
          "售出时， 随机{C:attention}摧毁",
          "一张{C:attention}小丑牌"
        }
      },
      p_paperback_ego_gift_normal = {
        name = "E.G.O饰品提取包",
        text = {
          "从最多{C:attention}#2#{}个{C:paperback_ego_gift}E.G.O饰品{}中",
          "选择{C:attention}#1#{}个",
        },
      },
      -- Minor Arcana
      p_paperback_minor_arcana_normal = {
        name = "秘仪包",
        text = {
          "从最多{C:attention}#2#{}张{C:paperback_minor_arcana}塔罗辅牌{}中",
          "选择{C:attention}#1#{}张",
          "即选即用"
        }
      },
      p_paperback_minor_arcana_jumbo = {
        name = "巨型秘仪包",
        text = {
          "从最多{C:attention}#2#{}张{C:paperback_minor_arcana}塔罗辅牌{}中",
          "选择{C:attention}#1#{}张",
          "即选即用"
        }
      },
      p_paperback_minor_arcana_mega = {
        name = "超级秘仪包",
        text = {
          "从最多{C:attention}#2#{}张{C:paperback_minor_arcana}塔罗辅牌{}中",
          "选择{C:attention}#1#{}张",
          "即选即用"
        }
      },
      -- Informational
      paperback_suit_drink = {
        name = "花色饮料",
        text = {
          "如果连续{C:attention}2{}次出牌",
          "都没有打出{C:attention}计分{}的{V:1}#1#{}牌",
          "这张小丑牌将{C:red}自毁",
        }
      },
    },
    Partner = {
      pnr_paperback_virtual = {
        name = "虚拟",
        text = {
          "如果没有打出{C:paperback_dark_suit}暗花色{}牌",
          "重新触发{C:attention}第一张{}计分的",
          "{C:paperback_light_suit}亮花色{}牌",
        }
      },
      pnr_paperback_aftermath = {
        name = "余波",
        text = {
          "计分的{C:attention}人头牌{}",
          "永久获得{C:chips}+#1#{}筹码",
        }
      },
      pnr_paperback_faker = {
        name = "伪装者",
        text = {
          "如果只出{C:attention}1{}张牌",
          "则摧毁这张牌",
          "每回合{C:attention}限一次{}",
        }
      },
      pnr_paperback_faker_buffed = {
        text = {
          "如果只出{C:attention}1{}张牌",
          "则摧毁这张牌",
        }
      },
    },
    Sleeve = {
      sleeve_paperback_paper = {
        name = "纸质牌套",
        text = {
          "{C:legendary}Paperback{}模组{C:attention}小丑{}",
          "出现频率{C:attention}X3",
          "开局带有",
          "{C:attention,T:j_paperback_shopping_center}#1#{}小丑"
        }
      },
      sleeve_paperback_paper_buff = {
        name = "纸质牌套",
        text = {
          "开局带有{C:dark_edition}负片{}版本的",
          "{C:attention,T:j_paperback_shopping_center}#1#{}小丑"
        }
      },

      sleeve_paperback_proud = {
        name = "骄傲牌套",
        text = {
          "初始牌组带有一整副",
          "{C:hearts}红桃{}、{C:diamonds}方片{}、{C:spades}黑桃",
          "{C:clubs}梅花{}、{C:paperback_crowns}皇冠{}和{C:paperback_stars}银星"
        }
      },
      sleeve_paperback_proud_buff = {
        name = "骄傲牌套",
        text = {
          "所有的{C:attention}A",
          "都是{C:dark_edition}多彩{}版本"
        }
      },

      sleeve_paperback_silver = {
        name = "银色牌套",
        text = {
          "开局拥有",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}优惠券",
          "和一张{C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      sleeve_paperback_silver_buff = {
        name = "银色牌套",
        text = {
          "开局拥有",
          "{C:paperback_minor_arcana,T:v_paperback_soothsay}#1#{}优惠券"
        }
      },

      sleeve_paperback_dreamer = {
        name = "逐梦者牌套",
        text = {
          "开局带有一张",
          "{C:paperback_temporary}临时{}的{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "小丑牌槽位{C:attention}#2#"
        }
      },
      sleeve_paperback_dreamer_buff = {
        name = "逐梦者牌套",
        text = {
          "初始牌组带有",
          "每种花色的一张{C:attention}#1#"
        }
      },

      sleeve_paperback_antique = {
        name = "古董牌套",
        text = {
          "{C:tarot}秘术包{}不再",
          "出现在商店中",
          "{C:paperback_minor_arcana}秘仪包",
          "出现频率{C:attention}X3"
        }
      },
      sleeve_paperback_antique_buff = {
        name = "古董牌套",
        text = {
          "所有{C:paperback_minor_arcana}秘仪包{}{C:money}免费",
        }
      },

      sleeve_paperback_passionate = {
        name = "激昂牌套",
        text = {
          "每次击败{C:attention}Boss盲注{}后",
          "获得一个{C:attention,T:tag_paperback_high_risk}#1#",
          "不再赚取{C:money}利息"
        }
      },
      sleeve_paperback_passionate_buff = {
        name = "激昂牌套",
        text = {
          "所有其他{C:attention}Boss盲注",
          "被换成{C:attention}关底盲注",
          "每次击败{C:attention}关底盲注",
          "获得一个{C:dark_edition,T:tag_negative}负片{}标签"
        }
      },
      sleeve_paperback_shimmering = {
        name = "微光牌套",
        text = {
          "小丑牌槽位{C:red}#2#",
          "每持有一种{C:attention}罪名",
          "使消耗牌槽位{C:attention}+#1#",
          "{C:paperback_ego_gift}E.G.O提取包{}出现频率{C:attention}X5",
        }
      },
      sleeve_paperback_shimmering_buff = {
        name = "微光牌套",
        text = {
          "TBD"
        }
      }
    }
  },
  misc = {
    challenge_names = {
      -- Trials
      c_paperback_trial_of_cups = "圣杯审判",
      c_paperback_trial_of_wands = "权杖审判",
      c_paperback_trial_of_swords = "宝剑审判",
      c_paperback_trial_of_pentacles = "星币审判",

      -- Regular Challenges
      c_paperback_joker_of_the_day = "今日小丑",
      c_paperback_white_nights_and_dark_days = "白夜与黑昼",
      c_paperback_hard_cover = "精装书",
      c_paperback_borderline = "边界线",
      c_paperback_all_smiles = "面带微笑",
      c_paperback_hide_and_seek = "捉迷藏",
      c_paperback_suburbia_overture = "郊区生活的序章",
      c_paperback_foodie = "美食家"
    },
    v_text = {
      ch_c_cup_trial_1 = {
        "击败{C:attention}Boss盲注{}后，{C:attention}摧毁{}"
      },
      ch_c_cup_trial_2 = {
        "最左侧的{C:attention}小丑牌{}并生成一张"
      },
      ch_c_cup_trial_3 = {
        "相同或更高稀有度的随机小丑牌"
      },
      ch_c_cup_trial_4 = {
        "{C:inactive}（无法生成{C:legendary}传奇{C:inactive}）{}"
      },
      ch_c_wand_trial = {
        "击败{C:attention}Boss盲注{}时，{C:attention}小丑牌槽位{}+1"
      },
      ch_c_sword_trial_1 = {
        "击败{C:attention}Boss盲注{}时，{C:attention}摧毁"
      },
      ch_c_sword_trial_2 = {
        "你牌组中{C:attention}点数最小{}的5张牌"
      },
      ch_c_paperback_banned_vanilla_jokers = {
        "所有{C:attention}原版{}小丑牌被禁用"
      },
      ch_c_paperback_banned_non_common_jokers = {
        "所有{C:attention}非普通{}小丑牌被禁用"
      },
      ch_c_paperback_only_food_jokers = {
        "所有{C:attention}非食物{}小丑牌被禁用"
      },
      ch_c_paperback_2x_blind_size = {
        "盲注要求分数{C:red}X2{}"
      },
      ch_c_paperback_non_faces_banned_ante = {
        "底注4结束后，所有{C:attention}非人头牌{}被{C:red}削弱"
      },
    },
    dictionary = {
      -- Badge under cards
      k_paperback_minor_arcana = "塔罗辅牌",
      -- Name of consumable type in collection
      b_paperback_minor_arcana_cards = "塔罗辅牌",
      -- Text shown at the bottom while opening booster
      paperback_minor_arcana_pack = "秘仪包",

      -- Badge under gifts
      k_paperback_ego_gift = "E.G.O饰品",
      -- Name of consumable type in collection
      b_paperback_ego_gift_cards = "E.G.O饰品",
      -- Text shown at the bottom while opening booster
      paperback_ego_gift_pack = "E.G.O饰品提取",

      -- Badge under E.G.O Gifts based on sins
      k_paperback_ego_sin_none = "残迹",
      k_paperback_ego_sin_pride = "傲慢",
      k_paperback_ego_sin_wrath = "愤怒",
      k_paperback_ego_sin_gloom = "忧郁",
      k_paperback_ego_sin_sloth = "怠惰",
      k_paperback_ego_sin_lust = "色欲",
      k_paperback_ego_sin_envy = "嫉妒",
      k_paperback_ego_sin_gluttony = "暴食",
      k_paperback_ego_sin_madness = "疯狂",

      paperback_confessed_ex = "认罪！!",
      paperback_polychrome_ex = "多彩！",
      paperback_destroyed_ex = "已摧毁！",
      paperback_doubled_ex = "翻倍！",
      paperback_too_late_ex = "太迟了！",
      paperback_broken_ex = "损坏！",
      paperback_none = "无",
      paperback_downgrade_ex = "降级！",
      paperback_copy_ex = "复制！",
      paperback_consumed_ex = "喝完了！",
      paperback_tipsy_ex = "微醺！",
      paperback_too_hot_ex = "太辣了！",
      paperback_inactive = "未激活",
      paperback_supplies_ex = "补给！",
      paperback_melted_ex = "融化了！",
      paperback_investment_ex = "投资！",
      paperback_plus_minor_arcana = "+1塔罗辅牌",
      paperback_plus_consumable = "+1消耗牌",
      paperback_plus_tag = "+1标签",
      paperback_plus_odds = "分子+1",
      paperback_enhanced_ex = "增强！",
      paperback_edition_ex = "版本！",
      paperback_rare_ex = "稀有！",
      paperback_saved_unholy_alliance = "被邪恶联盟救了",
      paperback_saved_determination = "被决心救了",
      paperback_reduced_ex = "降低！",
      paperback_determination_ex = "啊啊啊！",
      paperback_forlorn_destruction = "对不起…",
      paperback_freezer_ex = "晚餐时间！",
      paperback_corroded_ex = "已锈蚀！",
      paperback_jestosterone_ex = "男性化！",
      paperback_jestrogen_ex = "女性化！",
      paperback_punch_card_active = "告诉你朋友！",
      paperback_punch_card_ex = "错误传送！",
      paperback_hamsa_reverse = "倒置！",
      paperback_der_freischutz_fire = "开火…",
      paperback_off_switch_ex = "呼！",
      paperback_one_shift_more_true = "扑！",
      paperback_one_shift_more_false = "通！",

      paperback_ui_requires_restart = "需要重启",
      paperback_ui_no_requires_restart = "无需重启",
      paperback_ui_enable_blinds = "启用盲注",
      paperback_ui_enable_minor_arcana = "启用塔罗辅牌",
      paperback_ui_enable_ego_gifts = "启用E.G.O饰品",
      paperback_ui_enable_enhancements = "启用增强牌",
      paperback_ui_enable_editions = "启用版本",
      paperback_ui_enable_paperclips = "启用别针",
      paperback_ui_custom_suits_enabled = "启用新花色",
      paperback_ui_enable_vouchers = "启用优惠券",
      paperback_ui_enable_tags = "启用标签",
      paperback_ui_enable_ranks = "启用新点数",
      paperback_ui_developers = "开发者",
      paperback_ui_artists = "美术",
      paperback_ui_localization = "本地化",
      paperback_ui_paperclips = "别针",
      paperback_ui_enable_spectrals = "启用幻灵牌",
      paperback_ui_plague_doctor_quotes = "瘟疫医生语录",
      paperback_ui_select = "选择",
      paperback_ui_info = "（i）",
      paperback_ui_info_expanded = "（ i ）",
      paperback_ui_remaining_hands = "剩余出牌",
      paperback_ui_show_credits = "显示制作组",

      -- Plague Doctor's quotes  译者注：摘自《圣经·新约》
      paperback_plague_quote_1_1 = '我要把我的教会建造在这磐石上',
      paperback_plague_quote_1_2 = '阴间的权柄不能胜过它',

      paperback_plague_quote_2_1 = '请告诉我们，这些事什么时候发生？',
      paperback_plague_quote_2_2 = '你降临和世界的末了有什么预兆呢？',

      paperback_plague_quote_3_1 = '主啊，你要我们吩咐',
      paperback_plague_quote_3_2 = '火从天上降下来烧灭他们吗？',

      paperback_plague_quote_4_1 = '又给使徒起名叫半尼其',
      paperback_plague_quote_4_2 = '意思是「雷子」',

      paperback_plague_quote_5_1 = '求主将父显给我们看',
      paperback_plague_quote_5_2 = '我们就知足了',

      paperback_plague_quote_6_1 = '耶稣看见一个人，对他说：「跟从我」',
      paperback_plague_quote_6_2 = '他就起来跟从了耶稣',

      paperback_plague_quote_7_1 = '有一个人名叫西门，向来在那城里',
      paperback_plague_quote_7_2 = '行邪术，使撒玛利亚的百姓惊奇',

      paperback_plague_quote_8_1 = '他对其他的门徒说：',
      paperback_plague_quote_8_2 = '「我们也去和他同死吧！」',

      paperback_plague_quote_9_1 = '使徒说：「你是神的儿子',
      paperback_plague_quote_9_2 = '你是以色列的王」',

      paperback_plague_quote_10_1 = '使徒说：「主啊，为什么要向',
      paperback_plague_quote_10_2 = '我们显现，不向世人显现呢？」',

      paperback_plague_quote_11_1 = '从今以后，人都不要搅扰我，',
      paperback_plague_quote_11_2 = '因为我身上带着耶稣的印记',

      paperback_plague_quote_12_1 = '我不是拣选了你们十二个人吗？',
      paperback_plague_quote_12_2 = '但你们中间有一个是魔鬼',

      -- Clippy messages
      paperback_clippy_msg_1 = "保存文件？",
      paperback_clippy_msg_2 = "我是大眼夹！",
      paperback_clippy_msg_3 = "嗨！",
      paperback_clippy_msg_4 = "键盘已启用！",
      paperback_clippy_msg_5 = "我来帮你！",
      paperback_clippy_msg_6 = "问我吧！",
      paperback_clippy_msg_7 = "我该走了吗？",
      paperback_clippy_msg_8 = "鼠标已启用！",
      paperback_clippy_msg_full = "存储空间已满！",

      -- Da Capo messages
      paperback_da_capo_Clubs = "第一乐章",
      paperback_da_capo_Spades = "第二乐章",
      paperback_da_capo_Diamonds = "第三乐章",
      paperback_da_capo_Hearts = "第四乐章",
      paperback_da_capo_None = "终章！",

      -- Suit category
      paperback_light = "亮",
      paperback_dark = "暗",

      -- Credit
      paperback_art_credit = '美术——',
      paperback_code_credit = '代码——',
      paperback_music_credit = '作曲——',
      paperback_and_spacer = '和',

      -- Developers      译者注：人名不翻译

      paperback_dev_dowfrin = 'Dowfrin',
      paperback_dev_srockw = 'srockw',
      paperback_dev_papermoonqueen = 'PaperMoonQueen',
      paperback_dev_dylan_hall = 'Dylan Hall',
      paperback_dev_metanite = 'metanite64',
      paperback_dev_infinityplus = 'InfinityPlus05',
      paperback_dev_vitellary = 'vitellary',
      paperback_dev_ejwu = 'ejwu2',
      paperback_dev_b = 'B',
      paperback_dev_nether = 'Nether',
      paperback_dev_oppositewolf = 'OppositeWolf770',
      paperback_dev_thermo = 'ThermoDyn',
      paperback_dev_aa7 = 'aa7_2k03',
      paperback_dev_shizi = 'Shizi',
      paperback_dev_nevernamed = 'NeverNamed',
      paperback_dev_scruby = 'S_C_R_U_B_Y',
      paperback_dev_larantula = 'Larantula',
      paperback_dev_ari = 'ari',
    },
    v_dictionary = {
      paperback_a_discards = "+#1#弃牌",
      paperback_a_discards_minus = "-#1#弃牌",
      paperback_a_hands_minus = "-#1#出牌",
      paperback_prince_of_darkness = "+#1#倍率，+#2#筹码",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1#回合",
      paperback_a_plus_cards = "+#1#张#2#",
      paperback_a_plus_tags = "+#1#标签",
      paperback_a_dollars = "$#1#",

      paperback_a_plus_consumable_slot = "+#1#消耗牌槽位",
      paperback_a_minus_consumable_slot = "-#1#消耗牌槽位",
      paperback_a_ante = "#1#底注",
    },
    ranks = {
      paperback_Apostle = '使徒',
    },
    suits_singular = {
      paperback_Crowns = "皇冠",
      paperback_Stars = '银星'
    },
    suits_plural = {
      paperback_Crowns = "皇冠",
      paperback_Stars = '银星'
    },
    poker_hands = {
      ['paperback_Spectrum'] = "光谱",
      ['paperback_Straight Spectrum'] = "光谱顺",
      ['paperback_Straight Spectrum (Royal)'] = "皇家光谱顺",
      ['paperback_Spectrum House'] = "光谱葫芦",
      ['paperback_Spectrum Five'] = "光谱五条",
      ['paperback_Straight Flush (Rapture)'] = "被提同花顺",
    },
    poker_hand_descriptions = {
      ['paperback_Spectrum'] = {
        "5张不同花色的牌"
      },
      ['paperback_Straight Spectrum'] = {
        "连续5张牌 （点数连续），且",
        "每张花色都不同"
      },
      ['paperback_Spectrum House'] = {
        "三条及对子，且",
        "每张花色都不同"
      },
      ['paperback_Spectrum Five'] = {
        "5张相同点数的牌，且",
        "每张花色都不同"
      },
    },
    labels = {
      paperback_blue_clip = "蓝色别针",
      paperback_red_clip = "红色别针",
      paperback_orange_clip = "橙色别针",
      paperback_pink_clip = "粉色别针",
      paperback_black_clip = "黑色别针",
      paperback_yellow_clip = "黄色别针",
      paperback_gold_clip = "金色别针",
      paperback_white_clip = "白色别针",
      paperback_green_clip = "绿色别针",
      paperback_purple_clip = "紫色别针",
      paperback_platinum_clip = "白金别针",
      paperback_dichrome = "双色",
      paperback_energized = "充能",
      paperback_temporary = "临时",
      paperback_corroded = "锈蚀",
    },
  }
}
