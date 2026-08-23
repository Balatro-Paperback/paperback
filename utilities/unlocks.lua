-- Hook into global calculate to keep unlock conditions organized
local paperback_calculate_ref = SMODS.current_mod.calculate
SMODS.current_mod.calculate = function(self, context)
	paperback_calculate_ref(self, context)

	if context.remove_playing_cards then
		for _, v in ipairs(context.removed or {}) do
			-- Power Surge unlock
			if PB_UTIL.is_rank(v, 7) and SMODS.has_enhancement(v, 'm_steel') then
				check_for_unlock({ type = 'paperback_destroyed_steel_7' })
			end
		end
		check_for_unlock({ type = 'paperback_removed_playing_cards' })
	end
end