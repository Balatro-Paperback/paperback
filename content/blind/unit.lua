SMODS.Blind {
  key = "unit",
  boss = { min = 2 },
  boss_colour = HEX("5f5b91"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 20 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and not SMODS.has_no_rank(context.debuff_card) then
      local rank = tonumber(context.debuff_card.base.value)
      if rank then
        local prime = true
        for i = 2, rank ^ 0.5 do
          if rank % i == 0 then
            prime = false
            break
          end
        end
        if prime then return { debuff = true } end
      end
    end
  end
}
