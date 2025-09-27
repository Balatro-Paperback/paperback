SMODS.Joker {
  key = "da_capo",
  config = {
    extra = {
      xmult = 4
    }
  },
  rarity = 3,
  pos = { x = 17, y = 8 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  add_to_deck = function(self, card, from_debuff)
    for k, v in ipairs(G.playing_cards) do
      G.GAME.blind:debuff_card(v)
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = {
      set = 'Other',
      key = 'debuffed_playing_card'
    }
    if G.GAME.paperback.da_capo_suit ~= 'None' then
      return {
        vars = {
          card.ability.extra.xmult,
          localize(G.GAME.paperback.da_capo_suit, 'suits_plural'),
          colours = { G.C.SUITS[G.GAME.paperback.da_capo_suit] }
        }
      }
    else
      return {
        vars = {
          card.ability.extra.xmult,
          localize('paperback_none'),
          colours = { G.C.UI.TEXT_INACTIVE }
        }
      }
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end

    if context.setting_blind then
      G.E_MANAGER:add_event(Event {
        func = function()
          -- Update the debuff of all playing cards when swapping suits
          for k, v in ipairs(G.playing_cards) do
            G.GAME.blind:debuff_card(v)
          end

          return true
        end
      })
    end

    if not context.blueprint and context.after and context.cardarea == G.jokers then
      G.E_MANAGER:add_event(Event {
        func = function()
          -- Update the debuff of all playing cards when swapping suits
          for k, v in ipairs(G.playing_cards) do
            G.GAME.blind:debuff_card(v)
          end

          return true
        end
      })
      return {
        message = localize('paperback_da_capo_' .. G.GAME.paperback.da_capo_suit),
        colour = G.C.SUITS[G.GAME.paperback.da_capo_suit] or G.C.PAPERBACK_SOLEMN_WHITE
      }
    end
  end
}

-- We hook into the vanilla function used to update the debuffed status of cards
local debuff_card_ref = Blind.debuff_card
function Blind.debuff_card(self, card, from_blind)
  local ret = debuff_card_ref(self, card, from_blind)
  if card.area ~= G.jokers then
    if G.GAME.paperback.da_capo_suit == 'None' then
      return ret
    end
    for k, v in ipairs(SMODS.find_card('j_paperback_da_capo')) do
      if not card:is_suit(G.GAME.paperback.da_capo_suit, true) then
        card:set_debuff(true)
        if card.debuff then card.debuffed_by_blind = true end
      end
    end
  end

  return ret
end
