SMODS.Blind {
  key = 'misty_bass',
  boss = {
    showdown = true, min = 1
  },
  attributes = {
    'position'
  },
  dollars = 8,
  mult = 2,
  boss_colour = HEX("ABA89D"),
  atlas = 'music_blinds_atlas',
  pos = { y = 14 },

  disable = function(self)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      func = function()
        SMODS.Stickers.pinned:apply(G.jokers.cards[1], false)
        return true
      end
    }))
  end,

  defeat = function(self)
    SMODS.Stickers.pinned:apply(G.jokers.cards[1], false)
  end,

  calculate = function(self, blind, context)
    if not blind.disabled and context.setting_blind then
      if #G.jokers.cards > 0 then
        G.jokers:unhighlight_all()
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.2,
          func = function()
            if #G.jokers.cards > 1 then
              G.E_MANAGER:add_event(Event({
                func = function()
                  G.jokers:shuffle("misty_bass")
                  play_sound("cardSlide1", 0.85)
                  return true
                end
              }))
              delay(0.15)
              G.E_MANAGER:add_event(Event({
                func = function()
                  G.jokers:shuffle("misty_bass")
                  play_sound("cardSlide1", 1.15)
                  return true
                end
              }))
              delay(0.15)
              G.E_MANAGER:add_event(Event({
                func = function()
                  G.jokers:shuffle("misty_bass")
                  play_sound("cardSlide1", 1)
                  return true
                end
              }))
              delay(0.15)
            end
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.Stickers.pinned:apply(G.jokers.cards[1], true)
                return true
              end
            }))
            delay(0.5)
            return true
          end
        }))
      end
    end
  end
}
