-- by GodMarini for TibiaKing Fórum. --
local pokemons = {"Raikou", "Entei","Suicune","Zapdos", "Moltres", "Articuno","Mewtwo","Mew","Lugia","Ho-oh","Celebi","Latios","Latias","Phione","Manaphy","Uxie","Mesprit","Azelf","Arceus","Cresselia","Meloetta","Keldeo","Genesect","Regice","Regirock","Registeel","Regigigas","Shaymin","Zekrom","Reshiram","Deoxys","Jirachi","Darkrai","Kyogre","Heatran","Cobalion","Virizion","Terrakion","Rayquaza","Groudon","Dialga","Palkia","Giratina","Tornadus","Thundurus","Landorus","Kyurem"}


function onKill(cid, target, lastHit)
	if isInArray(pokemons,getCreatureName(target)) then
		doBroadcastMessage("O jogador "..getCreatureName(cid).." matou o Pokemon Lendario "..getCreatureName(target).."!")
	end
	return true


end