PB_UTIL.ENABLED_TICKETS = {
  "the_pyramids",
  "eiffel_tower",
  "todai_ji",
  "palacio_de_bellas_artes",
}

PB_UTIL.ENABLED_TICKET_BOOSTERS = {
  "travel_pack_normal_1"
}

if PB_UTIL.config.tickets_enabled then
  PB_UTIL.TICKET_GRADIENT = SMODS.Gradient {
    key = "wonder_header",
    colours = {
      lighten(G.C.GREY, 0.15),
      G.C.PALE_GREEN,
    },
    cycle = 4
  }

  --- @type SMODS.Consumable
  PB_UTIL.Ticket = SMODS.Consumable:extend {
    set = "paperback_ticket_to_ride",
    config = { extra = {} },
    pos = { 6, 0 },
    -- Tickets should override this to define the atlas positions for each stage besides the first one
    stages = {
      { x = 6, y = 0 },
      { x = 6, y = 0 },
      { x = 6, y = 0 }
    },

    -- Cannot be used by default, but tickets can override if needed
    can_use = function(self, card)
      return false
    end,

    -- Initialize the generic config that all tickets should have
    -- Rather than overriding this, tickets should define a `ticket_set_ability` function
    set_ability = function(self, card, initial, delay_sprites)
      card.ability.extra.ticket = { stage = 0, completed = {} }

      for i, _ in ipairs(self.stages) do
        card.ability.extra.ticket.completed[i] = false
      end

      -- Tickets don't take any space
      card.ability.card_limit = 1

      if self.ticket_set_ability then
        G.E_MANAGER:add_event(Event {
          blockable = false,
          func = function()
            self:ticket_set_ability(card, initial, delay_sprites)
            return true
          end
        })
      end
    end,

    -- When called, goes to the next stage, updating the sprite and showing a message
    ---@param self SMODS.Consumable
    ---@param card Card
    ---@param index number which stage was completed
    ---@param skip_message boolean
    ---@param immediate boolean
    complete_stage = function(self, card, index, skip_message, immediate)
      if card.ability.extra.ticket.completed[index] then return end

      card.ability.extra.ticket.completed[index] = true
      card.ability.extra.ticket.stage = card.ability.extra.ticket.stage + 1

      -- Updates the highest reached stage for this ticket
      -- which is used to decide which sprite to show in the collection
      local key = self.key .. "_highest"
      local value = math.max(PB_UTIL.get_profile_value(key, 0), card.ability.extra.ticket.stage)
      PB_UTIL.save_profile_value(key, value)

      local stage_func = function()
        -- Only update the sprites of card that aren't in the collection
        if card.added_to_deck or not card.area.config.collection then
          card.children.center:set_sprite_pos(self.stages[card.ability.extra.ticket.stage])
        end

        if not skip_message then
          SMODS.calculate_effect({
            message = localize('paperback_stage_completed'),
            colour = G.C.GOLD,
            instant = true
          }, card)
        end

        if self.ticket_complete_all then
          local all_complete = true
          for _, v in ipairs(card.ability.extra.ticket.completed) do
            if not v then
              all_complete = false
              break
            end
          end

          if all_complete then
            self:ticket_complete_all(card)
          end
        end
      end

      if immediate then
        stage_func()
      else
        G.E_MANAGER:add_event(Event {
          blockable = false,
          func = function()
            stage_func()
            return true
          end
        })
      end
    end,

    -- Set the right sprite when created or loaded
    set_sprites = function(self, card, front)
      if card.ability and card.ability.extra.ticket and card.ability.extra.ticket.stage then
        local stage = card.ability.extra.ticket.stage
        if stage > 0 then
          card.children.center:set_sprite_pos(self.stages[stage])
        end
      end

      -- Set the sprite in the collection
      G.E_MANAGER:add_event(Event {
        blockable = false,
        func = function()
          if card.area and card.area.config.collection then
            local highest = PB_UTIL.get_profile_value(self.key .. "_highest", 0)
            if highest > 0 then
              card.children.center:set_sprite_pos(self.stages[highest])
            end
          end
          return true
        end
      })
    end,

    -- Remove duplicates
    add_to_deck = function(self, card, from_debuff)
      for _, v in ipairs(G.consumeables.cards) do
        if v.config.center.key == card.config.center.key and v ~= card then
          -- Destroy the newly added ticket
          card.paperback_no_destroy_calc = true
          SMODS.destroy_cards(card)

          -- Show a message on the already held ticket
          SMODS.calculate_effect({
            message = localize('paperback_no_duplicates_ex'),
            colour = G.C.MULT
          }, v)
          break
        end
      end
    end,

    -- Tickets should define a `ticket_loc_vars` rather than override this
    loc_vars = function(self, info_queue, card)
      local vars = self.ticket_loc_vars and self:ticket_loc_vars(info_queue, card) or {}
      vars.box_ends = {}

      for i, completed in ipairs(card.ability.extra.ticket.completed) do
        if completed then
          vars.box_ends[i] = {
            {
              n = G.UIT.R,
              config = { padding = 0.04 },
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = localize('paperback_stage_completed'),
                    colour = G.C.GREEN,
                    scale = 0.24
                  }
                }
              }
            }
          }
        end
      end

      return vars
    end,

    -- Obfuscate the name depending on the current stage
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
      local stage = (card.area and card.area.config.collection)
          and PB_UTIL.get_profile_value(self.key .. "_highest", 0)
          or card.ability.extra.ticket.stage
      local original_name = G.localization.descriptions[self.set][self.key].name

      if stage < #self.stages then
        local name = G.localization.descriptions[self.set][self.key].obfuscated_names[stage + 1]
        G.localization.descriptions[self.set][self.key].name = name
        G.localization.descriptions[self.set][self.key].name_parsed = nil
      end

      SMODS.Consumable.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
      G.localization.descriptions[self.set][self.key].name = original_name
      G.localization.descriptions[self.set][self.key].name_parsed = nil
    end,

    -- Show the stage cycling tooltip
    set_badges = function(self, card, badges)
      table.insert(badges, 1, {
        n = G.UIT.R,
        config = { align = 'cm', padding = 0.03 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = 'cm' },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = localize('paperback_ui_ticket_cycle_help'),
                  scale = 0.26,
                  colour = G.C.UI.TEXT_LIGHT
                }
              }
            }
          },
        }
      })
    end,

    paperback_filter_multi_box = function(self, card, i)
      return i == (card.paperback_multi_box_focus or 1)
    end,
  }

  -- Stage cycling UI
  local function try_cycle_stage(direction)
    local hovered = G.CONTROLLER.hovering.target
    if not hovered or not Object.is(hovered, Card) then return end
    if not hovered.ability or hovered.ability.set ~= "paperback_ticket_to_ride" then return end

    local total = #hovered.config.center.stages
    hovered.paperback_multi_box_focus = (hovered.paperback_multi_box_focus or 1) + direction

    if hovered.paperback_multi_box_focus < 1 then
      hovered.paperback_multi_box_focus = total
    elseif hovered.paperback_multi_box_focus > total then
      hovered.paperback_multi_box_focus = 1
    end

    hovered:stop_hover()
    hovered:hover()
  end

  SMODS.Keybind {
    key_pressed = "left",
    action = function(self)
      try_cycle_stage(-1)
    end
  }

  SMODS.Keybind {
    key_pressed = "right",
    action = function(self)
      try_cycle_stage(1)
    end
  }

  PB_UTIL.TicketPack = SMODS.Booster:extend {
    group_key = 'paperback_ticket_pack',
    kind = 'paperback_ticket_to_ride',
    draw_hand = false,
    select_card = 'consumeables',

    loc_vars = function(self, info_queue, card)
      local orig = SMODS.Booster.loc_vars(self, info_queue, card)

      -- Removes the underscore with a digit at the end of a key if it exists,
      -- allowing us to make only one localization entry per type
      orig.key = self.key:gsub('_%d$', '')

      -- Add the information about tickets to ride
      info_queue[#info_queue + 1] = { set = "Other", key = "paperback_ticket_info" }

      return orig
    end,

    create_card = function(self, card, i)
      return {
        set = 'paperback_ticket_to_ride',
        area = G.pack_cards,
        skip_materialize = true,
      }
    end,

    ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, G.C.PALE_GREEN)
      ease_background_colour { new_colour = G.C.PAPERBACK_TICKET, special_colour = G.C.BLACK, contrast = 2 }
    end,
  }
end
