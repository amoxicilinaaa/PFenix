local effect = 173

PokemonShinys = 
{
	["Zoroark"] = {name = "Virus Zoroark", quant = 1},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isCreature(itemEx.uid) and isPokeball(itemEx.itemid) then
		if getPlayerSlotItem(cid, 8).uid == itemEx.uid then
			if #getCreatureSummons(cid) <= 0 then
				pokename = doCorrectString(getItemAttribute(itemEx.uid, "poke"))
				if PokemonShinys[pokename] then
					quant = PokemonShinys[pokename].quant
					if getPlayerItemCount(cid, item.itemid) >= quant then
						local newpoke = PokemonShinys[pokename].name
						doItemSetAttribute(itemEx.uid, "poke", newpoke)
						doItemSetAttribute(itemEx.uid, "description", "Contains a "..newpoke..".")
						doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[newpoke])
						doSendMagicEffect(getThingPos(cid), effect)
						doPlayerRemoveItem(cid, item.itemid, quant)
						doItemSetAttribute(itemEx.uid, "offense", pokes[newpoke].offense)
						doItemSetAttribute(itemEx.uid, "defense", pokes[newpoke].defense)
						doItemSetAttribute(itemEx.uid, "speed", pokes[newpoke].agility)
						doItemSetAttribute(itemEx.uid, "specialattack", pokes[newpoke].specialattack)
						doItemSetAttribute(itemEx.uid, "vitality", pokes[newpoke].vitality)
						doItemSetAttribute(itemEx.uid, "tadport", fotos[newpoke])
						doUpdatePokemonsBar(cid)
					else
						doPlayerSendCancel(cid,  "You don't have "..quant.." shiny stones to evolve this ".. pokename .."!")
					end
				else
					doPlayerSendCancel(cid,  pokename.." don't have a shiny evolution!")
				end
			else
				doPlayerSendCancel(cid,  "You need call your pokemon!")
			end
		else
			doPlayerSendCancel(cid,  "You need put "..pokename.." in the principal slot!")
		end
	else
		doPlayerSendCancel(cid,  "You need use shiny stone in pokeball!")
	end
	return true
end