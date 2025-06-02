function NurseyNpc(cid, npc, message, options)
  if not(options) then
    options = ''
  end
  doSendPlayerExtendedOpcode(cid, 176, getCreatureName(npc)..'@'..message..'@'..options) 
end