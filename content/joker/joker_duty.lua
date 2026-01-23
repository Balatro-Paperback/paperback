SMODS.Joker {
    key = "joker_duty",
    config = {
        extra = {
            mult = 0,
            change = 3
        }
    },
    rarity = 1,
    pos = { x = 23, y = 1 },
    atlas = "jokers_atlas",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    paperback_credit = {
        coder = { 'thermo' }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.change,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if G.GAME.current_round.discards_left == G.GAME.current_round.hands_left then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.change
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.ORANGE
                }
            end
        end
    end
}
