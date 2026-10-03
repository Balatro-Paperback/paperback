SMODS.Back {
  key = 'enchained',
  atlas = 'decks_atlas',
  pos = { x = 7, y = 0 },

  apply = function(self, back)
    local jokers = {}
    local rarities = { 0, 0, 0, 0 }
    for i, v in ipairs(G.P_CENTER_POOLS.Joker) do
      jokers[i] = v.key
      rarities[v.rarity] = rarities[v.rarity] + 1
    end

    pseudoshuffle(jokers, "paperback_enchained")
    local banned_rarities = { 0, 0, 0, 0 }
    for i = math.floor(#jokers / 4), #jokers do
      G.GAME.banned_keys[jokers[i]] = true
      banned_rarities[G.P_CENTERS[jokers[i]].rarity] = banned_rarities[G.P_CENTERS[jokers[i]].rarity] + 1
    end

    -- make sure at least 1 joker from each rarity is unbanned
    for i = 1, 4 do
      if banned_rarities[i] == rarities[i] then
        for j, v in ipairs(jokers) do
          if G.P_CENTERS[jokers[j]].rarity == i then
            G.GAME.banned_keys[jokers[j]] = false
            if i == 1 then G.GAME.paperback.new_default_joker = j end
            break
          end
        end
      end
    end
  end
}
