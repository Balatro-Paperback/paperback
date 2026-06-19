PB_UTIL.Paperclip {
  key = 'purple_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 3, y = 1 },
  badge_colour = G.C.PURPLE,
  config = {
    num_mod = 1,
    numerator = 0,
    denominator = 10
  },
  attributes = {
    'generation',
    'tarot',
    'consumable',
    'chance'
  },

  loc_vars = function(self, info_queue, card)
    local num, den = SMODS.get_probability_vars(card, card.ability[self.key].numerator,
      card.ability[self.key].denominator, "purple_clip")
    return {
      vars = {
        num,
        den,
        card.ability[self.key].num_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.clip_scored then
      card.ability[self.key].numerator = card.ability[self.key].numerator + card.ability[self.key].num_mod
    end

    if context.main_scoring and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if SMODS.pseudorandom_probability(card, "purple_clip", card.ability[self.key].numerator, card.ability[self.key].denominator, "purple_clip") then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        return {
          message = localize("k_plus_tarot"),
          message_card = card,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card { set = "Tarot", key_append = "paperback_purple_clip" }
                G.GAME.consumeable_buffer = 0
                return true
              end
            }))
          end
        }
      end
    end

    if context.after and context.cardarea == G.hand then
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        func = function()
          if card.ability[self.key] then
            card.ability[self.key].numerator = 0
            return true
          end
          return true
        end
      }))
    end
  end
}
