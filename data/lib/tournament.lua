torneio = {
awardTournament = 2160,
awardAmount = 3,
playerTemple = {x = 1049, y = 1045, z = 7},
playerTemple1 = {x = 1049, y = 1045, z = 7},
tournamentFight = {x = 1276, y = 138, z = 7},
area = {fromx = 1268, fromy = 124, fromz = 7, tox = 1285, toy = 153, toz= 7},
waitPlace = {x = 1281, y = 176, z = 7},  
waitArea = {fromx = 1268, fromy = 167, fromz = 7, tox = 1295, toy = 182, toz= 7},
startHour = "20:30:00",
endHour = "20:46:00",
startHour2 = "21:45:00",
endHour2 = "22:00:00",
price = 10000,
revivePoke = 12344,
}

function getPlayersInArea(area)

local players = {}

for x = area.fromx,area.tox do
for y = area.fromy,area.toy do
for z = area.fromz,area.toz do

local m = getTopCreature({x=x, y=y, z=z}).uid

if m ~= 0 and isPlayer(m) then
table.insert(players, m)
end
end
end
end
return players
end