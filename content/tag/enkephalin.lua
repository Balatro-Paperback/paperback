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
