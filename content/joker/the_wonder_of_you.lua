SMODS.Joker {
  key = "the_wonder_of_you",
  rarity = 3,
  pos = { x = 18, y = 4 },
  atlas = 'jokers_atlas',
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    --Check if the joker to the right has a probability roll
    if context.pseudorandom_result and not context.result and context.trigger_obj then
      if context.trigger_obj.config and context.trigger_obj.config.center and context.trigger_obj.config.center.set == 'Joker' then
        local wonder_Pos = nil
        local adjacent_Pos = nil
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card then
            wonder_Pos = i
          end
          if G.jokers.cards[i] == context.trigger_obj then
            adjacent_Pos = i
          end
        end

        -- Only activate if the failed joker is to the right of WOU
        if wonder_Pos and adjacent_Pos and adjacent_Pos == wonder_Pos + 1 then
          if G.hand.cards and #G.hand.cards > 0 then
            for i = #G.hand.cards, 1, -1 do
              if not G.hand.cards[i].destroyed then
                SMODS.destroy_cards(G.hand.cards[i])
                return {
                  message = localize('paperback_destroyed_ex')
                }
              end
            end
          end
        end
      end
    end
  end
}
