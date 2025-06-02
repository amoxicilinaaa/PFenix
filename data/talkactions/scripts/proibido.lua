-- Proibir palavrões by Talkaction
-- Author: Matheus Sesso
-- Url: www.tibiaking.com
function onSay(cid, words, param)
local time = 10 -- Tempo que ele ficará com outra outfit e muted! (em segundos)
local life = 15 -- Quantidade de vida que o player perderá!
doSendAnimatedText(getPlayerPosition(cid), "#$#%##%", 19)
doPlayerSendTextMessage(cid, 23, "Agora voce esta mudo,por "..time.." segundos!")
doCreatureAddHealth(cid, -life)
doSetMonsterOutfit(cid, "Bug", time*1000)
doMutePlayer(cid, time*1000)
return TRUE
end