SMODS.Joker {
    key = "coin_collection",
    config = {
        extra = {
            dollars = 1
        }
    },
    rarity = 1,
    pos = { x = 7, y = 11 },
    atlas = "jokers_atlas",
    cost = 6,
    -- it would be a lot of work to make it blueprint compatible
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    paperback_credit = {
        coder = { 'thermo' }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
}
