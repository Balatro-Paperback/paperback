SMODS.Joker {
  key = "twenty_first_century",
  attributes = {
    'red',
    'generation',
    'joker',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 7, y = 12 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return {
      vars = {
        localize { type = 'name_text', set = 'paperback_minor_arcana', key = 'c_paperback_nine_of_cups' }
      }
    }
  end,

  check_for_unlock = function (self, args)
    return args.type == "paperback_rare_nine_of_cups"
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and (context.beat_boss or G.GAME.blind.name == "Big Blind") then
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end

      if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
        local joker = G.jokers.cards[my_pos - 1]
        local rarity = joker.config.center.rarity
        if type(rarity) == "number" then
          if rarity < 3 then
            rarity = rarity + math.min(math.floor(pseudorandom("twenty_first_century", 0, 2)), 1)
          end

          rarity = PB_UTIL.base_rarities[rarity] or rarity
        end
        G.E_MANAGER:add_event(Event {
          trigger = 'after',
          delay = 0.4,
          func = function()
            card:juice_up()
            PB_UTIL.destroy_joker(joker, function()
              SMODS.add_card {
                set = 'Joker',
                rarity = rarity,
                edition = joker.edition,
                key_append = 'twenty_first_century_joker'
              }
            end)

            return true
          end
        })
      end
    end
  end
}
