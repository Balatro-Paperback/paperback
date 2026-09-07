if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "stardrop",
    config = {
      extra = {
        balance = 2
      }
    },
    attributes = {
      'balance',
      'suit',
      'stars'
    },
    rarity = 2,
    pos = { x = 1, y = 11 },
    soul_pos = { x = 2, y = 11 },
    atlas = "jokers_atlas",
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    paperback = {
      requires_custom_suits = true,
      requires_stars = true
    },
    paperback_credit = {
      coder = { 'thermo' }
    },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.balance,
          localize("paperback_Stars", 'suits_plural'),
          colours = {
            G.C.PAPERBACK_STARS_LC
          }
        }
      }
    end,

    check_for_unlock = function(self, args)
      if G.GAME.round >= 1 then
        local star = false
        for _, v in ipairs(G.playing_cards or {}) do
          if v.base.suit == ('paperback_Stars') then
            star = true
          else
            return false
          end
        end
        return star
      end
    end,

    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit('paperback_Stars') then
          return {
            func = function()
              PB_UTIL.apply_plasma_effect(context.other_card, false, card.ability.extra.balance / 100)
            end
          }
        end
      end
    end
  }
end
