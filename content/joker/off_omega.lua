SMODS.Joker {
  key = 'off_omega',
  config = {
    extra = {
      mult_mod = 13,
      mult = 0
    }
  },
  rarity = 4,
  pos = { x = 21, y = 10 },
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

  in_pool = function(self, args)
    return false
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { G.localization.descriptions.Joker.j_paperback_off_switch.name } }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_mod,
        card.ability.extra.mult,
      }
    }
  end,


  calculate = function(self, card, context)
    if not context.blueprint
    and context.paperback and context.paperback.destroyed_joker and not (card == context.paperback.destroyed_joker) and not (context.paperback.destroyed_joker.config.center.paperback and context.paperback.destroyed_joker.config.center.paperback.addon)
    then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

      return {
        message = localize {
          type = 'variable',
          key = 'a_mult',
          vars = { card.ability.extra.mult_mod }
        },
        colour = G.C.MULT
      }
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
