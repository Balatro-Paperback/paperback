if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "stella_octangula",
    config = {
      extra = {
        xc = 2,
        active = true,
        used = false,
        first_star = nil
      }
    },
    attributes = {
      'xchips',
      'suit',
      'stars'
    },
    rarity = 1,
    pos = { x = 23, y = 7 },
    atlas = "jokers_atlas",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    paperback = {
      requires_custom_suits = true,
      requires_stars = true
    },
    paperback_credit = {
      coder = { 'thermo' }
    },
    unlocked = false,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xc,
          localize("paperback_Stars", 'suits_singular'),
          colours = {
            G.C.PAPERBACK_STARS_LC
          }
        }
      }
    end,

    check_for_unlock = function (self, args)
      if args.type == 'paperback_suit_flushes' then
        return G.GAME.paperback.played_flushes['paperback_Stars']
      end
    end,
    -- thanks vremade :3
    -- also this might be extremely laggy, although im not sure how it can be improved.
    -- it seems laggy on my end, although that may be Linux's LOVE2D, since everything
    -- seems a bit slower when not using Proton
    calculate = function(self, card, context)
      -- vremade puts the photograph face checker in individual,
      -- which means it searches every card every time. this may be faster?
      if context.initial_scoring_step and not card.ability.extra.used then
        card.ability.extra.active = true
        card.ability.extra.used = false
        card.ability.extra.first_star = nil
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:is_suit("paperback_Stars") then
            card.ability.extra.first_star = context.scoring_hand[i]
            break
          end
        end
      end
      if card.ability.extra.active and context.individual and context.cardarea == G.play and card.ability.extra.first_star then
        if context.other_card == card.ability.extra.first_star then
          card.ability.extra.used = true
          return {
            xchips = card.ability.extra.xc
          }
        end
      end
      if context.end_of_round and context.main_eval and card.ability.extra.active and card.ability.extra.used then
        card.ability.extra.active = false
        card.ability.extra.used = false
      end
    end
  }
end
