function onUse(cid, item)

local t = {
{uid=10001, storage=15355, recompensa=20898, mensagem="Parabéns, você ganhou uma Glice Stone."},
{uid=10002, storage=15355, recompensa=20899, mensagem="Parabéns, você ganhou uma Green Stone."},
{uid=10003, storage=15355, recompensa=20900, mensagem="Parabéns, você ganhou uma Mag Stone."}
}

if item.uid == t[1].uid and getPlayerStorageValue(cid, t[1].storage) == -1 then
doPlayerAddItem(cid, t[1].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[1].mensagem)
setPlayerStorageValue(cid, t[1].storage, 1)

elseif item.uid == t[2].uid and getPlayerStorageValue(cid, t[2].storage) == -1 then
doPlayerAddItem(cid, t[2].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[2].mensagem)
setPlayerStorageValue(cid, t[2].storage, 2)

elseif item.uid == t[3].uid and getPlayerStorageValue(cid, t[3].storage) == -1 then
doPlayerAddItem(cid, t[3].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[3].mensagem)
setPlayerStorageValue(cid, t[3].storage, 1)

end
return doPlayerSendCancel(cid, "Você ja fez esta quest.")
end