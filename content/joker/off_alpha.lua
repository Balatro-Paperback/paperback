SMODS.Joker {
  key = 'off_alpha',
  config = {
    extra = {
      chips_mod = 13,
      chips = 0
    }
  },
  attributes = {
    'chips',
    'scaling'
  },
  rarity = 4,
  pos = { x = 21, y = 8 },
  soul_pos = { x = 22, y = 8 },
  atlas = 'jokers_atlas',
  cost = 1,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    permanently_eternal = true,
    indestructible = true,
    addon = true
  },
  paperback_secret_unlock = true,
  paperback_credit = {
    artist = { 'dylan_hall' },
    coder = { 'dowfrin' }
  },

  in_pool = function(self, args)
    return false
  end,
  -- dummy unlock condition for the unlock all button
  check_for_unlock = function(self, args) return false end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { G.localization.descriptions.Joker.j_paperback_the_batter.name } }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips_mod,
        card.ability.extra.chips,
      }
    }
  end,


  calculate = function(self, card, context)
    if PB_UTIL.is_joker_destroyed(context, card, true) and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'chips_mod',
        message_key = 'a_chips',
        message_colour = G.C.CHIPS
      })
      return nil, true
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
    }
  end,
}
