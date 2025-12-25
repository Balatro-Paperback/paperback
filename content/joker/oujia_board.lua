SMODS.Joker {
  key = "oujia_board",
  config = { extra = { allow_soul = false } },
  rarity = 3,
  pos = { x = 24, y = 10 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  add_to_deck = function(self, card, from_debuff)
    G.GAME.spectral_rate = G.GAME.spectral_rate + 2 -- same rate as ghost deck
    card.ability.extra.allow_soul = G.GAME.selected_back_key.key == 'b_ghost'
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.spectral_rate = G.GAME.spectral_rate - 2
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end
    if context.create_shop_card and card.ability.extra.allow_soul then
      return { shop_create_flags = { soulable = true } }
    end
    if context.press_play and #G.jokers.cards > 1 then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.jokers:shuffle('oujia_board'); play_sound('cardSlide1', 0.85); return true
            end
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
            func = function()
              G.jokers:shuffle('oujia_board'); play_sound('cardSlide1', 1.15); return true
            end
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
            func = function()
              G.jokers:shuffle('oujia_board'); play_sound('cardSlide1', 1); return true
            end
          }))
          delay(0.5)
          return true
        end
      }))
    end
  end
}
