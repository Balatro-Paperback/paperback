SMODS.Joker {
  key = "tutor",
  rarity = 1,
  attributes = {
    'chips',
    'rank',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten'
  },
  pos = { x = 4, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'dowfrin' }
  },
  unlocked = false,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 10 } }
  end,

  check_for_unlock = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      local id = v:get_id()
      if (2 <= id and id <= 10) and (v.ability.perma_bonus >= 10) then
        return true
      end
    end
    return false
  end,
}
local get_chip_bonus_ref = Card.get_chip_bonus
function Card.get_chip_bonus(self)
  local res = get_chip_bonus_ref(self)
  local cnt = #SMODS.find_card('j_paperback_tutor', false)
  if cnt > 0 then
    local id = self:get_id()
    if 2 <= id and id <= 10 then
      res = res * math.pow(2, cnt)
    end
  end
  return res
end
