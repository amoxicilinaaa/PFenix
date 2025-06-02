function OnUse (cid, item)
if getPlayerStorageValue (cid, 99991, 1) then
setPlayerStorageValue (cid, 99991) -1
doSendPlayerTextMessage (cid, "voce desbugou o vault")
end
return true
end