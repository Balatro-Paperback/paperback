SMODS.Blind {
  key = "index",
  boss = { min = 2 },
  attributes = { "discard" },
  boss_colour = HEX("a5998a"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 8 }
}

local can_discard_ref = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
  can_discard_ref(e)
  if #G.hand.highlighted ~= G.GAME.starting_params.discard_limit and G.GAME.blind.config.blind.key == "bl_paperback_index" then
    e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
  end
end
