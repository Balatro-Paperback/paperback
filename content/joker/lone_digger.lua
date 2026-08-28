SMODS.Joker {
  key = "lone_digger",
  attributes = {
    'retrigger',
    'face',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 18, y = 3 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
      local face_count, card_count = 0, 0
      for _, c in ipairs(context.scoring_hand) do
        if c:is_face() then face_count = face_count + 1 end
        card_count = card_count + 1
      end
      if face_count == 1 then
        return {
          repetitions = card_count
        }
      end
    end
  end
}
