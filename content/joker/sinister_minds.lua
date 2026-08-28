SMODS.Joker {
  key = "sinister_minds",
  config = {
    extra = {
      retriggers = 1,
      a_retriggers = 1,
      required_spectrals = 1,
      hand = 'Pair',
      spectrals_left = 1
    }
  },
  attributes = {
    'retrigger',
    'spectral',
    'hand_type',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 0, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.retriggers,
        card.ability.extra.retriggers == 1 and "" or "s",
        card.ability.extra.a_retriggers,
        card.ability.extra.required_spectrals,
        localize('k_spectral'),
        card.ability.extra.required_spectrals == 1 and "" or "s",
        localize(card.ability.extra.hand, 'poker_hands'),
        card.ability.extra.spectrals_left
      }
    }
  end,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.scoring_name == card.ability.extra.hand then
      return {
        repetitions = card.ability.extra.retriggers
      }
    end
    if not context.blueprint_card and context.using_consumeable and context.consumeable.ability.set == 'Spectral' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'spectrals_left',
        scalar_value = 'a_retriggers',
        operation = '-',
        no_message = true
      })

      if card.ability.extra.spectrals_left == 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'retriggers',
          scalar_value = 'a_retriggers',
          message_colour = G.C.ORANGE
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'required_spectrals',
          scalar_value = 'a_retriggers',
          no_message = true
        })
        card.ability.extra.spectrals_left = card.ability.extra.required_spectrals
        return nil, true
      end
    end
  end
}
