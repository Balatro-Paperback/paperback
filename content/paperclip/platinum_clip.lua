PB_UTIL.Paperclip {
  key = 'platinum_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 5, y = 0 },
  badge_colour = G.C.PAPERBACK_PLATINUM,
  badge_text_colour = G.C.WHITE,
  shiny = true,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      return { func = function()
        for i, v in ipairs(G.hand.cards) do
          local other_clip = not v.debuff and PB_UTIL.has_paperclip(v)
          if other_clip then
            local ctx = context
            local effect = PB_UTIL.platinum_effects[other_clip](v, ctx)
            if effect then
              SMODS.calculate_effect(effect, v)
              -- count as scored clip for consistency
              G.GAME.paperback.round.scored_clips = G.GAME.paperback.round.scored_clips + 1
            end
          end
        end
      end}
    end
  end
}

PB_UTIL.platinum_effects = {
  paperback_white_clip = function(card)
    SMODS.calculate_effect( { chips = card.ability.paperback_white_clip.chips }, card)
  end,

  paperback_black_clip = function(card, context)
    local ctx = {
      cardarea = G.play,
      full_hand = G.play.cards,
      scoring_hand = context.scoring_hand,
      scoring_name = context.scoring_name,
      poker_hands = context.poker_hands,
      platinum_trigger = true
    }

    if card:can_calculate() then
      SMODS.score_card(card, ctx)
    end
  end,

  paperback_gold_clip = function(card)
    local money = card.ability.paperback_gold_clip.money * (G.GAME.paperback.round.scored_clips or 0)
    return { dollars = math.min(money, card.ability.paperback_gold_clip.max_money) }
  end,

  paperback_red_clip = function(card)
    local clips = PB_UTIL.count_paperclips { area = G.hand }
    return { mult = card.ability.paperback_red_clip.mult_mod * clips }
  end,

  paperback_orange_clip = function(card)
    local clips = PB_UTIL.count_paperclips { area = G.hand }
    if clips >= card.ability.paperback_orange_clip.every then
      local clip_groups = math.floor(clips / card.ability.paperback_orange_clip.every)
      local money = card.ability.paperback_orange_clip.money * clip_groups
      return { dollars = money }
    end
  end,

  paperback_yellow_clip = function(card)
    local clip = card.ability.paperback_yellow_clip
    local effect = {}
    if PB_UTIL.chance(card, 'yellow_clip_money', nil, clip.dollar_odds) then
      effect.dollars = clip.dollars
    end
    if PB_UTIL.chance(card, 'yellow_clip_mult', nil, clip.mult_odds) then
      effect.mult = clip.mult
    end
    if PB_UTIL.chance(card, 'yellow_clip_xmult', nil, clip.xmult_odds) then
      effect.xmult = clip.xmult
    end
    return effect
  end,

  paperback_green_clip = function(card)
    return { mult = card.ability.paperback_green_clip.mult }
  end,

  paperback_blue_clip = function(card)
    local clips = PB_UTIL.count_paperclips { area = G.hand }
    local clip = card.ability.paperback_blue_clip
    return { x_chips = clip.x_chips_base + clips * clip.x_chips_mod }
  end,

  paperback_purple_clip = function(card, context)
    local ctx = {
      cardarea = G.play,
      full_hand = G.play.cards,
      scoring_hand = context.scoring_hand,
      scoring_name = context.scoring_name,
      poker_hands = context.poker_hands,
      platinum_trigger = true
    }

    local index = 0
    for k, v in ipairs(G.hand.cards) do
      if v == card then
        index = k
        break
      end
    end

    local left = G.hand.cards[index - 1]
    local right = G.hand.cards[index + 1]
    if left and PB_UTIL.has_paperclip(left) and left:can_calculate() then
      SMODS.score_card(left, ctx)
    end
    if right and PB_UTIL.has_paperclip(right) and right:can_calculate() then
      SMODS.score_card(right, ctx)
    end
  end,

  paperback_pink_clip = function(card)
    return { x_mult = card.ability.paperback_pink_clip.x_mult }
  end,

  paperback_platinum_clip = function()
  end
}
