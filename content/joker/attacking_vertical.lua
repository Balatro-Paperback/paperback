SMODS.Joker {
    key = "attacking_vertical",
    config = {
        extra = {
            ranks = {9, 5},
            xm = 1.25,
            change = 0.25
        }
    },
    pools = {
        Music = true
    },
    rarity = 3,
    pos = { x = 8, y = 11 },
    atlas = "jokers_atlas",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    paperback_credit = {
        coder = { 'thermo' }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ranks[1],
                card.ability.extra.ranks[2],
                card.ability.extra.xm,
                card.ability.extra.change
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == card.ability.extra.ranks[1] or context.other_card:get_id() == card.ability.extra.ranks[2] then
                return {
                    xmult = card.ability.extra.xm
                }
            end
        end
        if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
            card.ability.extra.xm = card.ability.extra.xm + card.ability.extra.change
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end
}
