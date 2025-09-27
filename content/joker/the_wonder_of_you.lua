SMODS.Joker {
  key = "the_wonder_of_you",
  config = {
    extra = {
      tag_count = 2
    }
  },
  rarity = 2,
  pos = { x = 18, y = 4 },
  atlas = 'jokers_atlas',
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind:get_type() == 'Boss' then
      for _ = 1, card.ability.extra.tag_count, 1 do
        G.E_MANAGER:add_event(Event({
          func = (function()
            local tag_pool = get_current_pool('Tag')
            local selected_tag = pseudorandom_element(tag_pool, 'modprefix_seed')
            local it = 1
            while selected_tag == 'UNAVAILABLE' do
              it = it + 1
              selected_tag = pseudorandom_element(tag_pool, 'modprefix_seed_resample' .. it)
            end
            add_tag(Tag(selected_tag, false, 'Small'))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
            return true
          end)
        }))
      end
    end
  end
}
