PB_UTIL.ENABLED_SUITS = {
  'crowns',
  'stars',
}

-- Define light and dark suits
PB_UTIL.light_suits = { 'Diamonds', 'Hearts' }
PB_UTIL.dark_suits = { 'Spades', 'Clubs' }

-- Add Crowns and Stars if enabled
if PB_UTIL.config.suits_enabled then
  table.insert(PB_UTIL.light_suits, 'paperback_Stars')
  table.insert(PB_UTIL.dark_suits, 'paperback_Crowns')

  --- @type SMODS.Consumable
  PB_UTIL.Planet = SMODS.Consumable:extend {
    set = "Planet",
    is_dwarf = false,

    -- Since the description of all planets is the same, we just copy it from a random one
    -- The name of this planet still needs to be specified in the localization file
    process_loc_text = function(self)
      G.localization.descriptions[self.set][self.key] = {
        text = G.localization.descriptions[self.set].c_mercury.text
      }
    end,

    set_card_type_badge = function(self, card, badges)
      badges[#badges + 1] = create_badge(
        not self.is_dwarf and localize('k_planet_q') or localize('k_dwarf_planet'),
        get_type_colour(self, card),
        nil,
        1.2
      )
    end,

    -- By making this not a function, the game will use the vanilla UI generation
    generate_ui = 'Nope!'
  }
end
