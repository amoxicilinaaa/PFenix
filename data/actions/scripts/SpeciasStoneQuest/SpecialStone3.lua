function onUse(cid, item)

local t = {
{uid=10007, storage=15355, recompensa=20905, mensagem="Parabéns, você ganhou uma Zone Stone."},
{uid=10008, storage=15355, recompensa=21079, mensagem="Parabéns, você ganhou uma Gladi Stone."},
{uid=10009, storage=15355, recompensa=21996, mensagem="Parabéns, você ganhou uma Llade Stone."}
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