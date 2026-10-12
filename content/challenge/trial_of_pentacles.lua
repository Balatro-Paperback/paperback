local banned_jokers = {}
local banned_tarot = {}
local banned_minor_arcana = {}

for i, v in ipairs(G.P_CENTER_POOLS.Joker) do
  if not v.eternal_compat then
    table.insert(banned_jokers, { id = v.key })
  end
end
for i, v in ipairs(G.P_CENTER_POOLS.Tarot) do
  table.insert(banned_tarot, { id = v.key })
end

for i, v in pairs(SMODS.Centers) do
  if v.set == "Joker" and not v.eternal_compat then
    table.insert(banned_jokers, { id = v.key })
  end
  if v.set == "Tarot" then
    table.insert(banned_tarot, { id = v.key })
  end
  if v.set == "paperback_minor_arcana" and not v.key:find("pentacles") then
    table.insert(banned_minor_arcana, { id = v.key })
  end
end

local banned = {}
for i, v in ipairs { banned_jokers, banned_tarot, banned_minor_arcana } do
  for j, w in ipairs(v) do
    table.insert(banned, w)
  end
end

table.insert(banned, { id = "c_paperback_apostle_of_cups" })
table.insert(banned, { id = "c_paperback_apostle_of_wands" })
table.insert(banned, { id = "c_paperback_apostle_of_swords" })

table.insert(banned, { id = "p_arcana_normal_1", ids = {
  "p_arcana_normal_1", "p_arcana_normal_2",
  "p_arcana_normal_3", "p_arcana_normal_4",
  "p_arcana_jumbo_1", "p_arcana_jumbo_2",
  "p_arcana_mega_1", "p_arcana_mega_2"
} })

SMODS.Challenge {
  key = "trial_of_pentacles",
  rules = {
    custom = {
      { id = "scaling", value = 2 },
      { id = "all_eternal" },
      { id = "pentacle_trial" }
    }
  },
  vouchers = {
    { id = "v_paperback_soothsay" }
  },
  restrictions = {
    banned_cards = banned,
    banned_tags = {
      { id = "tag_charm" }
    },
    banned_other = {
      { id = "bl_window", type = "blind" },
      { id = "bl_final_leaf", type = "blind" }
    }
  },
  unlocked = function (self)
    return G.P_CENTERS['v_paperback_soothsay'].unlocked
  end,
  deck = {
    type = "Challenge Deck",
    cards = (function()
      local temp = {}
      for i, v in pairs(SMODS.Ranks) do
        if not v.original_mod then
          for j = 1, 4 do
            table.insert(temp, { s = "D", r = v.card_key})
          end
        end
      end
      return temp
    end)()
  }
}
