SMODS.Joker {
  key = 'ghost_cola',
  config = {},
  rarity = 2,
  pos = { x = 5, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = nil,

  yes_pool_flag = "ghost_cola_can_spawn",
  pools = {
    Food = true
  },

  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_negative

    return {
      vars = {
        localize { type = 'name_text', set = 'Tag', key = 'tag_negative', nodes = {} },
        localize ('k_spectral')
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.selling_self then
      return {
        func = function()
          -- Adds the negative tag
          G.E_MANAGER:add_event(Event {
            func = function()
              PB_UTIL.add_tag('tag_negative')
              card:juice_up()
              return true
            end
          })

          -- Creates the spectral card
          PB_UTIL.try_spawn_card { set = 'Spectral' }

          -- Make Ghost Cola extinct
          G.GAME.pool_flags.ghost_cola_can_spawn = false
        end
      }
    end
  end,
}


-- Allows Ghost Cola to spawn on Diet Cola sold
local calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
  local ret, ret2 = calculate_joker_ref(self, context)

  if self.ability.set == "Joker" and not self.debuff then
    if context.selling_self then
      if self.ability.name == 'Diet Cola' then
        G.GAME.pool_flags.ghost_cola_can_spawn = true
      end
    end
  end

  return ret, ret2
end

--------------------------------------------------
