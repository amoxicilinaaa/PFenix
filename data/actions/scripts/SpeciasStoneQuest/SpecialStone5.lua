function onUse(cid, item)

local t = {
{uid=10013, storage=15355, recompensa=22000, mensagem="Parabéns, você ganhou uma Probo Stone."},
{uid=10014, storage=15355, recompensa=22001, mensagem="Parabéns, você ganhou uma Wea Stone."},
{uid=10015, storage=15355, recompensa=22002, mensagem="Parabéns, você ganhou uma Yanm Stone."},
{uid=10016, storage=15355, recompensa=22003, mensagem="Parabéns, você ganhou uma Fros Stone."}
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

elseif item.uid == t[4].uid and getPlayerStorageValue(cid, t[4].storage) == -1 then
doPlayerAddItem(cid, t[4].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[4].mensagem)
setPlayerStorageValue(cid, t[4].storage, 1)

end
return doPlayerSendCancel(cid, "Você ja fez esta quest.")
end