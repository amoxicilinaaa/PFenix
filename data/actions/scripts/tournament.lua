function onUse(cid, item)

if #getPlayersInArea(torneio.area) >= 2 then
doPlayerSendTextMessage(cid, 20 ,"Mate todo mundo para vencer o torneio!") return true end

doTeleportThing(cid, torneio.playerTemple1)
doBroadcastMessage("Parabéns ao treinador "..getCreatureName(cid).." por vencer o torneio de hoje.")
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
doPlayerAddItem(cid,18918,1) 
doPlayerAddItem(cid,2160,5) 
local topquest = 1
addTopQuest(cid, topquest)
return true
end