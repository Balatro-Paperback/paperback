SMODS.Blind {
  key = 'coda',
  boss = {
    min = 1,
  },
  attributes = {
    'position'
  },
  boss_colour = HEX('bea5c4'),
  atlas = 'music_blinds_atlas',
  pos = { y = 1 },
}

PB_UTIL.add_drag_condition("coda_blind", function(card)
  if card.is and type(card.is) == "function" and card:is(Card)
  and G and G.GAME and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled
  and G.GAME.blind.name == 'bl_paperback_coda' then
    return true
  end
end)
