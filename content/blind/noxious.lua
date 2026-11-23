SMODS.Blind {
  key = "noxious",
  boss = { min = 2 },
  attributes = { "destroy_card", "face" },
  boss_colour = HEX("98be8d"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 13 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.after then
      local to_destroy = {}
      for i, v in ipairs(context.full_hand) do
        if v:is_face() then to_destroy[#to_destroy + 1] = v end
      end
      SMODS.destroy_cards(to_destroy)
    end
  end
}
