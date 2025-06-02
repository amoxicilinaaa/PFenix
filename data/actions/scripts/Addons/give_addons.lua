-- local EXAMPLE_addons_item = {
	-- [ITEM_ID] = {poke = POKEMON_NAME, addon = POKEMON_ADDON},
-- }

function onUse(cid, item, fromPos, itemEx, toPos)

	if not isCreature(itemEx.uid) then
		doPlayerSendCancel(cid, "Desculpe, você deve usar este addon no seu Pokémon.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
		return true
	end
	
	local your_poke = getCreatureSummons(cid)[1]
	
	if not isCreature(your_poke) or itemEx.uid ~= your_poke then
		doPlayerSendCancel(cid, "O Pokémon deve ser seu.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
		return true
	end
	
	if getPokemonName(getCreatureSummons(cid)[1]) ~= addons_item[item.itemid].poke then
		doPlayerSendCancel(cid, "Desculpe, este addon só pode ser anexado em um "..addons_item[item.itemid].poke..".\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
		return true
	end
	
	local mypb = getPlayerSlotItem(cid, 8)

	local current_addon = getItemAttribute(mypb.uid, "current_addon")
	local addons = getPokeAddons(mypb.uid)
	
	if not addAddon(mypb.uid, addons_item[item.itemid].addon) then
		doPlayerSendCancel(cid, "Desculpe, este pokémon já tem esse addon.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
		return true
	end
	
	doRemoveItem(item.uid, 1)
	
	return true
end 