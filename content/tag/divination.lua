SMODS.Tag {
  key = 'divination',
  attributes = {
    'booster'
  },
  atlas = 'tags_atlas',
  pos = { x = 2, y = 0 },
  discovered = false,
  paperback = {
    requires_minor_arcana = true
  },

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_paperback_minor_arcana_mega
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:yep('+', G.C.PAPERBACK_MINOR_ARCANA, function()
        PB_UTIL.open_booster_pack('p_paperback_minor_arcana_mega')
        return true
      end)

      tag.triggered = true
      return true
    end
  end
}

if next(SMODS.find_mod("allinjest")) then
  SMODS.Tag {
    key = "augury",
    config = { aij = { upgrade = "paperback_divination" } },
    attributes = {
      "minor_arcana",
      "generation",
      "consumable"
    },
    atlas = "tags_atlas",
    pos = { x = 2, y = 1 },
    discovered = false,
    paperback = {
      requires_minor_arcana = true
    },

    apply = function(self, tag, context)
      if context.type == "immediate" then
        tag:yep("+", G.C.PAPERBACK_MINOR_ARCANA, function()
          G.SETTINGS.paused = true
          G.FUNCS.overlay_menu {
            config = { no_esc = true },
            definition = PB_UTIL.apostle_of_wands_collection_UIBox(
              G.P_CENTER_POOLS.paperback_minor_arcana,
              { 7, 7 },
              {
                no_materialize = true,
                h_mod = 1.05,
                modify_card = function(other_card, center)
                  PB_UTIL.create_select_card_ui(other_card, G.consumeables, 2)
                end
              }
            )
          }
          return true
        end)
        tag.triggered = true
      end
    end
  }
end
