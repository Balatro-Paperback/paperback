SMODS.Joker {
  key = 'pear',
  config = {
    extra = {
      chips = 0,
      chip_gain = 5,
      chip_loss = 10
    }
  },
  rarity = 1,
  pos = { x = 17, y = 4 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize('Pair', 'poker_hands'),
        card.ability.extra.chip_gain,
        card.ability.extra.chip_loss,
        card.ability.extra.chips
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    -- 1 in 100 chance to have a different sprite
    if initial and pseudorandom("pear_joke", 1, 100) == 1 then
      card.children.center:set_sprite_pos { x = 17, y = 3 }
    end
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      if next(context.poker_hands['Pair']) then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      elseif card.ability.extra.chips < 10 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
        return {
          message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chip_loss } },
          colour = G.C.CHIPS
        }
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
