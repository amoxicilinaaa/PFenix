function onKill(cid, target, lastHit)
  if isPlayer(cid) and isMonster(target) and doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT, (isCollectAll(cid) and "yes" or "no") .. "|" .. itens .. "|" .. getAllItensInMyListToClient(cid)) then
    local pos = getCreaturePosition(target)
    addEvent(doAutoLoot, 0, cid, pos)
  end
  return true
end