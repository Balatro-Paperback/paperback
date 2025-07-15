SMODS.Blind {
  key = 'coda',
  boss = {
    min = 1,
  },
  boss_colour = HEX('bea5c4'),
  atlas = 'music_blinds_atlas',
  pos = { y = 1 },
}

local move_ref = Moveable.drag
function Moveable.drag(self, offset)
  if self.is and type(self.is) == "function" and self:is(Card) then
    if G and G.GAME and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled and G.GAME.blind.name == 'bl_paperback_coda' then
      return
    end
  end

  return move_ref(self, offset)
end
