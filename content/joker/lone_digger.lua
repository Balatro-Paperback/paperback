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
  unlocked = false,
  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local photo = false
      local chad = false
      for _, v in ipairs(G.jokers.cards) do
        if v.config.center_key == "j_photograph" then photo = true end
        if v.config.center_key == "j_hanging_chad" then chad = true end
      end
      return photo and chad
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    local other_other_name = localize('k_unknown')
    if G.P_CENTERS['j_photograph'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_photograph' }
    end
    if G.P_CENTERS['j_hanging_chad'].unlocked then
      other_other_name = localize { type = 'name_text', set = 'Joker', key = 'j_hanging_chad' }
    end
    return {
      vars = {
        other_name, other_other_name
      }
    }
  end,
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
