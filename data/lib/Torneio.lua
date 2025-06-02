torneio = {


awardTournament = 2160,---- Premio
awardAmount = 5,---- quantia do Premio
playerTemple = {x = 1055, y = 1047, z = 7}, ---- posiçao do Templo
tournamentFight = {x = 1276, y = 138, z = 7}, ----- Area (Mapa) do torneio
area = {fromx = 1268, fromy = 124, fromz = 7, tox = 1285, toy = 153, toz= 7},---- fromx = 899, fromy = 968, fromz = 7 : posiçao superior a esquerda do Mapa do torneio /// tox = 919, toy = 989, toz= 7 : Posiçao inferior direito do Mapa do Torneio
waitPlace = {x = 1281, y = 176, z = 7}, ---- Sala de Espera (Coloque No-logout na area)
waitArea = {fromx = 1268, fromy = 167, fromz = 7, tox = 1295, toy = 182, toz= 7}, ---- fromx = 899, fromy = 968, fromz = 7 : posiçao superior a esquerda do Mapa Sala de espera /// tox = 919, toy = 989, toz= 7 : Posiçao inferior direito do Mapa sala de espera
startHour = "08:00:00;18:00:00", ---- Hora que Inicia as Iscriçoes do Torneio
endHour = "08:05:00;18:05:00", ----- Hora que Começa a Batalha
price = 10000, ------ Custo para se inscrever no torneio
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