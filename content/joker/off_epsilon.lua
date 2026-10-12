SMODS.Joker {
  key = 'off_epsilon',
  config = {
    extra = {
      dollars = 13
    }
  },
  attributes = {
    'economy'
  },
  rarity = 4,
  pos = { x = 21, y = 9 },
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
        card.ability.extra.dollars,
      }
    }
  end,

  calculate = function(self, card, context)
    if PB_UTIL.is_joker_destroyed(context, card, true) and not context.blueprint then
      return {
        dollars = card.ability.extra.dollars,
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "$" },
        { ref_table = "card.ability.extra", ref_value = "dollars", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.DOLLARS },
    }
  end,
}
