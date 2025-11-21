PB_UTIL.MinorArcana {
  key = 'six_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 6 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_investment
    info_queue[#info_queue + 1] = G.P_TAGS.tag_economy
    info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
    info_queue[#info_queue + 1] = G.P_TAGS.tag_d_six
    info_queue[#info_queue + 1] = G.P_TAGS.tag_juggle
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local tags = {
      'tag_investment',
      'tag_economy',
      'tag_coupon',
      'tag_d_six',
      'tag_juggle'
    }
    local tag = PB_UTIL.poll_tag("six_of_pentacles", tags)

    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.add_tag(tag)
    end)
  end
}
