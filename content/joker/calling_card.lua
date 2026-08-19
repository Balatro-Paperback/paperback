SMODS.Joker {
  key = 'calling_card',
  config = {
    extra = {
      Xmult_mod = 0.25,
      x_mult = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'boss_blind'
  },
  rarity = 2,
  pos = { x = 0, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,
  paperback_credit = {
    coder = { 'b' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_disable_crimson_heart' then
      return true
    end
  end,

  calculate = function(self, card, context)
    -- Upgrade joker if boss blind defeated
    if context.end_of_round and context.main_eval and not context.blueprint then
      if G.GAME.blind.boss then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'Xmult_mod',
          message_colour = G.C.MULT
        })
        return nil, true
      end
    end

    -- Upgrade joker if boss blind triggered
    if context.debuffed_hand and not context.blueprint then
      if G.GAME.blind.triggered then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'Xmult_mod',
          message_colour = G.C.MULT
        })
        return nil, true
      end
    end

    if context.joker_main then
      -- Upgrade joker if boss blind triggered (cards debuffed)
      if G.GAME.blind.triggered and G.GAME.blind.boss and not context.blueprint then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod

        SMODS.calculate_effect({
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
        }, card)
      end

      -- Give the xMult during scoring
      if card.ability.extra.x_mult > 1 then
        return {
          x_mult = card.ability.extra.x_mult,
          card = card
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = 'X' },
            { ref_table = 'card.ability.extra', ref_value = 'x_mult' }
          }
        }
      }
    }
  end
}

-- for calling card
local disable_ref = Blind.disable
function Blind:disable()
	local ret = disable_ref(self)
	if G.GAME.blind.name == 'Crimson Heart' then 
    check_for_unlock({ type = 'paperback_disable_crimson_heart' })
  end
  return ret
end
