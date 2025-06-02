                local addons = {
                [22903] = {pokemon = "Golem" , looktype = 4095, fly = 0, ride = 0, surf = 0},
				[22893] = {pokemon = "Charmander" , looktype = 3976, fly = 0, ride = 0, surf = 0},
				[22899] = {pokemon = "Feraligatr" , looktype = 3742, fly = 0, ride = 0, surf = 0},
				[22895] = {pokemon = "Snorlax" , looktype = 3752, fly = 0, ride = 0, surf = 0},
				[22882] = {pokemon = "Shiny Aggron" , looktype = 3779, fly = 0, ride = 0, surf = 0},
				[22914] = {pokemon = "Raichu" , looktype = 3302, fly = 0, ride = 0, surf = 0},
				[22894] = {pokemon = "Shiny Snorlax" , looktype = 3310, fly = 0, ride = 0, surf = 0},
				[22896] = {pokemon = "Shiny Tangela" , looktype = 3316, fly = 0, ride = 0, surf = 0},
				[22897] = {pokemon = "Shiny Tangela" , looktype = 3317, fly = 0, ride = 0, surf = 0},
				[22905] = {pokemon = "Shiny Tentacruel" , looktype = 3319, fly = 0, ride = 0, surf = 0},
				[22906] = {pokemon = "Shiny Tentacruel" , looktype = 3320, fly = 0, ride = 0, surf = 0},
				[22907] = {pokemon = "Shiny Tentacruel" , looktype = 3321, fly = 0, ride = 0, surf = 0},
				[22900] = {pokemon = "Marowak" , looktype = 3926, fly = 0, ride = 0, surf = 0},
				[22943] = {pokemon = "Garchomp" , looktype = 3674, fly = 0, ride = 0, surf = 0},
				[22944] = {pokemon = "Garchomp" , looktype = 3675, fly = 0, ride = 0, surf = 0},
				[22945] = {pokemon = "Garchomp" , looktype = 3676, fly = 0, ride = 0, surf = 0},
				[22946] = {pokemon = "Garchomp" , looktype = 3677, fly = 0, ride = 0, surf = 0},
				[22882] = {pokemon = "Aggron" , looktype = 3777, fly = 0, ride = 0, surf = 0},
				[22926] = {pokemon = "Togekiss" , looktype = 3401, fly = 0, ride = 0, surf = 0},
				[22926] = {pokemon = "Shiny Togekiss" , looktype = 3403, fly = 3404, ride = 0, surf = 0},
				[22927] = {pokemon = "Snorlax" , looktype = 3405, fly = 0, ride = 0, surf = 0},
				[22917] = {pokemon = "Shiny Metagross" , looktype = 3907, fly = 0, ride = 0, surf = 0},
				[23313] = {pokemon = "Noctowl" , looktype = 3731, fly = 3732, ride = 0, surf = 0},
				[23867] = {pokemon = "Shiny Sceptile" , looktype = 4594, fly = 0, ride = 0, surf = 0},
				[24208] = {pokemon = "Slowking" , looktype = 1729, fly = 0, ride = 0, surf = 0},
				[24211] = {pokemon = "Aggron" , looktype = 3726, fly = 0, ride = 0, surf = 0},
				[24214] = {pokemon = "Xatu" , looktype = 24214, fly = 0, ride = 0, surf = 0},
				[24311] = {pokemon = "Aggron" , looktype = 4841, fly = 0, ride = 0, surf = 0},
				[24313] = {pokemon = "Snorlax" , looktype = 4801, fly = 0, ride = 0, surf = 0},
				[24361] = {pokemon = "Machamp" , looktype = 4802, fly = 0, ride = 0, surf = 0},
				[24308] = {pokemon = "Sudowoodo" , looktype = 24308, fly = 0, ride = 0, surf = 0},
				[24312] = {pokemon = "Miltank" , looktype = 5127, fly = 0, ride = 0, surf = 0},
			    [24317] = {pokemon = "Charizard" , looktype = 5927, fly = 5925, ride = 0, surf = 0},
				[24325] = {pokemon = "Haxorus" , looktype = 5724, fly = 0, ride = 0, surf = 0}
				-- [] = {pokemon = "" , looktype = , fly = 0, ride = 0, surf = 0}
				
				--1729 slowking barba
				
				
			   }
 
               local function getOldAddon (looktype)
	for index, value in pairs (addons) do
		if value.looktype == looktype then
			return index
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local numero = addons[item.itemid].looktype
	local pb = itemEx.uid
	local pk = addons[item.itemid].pokemon
	
	if not isPokeball(itemEx.itemid) then 
		doPlayerSendCancel(cid, "Voce so poder usar este item em uma poke ball.")
	return true
	end
	
	if getPlayerSlotItem (cid, 8).uid == pb and (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) then
		doPlayerSendCancel (cid, "Desmonte do seu pokémon e volte-o para a poke ball.")
	return true
	end
	
	if getItemAttribute(pb, "addon") and getItemAttribute(pb, "addon") == numero then
		doPlayerSendCancel(cid, "Seu pokemon ja esta com este addon.")
	return true
	end     
	
	if #getCreatureSummons(cid) > 0 then
		doPlayerSendCancel(cid, "Por favor, volte o seu pokemon para a poke ball.")
	return true
	end   
	
	if getItemAttribute(pb, "poke") ~= pk then
		doPlayerSendCancel(cid, "Desculpe, voce nao pode adicionar este addon neste pokemon.")
	return true
	end
	
	if getItemAttribute (pb, "addon") and getItemAttribute (pb, "addon") > 1 then
		doPlayerSendTextMessage(cid, 27, "Voce substituiu um "..getItemNameById (getOldAddon (getItemAttribute (pb, "addon"))).." por um "..getItemNameById (item.itemid).." addon!")
	else
		doPlayerSendTextMessage(cid, 27, "Agora seu pokemon usara este "..getItemNameById (item.itemid).."!")
	end
	
	doRemoveItem(item.uid, 1)
	doSetItemAttribute(pb, "addon", numero) 
    setPlayerStorageValue(cid, 32000, 1)
return true
end