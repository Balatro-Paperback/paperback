-- Credits in our mod UI
PB_UTIL.credits = {
  artists = {
    color = G.C.MULT,
    entries = {
      'PaperMoon',
      '「S_C_R_U_B_Y」',
      'Firch',
      'Fennex',
      "MaveBoy",
      'Dylan Hall',
      "Ari",
      "ThermoDyn",
    }
  },
  developers = {
    color = G.C.GREEN,
    entries = {
      'OppositeWolf770, srockw, Nether, B, ejwu2, metanite64, Dowfrin',
      'InfinityPlus05, aliahmed2k03, ThermoDyn'
    }
  },
  localization = {
    color = G.C.FILTER,
    entries = {
      'pinkmaggit-hub & Riosodu (pt-BR)',
      'mathieulievre (FR)',
      'BurAndBY & Tauookie (RU)',
      'Ethylene (zh_CN)',
      'Marffe (es_ES & es_419)',
    }
  },
  music = {
    color = G.C.PURPLE,
    entries = {
      'Larantula'
    }
  }
}

-- By Eremel from Stocking Stuffer's PotatoPatch utils
PB_UTIL.CREDITS = {}

PB_UTIL.CREDITS.generate_string = function(developers, prefix)
  if type(developers) ~= 'table' then return end

  local amount = #developers
  local credit_string = {
    n = G.UIT.R,
    config = { align = 'tm' },
    nodes = {
      { n = G.UIT.R, config = { align = 'cm' }, nodes = { { n = G.UIT.T, config = { text = localize(prefix), shadow = true, colour = G.C.UI.BACKGROUND_WHITE, scale = 0.27 } } } }
    }
  }

  for i, name in ipairs(developers) do
    local target_row = math.ceil(i / 3)
    local dev = PB_UTIL.Developers[name] or {}
    if target_row > #credit_string.nodes then
      table.insert(credit_string.nodes,
        { n = G.UIT.R, config = { align = 'cm' }, nodes = {} })
    end
    table.insert(credit_string.nodes[target_row].nodes, {
      n = G.UIT.O,
      config = {
        object = DynaText({
          string = dev.loc and localize(dev.loc) or dev.name or name,
          colours = { dev and dev.colour or G.C.UI.BACKGROUND_WHITE },
          scale = 0.27,
          silent = true,
          shadow = true,
          y_offset = -0.6,
        })
      }
    })
    if i < amount then
      table.insert(credit_string.nodes[target_row].nodes,
        { n = G.UIT.T, config = { text = localize(i + 1 == amount and 'paperback_and_spacer' or 'paperback_comma_spacer'), shadow = true, colour = G.C.UI.BACKGROUND_WHITE, scale = 0.27 } })
    end
  end

  return credit_string
end

local card_popup_ref = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
  local ret_val = card_popup_ref(card)

  if PB_UTIL.config.show_credits then
    local obj = card.config.center and card.config.center.paperback_credit
    local target = ret_val.nodes[1].nodes[1].nodes[1].nodes
    local owned = function(card)
      if next(SMODS.find_card(card.config.center.key, true)) then
        if PB_UTIL.find(SMODS.find_card(card.config.center.key), card) then
          return true
        end
      end
      return false
    end


    if obj then
      if (not obj.hidden) or
      (obj.hidden and owned(card)) then
        if obj.artist then
          local str = PB_UTIL.CREDITS.generate_string(obj.artist, 'paperback_art_credit')
          if str then
            table.insert(target, str)
          end
        else
          local str = PB_UTIL.CREDITS.generate_string({ 'papermoonqueen' }, 'paperback_art_credit')
          if str then
            table.insert(target, str)
          end
        end
        if obj.coder then
          local str = PB_UTIL.CREDITS.generate_string(obj.coder, 'paperback_code_credit')
          if str then
            table.insert(target, str)
          end
        end
        if obj.composer then
          local str = PB_UTIL.CREDITS.generate_string(obj.composer, 'paperback_music_credit')
          if str then
            table.insert(target, str)
          end
        end
      end
    end
  end
  return ret_val
end

PB_UTIL.Developers = { internal_count = 0 }
PB_UTIL.Developer = Object:extend()
function PB_UTIL.Developer:init(args)
  self.name = args.name
  self.colour = args.colour
  self.loc = args.loc and type(args.loc) == 'boolean' and 'paperback_dev_' .. args.name or args.loc

  PB_UTIL.Developers[args.name] = self
  PB_UTIL.Developers.internal_count = PB_UTIL.Developers.internal_count + 1
end

--[[

                    TEMPLATE FOR DEVELOPER OBJECT
PB_UTIL.Developer({
  name = 'name',
  loc = true,
  colour = HEX('F9FFE3')
})

]]


-- Programmers

PB_UTIL.Developer({
  name = 'srockw',
  loc = true,
  colour = HEX('eea858')
})

PB_UTIL.Developer({
  name = 'oppositewolf',
  loc = true,
})

PB_UTIL.Developer({
  name = 'b',
  loc = true,
})

PB_UTIL.Developer({
  name = 'dowfrin',
  loc = true,
  colour = HEX('888A85')
})

PB_UTIL.Developer({
  name = 'infinityplus',
  loc = true,
  colour = HEX('5a9cef')
})

PB_UTIL.Developer({
  name = 'thermo',
  loc = true,
  colour = HEX('fde56c')
})

PB_UTIL.Developer({
  name = 'aa7',
  loc = true,
  colour = HEX('FFAC33')
})

PB_UTIL.Developer({
  name = 'vitellary',
  loc = true,
  colour = HEX('d9c44d')
})

PB_UTIL.Developer({
  name = 'metanite',
  loc = true,
  colour = HEX('f399ff')
})

PB_UTIL.Developer({
  name = 'ejwu',
  loc = true,
})

-- Artists

PB_UTIL.Developer({
  name = 'papermoonqueen',
  loc = true,
  colour = G.C.PAPERBACK_MINOR_ARCANA
})

PB_UTIL.Developer({
  name = 'shizi',
  loc = true,
  colour = HEX('EBC833')
})

PB_UTIL.Developer({
  name = 'dylan_hall',
  loc = true,
  colour = HEX('6e2b82')
})

PB_UTIL.Developer({
  name = 'scruby',
  loc = true,
})

PB_UTIL.Developer({
  name = 'ari',
  loc = true,
  colour = HEX('FF66D9')
})

-- Composers

PB_UTIL.Developer({
  name = 'larantula',
  loc = true,
  colour = HEX('5EE5AF')
})
