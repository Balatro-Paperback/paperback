SMODS.Tag {
  key = 'dichrome',
  attributes = {
    'joker',
    'editions',
    'shop'
  },
  atlas = 'tags_atlas',
  pos = { x = 1, y = 0 },
  discovered = false,

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_paperback_dichrome
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' and not context.card.edition and not context.card.temp_edition then
      if context.card.ability.set == 'Joker' then
        context.card.temp_edition = true
        tag:yep('+', G.C.DARK_EDITION, function()
          context.card:set_edition('e_paperback_dichrome', true)
          context.card.ability.couponed = true
          context.card:set_cost()
          context.card.temp_edition = nil
          return true
        end)

        tag.triggered = true
        return true
      end
    end
  end
}

if next(SMODS.find_mod("allinjest")) then
  SMODS.Tag {
    key = "heterochromia",
    config = { aij = { upgrade = "paperback_dichrome"} },
    attributes = {
      "joker",
      "editions"
    },
    atlas = "tags_atlas",
    pos = { x = 1, y = 1 },
    discovered = false,

    loc_vars = function(self, info_queue)
      info_queue[#info_queue + 1] = G.P_CENTERS.e_paperback_dichrome
    end,

    apply = function(self, tag, context)
      if context.type == "immediate" then
        local left, right
        for i = 1, #G.jokers.cards do
          if not G.jokers.cards[i].edition then
            left = i
            break
          end
        end
        for i = #G.jokers.cards, 1, -1 do
          if not G.jokers.cards[i].edition then
            right = i
            break
          end
        end

        if left then
          tag:yep("+", G.C.ATTENTION, function()
            G.jokers.cards[left]:set_edition("e_paperback_dichrome", true)
            if right and left ~= right then G.jokers.cards[right]:set_edition("e_paperback_dichrome", true) end
            return true
          end)
          tag.triggered = true
          return true
        end
      end
    end
  }
end
