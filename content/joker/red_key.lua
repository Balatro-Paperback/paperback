SMODS.Joker {
  key = "red_key",
  config = {
    extra = {
    }
  },
  attributes = {
    'generation',
    'joker',
    'red'
  },
  rarity = 2,
  pos = { x = 8, y = 12 },
  soul_pos = { x = 9, y = 12 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = 'Other', key = 'paperback_temporary' }
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_played_five_heart_kings' then
      return true
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
        G.E_MANAGER:add_event(Event {
          func = function()
            local c =     SMODS.add_card {
              set = "Joker",
              attributes = { "red" },
            }

            -- Mark the created Joker as temporary (it will be destroyed at the end of round)
            c:add_sticker('paperback_temporary', true)
            return true
          end
        })

      return {
        message = localize('paperback_red_ex'),
        colour = G.C.MULT
      }
      end

      if context.selling_self and not context.blueprint then

        for i, card in ipairs(G.jokers.cards) do
          card.ability.paperback_temporary = false
        end
      end
    end
}
