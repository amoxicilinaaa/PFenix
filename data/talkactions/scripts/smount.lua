local config = {
diamond_id = 2145,
blastoise = {qt = 45, effect = 317, msg = "Voce comprou a montaria Artic Unicorn."}, --pronto
charizard = {qt = 50, effect = 317, msg = "Voce comprou a montaria Death Crawler."}, --pronto
fleeting = {qt = 35, effect = 317, msg = "Voce comprou a montaria Fleeting Knowledge."},--pronto
ebony = {qt = 25, effect = 317, msg = "Voce comprou a montaria Ebony Tiger."}, --pronto
doombringer = {qt = 30, effect = 317, msg = "Voce comprou a montaria Doombringer."}, --pronto
prismatic = {qt = 55, effect = 317, msg = "Voce comprou a montaria Prismatic Unicorn."}, --pronto
tundra = {qt = 60, effect = 317, msg = "Voce comprou a montaria Tundra Rambler."},
steel = {qt = 60, effect = 317, msg = "Voce comprou a montaria Steelbeak."},
boreal = {qt = 35, effect = 317, msg = "Voce comprou a montaria Boreal Owl."},
cranium = {qt = 35, effect = 317, msg = "Voce comprou a montaria Cranium Spider."},
}


function onSay(cid, words, param)
	
	if(words == "#mount1#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.blastoise.qt then
	doPlayerAddItem(cid, 24109, 1)
	doPlayerRemoveItem(cid, config.diamond_id, config.blastoise.qt)
	doSendMagicEffect(getCreaturePosition(cid), config.blastoise.effect)	
	doPlayerSendTextMessage(cid, 27, config.blastoise.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
	elseif (words == "#mount2#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.charizard.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.charizard.qt)
	doPlayerAddItem(cid, 24110, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.charizard.effect)	
	doPlayerSendTextMessage(cid, 27, config.charizard.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
	elseif (words == "#mount3#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.fleeting.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.fleeting.qt)
	doPlayerAddItem(cid, 24114, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.fleeting.effect)	
	doPlayerSendTextMessage(cid, 27, config.fleeting.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
		elseif (words == "#mount4#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.ebony.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.ebony.qt)
	doPlayerAddItem(cid, 24106, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.ebony.effect)	
	doPlayerSendTextMessage(cid, 27, config.ebony.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
		elseif (words == "#mount5#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.doombringer.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.doombringer.qt)
	doPlayerAddItem(cid, 24112, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.doombringer.effect)	
	doPlayerSendTextMessage(cid, 27, config.doombringer.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end

		elseif (words == "#mount6#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.prismatic.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.prismatic.qt)
	doPlayerAddItem(cid, 24108, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.prismatic.effect)	
	doPlayerSendTextMessage(cid, 27, config.prismatic.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
			elseif (words == "#mount7#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.tundra.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.tundra.qt)
	doPlayerAddItem(cid, 24105, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.tundra.effect)	
	doPlayerSendTextMessage(cid, 27, config.tundra.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
	
			elseif (words == "#mount8#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.steel.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.steel.qt)
	doPlayerAddItem(cid, 24107, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.steel.effect)	
	doPlayerSendTextMessage(cid, 27, config.steel.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
			elseif (words == "#mount9#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.boreal.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.boreal.qt)
	doPlayerAddItem(cid, 24113, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.boreal.effect)	
	doPlayerSendTextMessage(cid, 27, config.boreal.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
	
			elseif (words == "#mount10#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.cranium.qt then
	doPlayerRemoveItem(cid, config.diamond_id, config.cranium.qt)
	doPlayerAddItem(cid, 24111, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.cranium.effect)	
	doPlayerSendTextMessage(cid, 27, config.cranium.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce nao tem diamonds o suficient para comprar essa montaria.")
	end
	
	
	
	end
		
	return TRUE 	
end  