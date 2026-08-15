SMODS.Atlas {
  key = "wish_fall_bg",
  path = "wishthaticouldfall_bg.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "wish_fall_soul",
  path = "wishthaticouldfall_soul.png",
  px = 71,
  py = 95,
  atlas_table = "ANIMATION_ATLAS",
  frames = 4,
  fps = 8
}

SMODS.Atlas {
  key = "wish_fall_text",
  path = "wishthaticouldfall_text.png",
  px = 71,
  py = 95
}

SMODS.Shader {
  key = "fall",
  path = "fall.fs"
}

SMODS.Joker {
  key = "i_wish_that_i_could_fall",
  atlas = "wish_fall_bg",
  soul_atlas = "wish_fall_soul",

  config = { extra = {
    bg_count = 19,
    offset_time = 0,
    spf = 4,

    chips = 0,
    chip_gain = 4
  } },
  rarity = 3,
  cost = 7,
  blueprint_compat = true,

  attributes = {
    "chips",
    "scaling",
    "modify_card",
    "music"
  },

  paperback_credit = {
    artist = {
      "thermo",
      "metanite",
      "papermoonqueen",
      "dylan_hall",
      "localthunk",
      "One Such Keeper"
    },
    coder = { "metanite" }
  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      local c = context.other_card

      return {
        message = localize("paperback_fall_ex"),
        colour = G.C.GREEN,
        func = function()
          G.E_MANAGER:add_event(Event {
            func = function()
              assert(SMODS.modify_rank(c, -1, true))
              c:set_sprites(nil, c.config.card)
              return true
            end
          })

          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chip_gain",
            message_key = "a_chips",
            message_colour = G.C.CHIPS
          })
        end
      }
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }
  end,

  set_sprites = function(self, card, front)
    card.children.paperback_fall_text = SMODS.create_sprite(card.T.x, card.T.y, card.T.w, card.T.h,
      "paperback_wish_fall_text", { x = 0, y = 0 })
    card.children.paperback_fall_text:set_role { major = card, role_type = "Glued", draw_major = card }
    card.children.paperback_fall_text.draw = function(self)
      if card.config.center.discovered or card.bypass_discovery_center then
        self:draw_shader("dissolve")
      end
    end

    local start_bg = math.random(0, self.config.extra.bg_count - 1)
    local pos = { x = start_bg % 8, y = math.floor(start_bg / 8) }
    if self.discovered or card.bypass_discovery_center then
      card.children.center:set_sprite_pos(pos)
    end
  end,

  update = function(self, card, dt)
    if self.discovered or card.bypass_discovery_center then
      card.ability.extra.offset_time = card.ability.extra.offset_time + G.real_dt
      if card.ability.extra.offset_time >= card.ability.extra.spf then
        local new_bg = math.random(0, card.ability.extra.bg_count - 1)
        local pos = { x = new_bg % 8, y = math.floor(new_bg / 8) }
        card.children.center:set_sprite_pos(pos)
        card.ability.extra.offset_time = 0
      end
    end
  end,

  draw = function(self, card, layer)
    if self.discovered or card.bypass_discovery_center then
      card.children.center:draw_shader("paperback_fall", nil, card.ARGS.send_to_shader)
    end
  end
}
