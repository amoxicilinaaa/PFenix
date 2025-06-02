local starterpokes = {
["Bulbasaur"] = {x = 143, y = 110, z = 6},
["Chikorita"] = {x = 144, y = 110, z = 6},
["Treecko"] = {x = 145, y = 110, z = 6},
["Turtwig"] = {x = 146, y = 110, z = 6},
["Snivy"] = {x = 147, y = 110, z = 6},
["Charmander"] = {x = 148, y = 110, z = 6},
["Cyndaquil"] = {x = 149, y = 110, z = 6},
["Torchic"] = {x = 150, y = 110, z = 6},
["Chimchar"] = {x = 151, y = 110, z = 6},
["Tepig"] = {x = 152, y = 110, z = 6},
["Squirtle"] = {x = 153, y = 110, z = 6},
["Totodile"] = {x = 154, y = 110, z = 6},
["Mudkip"] = {x = 155, y = 110, z = 6},
["Piplup"] = {x = 156, y = 110, z = 6},
["Oshawott"] = {x = 157, y = 110, z = 6},
}

local btype = "Icone"

function onUse(cid, item, frompos, item2, topos)


	local pokemon = ""

	for a, b in pairs (starterpokes) do
		if isPosEqualPos(topos, b) then
			pokemon = a
		end
	end
    if pokemon == "" then return true end
	
	doPlayerSendTextMessage(cid,22,"Boa escolha. Divirta-se!")

    addPokeToPlayer(cid, pokemon, 0, nil, btype, true)
     setPlayerStorageValue(cid, 8955, 1)

	doSendMagicEffect(getThingPos(cid), 29)
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	doSendMagicEffect(getThingPos(cid), 40)
	doSendMagicEffect(getThingPos(cid), 7)
	

return TRUE
end