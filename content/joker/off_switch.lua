SMODS.Joker {
  key = 'off_switch',
  config = {
    extra = {
      a_xmult = 2,
      x_mult = 1,
    }
  },
  rarity = 4,
  pos = { x = 20, y = 2 },
  soul_pos = { x = 21, y = 2 },
  atlas = 'jokers_atlas',
  cost = 13,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_off_addons = {
    'j_paperback_off_alpha',
    'j_paperback_off_omega',
    'j_paperback_off_epsilon',
  },
  paperback_secret_unlock = true,

  in_pool = function(self, args)
    return false
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { G.localization.descriptions.Joker.j_paperback_the_batter.name } }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult,
      }
    }
  end,
  add_to_deck = function(self, card, from_debuff)
    if from_debuff then return end
    G.E_MANAGER:add_event(Event({
      func = function()
        for _, v in ipairs(self.paperback_off_addons) do
          SMODS.add_card {
            key = v,
            set = 'Joker',
            stickers = { "eternal" },
            force_stickers = true
          }
        end
        return true
      end
    }))
  end,

  remove_from_deck = function(self, card, from_debuff)
    if from_debuff then return end
    for k, v in ipairs(G.jokers.cards) do
      for _, addon_key in ipairs(self.paperback_off_addons) do
        if v.config.center.key == addon_key then
          PB_UTIL.destroy_joker(v)
        end
      end
    end
  end,

  calculate = function(self, card, context)
    -- tries destroying leftmost non-eternal joker when a playing card is destroyed
    if not context.blueprint and context.remove_playing_cards then
      local triggered = false
      local eligible_jokers = {}

      for k, v in pairs(G.jokers.cards) do
        if not SMODS.is_eternal(v) and not v.getting_sliced and (v ~= card) then
          eligible_jokers[#eligible_jokers + 1] = v
        end
      end
      for count = 1, #context.removed do
        if next(eligible_jokers) and eligible_jokers[count] then
          triggered = true
          PB_UTIL.destroy_joker(eligible_jokers[count])
        end
      end
      if triggered then
        return {
          message = localize('paperback_off_switch_ex'),
          colour = G.C.BLACK
        }
      end
    end

    if not context.blueprint and context.paperback and context.paperback.destroyed_joker and
    not (card == context.paperback.destroyed_joker) then
      card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.a_xmult
      return {
        message = localize {
          type = 'variable',
          key = 'a_xmult',
          vars = { card.ability.extra.a_xmult }
        },
        colour = G.C.MULT
      }
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
