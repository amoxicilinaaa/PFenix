function onSay(cid, words, param)

if getPlayerItemCount(cid, 2145) >= 5 then
doPlayerRemoveItem(cid, 2145, 5)
if getPlayerSex(cid) == 0 then
doPlayerSetSex(cid, 1)
else
doPlayerSetSex(cid, 0)
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu personagem trocou de sexo por 10 diamonds!")
else
doPlayerSendCancel(cid, "Voce precisa de 5 diamonds para trocar de sexo")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end