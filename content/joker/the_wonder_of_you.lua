SMODS.Joker {
  key = "the_wonder_of_you",
  config = {
    extra = {
      tag_count = 2
    }
  },
  attributes = {
    'generation',
    'tag',
    'boss_blind'
  },
  rarity = 2,
  pos = { x = 18, y = 4 },
  atlas = 'jokers_atlas',
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'aa7' }
  },

  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.blind.boss 
    and G.GAME.blind.name == 'Amber Acorn' and not G.GAME.blind.disabled
  end,

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
