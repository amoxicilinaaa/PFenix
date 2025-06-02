function onUse(cid, item)

local t = {
{uid=10001, storage=15355, recompensa=20898, mensagem="Parabéns, você ganhou uma Glice Stone."},
{uid=10002, storage=15355, recompensa=20899, mensagem="Parabéns, você ganhou uma Green Stone."},
{uid=10003, storage=15355, recompensa=20900, mensagem="Parabéns, você ganhou uma Mag Stone."},
{uid=10004, storage=15355, recompensa=20901, mensagem="Parabéns, você ganhou uma Electri Stone."},
{uid=10005, storage=15355, recompensa=20902, mensagem="Parabéns, você ganhou uma Perior Stone."},
{uid=10006, storage=15355, recompensa=20903, mensagem="Parabéns, você ganhou uma Kiss Stone."},
{uid=10007, storage=15355, recompensa=20905, mensagem="Parabéns, você ganhou uma Zone Stone."},
{uid=10008, storage=15355, recompensa=21079, mensagem="Parabéns, você ganhou uma Gladi Stone."},
{uid=10009, storage=15355, recompensa=21996, mensagem="Parabéns, você ganhou uma Llade Stone."},
{uid=10010, storage=15355, recompensa=21997, mensagem="Parabéns, você ganhou uma Scor Stone."},
{uid=10011, storage=15355, recompensa=21998, mensagem="Parabéns, você ganhou uma Licky Stone."},
{uid=10012, storage=15355, recompensa=21999, mensagem="Parabéns, você ganhou uma Poryz Stone."},
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
setPlayerStorageValue(cid, t[2].storage, 1)

elseif item.uid == t[3].uid and getPlayerStorageValue(cid, t[3].storage) == -1 then
doPlayerAddItem(cid, t[3].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[3].mensagem)
setPlayerStorageValue(cid, t[3].storage, 1)

elseif item.uid == t[4].uid and getPlayerStorageValue(cid, t[4].storage) == -1 then
doPlayerAddItem(cid, t[4].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[4].mensagem)
setPlayerStorageValue(cid, t[4].storage, 1)

elseif item.uid == t[5].uid and getPlayerStorageValue(cid, t[5].storage) == -1 then
doPlayerAddItem(cid, t[5].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[5].mensagem)
setPlayerStorageValue(cid, t[5].storage, 1)

elseif item.uid == t[6].uid and getPlayerStorageValue(cid, t[6].storage) == -1 then
doPlayerAddItem(cid, t[6].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[6].mensagem)
setPlayerStorageValue(cid, t[6].storage, 1)

elseif item.uid == t[7].uid and getPlayerStorageValue(cid, t[7].storage) == -1 then
doPlayerAddItem(cid, t[7].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[7].mensagem)
setPlayerStorageValue(cid, t[7].storage, 1)

elseif item.uid == t[8].uid and getPlayerStorageValue(cid, t[8].storage) == -1 then
doPlayerAddItem(cid, t[8].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[8].mensagem)
setPlayerStorageValue(cid, t[8].storage, 1)

if item.uid == t[9].uid and getPlayerStorageValue(cid, t[9].storage) == -1 then
doPlayerAddItem(cid, t[9].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[9].mensagem)
setPlayerStorageValue(cid, t[9].storage, 1)

elseif item.uid == t[10].uid and getPlayerStorageValue(cid, t[10].storage) == -1 then
doPlayerAddItem(cid, t[10].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[10].mensagem)
setPlayerStorageValue(cid, t[10].storage, 1)

elseif item.uid == t[11].uid and getPlayerStorageValue(cid, t[11].storage) == -1 then
doPlayerAddItem(cid, t[11].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[11].mensagem)
setPlayerStorageValue(cid, t[11].storage, 1)

elseif item.uid == t[12].uid and getPlayerStorageValue(cid, t[12].storage) == -1 then
doPlayerAddItem(cid, t[12].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[12].mensagem)
setPlayerStorageValue(cid, t[12].storage, 1)

elseif item.uid == t[13].uid and getPlayerStorageValue(cid, t[13].storage) == -1 then
doPlayerAddItem(cid, t[13].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[13].mensagem)
setPlayerStorageValue(cid, t[13].storage, 1)

elseif item.uid == t[14].uid and getPlayerStorageValue(cid, t[14].storage) == -1 then
doPlayerAddItem(cid, t[14].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[14].mensagem)
setPlayerStorageValue(cid, t[14].storage, 1)

elseif item.uid == t[15].uid and getPlayerStorageValue(cid, t[15].storage) == -1 then
doPlayerAddItem(cid, t[15].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[15].mensagem)
setPlayerStorageValue(cid, t[15].storage, 1)

elseif item.uid == t[16].uid and getPlayerStorageValue(cid, t[16].storage) == -1 then
doPlayerAddItem(cid, t[16].recompensa, 1)
doPlayerSendTextMessage(cid, 22, t[16].mensagem)
setPlayerStorageValue(cid, t[16].storage, 1)

end
return doPlayerSendCancel(cid, "Você ja fez esta quest.")
end