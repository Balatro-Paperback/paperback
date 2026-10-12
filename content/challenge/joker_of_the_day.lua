SMODS.Challenge {
  key = 'joker_of_the_day',
  jokers = {
    { id = "j_paperback_photocopy", eternal = true },
    { id = "j_paperback_master_plan", eternal = true },
    { id = "j_brainstorm", eternal = true },
    { id = "j_blueprint", eternal = true },
  },
  unlocked = function (self)
    return G.P_CENTERS['j_paperback_photocopy'].unlocked and G.P_CENTERS['j_paperback_master_plan'].unlocked
    and G.P_CENTERS['j_brainstorm'].unlocked and G.P_CENTERS['j_blueprint'].unlocked
  end,

  restrictions = {
    banned_cards = PB_UTIL.banned_challenge_centers {
      'j_paperback_shadowmantle',
      'j_paperback_book_of_vengeance',
      'j_invisible',
      'c_paperback_eight_of_wands',
      'c_paperback_nine_of_swords',
      'c_paperback_two_of_pentacles',
      'v_blank',
      'v_antimatter'
    },

    banned_tags = {
      { id = 'tag_negative' }
    },

    banned_other = {
      { id = 'bl_final_leaf', type = 'blind' },
    },
  }
}
