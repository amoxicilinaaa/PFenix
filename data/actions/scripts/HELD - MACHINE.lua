--- HELD MACHINE

function onUse(cid, item, frompos, item2, topos)

doSendPlayerExtendedOpcode(cid, 137, "open")

return true
end