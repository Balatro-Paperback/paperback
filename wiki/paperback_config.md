# Paperback Config

Certain objects in our mod can include a `paperback` table within its definition, this is used to provide certain effects and avoid repetition.

## Centers and Tags

```lua
paperback = {
  requires_custom_suits = true, -- Makes this object only available in pool if Custom Suits are enabled in config
  requires_crowns = true, -- Makes this object require at least one card to be a Crown to be in the pool (ignores wild cards)
  requires_stars = true, -- Makes this object require at least one card to be a Star to be in the pool (ignores wild cards)
  requires_enhancements = true, -- Makes this object only available in pool if Enhancements are enabled in config
  requires_paperclips = true, -- Makes this object only available in pool if Paperclips are enabled in config
  requires_minor_arcana = true, -- Makes this object only available in pool if Minor Arcana are enabled in config
  requires_tags = true, -- Makes this object only available in pool if Tags are enabled in config
}
```

> [!NOTE]
> `requires_crowns` and `requires_stars` automatically set `requires_custom_suits = true`

## Jokers

```lua
paperback = {
  ignores_the_world = true, -- Whether this joker ignores the effect applied by The World joker, used by Solemn Lament and B-Soda
}
```

## Back

```lua
paperback = {
  create_crowns = true, -- Makes this Back create a full suit of Crowns
  create_stars = true, -- Makes this Back create a full suit of Stars
}
```
