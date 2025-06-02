SMODS.Joker {
  key = "plague_doctor",
  config = {
    extra = {
      xMult = 1.25
    }
  },
  rarity = 2,
  pos = { x = 8, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  paperback = {
    requires_ranks = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    local apostleCount = 0
    for _, v in ipairs(G.playing_cards) do
      if v:get_id() == SMODS.Ranks['paperback_Apostle'].id then
        apostleCount = apostleCount + 1
      end
    end
    if apostleCount >= 12 then
      G.GAME.pool_flags.plague_doctor_can_spawn = false
      G.E_MANAGER:add_event(Event({
        func = function()
          card.getting_sliced = true
          card:start_dissolve()
          SMODS.add_card({
            set = 'Joker',
            key = 'j_paperback_white_night',
            edition = card.edition,
            stickers = { "eternal" }
          })
          return true
        end
      }))
    end
  end,

  in_pool = function(self, args)
    return G.GAME.pool_flags.plague_doctor_can_spawn
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
      local apostleCount = 0
      for _, v in ipairs(G.playing_cards) do
        if v:get_id() == SMODS.Ranks['paperback_Apostle'].id then
          apostleCount = apostleCount + 1
        end
      end

      local to_apostle = context.scoring_hand[1]
      if context.scoring_name == 'High Card' and to_apostle:get_id() ~= SMODS.Ranks['paperback_Apostle'].id then
        apostleCount = apostleCount + 1
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            to_apostle:flip()
            play_sound('card1', 1)
            to_apostle:juice_up(0.3, 0.3)
            return true
          end
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            assert(SMODS.change_base(to_apostle, nil, 'paperback_Apostle'))
            return true
          end
        }))
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            to_apostle:flip()
            play_sound('tarot2', 1, 0.6)
            to_apostle:juice_up(0.3, 0.3)
            return true
          end
        }))

        local quote = (apostleCount > 12) and 12 or apostleCount
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            PB_UTIL.plague_quote({
              text = localize('paperback_plague_quote_' .. quote .. '_1'),
              colour = G.C.RED,
              major = G.play,
              hold = 4 * G.SETTINGS.GAMESPEED,
              offset = { x = 0, y = -3 },
              scale = 0.6
            })
            PB_UTIL.plague_quote({
              text = localize('paperback_plague_quote_' .. quote .. '_2'),
              colour = G.C.RED,
              major = G.play,
              hold = 4 * G.SETTINGS.GAMESPEED,
              offset = { x = 0, y = -2.2 },
              scale = 0.6
            })
            return true
          end
        }))
      end

      if apostleCount >= 12 then
        G.GAME.pool_flags.plague_doctor_can_spawn = false
        G.E_MANAGER:add_event(Event({
          func = function()
            card.getting_sliced = true
            card:start_dissolve()
            SMODS.add_card({
              set = 'Joker',
              key = 'j_paperback_white_night',
              edition = card.edition,
              stickers = { "eternal" }
            })
            return true
          end
        }))
      end
    end

    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card:get_id() == SMODS.Ranks['paperback_Apostle'].id then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED
          }
        else
          return {
            x_mult = card.ability.extra.xMult
          }
        end
      end
    end
  end
}
