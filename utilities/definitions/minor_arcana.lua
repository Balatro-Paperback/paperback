PB_UTIL.ENABLED_MINOR_ARCANA = {
  "ace_of_cups",
  "two_of_cups",
  "three_of_cups",
  "four_of_cups",
  "five_of_cups",
  "six_of_cups",
  "seven_of_cups",
  "eight_of_cups",
  "nine_of_cups",
  "ten_of_cups",
  "page_of_cups",
  "knight_of_cups",
  "queen_of_cups",
  "king_of_cups", -- CUPS
  "ace_of_wands",
  "two_of_wands",
  "three_of_wands",
  "four_of_wands",
  "five_of_wands",
  "six_of_wands",
  "seven_of_wands",
  "eight_of_wands",
  "nine_of_wands",
  "ten_of_wands",
  "page_of_wands",
  "knight_of_wands",
  "queen_of_wands",
  "king_of_wands", -- WANDS
  "ace_of_swords",
  "two_of_swords",
  "three_of_swords",
  "four_of_swords",
  "five_of_swords",
  "six_of_swords",
  "seven_of_swords",
  "eight_of_swords",
  "nine_of_swords",
  "ten_of_swords",
  "page_of_swords",
  "knight_of_swords",
  "queen_of_swords",
  "king_of_swords", -- SWORDS
  "ace_of_pentacles",
  "two_of_pentacles",
  "three_of_pentacles",
  "four_of_pentacles",
  "five_of_pentacles",
  "six_of_pentacles",
  "seven_of_pentacles",
  "eight_of_pentacles",
  "nine_of_pentacles",
  "ten_of_pentacles",
  "page_of_pentacles",
  "knight_of_pentacles",
  "queen_of_pentacles",
  "king_of_pentacles", -- PENTACLES
}

PB_UTIL.ENABLED_MINOR_ARCANA_BOOSTERS = {
  'minor_arcana_normal_1',
  'minor_arcana_normal_2',
  'minor_arcana_normal_3',
  'minor_arcana_normal_4',
  'minor_arcana_jumbo_1',
  'minor_arcana_jumbo_2',
  'minor_arcana_mega',
  'minor_arcana_mega_2',
}

if PB_UTIL.config.minor_arcana_enabled then
  --- @type SMODS.Consumable
  PB_UTIL.MinorArcana = SMODS.Consumable:extend {
    set = 'paperback_minor_arcana',
    unlocked = true,
    discovered = false,
    paperback_credit = {
    },

    loc_vars = function(self, info_queue, card)
      if not self.config then return end

      if card.ability.paperclip then
        info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip(card.ability.paperclip)

        return {
          vars = {
            card.ability.max_highlighted
          }
        }
      elseif card.ability.mod_conv then
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]

        return {
          vars = {
            card.ability.max_highlighted,
            localize {
              type = 'name_text',
              set = 'Enhanced',
              key = card.ability.mod_conv
            }
          }
        }
      elseif card.ability.suit_conv then
        return {
          vars = {
            card.ability.max_highlighted,
            localize(card.ability.suit_conv, 'suits_plural'),
            colours = {
              G.C.SUITS[card.ability.suit_conv]
            }
          }
        }
      end
    end,

    use = function(self, card, area)
      if not self.config then return end

      if card.ability.paperclip or card.ability.mod_conv or card.ability.suit_conv then
        PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
          for _, v in ipairs(G.hand.highlighted) do
            if card.ability.paperclip then
              PB_UTIL.set_paperclip(v, card.ability.paperclip)
            elseif card.ability.mod_conv then
              v:set_ability(G.P_CENTERS[card.ability.mod_conv])
            else
              SMODS.change_base(v, card.ability.suit_conv)
            end
          end
        end)
      end
    end
  }

  PB_UTIL.MinorArcanaBooster = SMODS.Booster:extend {
    group_key = 'paperback_minor_arcana_pack',
    kind = 'paperback_minor_arcana',
    draw_hand = true,
    paperback_credit = {
      composer = { 'larantula' },
    },

    loc_vars = function(self, info_queue, card)
      local orig = SMODS.Booster.loc_vars(self, info_queue, card)
      -- Removes the underscore with a digit at the end of a key if it exists,
      -- allowing us to make only one localization entry per type
      orig['key'] = self.key:gsub('_%d$', '')
      return orig
    end,

    create_card = function(self, card, i)
      return {
        set = 'paperback_minor_arcana',
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true -- Allow creating Apostle cards
      }
    end,

    ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, G.C.PAPERBACK_MINOR_ARCANA)
      ease_background_colour { new_colour = G.C.PAPERBACK_MINOR_ARCANA, special_colour = G.C.BLACK, contrast = 2 }
    end,
  }
end
