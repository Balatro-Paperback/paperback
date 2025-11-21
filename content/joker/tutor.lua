SMODS.Joker {
  key = "tutor",
  rarity = 1,
  pos = { x = 4, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
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
