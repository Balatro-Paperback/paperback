SMODS.Back {
  key = 'paper',
  atlas = 'decks_atlas',
  pos = { x = 0, y = 0 },
  config = {
    jokers = {
      'j_paperback_shopping_center'
    },
    extra = {
      xweight = 3
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Joker',
          key = 'j_paperback_shopping_center'
        }
      }
    }
  end,
  calculate = function(self, back, context)
    if context.modify_weights then
      for i, item in ipairs(context.pool) do
        local center = G.P_CENTERS[item.key]
        if center and center.set == "Joker" then
          if item.key:find('j_paperback_') or (center.attributes or {}).Paperback then
            item.weight = item.weight * self.config.extra.xweight
          end
        end
      end
    end
  end
}
