-- Create config UI
SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = 'cm', minh = 1 },
        nodes = {
          {
            n = G.UIT.T,
            config = {
              text = localize('paperback_ui_requires_restart'),
              colour = G.C.RED,
              scale = 0.5
            }
          }
        }
      },
      {
        n = G.UIT.R,
        config = { align = 'cm' },
        nodes = {
          {
            n = G.UIT.C,
            nodes = {
              create_toggle {
                label = localize('paperback_ui_enable_tags'),
                ref_table = PB_UTIL.config,
                ref_value = 'tags_enabled'
              },
              create_toggle {
                label = localize('paperback_ui_enable_blinds'),
                ref_table = PB_UTIL.config,
                ref_value = 'blinds_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_enable_vouchers'),
                ref_table = PB_UTIL.config,
                ref_value = 'vouchers_enabled'
              },
              create_toggle {
                label = localize('paperback_ui_enable_paperclips'),
                ref_table = PB_UTIL.config,
                ref_value = 'paperclips_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_enable_ranks'),
                ref_table = PB_UTIL.config,
                ref_value = 'ranks_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_enable_ego_gifts'),
                ref_table = PB_UTIL.config,
                ref_value = 'ego_gifts_enabled',
              }
            }
          },
          {
            n = G.UIT.C,
            nodes = {
              create_toggle {
                label = localize('paperback_ui_enable_editions'),
                ref_table = PB_UTIL.config,
                ref_value = 'editions_enabled'
              },
              create_toggle {
                label = localize('paperback_ui_enable_enhancements'),
                ref_table = PB_UTIL.config,
                ref_value = 'enhancements_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_enable_minor_arcana'),
                ref_table = PB_UTIL.config,
                ref_value = 'minor_arcana_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_custom_suits_enabled'),
                ref_table = PB_UTIL.config,
                ref_value = 'suits_enabled',
              },
              create_toggle {
                label = localize('paperback_ui_enable_spectrals'),
                ref_table = PB_UTIL.config,
                ref_value = 'spectrals_enabled'
              }
            }
          }
        }
      },
      {
        n = G.UIT.R,
        config = { align = 'cm', minh = 1 },
        nodes = {
          {
            n = G.UIT.T,
            config = {
              text = localize('paperback_ui_no_requires_restart'),
              colour = G.C.GREEN,
              scale = 0.5
            }
          }
        }
      },
      {
        n = G.UIT.R,
        config = { align = 'cm' },
        nodes = {
          {
            n = G.UIT.C,
            nodes = {
              create_toggle {
                label = localize('paperback_ui_plague_doctor_quotes'),
                ref_table = PB_UTIL.config,
                ref_value = 'plague_doctor_quotes_enabled'
              },
            }
          }
        }
      }
    }
  }
end

-- Create Credits tab in our mod UI
SMODS.current_mod.extra_tabs = function()
  local result = {}

  for k, v in pairs(PB_UTIL.credits) do
    local parsed = {}

    for _, entry in ipairs(v.entries) do
      parsed[#parsed + 1] = {
        n = G.UIT.R,
        config = { align = 'cm', minh = 0.25 },
        nodes = {
          { n = G.UIT.T, config = { text = entry, colour = v.color, scale = 0.4 } }
        }
      }
    end

    result[k] = parsed
  end

  local credits_tab = {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      {
        n = G.UIT.R,
        nodes = {
          {
            n = G.UIT.C,
            config = { padding = 0.5 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cm' },
                nodes = {
                  { n = G.UIT.T, config = { text = localize('paperback_ui_artists'), colour = G.C.CHIPS, scale = 0.75 } },
                }
              },
              unpack(result.artists)
            }
          },
          {
            n = G.UIT.C,
            config = { padding = 0.5 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cm' },
                nodes = {
                  { n = G.UIT.T, config = { text = localize('paperback_ui_localization'), colour = G.C.CHIPS, scale = 0.75 } },
                }
              },
              unpack(result.localization)
            }
          },
          {
            n = G.UIT.C,
            config = { padding = 0.5 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cm' },
                nodes = {
                  { n = G.UIT.T, config = { text = localize('b_music'), colour = G.C.CHIPS, scale = 0.75 } }
                }
              },
              unpack(result.music)
            }
          }
        }
      },
      {
        n = G.UIT.R,
        nodes = {
          {
            n = G.UIT.C,
            config = { padding = 0.5 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = 'cm' },
                nodes = {
                  { n = G.UIT.T, config = { text = localize('paperback_ui_developers'), colour = G.C.CHIPS, scale = 0.75 } },
                }
              },
              unpack(result.developers)
            }
          }
        }
      }
    }
  }

  return {
    {
      label = localize('b_credits'),
      tab_definition_function = function()
        return credits_tab
      end
    }
  }
end

-- Create collection entry for Paperclips
if PB_UTIL.config.paperclips_enabled then
  SMODS.current_mod.custom_collection_tabs = function()
    return {
      UIBox_button({
        button = 'your_collection_paperback_paperclips',
        id = 'your_collection_paperback_paperclips',
        label = { localize('paperback_ui_paperclips') },
        minw = 5,
        minh = 1
      })
    }
  end

  local function paperclips_ui()
    local paperclips = {}

    for k, v in pairs(SMODS.Stickers) do
      if PB_UTIL.is_paperclip(k) then
        paperclips[k] = v
      end
    end

    return SMODS.card_collection_UIBox(paperclips, { 5, 5 }, {
      snap_back = true,
      hide_single_page = true,
      collapse_single_page = true,
      center = 'c_base',
      h_mod = 1.18,
      back_func = 'your_collection_other_gameobjects',
      modify_card = function(card, center)
        card.ignore_pinned = true
        center:apply(card, true)
      end,
    })
  end

  G.FUNCS.your_collection_paperback_paperclips = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
      definition = paperclips_ui()
    }
  end

  local function wrap_without_paperclips(func)
    -- Remove our paperclips from SMODS.Stickers just for this function call
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
      if PB_UTIL.is_paperclip(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
      end
    end

    local ret = func()

    -- Add them back once the UI was created
    for k, v in pairs(removed) do
      SMODS.Stickers[k] = v
    end

    return ret
  end

  -- Override the creation of the 'Stickers' tab in the collection
  local stickers_ui_ref = create_UIBox_your_collection_stickers
  create_UIBox_your_collection_stickers = function()
    return wrap_without_paperclips(stickers_ui_ref)
  end

  -- Override the creation of the 'Stickers' tab in our 'Additions' tab
  local other_objects_ref = create_UIBox_Other_GameObjects
  create_UIBox_Other_GameObjects = function()
    return wrap_without_paperclips(other_objects_ref)
  end
end

-- Returns a table that can be inserted into info_queue to show all suits of the provided type
--- @param type 'light' | 'dark'
--- @return table
function PB_UTIL.suit_tooltip(type)
  local suits = type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits
  local key = 'paperback_' .. type .. '_suits'
  local colours = {}

  -- If any modded suits were loaded, we need to dynamically
  -- add them to the localization table
  if #suits > 2 then
    local text = {}
    local line = ""
    local text_parsed = {}

    for i = 1, #suits do
      local suit = suits[i]

      colours[#colours + 1] = G.C.SUITS[suit] or G.C.IMPORTANT
      line = line .. "{V:" .. i .. "}" .. localize(suit, 'suits_plural') .. "{}"

      if i < #suits then
        line = line .. ", "
      end

      if #line > 30 then
        text[#text + 1] = line
        line = ""
      end
    end

    if #line > 0 then
      text[#text + 1] = line
    end

    for _, v in ipairs(text) do
      text_parsed[#text_parsed + 1] = loc_parse_string(v)
    end

    G.localization.descriptions.Other[key].text = text
    G.localization.descriptions.Other[key].text_parsed = text_parsed
  end

  return {
    set = 'Other',
    key = key,
    vars = {
      colours = colours
    }
  }
end

--- @param type Paperclip
--- @return table | nil
function PB_UTIL.paperclip_tooltip(type)
  local key = 'paperback_' .. type .. '_clip'
  local paperclip = SMODS.Stickers[key]
  local vars = {}

  -- This may be the case if the paperclip was disabled by the user
  if not paperclip then return end

  if paperclip.loc_vars then
    local dummy_card = { ability = {} }
    paperclip:apply(dummy_card, true)
    vars = paperclip:loc_vars({}, dummy_card).vars
  end

  return {
    set = 'Other',
    key = key,
    vars = vars
  }
end

--- @param type
--- @return table | nil
function PB_UTIL.sin_tooltip(type)
  local key = 'paperback_sin_' .. type
  local vars = PB_UTIL.EGO_GIFT_SINS[type]

  return {
    set = 'Other',
    key = key,
    vars = vars
  }
end

-- text display function for plague doctor's quotes
-- adapted from vanilla attention_text()
--- @param args table
function PB_UTIL.plague_quote(args)
  args = args or {}
  args.text = args.text or 'test'
  args.scale = args.scale or 1
  args.colour = copy_table(args.colour or G.C.WHITE)
  args.hold = (args.hold or 0) + 0.1 * (G.SPEEDFACTOR)

  args.cover_colour = copy_table(G.C.CLEAR)

  args.uibox_config = {
    align = 'cm',
    offset = args.offset or { x = 0, y = 0 },
    major = args.major or nil
  }

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0,
    blockable = false,
    blocking = true,
    func = function()
      args.AT = UIBox {
        T = { 0, 0, 0, 0 },
        definition = {
          n = G.UIT.ROOT,
          config = {
            align = 'cm',
            minw = 0.001,
            minh = 0.001,
            padding = 0.03,
            r = 0.1,
            emboss = nil,
            colour = args.cover_colour
          },
          nodes = {
            { n = G.UIT.O, config = { draw_layer = 1, object = DynaText({ scale = args.scale, string = args.text, maxw = args.maxw, colours = { args.colour }, float = true, shadow = true, silent = true, args.scale, pop_in = 0, pop_in_rate = 1, rotate = nil }) } },
          }
        },
        config = args.uibox_config
      }
      args.AT.attention_text = true
      args.text = args.AT.UIRoot.children[1].config.object
      return true
    end
  }))

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = args.hold,
    blockable = false,
    blocking = true,
    func = function()
      args.start_time = G.TIMERS.TOTAL
      args.text:pop_out(3)

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 1,
        blockable = false,
        blocking = false,
        timer = "REAL",
        func = function()
          if args.AT then args.AT:remove() end
          return true
        end
      }))
      return true
    end
  }))
end

-- Functions to create an UI for selecting a card, from All in Jest
-- Used by Apostle of Wands
function PB_UTIL.apostle_of_wands_collection_UIBox(_pool, rows, args)
  args = args or {}
  args.w_mod = args.w_mod or 1
  args.h_mod = args.h_mod or 1
  args.card_scale = args.card_scale or 1
  local deck_tables = {}
  local pool = SMODS.collection_pool(_pool)

  G.your_collection = {}
  local cards_per_page = 0
  local row_totals = {}
  for j = 1, #rows do
    if cards_per_page >= #pool and args.collapse_single_page then
      rows[j] = nil
    else
      row_totals[j] = cards_per_page
      cards_per_page = cards_per_page + rows[j]
      G.your_collection[j] = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        (args.w_mod * rows[j] + 0.25) * G.CARD_W,
        args.h_mod * G.CARD_H,
        { card_limit = rows[j], type = args.area_type or 'title', highlight_limit = 0, collection = true }
      )
      table.insert(deck_tables,
        {
          n = G.UIT.R,
          config = { align = "cm", padding = 0.07, no_fill = true },
          nodes = {
            { n = G.UIT.O, config = { object = G.your_collection[j] } }
          }
        })
    end
  end

  local options = {}
  for i = 1, math.ceil(#pool / cards_per_page) do
    table.insert(
      options,
      localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#pool / cards_per_page))
    )
  end

  G.FUNCS.paperback_card_collection_page = function(e)
    if not e or not e.cycle_config then return end
    for j = 1, #G.your_collection do
      for i = #G.your_collection[j].cards, 1, -1 do
        local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
        c:remove()
        c = nil
      end
    end
    for j = 1, #rows do
      for i = 1, rows[j] do
        local center = pool[i + row_totals[j] + (cards_per_page * (e.cycle_config.current_option - 1))]
        if not center then break end
        local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
          G.CARD_W * args.card_scale, G.CARD_H * args.card_scale, G.P_CARDS.empty,
          (args.center and G.P_CENTERS[args.center]) or center)
        if args.modify_card then args.modify_card(card, center, i, j) end
        if not args.no_materialize then card:start_materialize(nil, i > 1 or j > 1) end
        G.your_collection[j]:emplace(card)
      end
    end
    INIT_COLLECTION_CARD_ALERTS()
  end

  G.FUNCS.paperback_card_collection_page { cycle_config = { current_option = 1 } }

  local t = create_UIBox_generic_options({
    back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or 'your_collection',
    snap_back = args.snap_back,
    infotip = args.infotip,
    no_back = true,
    contents = {
      { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
      (not args.hide_single_page or cards_per_page < #pool) and {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          create_option_cycle({
            options = options,
            w = 4.5,
            cycle_shoulders = true,
            opt_callback = 'paperback_card_collection_page',
            current_option = 1,
            colour = G.C.RED,
            no_pips = true,
            focus_args = { snap_to = true, nav = 'wide' }
          })
        }
      } or nil,
    }
  })
  return t
end

G.FUNCS.paperback_select_joker = function(e)
  local c1 = e.config.ref_table

  if c1 and c1.is and type(c1.is) == "function" and c1:is(Card) then
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        G.SETTINGS.paused = false
        if G.OVERLAY_MENU ~= nil then
          G.OVERLAY_MENU:remove()
          G.OVERLAY_MENU = nil
        end

        SMODS.add_card {
          key = c1.config.center_key,
          area = e.config.data[1]
        }

        return true
      end
    }))
  end
end

function PB_UTIL.create_select_card_ui(card, area)
  local t2 = {
    n = G.UIT.ROOT,
    config = {
      ref_table = card,
      minw = 0.6,
      padding = 0.1,
      align = 'bm',
      colour = G.C.GREEN,
      shadow = true,
      r = 0.08,
      minh = 0.3,
      one_press = true,
      button = 'paperback_select_joker',
      data = { area },
      hover = true
    },
    nodes = {
      {
        n = G.UIT.T,
        config = {
          text = localize('paperback_ui_select'),
          colour = G.C.WHITE,
          scale = 0.42
        }
      }
    }
  }

  card.children.select_button = UIBox {
    definition = t2,
    config = {
      align = "bm",
      offset = { x = -0, y = -0.15 },
      major = card,
      bond = 'Weak',
      parent = card
    }
  }
end
