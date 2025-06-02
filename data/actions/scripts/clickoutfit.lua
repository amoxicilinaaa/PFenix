function onUse(cid, item, frompos, item2, topos)
local config = {
outfit = {lookType = 4134 },
}

  doSetCreatureOutfit(cid, config.outfit, -1)
  end