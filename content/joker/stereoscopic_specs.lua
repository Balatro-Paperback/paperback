SMODS.Joker {
  key = "stereoscopic_specs",
  config = {
    extra = {
      last_tag = nil
    }
  },
  attributes = {
    'generation',
    'tag'
  },
  rarity = 3,
  pos = { x = 11, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,
  check_for_unlock = function (self, args)
    local count = 0
    for i = 1, #G.GAME.tags do
      if G.GAME.tags[i].key == "tag_double" then count = count + 1 end
    end
    return count >= 5
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,
  loc_vars = function(self, info_queue, card)
    if card.ability.extra.last_tag then
      return {
        vars = {
          localize { type = 'name_text', set = 'Tag', key = card.ability.extra.last_tag, nodes = {} }
        }
      }
    else
      return {
        vars = {
          localize("paperback_none")
        }
      }
    end
  end,
  calculate = function(self, card, context)
    if context.tag_triggered then
      card.ability.extra.last_tag = context.tag_triggered.key
    end
    if context.end_of_round and context.main_eval and context.beat_boss then
      if card.ability.extra.last_tag then
        return {
          func = function()
            -- Adds the negative tag
            G.E_MANAGER:add_event(Event {
              func = function()
                PB_UTIL.add_tag(card.ability.extra.last_tag)
                card:juice_up()
                return true
              end
            })
          end
        }
      end
    end
  end
}
