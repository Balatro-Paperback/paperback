SMODS.Tag {
  key = 'tag',
  config = {
    cards = 5,
    bonuses = {
      { "bonus", 30 },
      { "mult", 6 },
      { "x_chips", 0.3 },
      { "x_mult", 0.2 },
      { "p_dollars", 1 },
      { "repetitions", 1 },
      { "paperback_plus_odds", 1 },
      --% balance permabonus
    }
  },
  attributes = {
    "perma_bonus",
    "modify_card",
    "chips",
    "mult",
    "xchips",
    "xmult",
    "retrigger",
    --balance
  },
  atlas = 'tags_atlas',
  pos = { x = 5, y = 0 },
  discovered = false,

  apply = function(self, tag, context)
    if context.type == "paperback_first_hand" then
      tag:yep("+", G.C.GREEN, function()
        local cards = SMODS.shallow_copy(G.hand.cards)
        while #cards > 5 do
          local _, index = pseudorandom_element(cards, "paperback_tag_tag_pick_cards")
          table.remove(cards, index)
        end
        for i, v in ipairs(cards) do
          local bonus = pseudorandom_element(self.config.bonuses, "paperback_tag_tag_pick_bonuses")
          v.ability["perma_" .. bonus[1]] = v.ability["perma_" .. bonus[1]] + bonus[2]
        end
        for i = 1, #cards do
          local percent = 0.85 + (i - 0.999) / (#cards - 0.998) * 0.3
          G.E_MANAGER:add_event(Event {
            trigger = "after",
            delay = 0.15,
            func = function()
              play_sound("tarot2", percent, 0.6)
              cards[i]:juice_up(0.3, 0.3)
              return true
            end
          })
        end
        return true
      end)
      tag.triggered = true
    end
  end
}

if next(SMODS.find_mod("allinjest")) then
  SMODS.Tag {
    key = "marked",
    config = {
      bonuses = {
        { "bonus", 30 },
        { "mult", 6 },
        { "x_chips", 0.3 },
        { "x_mult", 0.2 },
        { "p_dollars", 1 },
        { "repetitions", 1 },
        { "paperback_plus_odds", 1 },
        --% balance permabonus
      },
      aij = { upgrade = "paperback_tag" }
    },
    attributes = {
      "perma_bonus",
      "modify_card",
      "chips",
      "mult",
      "xchips",
      "xmult",
      "retrigger",
      --balance
    },
    atlas = 'tags_atlas',
    pos = { x = 5, y = 1 },
    discovered = false,

    apply = function(self, tag, context)
      if context.type == "paperback_first_hand" then
        tag:yep("+", G.C.GREEN, function()
          for i, v in ipairs(G.hand.cards) do
            for i = 1, pseudorandom("paperback_marked_tag_bonus_count", 1, 3) do
              local bonus = pseudorandom_element(self.config.bonuses, "paperback_marked_tag_pick_bonuses")
              v.ability["perma_" .. bonus[1]] = v.ability["perma_" .. bonus[1]] + bonus[2]
            end
          end
          for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event {
              trigger = "after",
              delay = 0.15,
              func = function()
                play_sound("tarot2", percent, 0.6)
                G.hand.cards[i]:juice_up(0.3, 0.3)
                return true
              end
            })
          end
          return true
        end)
        tag.triggered = true
      end
    end
  }
end
