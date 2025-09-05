Partner_API.Partner {
  key = "virtual",
  unlocked = false,
  discovered = true,
  pos = { x = 0, y = 0 },
  atlas = "partners_atlas",
  config = { extra = { retriggers = 1, active = true } },
  link_config = { j_paperback_paranoia = 1 },

  loc_vars = function(self, info_queue, card)
    if next(SMODS.find_card("j_paperback_paranoia")) then
      return {
        vars = { card.ability.extra.retriggers * 2 }
      }
    else
      return {
        vars = { card.ability.extra.retriggers }
      }
    end
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_paperback_paranoia" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before then
      card.ability.extra.active = true
    end

    if context.repetition and context.cardarea == G.play then
      for k, v in ipairs(context.full_hand) do
        if PB_UTIL.is_suit(v, 'dark') then
          card.ability.extra.active = false
          break
        end
      end
      if PB_UTIL.is_suit(context.other_card, 'light') and card.ability.extra.active then
        card.ability.extra.active = false
        if next(SMODS.find_card("j_paperback_paranoia")) then
          return {
            repetitions = card.ability.extra.retriggers * 2,
            card = card,
            message = localize("k_again_ex"),
          }
        else
          return {
            repetitions = card.ability.extra.retriggers,
            card = card,
            message = localize("k_again_ex"),
          }
        end
      end
    end
  end
}
