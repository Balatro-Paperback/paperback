return {
  descriptions = {
    Back = {
      b_paperback_paper = {
        name = "纸制牌组",
        text = {
          "{C:legendary}Paperback{C:attention} 小丑{}有{C:attention}3X{}的可能出现",
          "开局时获得",
          "{C:attention,T:j_paperback_shopping_center}#1#{}"
        }
      },
      b_paperback_silver = {
        name = "银色牌组",
        text = {
          "开局时拥有",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}优惠券",
          "和一张{C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      b_paperback_passionate = {
        name = "热忱牌组",
        text = {
          "每击败一次",
          "{C:attention}Boss盲注{}后",
          "获得{C:attention,T:tag_paperback_high_risk}#1#",
          "不获得任何{C:money}利息"
        }
      },
      b_paperback_antique = {
        name = "古旧牌组",
        text = {
          "{C:tarot}秘术包{}将不再",
          "出现在商店中",
          "{C:paperback_minor_arcana}秘仪包",
          "出现频率提升为{C:attention}3X{}"
        }
      },
      b_paperback_proud = {
        name = "骄傲牌组",
        text = {
          "开局时拥有全套的",
          "{C:hearts}红桃{}、{C:diamonds}方片{}、{C:spades}黑桃",
          "{C:clubs}梅花{}、{C:paperback_crowns}皇冠{}、{C:paperback_stars}银星"
        }
      },
      b_paperback_dreamer = {
        name = "追梦者牌组",
        text = {
          "开局时获得一张{C:paperback_temporary}临时{}的",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:attention}#2#{}个小丑牌槽位"
        }
      }
    },
    Tag = {
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
      tag_paperback_angel_investment = {
        name = "天使投资标签",
        text = {
          "当前每拥有{C:money}$#2#{}",
          "使你获得{C:money}$#1#{}",
          "{C:inactive}(可获得{C:money}$#3#{C:inactive})"
        }
      },
      tag_paperback_breaking = {
        name = "攻坚标签",
        text = {
          "使{C:attention}Boss盲注{}",
          "限制条件消失"
        }
      },
      tag_paperback_high_risk = {
        name = "高风险标签",
        text = {
          "选择{C:attention}Boss盲注{}时",
          "将其分数",
          "需求{C:attention}翻倍{}",
          "并获得{C:money}$#1#"
        }
      }
    },
    Blind = {
      bl_paperback_quarter = {
        name = "四等分",
        text = {
          "#1# / #2# 的游戏牌",
          "会被削弱"
        }
      },
      bl_paperback_rest = {
        name = "安息",
        text = {
          "#1# / #2# 的数字牌",
          "将以背面朝上方式抽取"
        }
      },
      bl_paperback_sharp = {
        name = "升调",
        text = {
          "提升打出牌的",
          "点数"
        }
      },
      bl_paperback_half = {
        name = "折半",
        text = {
          "所有列出的",
          "概率均减半"
        }
      },
      bl_paperback_whole = {
        name = "整体",
        text = {
          "在本底注中此前计分过的",
          "点数都会被削弱"
        }
      },
      bl_paperback_flat = {
        name = "平面",
        text = {
          "降低打出牌的",
          "点数等级"
        }
      },
      bl_paperback_taupe_treble = {
        name = "灰褐三连",
        text = {
          "必须打出",
          "一张增强牌"
        }
      },
      bl_paperback_coda = {
        name = "终章",
        text = {
          "游戏牌与小丑牌",
          "均不可移动"
        }
      },
      bl_paperback_natural = {
        name = "自然",
        text = {
          "牌型中高于你最低",
          "牌型等级的游戏牌",
          "都会被削弱"
        }
      }
    },
    paperback_minor_arcana = {
      c_paperback_page_of_wands = {
        name = "权杖侍从",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:attention}橙色别针{}"
        }
      },
      c_paperback_page_of_cups = {
        name = "圣杯侍从",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:inactive}白色别针{}"
        }
      },
      c_paperback_ten_of_wands = {
        name = "权杖十",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "摧毁{C:attention}右侧两张{}并将",
          "它们的{C:chips}筹码{}给予{C:attention}左侧那张",
          "{C:inactive}(拖动重新排列)"
        }
      },
      c_paperback_nine_of_swords = {
        name = "宝剑九",
        text = {
          "摧毁选定小丑牌",
          "{C:attention}本局游戏{}",
          "此牌{C:red}无法{}再次出现"
        }
      },
      c_paperback_nine_of_wands = {
        name = "权杖九",
        text = {
          "增强{C:attention}#1#{}张选定",
          "卡牌成为",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_seven_of_cups = {
        name = "圣杯七",
        text = {
          "选定最多{C:attention}#1#{}张卡牌",
          "使其获得随机{C:attention}增强"
        }
      },
      c_paperback_four_of_cups = {
        name = "圣杯四",
        text = {
          "选定最多{C:attention}#1#{}张卡牌",
          "并移除其所有的",
          "{C:attention}增强{}、{C:attention}蜡封{}和{C:attention}版本{}",
          "每移除一个就获得{C:money}$#2#{}"
        }
      },
      c_paperback_ace_of_swords = {
        name = "宝剑A",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定卡牌",
          "转换为{V:1}#2#{}"
        }
      },
      c_paperback_six_of_swords = {
        name = "宝剑六",
        text = {
          "为{C:attention}#1#{}张选定游戏牌",
          "添加{C:attention}黄色别针"
        }
      },
      c_paperback_three_of_cups = {
        name = "圣杯三",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:paperback_black}黑色别针{}"
        }
      },
      c_paperback_king_of_swords = {
        name = "宝剑国王",
        text = {
          "移除选定小丑牌的",
          "{C:money}租用{}和{C:paperback_perishable}易腐{}贴纸"
        }
      },
      c_paperback_eight_of_wands = {
        name = "权杖八",
        text = {
          "创造一个{C:dark_edition}负片{C:attention}标签{}并失去{C:money}$#1#{}",
          "如果当前拥有超过{C:attention}#3#{}张小丑",
          "超出的每张使你额外失去{C:money}$#2#{}",
          "{C:inactive}(当前{C:money}$#4#{C:inactive})"
        }
      },
      c_paperback_three_of_swords = {
        name = "宝剑三",
        text = {
          "将{C:attention}#1#{}张选定",
          "游戏牌增强为",
          "{C:attention}#2#"
        }
      },
      c_paperback_queen_of_swords = {
        name = "宝剑皇后",
        text = {
          "将完整牌组中{C:attention}#1#{}张随机",
          "且{C:attention}花色不同{}的游戏牌",
          "转换为选定牌的{C:attention}花色"
        }
      },
      c_paperback_two_of_wands = {
        name = "权杖二",
        text = {
          "创造你打出次数",
          "{C:attention}最多{}和{C:attention}最少{}牌型",
          "对应的{C:planet}星球牌{}",
          "{C:inactive}(需要空间)"
        }
      },
      c_paperback_king_of_cups = {
        name = "圣杯国王",
        text = {
          "每个拥有全部13种{C:attention}基础点数{}",
          "的花色使你获得{C:money}$#1#{}",
          "{C:inactive}(当前{C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_five_of_wands = {
        name = "宝剑五",
        text = {
          "摧毁所有",
          "{C:attention}留在手牌中的游戏牌{}",
          "将资金设为{C:money}$0"
        }
      },
      c_paperback_king_of_wands = {
        name = "权杖国王",
        text = {
          "创造一张随机",
          "非{C:chips}普通{C:attention}小丑",
          "{C:inactive}(不包含{C:legendary}传奇{C:inactive})"
        }
      },
      c_paperback_ten_of_swords = {
        name = "宝剑十",
        text = {
          "{C:attention}摧毁{}牌组中",
          "与选定牌{C:attention}点数相同{}的",
          "所有游戏牌"
        }
      },
      c_paperback_page_of_swords = {
        name = "宝剑侍从",
        text = {
          "将{C:attention}#1#{}张选定",
          "游戏牌增强为",
          "{C:attention}#2#"
        }
      },
      c_paperback_five_of_swords = {
        name = "宝剑五",
        text = {
          "选择{C:attention}#1#{}张游戏牌",
          "摧毁最右侧两张并为",
          "最左侧一张添加随机{C:attention}版本{}",
          "{C:attention}蜡封{}或{C:attention}增强效果",
          "{C:inactive}（可拖动调整位置）"
        }
      },
      c_paperback_nine_of_cups = {
        name = "圣杯九",
        text = {
          "选定一张{C:attention}小丑{}",
          "将其摧毁并创造一张",
          "相同或更高{C:attention}稀有度{}的{C:attention}小丑{}",
          "{C:inactive}(无法升级为{C:legendary}传奇{C:inactive})"
        }
      },
      c_paperback_three_of_wands = {
        name = "权杖三",
        text = {
          "选定手牌中的{C:attention}#1#{}张牌",
          "生成1张其复制牌"
        }
      },
      c_paperback_four_of_swords = {
        name = "宝剑四",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定游戏牌转换为",
          "随机{C:attention}人头牌"
        }
      },
      c_paperback_queen_of_wands = {
        name = "权杖皇后",
        text = {
          "有{C:green}#1#/#2#{}几率",
          "为一张随机{C:attention}小丑",
          "添加{C:dark_edition}双色{}版本"
        }
      },
      c_paperback_five_of_cups = {
        name = "圣杯五",
        text = {
          "增强{C:attention}#1#{}张选定",
          "卡牌成为",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_six_of_wands = {
        name = "权杖六",
        text = {
          "增强{C:attention}#1#{}张选定",
          "卡牌成为",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_ace_of_wands = {
        name = "权杖A",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:mult}红色别针{}"
        }
      },
      c_paperback_two_of_cups = {
        name = "圣杯二",
        text = {
          "随机创造一个",
          "{C:dark_edition}多彩{}、{C:dark_edition}镭射{}、{C:dark_edition}闪箔{}、",
          "{C:mult}稀有{}或{C:green}罕见{C:attention}标签"
        }
      },
      c_paperback_knight_of_wands = {
        name = "权杖骑士",
        text = {
          "创造一个{C:mult}高风险{C:attention}标签"
        }
      },
      c_paperback_queen_of_cups = {
        name = "圣杯皇后",
        text = {
          "增强{C:attention}#1#{}张选定",
          "卡牌成为",
          "{C:attention}#2#{}"
        }
      },
      c_paperback_knight_of_cups = {
        name = "圣杯骑士",
        text = {
          "选定{C:attention}#1#{}张卡牌",
          "{C:attention}左侧{}那张复制{C:attention}右侧{}那张",
          "除了{C:attention}点数{}和{C:attention}花色{}以外的{C:attention}一切{}",
          "之后摧毁{C:attention}右侧{}那张",
          "{C:inactive}(拖动重新排列)"
        }
      },
      c_paperback_eight_of_cups = {
        name = "圣杯八",
        text = {
          "选定最多{C:attention}#1#{}张卡牌",
          "将其转换为{C:attention}当前",
          "{C:attention}未选定{}的一种随机花色"
        }
      },
      c_paperback_four_of_wands = {
        name = "权杖四",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:paperback_pink}粉色别针{}"
        }
      },
      c_paperback_knight_of_swords = {
        name = "宝剑骑士",
        text = {
          "生成一张随机{C:paperback_minor_arcana}塔罗辅牌{}",
          "和一张随机{C:tarot}塔罗牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      c_paperback_six_of_cups = {
        name = "圣杯六",
        text = {
          "获得等同于所选",
          "{C:attention}#1#{}张卡牌{C:chips}筹码{}数",
          "{C:attention}一半{}的{C:money}资金",
          "{C:inactive}(最高{C:money}$#2#{C:inactive})"
        }
      },
      c_paperback_ace_of_cups = {
        name = "圣杯A",
        text = {
          "给最多{C:attention}#1#{}张所选卡牌",
          "加上{C:chips}蓝色别针{}"
        }
      },
      c_paperback_two_of_swords = {
        name = "宝剑二",
        text = {
          "将最多",
          "{C:attention}#1#{}张选定游戏牌",
          "转换为上次{C:attention}计分{}的花色",
          "{C:inactive}（当前为{V:1}#2#{C:inactive}）"
        }
      },
      c_paperback_seven_of_wands = {
        name = "权杖七",
        text = {
          "创造一个{C:attention}攻坚标签"
        }
      },
      c_paperback_ace_of_pentacles = {
        name = "钱币A",
        text = {
          "将最多{C:attention}#1#{}张",
          "选定卡牌",
          "转换为{V:1}#2#{}"
        }
      },
      c_paperback_seven_of_swords = {
        name = "宝剑七",
        text = {
          "为最多{C:attention}#1#{}张选定的游戏牌",
          "添加{C:attention}金色别针"
        }
      },
      c_paperback_eight_of_swords = {
        name = "宝剑八",
        text = {
          "为最多{C:attention}#1#{}张选定的游戏牌",
          "添加随机{C:attention}别针"
        }
      },
      c_paperback_ten_of_cups = {
        name = "圣杯十",
        text = {
          "有{C:green}#1#/#2#{}几率",
          "为一张所选卡牌",
          "添加{C:dark_edition}多彩{}版本"
        }
      }
    },
    Partner = {
      pnr_paperback_virtual = {
        name = "虚拟",
        text = {
          "重新触发每手牌中",
          "第一个计分的{C:paperback_light_suit}亮花色{}",
          "（当未打出{C:paperback_dark_suit}暗花色{}时）"
        }
      },
      pnr_paperback_faker = {
        name = "伪装者",
        text = {
          "{C:attention}每回合一次{}",
          "如果只打出{C:attention}一张牌{}",
          "则将其摧毁"
        }
      },
      pnr_paperback_aftermath = {
        name = "余波",
        text = {
          "{C:attention}人头牌{}在计分时",
          "{C:chips}+#1#{}筹码"
        }
      },
      pnr_paperback_faker_buffed = {
        text = {
          "如果只打出{C:attention}一张牌{}",
          "则将其摧毁"
        }
      }
    },
    Joker = {
      j_paperback_complete_breakfast = {
        name = "均衡早餐",
        text = {
          "{C:mult}+#1#{}倍率且{C:chips}+#2#{}筹码",
          "出牌后这张小丑",
          "有{C:green}#3#/#4#{}几率{C:attention}吃完{}",
          "出牌后几率",
          "增加{C:attention}#5#{}"
        }
      },
      j_paperback_kintsugi_joker = {
        name = "金缮小丑",
        text = {
          "当一张{C:attention}#2#{}被摧毁时",
          "将{C:attention}#2#{}的资金",
          "产出上限提升{C:money}$#1#{}",
          "{C:inactive}(当前提升{C:money}$#3#{C:inactive})"
        }
      },
      j_paperback_sake_cup = {
        name = "清酒杯",
        text = {
          "出牌后{C:attention}留在手中{}的{C:attention}#1#{}",
          "有{C:green}#2#/#3#{}几率生成",
          "对应打出{C:attention}牌型{}的",
          "{C:planet}星球牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_blade_dance = {
        name = "刀刃之舞",
        text = {
          "选择{C:attention}盲注{}时",
          "在手牌中生成{C:attention}#1#{}张",
          "随机{C:paperback_temporary}临时{}{C:attention}#2#{}"
        }
      },
      j_paperback_triple_moon_goddess_minor_arcana = {
        name = "三月女神",
        text = {
          "如果打出的牌中包含{C:attention}三条{}",
          "有{C:green}#1#/#2#{}几率创造一张随机{C:tarot}塔罗牌{}",
          "有{C:green}#1#/#3#{}几率创造一张随机{C:paperback_minor_arcana}塔罗辅牌{}",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_wheat_field = {
        name = "麦田",
        text = {
          "计分的{C:paperback_crowns}皇冠{}花色牌{}给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:paperback_crowns}皇冠{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_basic_energy = {
        name = "基本小丑能量",
        text = {
          "使用任何{C:attention}消耗牌{}时",
          "有{C:green}#1#/#2#{}几率复制一张",
          "{C:inactive}(无法复制复制出的牌)",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_joker_cd_i = {
        name = "小丑CD-i",
        text = {
          "如果打出的牌刚好有{C:attention}#3#{}张",
          "有{C:green}#1#/#2#{}几率生成",
          "一张随机{C:planet}星球牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_moribund = {
        name = "行将就木",
        text = {
          "如果击败{C:attention}盲注{}时",
          "剩余{C:chips}出牌次数{}为{C:attention}0",
          "这张小丑获得{C:mult}+#1#{}倍率",
          "没有击败盲注则{C:mult}倍率{}翻倍",
          "{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)"
        }
      },
      j_paperback_langely = {
        name = "朗格雷",
        text = {
          "击败{C:attention}大盲注{}时获得",
          "所有小丑牌{C:money}售价{}一半的金钱",
          "击败{C:attention}Boss盲注{}时获得",
          "所有小丑牌全额{C:money}售价{}的金钱"
        }
      },
      j_paperback_crispy_taco = {
        name = "酥脆玉米卷",
        text = {
          "{X:chips,C:white}X#1#{}筹码",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_resurrections = {
        name = "复活",
        text = {
          "卖掉{C:attention}小丑{}时有{C:green}#1#/#2#{}几率",
          "创造一张售价{C:money}-$#3#{}且带有",
          "{C:dark_edition}负片{}版本的相同小丑",
          "{s:0.9}复制失败时几率增加{s:0.9,C:green}#4#",
          "{s:0.9}复制成功后几率重置"
        }
      },
      j_paperback_joke_master = {
        name = "段子手",
        text = {
          "如果打出的牌型是{C:attention}#2#{}",
          "这张小丑牌获得{C:mult}+#1#{}倍率",
          "{s:0.8}牌型每回合改变",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
        }
      },
      j_paperback_sticky_stick = {
        name = "黏签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_jestosterone = {
        name = "Jestosterone",
        text = {
          "计分的{C:attention}#1#{}变为{C:attention}#2#{}"
        }
      },
      j_paperback_b_soda = {
        name = "B-苏打",
        text = {
          "选择{C:attention}盲注{}时",
          "获得{C:chips}+#1#{}出牌次数",
          "击败{C:attention}盲注{}时若",
          "剩余{C:chips}0{}出牌次数",
          "则回合结束自毁"
        }
      },
      j_paperback_the_wonder_of_you = {
        name = "你的奇迹",
        text = {
          "当{C:attention}右侧{}的小丑牌",
          "{C:green}概率{}判定失败时",
          "{C:attention}摧毁{}手牌中",
          "{C:attention}最右侧{}的游戏牌"
        }
      },
      j_paperback_double_dutchman = {
        name = "双层荷兰风味汉堡",
        text = {
          "出牌后{C:attention}留在手中{}的游戏牌",
          "有{C:green}#1#/#2#{}几率",
          "获得随机{C:attention}增强{}、{C:attention}蜡封{}或{C:attention}版本{}",
          "{C:attention}#3#{}次出牌自毁",
          "{C:inactive}（译注：此食物名称通常指含有双份肉或{}",
          "{C:inactive}双份荷兰奶酪的荷兰风味汉堡或三明治）{}"
        }
      },
      j_paperback_birches = {
        name = "白桦",
        text = {
          "计分的{C:paperback_stars}银星{}花色牌{}给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:paperback_stars}银星{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_moon_waltz = {
        name = "月下圆舞曲",
        text = {
          "这张小丑牌有{C:green}#3#{}在{C:green}#4#{}的几率获得",
          "已使用的{C:planet}Moon{}或",
          "{C:planet}Asteroid{}的一半{C:mult}+倍率{}或{C:chips}+筹码{}",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率和{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      j_paperback_bicycle = {
        name = "自行车",
        text = {
          "{C:attention}万能牌{}给予等同于",
          "其{C:chips}筹码{}数的{C:mult}倍率{}",
          "之后{X:mult,C:white}X#1#{}倍率"
        }
      },
      j_paperback_furioso = {
        name = "Furioso",
        text = {
          "计分的每个不同{C:attention}点数{}",
          "使这张小丑获得{X:mult,C:white}X#1#{}倍率",
          "击败{C:attention}Boss盲注{}后重置",
          "{C:inactive}(当前{X:mult,C:white}X#2#{}{C:inactive}倍率)",
          "{C:inactive}(打出总点数：{C:attention}#3#{C:inactive})"
        }
      },
      j_paperback_the_normal_joker = {
        name = "普通小丑",
        text = {
          "重新触发所有",
          "{C:blue}普通{C:attention}小丑牌"
        }
      },
      j_paperback_bismuth = {
        name = "铋",
        text = {
          "打出的{V:1}#1#{}和{V:2}#2#{}花色牌",
          "有{C:green}#3#/#4#{}概率变成",
          "{C:dark_edition}闪箔{}、{C:dark_edition}镭射{}或{C:dark_edition}多彩"
        }
      },
      j_paperback_soft_taco = {
        name = "绵软玉米卷",
        text = {
          "{X:mult,C:white}X#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_evergreens = {
        name = "常青树",
        text = {
          "计分的{C:spades}黑桃{}花色牌给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:spades}黑桃{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_meeple = {
        name = "米宝",
        text = {
          "如果打出的牌中",
          "包含计分的{C:attention}人头牌{}",
          "本回合{C:mult}+#1#{}弃牌次数"
        }
      },
      j_paperback_white_night = {
        unlock = {
          "牌组中拥有#1#张",
          "或更多{C:attention}使徒{}"
        },
        name = "白夜",
        text = {
          "计分结束时摧毁所有计分的非{C:attention}使徒{}牌",
          "计分的{C:attention}使徒{}给予{X:mult,C:white}X#1#{}倍率",
          "打出的牌不含{C:attention}使徒{}时{C:attention}摧毁{}一张随机小丑牌",
          "被弃掉的{C:attention}使徒{}会被{C:attention}摧毁{}"
        }
      },
      j_paperback_as_above_so_below = {
        unlock = {
          "打出一次{C:attention}被提同花{}"
        },
        name = "如上及下",
        text = {
          "打出包含一张{C:attention}使徒{}的五张牌牌型时",
          "生成一张{C:purple}塔罗牌{}",
          "如果牌型同时包含{C:attention}顺子{}",
          "改为生成一张{C:spectral}幻灵牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_spotty_joker = {
        name = "斑点小丑",
        text = {
          "如果{C:attention}计分牌{}包含{C:attention}#2#{}",
          "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "否则失去{X:mult,C:white}X#3#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#4#{}{C:inactive}倍率）"
        }
      },
      j_paperback_ultra_rare = {
        name = "超稀有",
        text = {
          "选择{C:attention}盲注{}时",
          "生成售价为{C:money}$#1#{}的",
          "随机{C:blue}普通{}、{C:green}罕见和{C:red}稀有{}的临时{C:dark_edition}负片",
          "{C:attention}小丑牌{}"
        }
      },
      j_paperback_black_star = {
        name = "黑星",
        text = {
          "计分的{C:paperback_dark_suit}暗花色",
          "变为{V:1}#1#"
        }
      },
      j_paperback_sweet_stick = {
        name = "甜签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_jester_of_nihil = {
        name = "虚无弄臣",
        text = {
          "{C:attention}削弱最后计分{}的牌",
          "对应的花色",
          "每张{C:attention}被削弱{}的牌",
          "给予{C:mult}+#1#{}倍率",
          "{C:inactive}(当前削弱{V:1}#2#{C:inactive}且{C:mult}+#3#{C:inactive}倍率)"
        }
      },
      j_paperback_solar_system = {
        name = "太阳系",
        text = {
          "九种基础{C:planet}星球{}中",
          "{C:attention}等级{}最低的那个",
          "按等级每级提供{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#2#{}{C:inactive}倍率)"
        }
      },
      j_paperback_ready_to_fly = {
        name = "展翅高飞",
        text = {
          "每当相邻的小丑牌被{C:attention}触发{}",
          "这张小丑牌获得{X:chips,C:white}X#2#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#1#{C:inactive}筹码）"
        }
      },
      j_paperback_high_speed_rail = {
        name = "高速铁路",
        text = {
          "这张小丑牌{C:blue}获得{}等同于",
          "{C:blue}购买过的{}{C:attention}小丑牌{}的花费金额的倍率",
          "这张小丑牌{C:red}失去{}等同于",
          "{C:red}售出过的{}{C:attention}小丑牌{}的售价金额的倍率",
          "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
        }
      },
      j_paperback_backpack = {
        name = "背包",
        text = {
          "{C:money}商店{}增加一个",
          "免费的{C:attention}小丑包"
        }
      },
      j_paperback_black_rainbows = {
        name = "黑彩虹",
        text = {
          "计分的{C:spades}黑桃{}和{C:clubs}梅花",
          "有{C:green}#1#/#2#{}几率",
          "变成{C:dark_edition}多彩"
        }
      },
      j_paperback_clippy = {
        name = "大眼夹",
        text = {
          "选择{C:attention}盲注{}时",
          "为牌组中的一张随机游戏牌",
          "添加一枚随机{C:attention}别针{}"
        }
      },
      j_paperback_blue_star = {
        name = "蓝星",
        text = {
          "当{V:1}#2#{}计分时获得{X:chips,C:white}X#1#{}筹码",
          "当{V:2}#4#{}计分时失去{X:chips,C:white}X#3#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#5#{C:inactive}筹码）"
        }
      },
      j_paperback_the_sun = {
        name = "太阳",
        text = {
          "如果打出的牌",
          "仅包含{C:paperback_light_suit}亮花色{}",
          "获得{C:mult}+#1#{}倍率",
          "{C:paperback_dark_suit}暗花色{}计分时-{C:mult}#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        }
      },
      j_paperback_king_me = {
        name = "加冕",
        text = {
          "计分的{V:1}#1#{}点数",
          "增加{C:attention}#2#{}"
        }
      },
      j_paperback_pedrillo = {
        name = "佩德里洛",
        text = {
          "如果计分牌包含一张{C:attention}Q{}",
          "升级打出的{C:attention}牌型{}"
        }
      },
      j_paperback_charred_marshmallow = {
        name = "焦黄棉花糖",
        text = {
          "计分的{C:spades}黑桃{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_burning_pact = {
        name = "燃烧契约",
        text = {
          "如果{C:attention}弃牌{}仅包含{C:attention}#1#{}张牌",
          "则额外抽取{C:attention}#2#{}张牌"
        }
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds = {
        name = "一罪百善",
        text = {
          "计分的{C:attention}3{}和{C:attention}无点数牌{}",
          "计分时给予{C:mult}+#1#{}倍率",
          "{C:inactive}“它以恶为食”"
        }
      },
      j_paperback_shooting_star = {
        name = "流星",
        text = {
          "计分的{V:1}#1#{}有",
          "{C:green}#2#/#3#{}几率生成",
          "对应打出{C:attention}牌型{}",
          "的{C:planet}星球牌{}"
        }
      },
      j_paperback_ncj = {
        name = "无版权小丑",
        text = {
          "所有其他拥有的小丑牌",
          "{C:attention}售价{}每有{C:money}$1{}",
          "这张小丑牌给予{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      j_paperback_blue_marble = {
        name = "蓝色弹珠",
        text = {
          "如果{C:attention}计分牌{}包含{V:3}#3#{}",
          "{C:green}#1#/#2#{}几率生成",
          "一张随机{C:planet}星球牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_milk_tea = {
        name = "奶茶",
        text = {
          "{C:purple}平衡{}{C:attention}#1#%{}的{C:chips}筹码{}和{C:mult}倍率{}",
          "如果平衡后{C:mult}倍率{}{C:attention}高于{}{C:chips}筹码{}",
          "数值减少{C:attention}#2#%{} "
        }
      },
      j_paperback_forlorn = {
        name = "孤寂者",
        text = {
          "如果{C:attention}计分牌{}仅包含{V:1}#1#{}",
          "随机摧毁一张",
          "手牌中的{C:attention}游戏牌{}"
        }
      },
      j_paperback_blood_rain = {
        name = "血雨",
        text = {
          "{C:attention}#1#{}给予等同于",
          "手持游戏牌{C:attention}点数{}的{C:mult}倍率{}",
          "而非其{C:chips}筹码值{}"
        }
      },
      j_paperback_skydiver = {
        name = "跳伞者",
        text = {
          "如果本次出牌所有{C:attention}计分牌{}的点数",
          "均不大于本回合计分过的{C:attention}最小点数",
          "获得{C:white,X:mult}X#1#{}倍率",
          "{C:inactive}(出牌结束后更新{C:inactive})",
          "{C:inactive}(当前点数：{C:attention}#2#{C:inactive})"
        }
      },
      j_paperback_mexican_train = {
        name = "墨西哥火车",
        text = {
          "打出的{C:attention}多米诺牌{}",
          "每张给予{C:money}$#2#{}",
          "{C:inactive}（当前{C:money}$#3#{C:inactive}）"
        }
      },
      j_paperback_jestrogen = {
        name = "Jestrogen",
        text = {
          "计分的{C:attention}#1#{}和{C:attention}#2#{}",
          "变为{C:attention}#3#{}"
        }
      },
      j_paperback_solemn_lament = {
        name = "庄严哀悼",
        text = {
          "如果计分牌同时包含{C:paperback_dark_suit}暗花色{}",
          "与{C:paperback_light_suit}亮花色{}",
          "此小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      j_paperback_cakepop = {
        name = "蛋糕棒棒糖",
        text = {
          "计分的{C:hearts}红桃{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_ice_cube = {
        name = "冰块",
        text = {
          "每个{C:attention}食物小丑{}",
          "提供{X:mult,C:white}X#1#{}倍率",
          "{C:attention}#2#{}回合后融化",
          "{C:inactive}(当前{X:mult,C:white}X#3#{C:inactive}倍率)"
        }
      },
      j_paperback_book_of_vengeance = {
        name = "复仇之书",
        text = {
          "如果回合的{C:attention}第一次出牌{}",
          "击败了{C:attention}Boss盲注{}",
          "自毁并复制一张",
          "右侧的{C:attention}小丑{}"
        }
      },
      j_paperback_in_case_i_make_it = {
        name = "如果我成功了",
        text = {
          "每张打出的{C:attention}无点数牌{}",
          "计分时永久获得",
          "{C:chips}+#1#{}筹码"
        }
      },
      j_paperback_prism = {
        name = "棱镜",
        text = {
          "如果打出的牌包含{C:attention}#1#{}",
          "将所有{C:attention}计分牌{}转换为",
          "随机{C:attention}不同花色{}"
        }
      },
      j_paperback_the_world = {
        name = "砸瓦鲁多",
        text = {
          "所有{C:chips}出牌{}和{C:mult}弃牌{}",
          "都视为每回合",
          "{C:attention}第一次{}和{C:attention}最后一次{}"
        }
      },
      j_paperback_stamp = {
        name = "邮戳",
        text = {
          "任何带有{C:attention}蜡封{}的牌计分时",
          "这张小丑有{C:green}#1#/#2#{}几率",
          "获得{C:chips}+#3#{}筹码",
          "{C:inactive}(当前{C:chips}+#4#{C:inactive}筹码)"
        }
      },
      j_paperback_inner_peace = {
        name = "内心宁静",
        text = {
          "本回合{C:attention}第一次出牌{}之前",
          "{C:attention}+3{}手牌上限"
        }
      },
      j_paperback_full_moon = {
        name = "满月",
        text = {
          "{C:planet}星球牌{}有",
          "{C:green}#1#/#2#{}几率",
          "升级{C:attention}两次"
        }
      },
      j_paperback_summoning_circle = {
        name = "召唤术阵",
        text = {
          "如果打出的牌中",
          "包含{C:attention}#1#{}",
          "复制一张{C:attention}随机消耗牌",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_shopping_center = {
        name = "购物中心",
        text = {
          "{C:money}商店{}增加一个",
          "额外{C:attention}卡牌槽位"
        }
      },
      j_paperback_watercolor_joker = {
        name = "水彩小丑",
        text = {
          "{C:attention}#1#{}计分时",
          "给予{X:chips,C:white}X#2#{}筹码"
        }
      },
      j_paperback_fraudulent_joker = {
        name = "欺诈小丑",
        text = {
          "打出的",
          "{C:paperback_crowns}皇冠{}花色牌",
          "在计分时给予{C:mult}+#1#{}倍率"
        }
      },
      j_paperback_find_jimbo = {
        name = "视觉大发现",
        text = {
          "每张计分的{V:1}#2#{}{C:attention}#1#{}",
          "使你获得{C:money}$#3#{}",
          "{s:0.8}卡牌每回合改变"
        }
      },
      j_paperback_cream_liqueur = {
        name = "奶油利口酒",
        text = {
          "{C:attention}标签{}生效时赚取{C:money}$#1#{}",
          "{C:attention}#2#{}回合后{C:attention}饮尽{}",
          "{C:inactive}(获取{C:attention}标签{C:inactive}时重置)"
        }
      },
      j_paperback_its_tv_time = {
        name = "电视时间到！",
        text = {
          "{C:paperback_stars}银星牌{}视为{C:attention}奖励牌",
          "{C:attention}奖励牌{}视为{C:paperback_stars}银星牌{}"
        }
      },
      j_paperback_the_one_who_waits = {
        name = "待终冠主",
        text = {
          "如果打出的牌包含计分的{V:1}#1#",
          "{C:green}#2#/#3#{}几率获得{X:mult,C:white}X#4#{}倍率",
          "{C:green}#5#/#6#{}几率生成一张{C:tarot}#7#{}塔罗牌",
          "{C:inactive}（必须有空位） （当前为{X:mult,C:white}X#8#{C:inactive}倍率）"
        }
      },
      j_paperback_pride_flag_no_spectrums = {
        name = "自豪旗帜",
        text = {
          "如果打出的牌中包含",
          "{C:attention}三种{}不同花色",
          "这张小丑获得{C:mult}+#1#{}倍率",
          "{C:inactive}(当前{C:mult}+#2#{}{C:inactive}倍率)"
        }
      },
      j_paperback_angel_investor = {
        name = "天使投资家",
        text = {
          "跳过{C:attention}盲注{}时获得",
          "{C:attention}#1#{}个{C:money}天使投资标签"
        }
      },
      j_paperback_heretical_joker = {
        name = "异教小丑",
        text = {
          "打出的",
          "{C:paperback_stars}银星{}花色牌",
          "在计分时给予{C:mult}+#1#{}倍率"
        }
      },
      j_paperback_apple = {
        name = "苹果",
        text = {
          "购买{C:attention}消耗牌{}时",
          "有{C:green}#1#/#2#{}几率",
          "生成它的{C:dark_edition}负片{}版本",
          "{S:1.1,C:red,E:2}自毁{}"
        }
      },
      j_paperback_tutor = {
        name = "导师",
        text = {
          "{C:attention}数字牌{}给予",
          "{C:attention}双倍{}{C:chips}筹码{}值"
        }
      },
      j_paperback_river = {
        name = "河流",
        text = {
          "如果打出的牌包含{C:attention}5张计分牌",
          "获得等同于得分最低的",
          "卡牌的{C:chips}筹码{}的{C:money}资金",
          "{C:inactive}(最高{C:money}$#1#{C:inactive})"
        }
      },
      j_paperback_big_misser = {
        name = "莫大的缺失",
        text = {
          "每个空的消耗牌槽位",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#2#{}{C:inactive}倍率)"
        }
      },
      j_paperback_let_it_happen = {
        name = "顺其自然",
        text = {
          "如果出牌牌型是",
          "本{C:attention}底注{}第一次打出",
          "平衡{C:mult}倍率{}和{C:chips}筹码",
          "{C:inactive}(已打出的牌型：{C:attention}#1#{C:inactive})"
        }
      },
      j_paperback_golden_egg = {
        unlock = {
          "以{C:attention}隐藏牌型{}作为",
          "最常使用牌型",
          "赢得一局"
        },
        name = "金蛋",
        text = {
          "打出{C:attention}隐藏牌型{}时",
          "获得右侧{C:attention}小丑牌{}",
          "售价的金钱"
        }
      },
      j_paperback_prince_of_darkness = {
        name = "黑暗王子",
        text = {
          "如果打出的计分牌中",
          "包含{C:hearts}红桃{}和{C:attention}#1#{}种不同花色",
          "接下来的{C:chips}#3#{}次出牌",
          "这张小丑提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(当前下{C:chips}#4#{C:inactive}次出牌)"
        }
      },
      j_paperback_champagne = {
        name = "香槟",
        text = {
          "挑战{C:attention}Boss盲注{}期间",
          "每张计分牌给予{C:money}$#1#{}",
          "带有{C:attention}蜡封{}的牌{C:attention}翻倍{}",
          "{C:attention}#2#{}回合后{C:attention}饮尽{}"
        }
      },
      j_paperback_deviled_egg = {
        name = "恶魔蛋",
        text = {
          "每回合第一张计分的牌",
          "变为{C:attention}黄金牌{}。",
          "在{C:attention}#1#{}回合后吃完"
        }
      },
      j_paperback_deadringer = {
        name = "牵线傀儡",
        text = {
          "重新触发计分的{C:attention}#1#{}和{C:attention}#2#",
          "重新触发计分的{C:attention}#3#{}两次"
        }
      },
      j_paperback_chocolate_joker = {
        name = "巧克力小丑",
        text = {
          "每有一张{C:attention}小丑牌{}",
          "这张小丑牌获得{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）"
        }
      },
      j_paperback_weather_radio = {
        name = "天气预报",
        text = {
          "如果打出的{C:attention}牌型{}包含{C:attention}#2#{}",
          "这张小丑获得{X:mult,C:white}X#1#{}倍率",
          "当达到{X:mult,C:white}X#3#{}倍率或以上时",
          "消除当前{C:attention}Boss盲注{}的限制条件",
          "并失去{X:mult,C:white}X#4#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#5#{C:inactive}倍率)",
          "{s:0.75}牌型每回合结束改变"
        }
      },
      j_paperback_pocket_pair = {
        name = "便携对子",
        text = {
          "回合开始发牌发出的",
          "每一个{C:attention}#2#{}给予{C:money}$#1#{}"
        }
      },
      j_paperback_medic = {
        name = "医生",
        text = {
          "{C:attention}#1#{}重新触发",
          "其他牌的效果增加一次"
        }
      },
      j_paperback_wild_plus_four = {
        name = "变色+4",
        text = {
          "{C:attention}+#1#{}手牌上限"
        }
      },
      j_paperback_paranoia = {
        name = "偏执狂",
        text = {
          "本局中{C:attention}摧毁{}的每张",
          "{C:paperback_dark_suit}暗花色{}卡牌使打出的",
          "{C:paperback_light_suit}亮花色{}卡牌每张提供{C:mult}+#1#{}倍率",
          "{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)"
        }
      },
      j_paperback_nichola = {
        name = "尼古拉",
        text = {
          "{C:attention}留在手中{}的{C:attention}人头牌{}",
          "参与{C:attention}计分{}"
        }
      },
      j_paperback_oracle = {
        name = "神谕",
        text = {
          "每使用过一张{C:attention}不重复{}的",
          "{C:paperback_minor_arcana}塔罗辅牌{}",
          "这张小丑牌获得{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}（当前为{X:chips,C:white}X#2#{C:inactive}筹码）"
        }
      },
      j_paperback_pear = {
        name = "梨",
        text = {
          "如果打出的牌包含{C:attention}#1#{}",
          "获得{C:chips}+#2#{}筹码",
          "否则{C:chips}-#3#{}筹码",
          "筹码低于0时{S:1.1,C:red,E:2}自毁{}",
          "{C:inactive}（当前为{C:chips}+#4#{C:inactive}筹码）"
        }
      },
      j_paperback_rock_candy = {
        name = "石头糖",
        text = {
          "计分的{C:paperback_stars}银星{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_quartz = {
        name = "石英",
        text = {
          "每张打出的{C:paperback_stars}银星{}花色牌",
          "使其他计分的{C:paperback_stars}银星{}花色牌",
          "额外给予{X:chips,C:white}X#1#{}筹码"
        }
      },
      j_paperback_sacrificial_lamb = {
        name = "替罪羊",
        text = {
          "每{C:attention}摧毁{}一张卡牌或小丑",
          "这张小丑获得{C:mult}+#1#{}倍率",
          "{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)"
        }
      },
      j_paperback_union_card = {
        name = "联盟卡",
        text = {
          "持有这张小丑时所有",
          "{C:attention}卡牌{}的{C:attention}售价{}锁定为{C:money}$0{}",
          "给予等同于本次出牌中",
          "计分的{C:paperback_light_suit}亮花色{}卡牌数量",
          "的{X:mult,C:white}X倍率{}"
        }
      },
      j_paperback_you_are_a_fool = {
        name = "你是小丑！",
        text = {
          "如果出牌至少有",
          "{C:attention}#1#{}张{C:attention}人头牌{}计分",
          "将{C:attention}留在手牌中{}的所有牌",
          "转换为{C:attention}最左侧{}的计分牌",
          "{S:1.1,C:red,E:2}之后自毁"
        }
      },
      j_paperback_the_quiet = {
        name = "这宁静",
        text = {
          "在你的完整牌组中",
          "每比完整的{C:attention}#2#{}张牌少一张",
          "就获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#3#{C:inactive}倍率)"
        }
      },
      j_paperback_card_sleeve = {
        name = "卡套",
        text = {
          "售出此卡使{C:attention}右侧{}的小丑牌",
          "添加{C:attention}永恒{}标签"
        }
      },
      j_paperback_reference_card = {
        name = "参考卡",
        text = {
          "九种基础{C:attention}牌型{}中",
          "{C:attention}打出次数{}最少的那个",
          "按次数每次提供{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#2#{}{C:inactive}倍率)"
        }
      },
      j_paperback_jimbo_adventure = {
        name = "小丑大冒险",
        text = {
          "跳过{C:attention}盲注{}时创造",
          "一个随机的{C:attention}标签{}"
        }
      },
      j_paperback_zealous_joker = {
        name = "狂热小丑",
        text = {
          "如果打出的牌",
          "包含{C:attention}#2#{}",
          "{C:mult}+#1#{}倍率"
        }
      },
      j_paperback_pyrite = {
        name = "黄铁矿",
        text = {
          "打出的{V:1}#1#{}花色牌",
          "有{C:green}#2#/#3#{}几率创造",
          "一张随机{C:tarot}塔罗牌{}",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_pinot_noir = {
        name = "黑皮诺",
        text = {
          "下{C:attention}#1#{}次{C:attention}#2#",
          "触发时给予额外{C:mult}#3#{}倍率"
        }
      },
      j_paperback_great_wave = {
        name = "巨浪",
        text = {
          "每张{C:attention}计分牌{}使{C:attention}最右侧{}",
          "的计分牌{C:attention}重新触发{}一次"
        }
      },
      j_paperback_caramel_apple = {
        name = "焦糖苹果",
        text = {
          "计分的{C:clubs}梅花{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_nachos = {
        name = "烤干酪辣味玉米片",
        text = {
          "{X:chips,C:white}X#1#{}筹码",
          "每弃{C:attention}一张{}牌",
          "失去{X:chips,C:white}X#2#{}筹码"
        }
      },
      j_paperback_calling_card = {
        name = "预告信",
        text = {
          "击败{C:attention}Boss盲注{}或",
          "触发它的{C:attention}限制{}时",
          "这张小丑获得{X:red,C:white}X#1#{}倍率",
          "{C:inactive}(当前{}{X:red,C:white}X#2#{}{C:inactive}倍率){}"
        }
      },
      j_paperback_sommelier = {
        name = "侍酒师",
        text = {
          "如果回合{C:attention}第一次弃牌{}",
          "包含{C:attention}#1#{}",
          "第一张被弃掉的",
          "{C:attention}#1#{}获得",
          "一个随机{C:attention}蜡封{}"
        }
      },
      j_paperback_solar_eclipse = {
        name = "日食",
        text = {
          "计分的{C:paperback_light_suit}亮花色",
          "变为{V:1}#1#"
        }
      },
      j_paperback_derecho = {
        name = "横行风暴",
        text = {
          "如果打出的{C:attention}计分牌{}仅包含{C:paperback_dark_suit}暗花色",
          "这张小丑获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_cherry_blossoms = {
        name = "樱花",
        text = {
          "计分的{C:hearts}红桃{}花色牌给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:hearts}红桃{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_coffee = {
        name = "咖啡",
        text = {
          "{C:attention}+#1#{}手牌上限",
          "跳过{C:attention}盲注{}时增加{C:attention}#2#{}",
          "选择{C:attention}小盲注{}或{C:attention}大盲注{}时",
          "有{C:green}#3#/#4#{}几率{C:attention}饮尽{}"
        }
      },
      j_paperback_joker_cookie = {
        name = "小丑姜饼",
        text = {
          "回合结束时赚取{C:money}$#1#{}",
          "提现时这一数值增加{C:money}$#2#{}",
          "回合结束时",
          "有{C:green}#3#/#4#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_epic_sauce = {
        name = "史诗酱料",
        text = {
          "{X:mult,C:white}X#1#{}倍率",
          "如果出牌不是",
          "回合{C:attention}第一次{}出牌",
          "摧毁一张随机{C:attention}小丑{}"
        }
      },
      j_paperback_the_dynasty = {
        name = "王朝",
        text = {
          "如果打出的牌",
          "包含{C:attention}#2#{}",
          "{X:mult,C:white}X#1#{}倍率"
        }
      },
      j_paperback_ddakji = {
        name = "叠纸游戏",
        text = {
          "{C:green}#1#/#2#{}的牌抽取时背面朝上",
          "如果打出的计分牌同时",
          "包含{C:attention}正面朝上{}和",
          "{C:attention}背面朝上{}的牌",
          "创造一张随机消耗牌",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_autumn_leaves = {
        name = "秋叶",
        text = {
          "计分的{C:diamonds}方片{}花色牌给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:diamonds}方片{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_pointy_stick = {
        name = "尖签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_manilla_folder = {
        name = "档案袋",
        text = {
          "完整牌组中",
          "每有一种{C:attention}不重复{}的{C:attention}别针{}",
          "回合结束时获得{C:money}$#1#{}",
          "{C:inactive}（当前{C:money}$#2#{C:inactive}）"
        }
      },
      j_paperback_lurid_joker = {
        name = "骇人小丑",
        text = {
          "如果打出的牌包含",
          "{C:attention}#2#{}",
          "{C:chips}+#1#{}筹码"
        }
      },
      j_paperback_power_surge = {
        name = "电涌",
        text = {
          "打出的{C:attention}#1#{}在计分时",
          "给予{X:mult,C:white}X#2#{}倍率",
          "但有{C:green}#3#/#4#{}几率",
          "{C:red}摧毁{}一张{C:attention}留在{}",
          "{C:attention}手牌中{}的卡牌"
        }
      },
      j_paperback_wild_prize = {
        name = "[[万能大奖!1!]]",
        text = {
          "{C:attention}万能牌{}有{C:green}#1#/#2#{}几率",
          "{C:attention}重新触发{}以及{C:green}#1#/#3#{}几率",
          "计分时赚取{C:money}$#4#{}到{C:money}$#5#{}"
        }
      },
      j_paperback_wish_you_were_here = {
        name = "想你在这里",
        text = {
          "获得等同于这张小丑",
          "{C:attention}售价{}{C:mult}#1#X{}倍的{C:mult}倍率{}",
          "回合结束时",
          "{C:attention}售价{}提升{C:money}$#2#{}",
          "{C:inactive}(当前{C:mult}+#3#{C:inactive}倍率){}"
        }
      },
      j_paperback_giga_size = {
        name = "巨型尺寸",
        text = {
          "当前{C:attention}盲注{}内每次出牌",
          "这张小丑牌获得{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
        }
      },
      j_paperback_emergency_broadcast = {
        name = "紧急广播",
        text = {
          "打出的{C:attention}5{}和{C:attention}8{}计分时",
          "给予{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码"
        }
      },
      j_paperback_festive_joker = {
        name = "喜庆小丑",
        text = {
          "{C:attention}#1#{}在计分时",
          "有{C:green}#2#/#3#几率创造",
          "一张随机{C:attention}消耗牌{}",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_pop_stick = {
        name = "棒签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_surfer = {
        name = "冲浪者",
        text = {
          "{C:attention}回合结束时{}每张留在手牌中",
          "的{C:attention}#3#{}使这张小丑获得{C:chips}+#1#{}筹码",
          "每张计分的{C:attention}#3#{}使",
          "这张小丑获得{C:chips}+#2#{}筹码",
          "{C:inactive}(当前{C:chips}+#4#{C:inactive}筹码)"
        }
      },
      j_paperback_subterfuge = {
        name = "诡计",
        text = {
          "摧毁每回合打出的",
          "{C:attention}第一手牌{}"
        }
      },
      j_paperback_j_and_js = {
        name = "J&J",
        text = {
          "如果打出的牌中",
          "包含{C:attention}光谱牌{}",
          "生成{C:attention}#1#{}个随机{C:attention}标签",
          "{C:attention}#2#{}回合后{S:1.1,C:red,E:2}自毁"
        }
      },
      j_paperback_better_call_jimbo = {
        name = "绝命金宝",
        text = {
          "每拥有{C:money}$#2#{}",
          "获得{X:mult,C:white}X#1#{}倍率",
          "不再赚取{C:money}利息{}",
          "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）"
        }
      },
      j_paperback_rockin_stick = {
        name = "石签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_triple_moon_goddess = {
        name = "三月女神",
        text = {
          "如果打出的牌中包含{C:attention}三条{}",
          "有{C:green}#1#/#2#{}几率创造一张随机{C:planet}星球牌{}",
          "有{C:green}#1#/#3#{}几率创造一张随机{C:purple}塔罗牌{}",
          "{C:inactive}(需要空间)"
        }
      },
      j_paperback_quick_fix = {
        name = "应急补丁",
        text = {
          "{C:attention}+#1#{}手牌上限",
          "回合结束",
          "有{C:green}#2#/#3#{}几率",
          "自毁"
        }
      },
      j_paperback_mismatched_sock = {
        name = "错配袜子",
        text = {
          "如果打出的牌中",
          "不包含{C:attention}#2#",
          "这张小丑获得{X:mult,C:white}X#1#倍率",
          "{C:inactive}(当前{X:mult,C:white}X#3#{C:inactive}倍率)"
        }
      },
      j_paperback_tanghulu = {
        name = "糖葫芦",
        text = {
          "计分的{C:paperback_crowns}皇冠{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_der_fluschutze = {
        name = "魔弹射手",
        text = {
          "如果本回合{C:attention}第一次{}出牌仅包含",
          "一张{C:attention}人头牌{}则将其摧毁",
          "并使这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{} {C:inactive}倍率）"
        }
      },
      j_paperback_telamon = {
        name = "特拉蒙",
        text = {
          "如果{C:attention}最后一次出牌{}",
          "包含{C:attention}#1#{}",
          "生成一张随机{C:attention}宝剑{C:paperback_minor_arcana}塔罗辅牌{}",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_jestrica = {
        name = "JESTRiCA",
        text = {
          "打出的{C:attention}8{}计分时",
          "这张小丑获得{C:mult}+#1#{}倍率",
          "本回合未触发则重置",
          "{C:inactive}(当前C:mult}+#2#{C:inactive}倍率)"
        }
      },
      j_paperback_grand_strategy = {
        name = "大战略",
        text = {
          "如果牌组中至少有{C:attention}#2#{}种",
          "不同的{C:attention}增强{}、{C:attention}版本{}、{C:attention}蜡封{}",
          "则{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前{C:attention}#3#{C:inactive})"
        }
      },
      j_paperback_everything_must_go = {
        name = "清仓大甩卖！",
        text = {
          "商店额外出售",
          "{C:attention}#1#{}张{C:attention}优惠券{}"
        }
      },
      j_paperback_jimbos_joyous_joker_jamboree = {
        unlock = {
          "牌组中拥有{C:attention}#1#{}种",
          "或更多{C:attention}花色{}"
        },
        name = "金宝的欢乐小丑盛会",
        text = {
          "每计分{C:attention}#1#{C:inactive} [#2#]{}张牌",
          "生成一张随机{C:paperback_minor_arcana}塔罗辅牌{}"
        }
      },
      j_paperback_plague_doctor = {
        name = "瘟疫医生",
        text = {
          "如果打出的牌型是{C:attention}高牌",
          "将计分牌转换为{C:attention}使徒{}",
          "手牌中每持有一张{C:attention}使徒{}",
          "给予{X:mult,C:white}X#1#{}倍率"
        }
      },
      j_paperback_blue_bonnets = {
        name = "矢车菊",
        text = {
          "计分的{C:clubs}梅花{}花色牌给予{X:mult,C:white}X#1#{}倍率",
          "每张连续打出的{C:clubs}梅花{}花色牌",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      j_paperback_gambit = {
        name = "弃兵术",
        text = {
          "如果打出的牌包含计分的{V:1}#1#{}",
          "第一张计分的{V:1}#1#{}会被{C:attention}摧毁{}",
          "手牌中第一张非{V:1}#1#{}牌",
          "获得其{C:chips}筹码值{}"
        }
      },
      j_paperback_clothespin = {
        name = "衣夹",
        text = {
          "{C:attention}回合结束{}时每个",
          "{C:attention}留在手牌中{}的{C:attention}别针",
          "使这张小丑获得{C:chips}+#1#{}筹码",
          "{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)"
        }
      },
      j_paperback_alert = {
        name = "警报",
        text = {
          "如果{C:attention}出牌{}是",
          "一张{C:attention}人头牌{},",
          "将其摧毁",
          "{C:inactive}(#1#/#2#)?"
        }
      },
      j_paperback_popsicle_stick = {
        name = "冰签",
        text = {
          "其他{C:attention}\"签\"{}小丑",
          "每个提供{X:mult,C:white}X#1#{}倍率...",
          "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)"
        }
      },
      j_paperback_boundary_of_death = {
        name = "生死境界",
        text = {
          "{C:attention}#1#{}有",
          "{C:green}#2#/#3#{}的几率",
          "额外提供{C:red}+#4#{}倍率"
        }
      },
      j_paperback_da_capo = {
        name = "从头再来",
        text = {
          "给予{X:mult,C:white}X#1#{}倍率",
          "每次出牌{C:attention}削弱{}除一种以外的所有{C:attention}花色{}",
          "顺序如下",
          "{C:clubs}梅花{}、{C:spades}黑桃{}、{C:diamonds}方片{}、{C:hearts}红桃{}、{C:inactive}无{}",
          "{C:inactive}（当前为 {V:1}#2#{C:inactive}）{}"
        }
      },
      j_paperback_dreamsicle = {
        name = "梦幻棒冰",
        text = {
          "计分的{C:diamonds}方片{}花色牌",
          "给予{C:mult}+#1#{}倍率",
          "回合结束时",
          "有{C:green}#2#/#3#{}几率{C:attention}吃完{}"
        }
      },
      j_paperback_punch_card = {
        name = "积分卡",
        text = {
          "经过{C:attention}#1#{}个回合后",
          "售出此卡可",
          "{C:attention}#3#{}底注",
          "{C:inactive}（当前为{C:attention}#2#{C:inactive}/#1#）"
        }
      },
      j_paperback_hole_in_one = {
        name = "一杆进洞",
        text = {
          "如果回合的{C:chips}第一次出牌{}击败了{C:attention}盲注{}",
          "则将所有{C:attention}卡牌{}的{C:attention}出售价格{}翻倍",
          "{C:inactive}(最多每回合{C:money}$#1#{C:inactive})",
          "这张小丑被售出时将",
          "{C:attention}所有卡牌{}的{C:attention}售价{}设为{C:money}$0"
        }
      },
      j_paperback_pride_flag_spectrums = {
        name = "自豪旗帜",
        text = {
          "如果打出的牌中包含{C:attention}光谱",
          "这张小丑获得{C:chips}+#1#{}筹码",
          "如果打出的牌包含{C:attention}顺子",
          "则会重置",
          "{C:inactive}(当前{C:chips}+#2#{}{C:inactive}筹码)"
        }
      },
      j_paperback_touch_tone_joker = {
        name = "按键音小丑",
        text = {
          "打开{C:tarot}秘术包{}",
          "{C:planet}天体包{}或{C:spectral}幻灵包{}时",
          "将包内{C:attention}第一张牌{}{C:attention}放置{}",
          "到消耗牌栏位",
          "{C:inactive}（必须有空位）"
        }
      },
      j_paperback_legacy = {
        name = "遗产",
        text = {
          "当摧毁一张{C:attention}无增强{}的牌时",
          "将它的{C:chips}筹码{}数作为{C:mult}倍率{}",
          "增加到这张牌的倍率上",
          "{C:inactive}(当前{C:mult}+#1#{C:inactive}倍率)"
        }
      },
      j_paperback_shadowmantle = {
        name = "暗影披风",
        text = {
          "计分的{V:1}#1#{}有",
          "{C:green}#2#/#3#{}几率生成一个",
          "{C:dark_edition}负片{C:attention}标签{}"
        }
      },
      j_paperback_aurora_borealis = {
        name = "北极光",
        text = {
          "每有一张拥有{C:attention}版本{}的小丑牌",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{s:0.9,C:dark_edition}负片{s:0.9,C:inactive}版本除外{}",
          "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
        }
      },
      j_paperback_master_spark = {
        name = "极限火花",
        text = {
          "如果打出的牌包含{C:attention}光谱{}",
          "摧毁所有{C:attention}手牌{}",
          "所有打出的牌添加{C:dark_edition}多彩{}",
          "{S:1.1,C:red,E:2}自毁"
        }
      },
      j_paperback_unholy_alliance = {
        name = "邪恶联盟",
        text = {
          "每当一张卡牌或小丑牌被{C:attention}摧毁{}时",
          "此小丑牌获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
        }
      },
      j_paperback_ghost_cola = {
        name = "幽灵可乐",
        text = {
          "卖掉这张小丑以创造一个{C:attention}#1#{}",
          "和一张随机{C:dark_edition}负片{}{C:spectral}幻灵牌{}"
        }
      },
      j_paperback_claw = {
        name = "爪击",
        text = {
          "计分的{C:attention}#1#{}",
          "给予额外{C:mult}+#2#{}倍率",
          "{C:attention}回合结束{}时重置",
          "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
        }
      },
      j_paperback_one_sin_and_hundreds_of_good_deeds_fed = {
        name = "{C:red}一罪百善+{}",
        text = {
          "计分的{C:attention}3{}和{C:attention}无点数牌{}计分时",
          "牌组中每剩余一张牌",
          "给予+{C:mult}倍率{}",
          "{C:inactive}（当前为{C:mult}+#2#{}{C:inactive}）"
        }
      },
      j_paperback_forgery = {
        name = "赝品",
        text = {
          "每次出牌复制一张随机{C:attention}小丑的能力",
          "如果其中包含{X:mult,C:white}X倍率{}、{C:mult}倍率{}或{C:chips}筹码{}",
          "将对应的数值乘以",
          "{X:attention,C:white}X#1#{}与{X:attention,C:white}X#2#{}之间的随机系数",
          "{C:inactive}(当前{C:attention}#3#{C:inactive}系数{X:attention,C:white}X#4#{C:inactive})"
        }
      },
      j_paperback_chaplin = {
        name = "卓别林",
        text = {
          "购买{C:attention}优惠券{}时",
          "同时获得其{C:attention}升级{}版本"
        }
      },
      j_paperback_matcha = {
        name = "抹茶",
        text = {
          "每张牌计分时这张",
          "小丑获得{C:chips}+#1#{}筹码",
          "{C:mult}弃牌{}时有",
          "{C:green}#2#/#3#{}几率自毁",
          "{C:inactive}(当前{C:chips}+#4#{C:inactive}筹码)"
        }
      },
      j_paperback_freezer = {
        unlock = {
          "获得一张{C:dark_edition}负片{}",
          "{S:1.1,C:attention,E:2}食物小丑牌"
        },
        name = "冰箱",
        text = {
          "击败{C:attention}Boss盲注{}后",
          "生成一张{C:dark_edition}负片{C:attention}食物小丑牌{}"
        }
      },
      j_paperback_determination = {
        name = "决心",
        text = {
          "即将死亡时",
          "{C:attention}#1#{}底注",
          "{C:attention}#1#{}手牌上限",
          "{S:1.1,C:red,E:2}自毁{}"
        }
      },
      j_paperback_pool_table = {
        name = "台球桌",
        text = {
          "如果回合的第一次出牌",
          "不包含计分的{C:attention}人头牌{}",
          "创造一张对应{C:attention}牌型",
          "的{C:planet}星球牌",
          "{C:inactive}(需要空间)"
        }
      }
    },
    Sleeve = {
      sleeve_paperback_paper = {
        name = "纸制牌套",
        text = {
          "{C:legendary}Paperback{C:attention}小丑{}出现几率",
          "{C:attention}3X{}开局时拥有",
          "{C:attention,T:j_paperback_shopping_center}#1#{}"
        }
      },
      sleeve_paperback_antique = {
        name = "古旧牌套",
        text = {
          "{C:tarot}秘术包{}不再",
          "出现在商店中",
          "{C:paperback_minor_arcana}秘仪包",
          "出现概率{C:attention}3X{}"
        }
      },
      sleeve_paperback_proud_buff = {
        name = "骄傲牌套",
        text = {
          "所有初始{C:attention}A",
          "均为{C:dark_edition}多彩{}"
        }
      },
      sleeve_paperback_dreamer_buff = {
        name = "追梦者牌套",
        text = {
          "开局时拥有每种花色",
          "各一张{C:attention}#1#"
        }
      },
      sleeve_paperback_proud = {
        name = "骄傲牌套",
        text = {
          "开局时拥有全套",
          "{C:hearts}红桃{}、{C:diamonds}方片{}、{C:spades}黑桃{}",
          "{C:clubs}梅花{}、{C:paperback_crowns}皇冠{}和{C:paperback_stars}银星{}"
        }
      },
      sleeve_paperback_paper_buff = {
        name = "纸制牌套",
        text = {
          "开局时拥有{C:dark_edition}负片{}",
          "{C:attention,T:j_paperback_shopping_center}#1#{}小丑牌"
        }
      },
      sleeve_paperback_silver_buff = {
        name = "银色牌套",
        text = {
          "开局时拥有",
          "{C:paperback_minor_arcana,T:v_paperback_soothsay}#1#{}优惠券"
        }
      },
      sleeve_paperback_passionate_buff = {
        name = "热忱牌套",
        text = {
          "每隔一个{C:attention}Boss盲注{}",
          "替换为{C:attention}决胜盲注{}",
          "击败{C:attention}决胜盲注{}",
          "获得一个{C:dark_edition,T:tag_negative}负片{}标签"
        }
      },
      sleeve_paperback_dreamer = {
        name = "追梦者牌套",
        text = {
          "开局时拥有一个{C:paperback_temporary}临时",
          "{C:paperback_minor_arcana,T:c_paperback_apostle_of_wands}#1#",
          "{C:attention}#2#{}个小丑牌槽位"
        }
      },
      sleeve_paperback_silver = {
        name = "银色牌套",
        text = {
          "开局时拥有",
          "{C:paperback_minor_arcana,T:v_paperback_celtic_cross}#1#{}优惠券",
          "和一张{C:paperback_minor_arcana,T:c_paperback_nine_of_cups}#2#"
        }
      },
      sleeve_paperback_antique_buff = {
        name = "古旧牌套",
        text = {
          "{C:paperback_minor_arcana}秘仪包{}均{C:money}免费"
        }
      },
      sleeve_paperback_passionate = {
        name = "热忱牌套",
        text = {
          "每次击败{C:attention}Boss盲注{}后",
          "获得一个{C:attention,T:tag_paperback_high_risk}#1#",
          "不赚取任何{C:money}利息"
        }
      }
    },
    Voucher = {
      v_paperback_soothsay = {
        name = "预言",
        text = {
          "{C:money}商店{}里面",
          "有{C:paperback_minor_arcana}塔罗辅牌{}",
          "可供选购"
        }
      },
      v_paperback_celtic_cross = {
        name = "凯尔特十字",
        text = {
          "击败{C:attention}Boss盲注{}时",
          "获得一个{C:paperback_minor_arcana}占卜标签{}"
        }
      }
    },
    Planet = {
      c_paperback_quaoar = {
        name = "创神星"
      },
      c_paperback_haumea = {
        name = "妊神星"
      },
      c_paperback_makemake = {
        name = "鸟神星"
      },
      c_paperback_sedna = {
        name = "塞德娜"
      }
    },
    Spectral = {
      c_paperback_apostle_of_cups = {
        name = "圣杯使徒",
        text = {
          "将选中的{C:attention}游戏牌{}",
          "变为{C:dark_edition}负片{}版本",
          "{C:attention}#1#{}个小丑牌槽位"
        }
      },
      c_paperback_apostle_of_swords = {
        name = "宝剑使徒",
        text = {
          "摧毁选中的{C:attention}小丑牌{}",
          "{C:attention}#1#{}底注"
        }
      },
      c_paperback_apostle_of_wands = {
        name = "权杖使徒",
        text = {
          "从列表选择并生成一张",
          "{C:legendary}传奇{}以下（不包含）稀有度的小丑牌",
          "{C:inactive}（不会重复）"
        }
      }
    },
    Edition = {
      e_paperback_dichrome = {
        name = "双色",
        text = {
          "选择{C:attention}盲注{}时",
          "{C:attention}+#1#{C:chips}出牌{}或{C:mult}弃牌{}次数",
          "{C:inactive}(较少的优先)"
        }
      }
    },
    Other = {
      paperback_temporary = {
        name = "临时",
        text = {
          "回合结束时",
          "{C:mult}被摧毁{}"
        }
      },
      p_paperback_minor_arcana_normal = {
        name = "秘仪包",
        text = {
          "从最多{C:attention}#2#{}张{C:paperback_minor_arcana}塔罗辅牌{}中",
          "选择{C:attention}#1#{}张",
          "即选即用"
        }
      },
      paperback_pink_clip = {
        name = "粉色别针",
        text = {
          "{C:attention}留在手牌中{}时提供{X:mult,C:white}X#1#{}倍率",
          "每个计分的{C:attention}别针{}使其",
          "额外提供{X:mult,C:white}X#2#{}倍率",
          "{C:inactive}(出牌结束后重置)"
        }
      },
      paperback_light_suits = {
        name = "亮花色",
        text = {
          "{C:diamonds}方片{}、{C:hearts}红桃{}"
        }
      },
      paperback_yellow_clip = {
        name = "黄色别针",
        text = {
          "如果{C:attention}计分{}时{C:attention}留在手中{}的牌拥有{C:attention}别针{}",
          "留有黄色别针的牌计分时有{C:green}#1#/#2#{}几率{C:red}+#3#{}倍率",
          "{C:green}#4#/#5#{}几率{X:mult,C:white}X#6#{}倍率",
          "{C:green}#7#/#8#{}几率获得{C:money}$#9#{}"
        }
      },
      paperback_red_clip = {
        name = "红色别针",
        text = {
          "{C:attention}留在手牌中{}的每个{C:attention}别针{}",
          "使这个别针额外提供{C:mult}+#1#{}倍率",
          "{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)"
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
      paperback_gold_clip = {
        name = "金色别针",
        text = {
          "回合结束时{C:attention}留在手牌{}的金色别针为",
          "每个{C:attention}计分{}的{C:attention}别针{}",
          "给予{C:money}$#1#{}",
          "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
        }
      },
      paperback_energized = {
        name = "已充能",
        text = {
          "{C:attention}基本小丑能量{}",
          "无法复制此牌"
        }
      },
      paperback_requires_ranks = {
        name = "需要点数",
        text = {
          "由于{C:legendary}Paperback{}中",
          "禁用了{C:dark_edition}点数{}",
          "已从奖池中移除"
        }
      },
      paperback_requires_editions = {
        name = "需要版本",
        text = {
          "由于{C:legendary}Paperback",
          "{C:dark_edition}版本{}被禁用",
          "而无法出现在游戏中"
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
      paperback_blue_clip = {
        name = "蓝色别针",
        text = {
          "{C:attention}留在手牌中{}的每个{C:attention}别针{}",
          "使这个别针额外提供{X:chips,C:white}X#1#{}筹码",
          "{C:inactive}(当前{X:chips,C:white}X#2#{C:inactive}筹码)"
        }
      },
      undiscovered_paperback_minor_arcana = {
        name = "未发现",
        text = {
          "在非预设局中",
          "购买或使用",
          "这张牌",
          "以了解其作用"
        }
      },
      paperback_white_clip = {
        name = "白色别针",
        text = {
          "如果{C:attention}回合结束{}时仍{C:attention}留在手中",
          "本回合打出的每个{C:attention}别针{}",
          "使这个别针获得{C:chips}+#1#{}筹码",
          "{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)"
        }
      },
      paperback_requires_enhancements = {
        name = "需要增强",
        text = {
          "由于{C:legendary}Paperback",
          "{C:attention}增强{}被禁用",
          "而无法出现在游戏中"
        }
      },
      paperback_requires_paperclips = {
        name = "需要别针",
        text = {
          "由于{C:legendary}Paperback",
          "{C:attention}别针{}被禁用",
          "而无法出现在游戏中"
        }
      },
      paperback_black_clip = {
        name = "黑色别针",
        text = {
          "除这个别针以外",
          "如果{C:attention}打出的牌{}带有{C:attention}别针{}",
          "或{C:attention}留在手中的牌{}带有{C:attention}别针{}",
          "各使此牌重新触发一次"
        }
      },
      paperback_requires_minor_arcana = {
        name = "需要塔罗辅牌",
        text = {
          "由于{C:legendary}Paperback",
          "{C:paperback_minor_arcana}塔罗辅牌{}被禁用",
          "而无法出现在游戏中"
        }
      },
      paperback_dark_suits = {
        name = "暗花色",
        text = {
          "{C:spades}黑桃{}、{C:clubs}梅花{}"
        }
      },
      paperback_requires_tags = {
        name = "需要标签",
        text = {
          "由于{C:legendary}Paperback",
          "{C:attention}标签{}被禁用",
          "而无法出现在游戏中"
        }
      },
      paperback_requires_custom_suits = {
        name = "需要自定义花色",
        text = {
          "由于{C:legendary}Paperback",
          "{C:attention}自定义花色{}被禁用",
          "而无法出现在游戏中"
        }
      },
      paperback_orange_clip = {
        name = "橙色别针",
        text = {
          "{C:attention}留在手牌中{}的每{C:attention}#2#{}个{C:attention}别针{}",
          "使这个别针额外提供{C:money}$#1#{}",
          "{C:inactive}(当前{C:money}$#3#{C:inactive})"
        }
      }
    },
    Enhanced = {
      m_paperback_ceramic = {
        name = "陶器牌",
        text = {
          "计分时随机获得{C:money}$#1#{}~{C:money}$#2#{}",
          "如果{C:mult}倍率{}最终",
          "{C:attention}高于{} {C:chips}筹码{}",
          "则{C:red}摧毁{}此牌",
          "（打出或留在手牌时生效）"
        }
      },
      m_paperback_wrapped = {
        name = "礼品牌",
        text = {
          "计分时给予{C:money}$#1#{}",
          "无点数花色"
        }
      },
      m_paperback_soaked = {
        name = "水浸牌",
        text = {
          "{C:attention}留在手牌中{}的水浸牌",
          "为计分提供它们的{C:chips}筹码{}",
          "{C:mult}弃牌{}时有{C:green}#1#/#2#{}几率",
          "被{C:mult}摧毁{}"
        }
      },
      m_paperback_stained = {
        name = "染色牌",
        text = {
          "如果本回合已出牌后",
          "此牌仍{C:attention}留在手中{}",
          "则所有计分牌永久获得{C:mult}#1#{}倍率"
        }
      },
      m_paperback_domino = {
        name = "多米诺牌",
        text = {
          "本回合每打出或弃掉一个点数",
          "获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
        }
      },
      m_paperback_bandaged = {
        name = "绑扎牌",
        text = {
          "重新触发{C:attention}两侧{}的卡牌",
          "计分时有{C:green}#1#/#2#{}几率",
          "被{C:mult}摧毁{}"
        }
      }
    }
  },
  misc = {
    suits_singular = {
      paperback_Crowns = "皇冠",
      paperback_Stars = "银星"
    },
    suits_plural = {
      paperback_Crowns = "皇冠",
      paperback_Stars = "银星"
    },
    dictionary = {
      paperback_clippy_msg_5 = "我来帮忙！",
      k_paperback_minor_arcana = "塔罗辅牌",
      paperback_destroyed_ex = "被毁！",
      paperback_rare_ex = "稀有！",
      paperback_da_capo_Clubs = "第一乐章",
      paperback_polychrome_ex = "多彩！",
      paperback_clippy_msg_1 = "保存文件？",
      paperback_clippy_msg_3 = "嗨！",
      paperback_too_hot_ex = "太热！",
      paperback_ui_enable_ranks = "启用点数",
      paperback_reduced_ex = "已减少！",
      paperback_downgrade_ex = "降级！",
      paperback_determination_ex = "啊啊啊啊！",
      paperback_doubled_ex = "翻倍！",
      paperback_forlorn_destruction = "抱歉……",
      paperback_minor_arcana_pack = "秘仪包",
      paperback_ui_enable_spectrals = "启用幻灵牌",
      paperback_clippy_msg_full = "存储空间已满！",
      paperback_none = "没有",
      paperback_too_late_ex = "太晚了！",
      paperback_ui_paperclips = "别针",
      paperback_plus_minor_arcana = "+1塔罗辅牌",
      paperback_da_capo_None = "终章！",
      paperback_ui_enable_jokers = "启用小丑",
      paperback_clippy_msg_8 = "鼠标已启用！",
      paperback_freezer_ex = "晚餐时间！",
      paperback_saved_determination = "被决心拯救",
      paperback_ui_enable_minor_arcana = "启用塔罗辅牌",
      paperback_jestrogen_ex = "雌性化！",
      paperback_consumed_ex = "吃完了！",
      paperback_ui_custom_suits_enabled = "启用自定义花色",
      paperback_ui_select = "选择",
      paperback_ui_enable_paperclips = "启用别针",
      paperback_copy_ex = "复制！",
      paperback_melted_ex = "融化了！",
      paperback_clippy_msg_6 = "询问我！",
      paperback_edition_ex = "版本！",
      paperback_ui_enable_enhancements = "启用增强",
      paperback_jestosterone_ex = "雄性化！",
      paperback_broken_ex = "损坏！",
      paperback_inactive = "不生效",
      paperback_ui_artists = "画师",
      paperback_clippy_msg_7 = "我该走吗？",
      paperback_ui_enable_tags = "启用标签",
      paperback_da_capo_Spades = "第二乐章",
      paperback_plus_tag = "+1 标签",
      paperback_ui_localization = "翻译",
      paperback_supplies_ex = "补给！",
      paperback_clippy_msg_4 = "键盘已启用！",
      paperback_investment_ex = "投资！",
      paperback_ui_plague_doctor_quotes = "瘟疫医生语录",
      paperback_ui_enable_blinds = "启用盲注",
      paperback_ui_developers = "开发者",
      paperback_ui_requires_restart = "需要重启",
      paperback_ui_no_requires_restart = "无需重启",
      paperback_da_capo_Hearts = "第四乐章",
      paperback_saved_unholy_alliance = "被邪恶联盟拯救",
      paperback_ui_enable_vouchers = "启用优惠券",
      paperback_confessed_ex = "忏悔！",
      paperback_punch_card_ex = "错误传送！",
      b_paperback_minor_arcana_cards = "塔罗辅牌",
      paperback_clippy_msg_2 = "我是大眼夹！",
      paperback_da_capo_Diamonds = "第三乐章",
      paperback_plus_consumable = "+1消耗牌",
      paperback_punch_card_active = "告诉你的朋友！",
      paperback_ui_enable_editions = "启用版本"
    },
    labels = {
      paperback_energized = "已充能",
      paperback_temporary = "临时",
      paperback_pink_clip = "粉色别针",
      paperback_blue_clip = "蓝色别针",
      paperback_dichrome = "双色",
      paperback_red_clip = "红色别针",
      paperback_black_clip = "黑色别针",
      paperback_white_clip = "白色别针",
      paperback_orange_clip = "橙色别针",
      paperback_yellow_clip = "黄色别针",
      paperback_gold_clip = "金色别针"
    },
    poker_hands = {
      paperback_Spectrum = "光谱",
      ["paperback_Straight Flush (Rapture)"] = "被提同花",
      ["paperback_Spectrum House"] = "光谱葫芦",
      ["paperback_Spectrum Five"] = "光谱五条",
      ["paperback_Straight Spectrum"] = "光谱顺子",
      ["paperback_Straight Spectrum (Royal)"] = "皇家光谱"
    },
    ranks = {
      paperback_Apostle = "使徒"
    },
    v_dictionary = {
      paperback_prince_of_darkness = "+#1#倍率，+#2#筹码",
      paperback_a_discards_minus = "-#1#弃牌次数",
      paperback_a_completion = "#1#/#2#",
      paperback_a_round_minus = "-#1#回合",
      paperback_a_discards = "+#1#弃牌次数",
      paperback_a_hands_minus = "-#1#出牌次数",
      paperback_a_plus_tags = "+#1# 标签",
      paperback_a_plus_cards = "+#1# #2#s"
    },
    poker_hand_descriptions = {
      paperback_Spectrum = {
        "花色不同的5张牌"
      },
      ["paperback_Straight Spectrum"] = {
        "花色不同、点数连续的5张牌"
      },
      ["paperback_Spectrum House"] = {
        "每张牌花色均不同的三条加对子"
      },
      ["paperback_Spectrum Five"] = {
        "花色不同、点数相同的5张牌"
      }
    }
  }
}
