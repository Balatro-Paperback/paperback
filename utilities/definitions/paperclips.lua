-- List of defined paperclips within Paperback
PB_UTIL.ENABLED_PAPERCLIPS = {
  "white_clip",
  "black_clip",
  "gold_clip",
  "red_clip",
  "orange_clip",
  "yellow_clip",
  "green_clip",
  "blue_clip",
  "purple_clip",
  "pink_clip",
  "platinum_clip"
}

if PB_UTIL.config.paperclips_enabled then
  -- Table to hold all paperclip keys regardless of mod of origin for easy reference
  PB_UTIL.Paperclips = {}

  PB_UTIL.Paperclip = SMODS.Sticker:extend {
    prefix_config = { key = true },
    should_apply = function(self, card, center, area, bypass_roll)
      return bypass_roll
    end,
    config = {},
    rate = 0,
    special = false,
    sets = {
      Default = true
    },

    inject = function(self, i)
      SMODS.Sticker.inject(self, i)
      table.insert(PB_UTIL.Paperclips, self.key)
    end,

    draw = function(self, card)
      local x_offset = (card.T.w / 71) * -4 * card.T.scale
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, x_offset)
      if self.shiny then
        G.shared_stickers[self.key]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center, nil,
          nil, x_offset)
      end
    end,

    apply = function(self, card, val)
      card.ability[self.key] = val and copy_table(self.config) or nil
    end
  }

  -- allow paperclips to appear in standard packs
  local create_card_ref = G.P_CENTERS.p_standard_normal_1.create_card
  SMODS.Booster:take_ownership_by_kind("Standard", {
    create_card = function(self, card, i)
      local _card = SMODS.create_card(create_card_ref(self, card, i))
      local clip = pseudorandom(pseudoseed("std_clip" .. G.GAME.round_resets.ante)) > 0.7
          and PB_UTIL.poll_paperclip("std_clip")
      if clip then PB_UTIL.set_paperclip(_card, clip) end
      return _card
    end
  }, true)

  -- explain that Illusion also adds paperclips in shop
  SMODS.Voucher:take_ownership("illusion", {
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = { set = "Other", key = "paperback_illusion_clips" }
    end
  })
end
