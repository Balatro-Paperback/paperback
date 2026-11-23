SMODS.Tag {
  key = 'enkephalin',
  attributes = {
    "ego_gift"
  },
  atlas = 'tags_atlas',
  pos = { x = 0, y = 2 },
  discovered = false,
  min_ante = 2,

  loc_vars = function(self, info_queue, tag)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_paperback_ego_gift_normal_1
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      local lock = tag.ID
      G.CONTROLLER.locks[lock] = true
      tag:yep('+', G.C.PURPLE, function()
        local booster = SMODS.create_card { key = 'p_paperback_ego_gift_normal_1', area = G.play }
        booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
        booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
        booster.T.w = G.CARD_W * 1.27
        booster.T.h = G.CARD_H * 1.27
        booster.cost = 0
        booster.from_tag = true
        G.FUNCS.use_card({ config = { ref_table = booster } })
        booster:start_materialize()
        G.CONTROLLER.locks[lock] = nil
        return true
      end)
      tag.triggered = true
      return true
    end
  end
}

if next(SMODS.find_mod("allinjest")) then
  SMODS.Tag {
    key = "meltdown",
    config = { aij = { upgrade = "paperback_enkephalin"} },
    attributes = {
      "ego_gift",
      "generation"
    },
    atlas = "tags_atlas",
    pos = { x = 0, y = 3 },
    discovered = false,
    min_ante = 2,

    apply = function(self, tag, context)
      if context.type == "immediate" then
        local corroded = {}
        for i, v in ipairs(G.consumeables.cards) do
          if v.ability.set == "paperback_ego_gift" and not v.ability.paperback_corroded then
            v:add_sticker("paperback_corroded", true)
            corroded[#corroded + 1] = v
          end
        end

        for i = 1, #corroded do
          local percent = 0.85 + (i - 0.999) / (#corroded - 0.998) * 0.3
          G.E_MANAGER:add_event(Event {
            trigger = "after",
            delay = 0.15,
            func = function()
              play_sound("tarot1", percent, 0.8)
              corroded[i]:juice_up(0.3, 0.3)
              return true
            end
          })
        end

        tag:yep("+", G.C.PAPERBACK_EGO_GIFT_RED, function()
          for i = 1, 3 do SMODS.add_card { set = "paperback_ego_gift", edition = "e_negative" } end
          return true
        end)
        tag.triggered = true
        return true
      end
    end
  }
end
