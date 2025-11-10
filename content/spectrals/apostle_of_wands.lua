SMODS.Consumable {
  key = 'apostle_of_wands',
  config = {
    extra = {
      delta = -1
    }
  },
  set = "Spectral",
  atlas = 'spectral_atlas',
  pos = { x = 1, y = 0 },

  hidden = true,
  soul_set = "paperback_minor_arcana",
  soul_rate = 0.001,

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.delta }
    }
  end,

  can_use = function(self, card)
    return #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card, area, copier)
    PB_UTIL.use_consumable_animation(card, nil, function()
      if #G.jokers.cards < G.jokers.config.card_limit then
        G.SETTINGS.paused = true

        local selectable_jokers = {}

        for _, v in ipairs(G.P_CENTER_POOLS.Joker) do
          -- Only shows discovered common, uncommon or rare and non-owned jokers
          local add = not PB_UTIL.is_banned(v)
              and v.discovered
              and not next(SMODS.find_card(v.key))
              and (v.rarity == 1 or v.rarity == 2 or v.rarity == 3)

          if add then
            selectable_jokers[#selectable_jokers + 1] = v
          end
        end

        -- If the list of jokers is empty, we want at least one option so the user can leave the menu
        if #selectable_jokers <= 0 then
          selectable_jokers[#selectable_jokers + 1] = G.P_CENTERS.j_joker
        end

        G.FUNCS.overlay_menu {
          config = { no_esc = true },
          definition = PB_UTIL.apostle_of_wands_collection_UIBox(
            selectable_jokers,
            { 5, 5, 5 },
            {
              no_materialize = true,
              modify_card = function(other_card, center)
                other_card.sticker = get_joker_win_sticker(center)
                PB_UTIL.create_select_card_ui(other_card, G.jokers)
              end,
              h_mod = 1.05,
            }
          ),
        }
      end
    end)
  end
}
