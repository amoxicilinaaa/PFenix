function onUse(cid, item)

local t = {
{uid=10004, storage=15355, recompensa=20901, mensagem="Parabéns, você ganhou uma Electri Stone."},
{uid=10005, storage=15355, recompensa=20902, mensagem="Parabéns, você ganhou uma Perior Stone."},
{uid=10006, storage=15355, recompensa=20903, mensagem="Parabéns, você ganhou uma Kiss Stone."}
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