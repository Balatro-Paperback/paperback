# Contexts

Every context added by Paperback can be easily accessed through the `context` parameter within your `calculate` function, they will all be located under the `context.paperback` field to avoid any conflicts with other mods.

### Cashing Out

This context is used for effects that happen when the "Cash Out" button is pressed.

```lua
context.paperback = {
  cashing_out = true
}
```

### Using Tag

This context is used for effects before a Tag is activated.

```lua
context.paperback = {
  using_tag = true,
  tag = self -- Tag: the tag that was activated
}
```

### Destroying Joker

This context is used for effects after a joker is destroyed.

```lua
context.paperback = {
  destroying_joker = true,
  destroyed_joker = self -- Card: the joker that was destroyed
}
```

> [!WARNING]
> When using this, ensure that your own joker isn't the one being destroyed: `card ~= context.paperback.destroyed_joker`

### Level Up Hand

This context is used for effects after a hand's level has been increased.

```lua
context.paperback = {
  level_up_hand = true
}
```

### Repetitions from playing card

This context is used to collect repetitions from other playing cards

```lua
context.paperback = {
  repetition_from_playing_card = true,
  other_card = card, -- the card that would be retriggered if at least 1 repetition was returned
  cardarea = card.area, -- the area where the card is
  scoring_hand = context.scoring_hand, -- the scoring hand, if any
}
```

> [!WARNING]
> This is a W.I.P and currently only supports calculating repetitions from Enhancements

### Modify final hand

This context is used for modifying cards in a hand right before they're highlighted. Currently used by Black Rainbows and Bismuth

```lua
context.paperback = {
  modify_final_hand = true,
  scoring_hand = final_scoring_hand,
  full_hand = G.play.cards
}
```
