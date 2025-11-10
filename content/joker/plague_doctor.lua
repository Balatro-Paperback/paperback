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
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  paperback = {
    requires_ranks = true
  },
  locked_loc_vars = function(self, info_queue)
    return { vars = { 5 } }
  end,
  check_for_unlock = function(self, args)
    if G.P_CENTER_POOLS["paperback_ego_gift"] then
      local count = 0
      for k, v in pairs(G.P_CENTER_POOLS["paperback_ego_gift"]) do
        if v.discovered == true then
          count = count + 1
        end
      end
      if count >= 5 then
        unlock_card(self)
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult
      }
    }
  end,

  in_pool = function(self, args)
    return G.GAME.pool_flags.plague_doctor_can_spawn
  end,

  calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers and not context.blueprint then
      local apostleCount = 0
      for _, v in ipairs(G.playing_cards) do
        if PB_UTIL.is_rank(v, 'paperback_Apostle') then
          apostleCount = apostleCount + 1
        end
      end
      if context.scoring_name == 'High Card' then
        local to_apostle = {}
        for _, scored in ipairs(context.scoring_hand) do
          if not (scored.config.center.key == 'm_stone' or scored.config.center.overrides_base_rank)
          and not PB_UTIL.is_rank(scored, 'paperback_Apostle') then
            table.insert(to_apostle, scored)
          end
        end
        if to_apostle[1] then
          PB_UTIL.use_consumable_animation(card, to_apostle,
            function()
              for _, v in ipairs(to_apostle) do
                assert(SMODS.change_base(v, nil, 'paperback_Apostle'))
              end
            end)
        end
        apostleCount = apostleCount + #to_apostle

        if #to_apostle > 0 and PB_UTIL.config.plague_doctor_quotes_enabled then
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
              stickers = { "eternal" },
              force_stickers = true
            })
            return true
          end
        }))
      end
    end

    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if PB_UTIL.is_rank(context.other_card, 'paperback_Apostle') then
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
