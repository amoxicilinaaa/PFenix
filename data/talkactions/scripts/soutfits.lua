local config = {
diamond_id = 2145,
blastoise = {sto = 99999999, qt = 25, effect = 222, msg = "Voce comprou a roupa Coelho da pascoa."}, --pronto
charizard = {sto = 99999998, qt = 50, effect = 222, msg = "Voce comprou a roupa Anjo Divino."}, --pronto
venusaur = {sto = 99999997, qt = 15, effect = 222, msg = "Voce comprou a roupa Torcedor Brasileiro."}, --pronto
terror = {sto = 99999996, qt = 25, effect = 222, msg = "Voce comprou a roupa Presente de Natal."},
enigmer = {sto = 99999995, qt = 35, effect = 222, msg = "Voce comprou a roupa Pikachu."},
umbreon = {sto = 99999994, qt = 35, effect = 222, msg = "Voce comprou a roupa Lion."}, --pronto
slash = {sto = 99999993, qt = 30, effect = 222, msg = "Voce comprou a roupa Charizard."},
ursaring = {sto = 99999992, qt = 30, effect = 222, msg = "Voce comprou a roupa Homem Aranha."}, --pronto
vinganca = {sto = 99999991, qt = 20, effect = 222, msg = "Voce comprou a roupa Deadpool."}, --pronto
assassino = {sto = 99999990, qt = 30, effect = 222, msg = "Voce comprou a roupa Slowpoke."},
armadura = {sto = 99999989, qt = 35, effect = 222, msg = "Voce comprou a roupa Pikachu."},
ironman = {sto = 99999988, qt = 25, effect = 222, msg = "Voce comprou a roupa Presente de Natal."},
robin = {sto = 99999987, qt = 35, effect = 222, msg = "Voce comprou a roupa Pikachu Parceiro."},
grandpa = {sto = 99999986, qt = 25, effect = 222, msg = "Voce comprou a roupa Grandpa."},
iruka = {sto = 99999985, qt = 25, effect = 222, msg = "Voce comprou a roupa Iruka."},
kakashi = {sto = 99999984, qt = 25, effect = 222, msg = "Voce comprou a roupa Kakashi."},
yamato = {sto = 99999983, qt = 25, effect = 222, msg = "Voce comprou a roupa Yamato."},
}


function onSay(cid, words, param)
	
	if(words == "#outfit1#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.blastoise.qt and getPlayerStorageValue(cid, config.blastoise.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.blastoise.qt)
	setPlayerStorageValue(cid, config.blastoise.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.blastoise.effect)	
	doPlayerSendTextMessage(cid, 27, config.blastoise.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit2#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.charizard.qt and getPlayerStorageValue(cid, config.charizard.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.charizard.qt)
	setPlayerStorageValue(cid, config.charizard.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.charizard.effect)	
	doPlayerSendTextMessage(cid, 27, config.charizard.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit3#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.armadura.qt and getPlayerStorageValue(cid, config.armadura.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.armadura.qt)
	setPlayerStorageValue(cid, config.armadura.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.armadura.effect)	
	doPlayerSendTextMessage(cid, 27, config.armadura.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit4#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.ironman.qt and getPlayerStorageValue(cid, config.ironman.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.ironman.qt)
	setPlayerStorageValue(cid, config.ironman.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.ironman.effect)	
	doPlayerSendTextMessage(cid, 27, config.ironman.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit5#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.robin.qt and getPlayerStorageValue(cid, config.robin.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.robin.qt)
	setPlayerStorageValue(cid, config.robin.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.robin.effect)	
	doPlayerSendTextMessage(cid, 27, config.robin.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	
	elseif (words == "/buydj") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.marshmello.qt and getPlayerStorageValue(cid, config.marshmello.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.marshmello.qt)
	setPlayerStorageValue(cid, config.marshmello.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.marshmello.effect)	
	doPlayerSendTextMessage(cid, 27, config.marshmello.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit6#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.kakashi.qt and getPlayerStorageValue(cid, config.kakashi.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.kakashi.qt)
	setPlayerStorageValue(cid, config.kakashi.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.kakashi.effect)	
	doPlayerSendTextMessage(cid, 27, config.kakashi.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	
	elseif (words == "#outfit7#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.umbreon.qt and getPlayerStorageValue(cid, config.umbreon.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.umbreon.qt)
	setPlayerStorageValue(cid, config.umbreon.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.umbreon.effect)	
	doPlayerSendTextMessage(cid, 27, config.umbreon.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit8#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.ursaring.qt and getPlayerStorageValue(cid, config.ursaring.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.ursaring.qt)
	setPlayerStorageValue(cid, config.ursaring.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.ursaring.effect)	
	doPlayerSendTextMessage(cid, 27, config.ursaring.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	
	elseif (words == "#outfit9#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.venusaur.qt and getPlayerStorageValue(cid, config.venusaur.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.venusaur.qt)
	setPlayerStorageValue(cid, config.venusaur.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.venusaur.effect)	
	doPlayerSendTextMessage(cid, 27, config.venusaur.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit10#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.terror.qt and getPlayerStorageValue(cid, config.terror.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.terror.qt)
	setPlayerStorageValue(cid, config.terror.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.terror.effect)	
	doPlayerSendTextMessage(cid, 27, config.terror.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit11#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.enigmer.qt and getPlayerStorageValue(cid, config.enigmer.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.enigmer.qt)
	setPlayerStorageValue(cid, config.enigmer.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.enigmer.effect)	
	doPlayerSendTextMessage(cid, 27, config.enigmer.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
		elseif (words == "#outfit12#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.grandpa.qt and getPlayerStorageValue(cid, config.grandpa.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.grandpa.qt)
	setPlayerStorageValue(cid, config.grandpa.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.grandpa.effect)	
	doPlayerSendTextMessage(cid, 27, config.grandpa.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
			elseif (words == "#outfit13#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.iruka.qt and getPlayerStorageValue(cid, config.iruka.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.iruka.qt)
	setPlayerStorageValue(cid, config.iruka.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.iruka.effect)	
	doPlayerSendTextMessage(cid, 27, config.iruka.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	elseif (words == "#outfit14#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.kakashi.qt and getPlayerStorageValue(cid, config.kakashi.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.kakashi.qt)
	setPlayerStorageValue(cid, config.kakashi.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.kakashi.effect)	
	doPlayerSendTextMessage(cid, 27, config.kakashi.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
		elseif (words == "#outfit15#") then
	if getPlayerItemCount(cid, config.diamond_id) >= config.yamato.qt and getPlayerStorageValue(cid, config.yamato.sto) < 1 then
	doPlayerRemoveItem(cid, config.diamond_id, config.yamato.qt)
	setPlayerStorageValue(cid, config.yamato.sto, 1)
	doSendMagicEffect(getCreaturePosition(cid), config.yamato.effect)	
	doPlayerSendTextMessage(cid, 27, config.yamato.msg)
	else
	doPlayerSendTextMessage(cid, 27, "Voce ja tem esta roupa ou nao tem diamond.")
	end
	
	end
		
	return TRUE 	
end  