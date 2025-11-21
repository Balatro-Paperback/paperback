SMODS.Consumable {
  key = 'apostle_of_pentacles',
  config = {
    max_highlighted = 1,
    paperclip = 'platinum'
  },
  set = 'Spectral',
  atlas = 'spectral_atlas',
  pos = { x = 3, y = 0 },

  hidden = true,
  soul_set = "paperback_minor_arcana",
  soul_rate = 0.001,

  paperback = {
    requires_paperclips = true,
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip(card.ability.paperclip)

    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        if card.ability.paperclip then
          PB_UTIL.set_paperclip(v, card.ability.paperclip)
        end
      end
    end)
  end
}
