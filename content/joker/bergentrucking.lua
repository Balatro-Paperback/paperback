SMODS.Joker {
  key = "bergentrucking",
  config = {
    extra = {
      upgrade = "perma_x_mult",
      a_x_mult = 0.05,
      suit = 'paperback_Crowns',
      destroy_suit = 'Hearts',
      active = { suit = false, destroy_suit = false },
      spillage = 3
    }
  },
  attributes = {
    'red',
    'xmult',
    'modify_card',
    'perma_bonus',
    'suit',
    'hearts',
    'crowns'
  },
  rarity = 3,
  pos = { x = 23, y = 4 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'ThermoDyn' }
  },
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.a_x_mult,
        localize(card.ability.extra.destroy_suit, 'suits_singular'),
        localize(card.ability.extra.destroy_suit, 'suits_plural')
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint_card and context.paperback and context.paperback.destroyed_joker and not (card == context.paperback.destroyed_joker) and not (context.paperback.destroyed_joker.config.center.paperback and context.paperback.destroyed_joker.config.center.paperback.addon) then
      if context.paperback.destroyed_joker.config.center.key == "j_paperback_lager" then
        -- Just Queen of Swords it
        local ref = card.ability.extra.suit
        local targets = {}
        local possible_targets = {}
        -- Collect the possible targets
        for _, c in ipairs(G.playing_cards) do
          if not SMODS.has_no_suit(c) and c.base.suit ~= ref then
            table.insert(possible_targets, c)
          end
        end

        local shake_deck = false
        while #targets < card.ability.extra.spillage and #possible_targets > 0 do
          local target = pseudorandom_element(possible_targets, pseudoseed('j_paperback_bergentrucking'))
          table.insert(targets, target)
          if target.area == G.deck then
            shake_deck = true
          end
          -- Get rid of possible targets with the same suit as chosen `target`
          for i = #possible_targets, 1, -1 do
            if possible_targets[i].base.suit == target.base.suit then
              table.remove(possible_targets, i)
            end
          end
        end
        for _, v in ipairs(targets) do
          v:juice_up()
          assert(SMODS.change_base(v, ref))
        end
        if shake_deck then G.deck.cards[1]:juice_up() end
        return {
          message = localize('k_drank_ex')
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit(card.ability.extra.suit) then
        card.ability.extra.active.suit = true
      end
      if context.other_card:is_suit(card.ability.extra.destroy_suit) then
        card.ability.extra.active.destroy_suit = true
      end
    end

    if context.joker_main and card.ability.extra.active.suit and card.ability.extra.active.destroy_suit then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card:is_suit(card.ability.extra.suit) then
          scoring_card.ability[card.ability.extra.upgrade] = (scoring_card.ability[card.ability.extra.upgrade] or 1) +
              card.ability.extra.a_x_mult
        end
      end
      return {
        message = localize('k_upgrade_ex')
      }
    end

    if context.destroy_card and context.cardarea == G.play and (card.ability.extra.active.suit and card.ability.extra.active.destroy_suit) then
      if context.destroy_card:is_suit(card.ability.extra.destroy_suit) then
        return {
          remove = true
        }
      end
    end

    if context.after then
      card.ability.extra.active = { suit = false, destroy_suit = false }
    end
  end
}
