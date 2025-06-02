function onTimer ()

if #getPlayersInArea(torneio.area) > 1 then
doBroadcastMessage("") return true end

for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
doTeleportThing(pid, torneio.tournamentFight)
doBroadcastMessage("O Torneio Começou!")
end
return true
end