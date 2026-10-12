local banned_tarot = {}
local banned_minor_arcana = {}

for i, v in ipairs(G.P_CENTER_POOLS.Tarot) do
  table.insert(banned_tarot, { id = v.key })
end

for i, v in pairs(SMODS.Centers) do
  if v.set == "Tarot" then
    table.insert(banned_tarot, { id = v.key })
  end
  if v.set == "paperback_minor_arcana" and not v.key:find("cups") then
    table.insert(banned_minor_arcana, { id = v.key })
  end
end

local banned = {}
for i, v in ipairs { banned_tarot, banned_minor_arcana } do
  for j, w in ipairs(v) do
    table.insert(banned, w)
  end
end

table.insert(banned, { id = "c_paperback_apostle_of_wands" })
table.insert(banned, { id = "c_paperback_apostle_of_swords" })
table.insert(banned, { id = "c_paperback_apostle_of_pentacles" })

table.insert(banned, { id = "p_arcana_normal_1", ids = {
  "p_arcana_normal_1", "p_arcana_normal_2",
  "p_arcana_normal_3", "p_arcana_normal_4",
  "p_arcana_jumbo_1", "p_arcana_jumbo_2",
  "p_arcana_mega_1", "p_arcana_mega_2"
} })

SMODS.Challenge {
  key = "trial_of_cups",
  rules = {
    custom = {
      { id = "scaling", value = 2 },
      { id = "cup_trial_1" },
      { id = "cup_trial_2" },
      { id = "cup_trial_3" },
      { id = "cup_trial_4" },
      { id = "cup_trial" }
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
      { id = "bl_head", type = "blind" }
    }
  },
  deck = {
    type = "Challenge Deck",
    cards = (function()
      local temp = {}
      for i, v in pairs(SMODS.Ranks) do
        if not v.original_mod then
          for j = 1, 4 do
            table.insert(temp, { s = "H", r = v.card_key})
          end
        end
      end
      return temp
    end)()
  },
  unlocked = function (self)
    return G.P_CENTERS['v_paperback_soothsay'].unlocked
  end,
  calculate = function(self, context)
    if context.end_of_round and context.main_eval and context.beat_boss then
      for _, v in ipairs(G.jokers.cards) do
        if not v.ability.eternal then
          local rarity = v.config.center.rarity
          local edition = v.edition
          if type(rarity) == "number" then
            if rarity < 3 then rarity = rarity + 1 end
            rarity = PB_UTIL.base_rarities[rarity] or rarity
          end
          PB_UTIL.destroy_joker(v, function()
            SMODS.add_card {
              set = "Joker",
              rarity = rarity,
              edition = edition
            }
          end)
          break
        end
      end
    end
  end
}
