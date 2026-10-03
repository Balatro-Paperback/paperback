-- Only load our breaking tag if the one from Bunco isn't loaded
if SMODS.Tags.tag_bunc_breaking then return end

SMODS.Tag {
  key = 'breaking',
  attributes = {
    'boss_blind'
  },
  atlas = 'tags_atlas',
  pos = { x = 4, y = 0 },
  discovered = false,

  apply = function(self, tag, context)
    if context.type == 'round_start_bonus' and G.GAME.blind.boss and not G.GAME.blind.disabled then
      tag:yep('+', G.C.DARK_EDITION, function()
        G.E_MANAGER:add_event(Event {
          func = function()
            G.GAME.blind:disable()
            return true
          end
        })
        return true
      end)

      tag.triggered = true
      return true
    end
  end
}
