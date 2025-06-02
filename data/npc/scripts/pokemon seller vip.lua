local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local baseprice = 0
local pokePrice = {
["Charmander"] = 1300,
["Charmeleon"] = 6500, 
["Charizard"] = 9100,
["Bulbasaur"] =  1300,
["Ivysaur"] =  6500,
["Venusaur"] =  9100,
["Squirtle"] =  1300,
["Wartortle"] =  6500,
["Blastoise"] =  9100,
["Caterpie"] =  65,
["Metapod"] =  325,
["Butterfree"] =  2600,
["Weedle"] =  65,
["Kakuna"] =  325,
["Beedrill"] =  2600,
["Pidgey"] =  78,
["Pidgeotto"] =  1950,
["Pidgeot"] =  3900,
["Rattata"] =  7,
["Raticate"] =  1300,
["Spearow"] =  130,
["Fearow"] =  1430,
["Ekans"] =  390,
["Arbok"] =  2600,
["Pikachu"] =  2600,
["Raichu"] =  4550,
["Sandshrew"] =  1170,
["Sandslash"] =  1950,
["Nidoran Female"] =  163,
["Nidorina"] =  2925,
["Nidoqueen"] =  7085,
["Nidoran Male"] =  163,
["Nidorino"] =  2925,
["Nidoqueen"] = 7085,
["Clefairy"] =  1300,
["Clefable"] =  7800,
["Vulpix"] =  1300,
["Ninetales"] = 7800,
["Jigglypuff"] =  1300,
["Wigglytuff"] =  7800,
["Zubat"] =  156,
["Golbat"] =  1560,
["Oddish"] =  1040,
["Gloom"] =  2925,
["Vileplume"] =  6500,
["Paras"] =  780,
["Parasect"] =  6270, 
["Venonat"] =  1690,
["Venomoth"] =  4650,
["Diglett"] =  200,
["Dugtrio"] =  2000,
["Meowth"] =  300,
["Persian"] =  2000,
["Psyduck"] =  900,
["Golduck"] =  3800,
["Mankey"] =  300,
["Primeape"] =  4050,
["Growlithe"] =  1000,
["Arcanine"] =  6000,
["Poliwag"] =  800,
["Poliwhirl"] =  1500,
["Poliwrath"] =  6000,
["Abra"] =  800,
["Kadabra"] =  2400,
["Alakazam"] =  7400,
["Machop"] =  1000,
["Machoke"] =  3000,
["Machamp"] =  6700,
["Bellsprout"] =  800,
["Wepinbell"] =  1700,
["Victreebel"] =  42000,
["Tentacool"] =  300,
["Tentacruel"] =  3600,
["Geodude"] =  300,
["Graveler"] =  18000,
["Golem"] =  5700,
["Ponyta"] =  800,
["Rapidash"] =  6500,
["Slowpoke"] =  400,
["Slowbro"] =  6000,
["Magnemite"] =  450,
["Magneton"] =  3500,
["Farfetch'd"] =  4000,
["Doduo"] =  600,
["Dodrio"] =  4800,
["Seel"] =  900,
["Dewgong"] = 4920,
["Grimer"] =  300,
["Muk"] =  4000,
["Shellder"] =  900,
["Cloyster"] =  4920,
["Gastly"] =  1050,
["Haunter"] =  3650,
["Gengar"] =  7590,
["Onix"] =  2000,
["Drowzee"] =  1150,
["Hypno"] =  5660,
["Krabby"] =  250,
["Kingler"] =  4200,
["Voltorb"] =  450,
["Electrode"] =  3500,
["Exeggute"] =  850,
["Exeggutor"] =  3500,
["Cubone"] =  1000,
["Marowak"] =  5700,
["Hitmonlee"] =  6000,
["Hitmonchan"] =  6000,
["Lickitung"] =  5000,
["Koffing"] =  300,
["Weezing"] =  6000,
["Rhyhorn"] =  1000,
["Rhydon"] =  7400,
["Chansey"] =  24000,
["Tangela"] =  1600,
["Kangaskhan"] = 4740,
["Horsea"] =  200,
["Seadra"] =  2600,
["Goldeen"] =  200,
["Seaking"] =  2300,
["Staryu"] =  1100,
["Starmie"] =  4360,
["Mr. Mime"] =  5950,
["Scyther"] =  1700,
["Jynx"] =  5950,
["Electabuzz"] =  4950,
["Magmar"] =  4950,
["Pinsir"] =  4769,
["Tauros"] =  4759,
["Magikarp"] =  5,
["Gyarados"] =  8500,
["Lapras"] =  6780,
["Ditto"] =  70000,
["Eevee"] =  1500,
["Vaporeon"] =  6700,
["Jolteon"] =  6700,
["Flareon"] =  6700,
["Porygon"] =  2689,
["Omanyte"] =  1100,
["Omastar"] =  6666,
["Kabuto"] =  1100,
["Kabutops"] =  6666,
["Aerodactyl"] =  7840,
["Snorlax"] =  7600,
["Dratini"] =  1600,
["Dragonair"] =  3700,
["Dragonite"] =  12000,
 
-- Segunda Geração

["Chikorita"] = 1000,
["Bayleef"] = 5000,
["Cydaquil"] = 1000,
["Quilava"] = 5000,
["Typhlosion"] = 7000,
["Totodile"] = 1000,
["Croconaw"] = 5000,
["Feraligatr"] = 7000,
["Sentret"] = 950,
["Furret"] = 3000,
["Hoothoot"] = 1500,
["Noctowl"] = 5800,
["Ledyba"] = 560,
["Ledian"] = 1970,
["Spinarak"] = 250,
["Ariados"] = 2600,
["Crobat"] = 4850,
["Chinchou"] = 1000,
["Lanturn"] = 4900,
["Pichu"] = 500,
["Cleffa"] = 500,
["Igglybuff"] = 500,
["Togepi"] = 1500,
["Togetic"] = 2700,
["Natu"] = 1900,
["Xatu"] = 3750,
["Mareep"] = 1000,
["Flaaffy"] = 3750,
["Ampharos"] = 7450,
["Bellossom"] = 5000,
["Marill"] = 1000,
["Azumarill"] = 5000,
["Sudowoodo"] = 6350,
["Politoed"] = 6000,
["Hoppip"] = 80,
["Skiploom"] = 666,
["Jumpluff"] = 4560,
["Aipom"] = 4600,
["Sunkern"] = 500,
["Sunflora"] = 3100,
["Yanma"] = 2300,
["Wooper"] = 1200,
["Quagsire"] = 4950,
["Espeon"] = 4590,
["Umbreon"] = 4590,
["Murkrow"] = 1000,
["Slowking"] = 6500,
["Misdreavus"] = 2600,
["Wobbuffet"] = 7850,
["Girafarig"] = 7300,
["Pineco"] = 300,
["Forretress"] = 2100,
["Dunsparce"] = 1000,
["Gligar"] = 2600,
["Steelix"] = 8690,
["Snubbull"] = 1600,
["Granbull"] = 6499,
["Qwilfish"] = 4051,
["Scizor"] = 5650,
["Shuckle"] = 2100,
["Heracross"] = 5000,
["Sneasel"] = 2300,
["Teddiursa"] = 1400,
["Ursaring"] = 7600,
["Slugma"] = 1700,
["Magcargo"] = 7800,
["Swinub"] = 2100,
["Piloswine"] = 4650,
["Corsola"] = 3400,
["Remoraid"] = 200,
["Octillery"] = 3800,
["Delibird"] = 4200,
["Mantine"] = 1500,
["Skarmory"] = 5600,
["Houndour"] = 1800,
["Houndoom"] = 6800,
["kingdra"] = 7650,
["Phanpy"] = 1200,
["Donphan"] = 6000,
["Porygon2"] = 5100,
["Stantler"] = 3650,
["Tyrogue"] = 1000,
["Hitmontop"] = 6000,
["Smoochum"] = 1000,
["Elikid"] = 1000,
["Magby"] = 1000,
["Miltank"] = 4600,
["Blissey"] = 9050,
["Larvitar"] = 1950,
["Pupitar"] = 3170,
["Tyranitar"] = 12000,
["Togekiss"] = 12000,
["Armaldo"] = 6750,
-- shiny --
["Shiny Fearow"] = 100000,
["Shiny Vileplume"] = 100000,
["Shiny Golem"] = 120000,
["Shiny Nidoking"] = 110000,
["Shiny Hypno"] = 120000,
["Shiny Vaporeon"] = 100000,
["Shiny Jolteon"] = 100000,
["Shiny Flareon"] = 100000,
["Shiny Hitmontop"] = 110000,
["Shiny Lucario"] = 190000,
["Shiny Ludicolo"] = 100000,
["Shiny Houndoom"] = 100000,
["Shiny Metagross"] = 190000,
["Shiny Milotic"] = 160000,
["Shiny Tangrowth"] = 180000,
["Shiny Tropius"] = 180000,
["Shiny Miltank"] = 110000,
["Shiny Scizor"] = 150000,
["Shiny Kabutops"] = 110000,
["Shiny Rapidash"] = 120000,
["Poochyena"] = 650,
["Mightyena"] = 3260,
["Zigzagoon"] = 650,
["Linoone"] = 3260,
["Wurmple"] = 20,
["Silcoon"] = 300,
["Beautifly"] = 3140,
["Cascoon"] = 300,
["Dustox"] = 3140,
["Lotad"] = 700,
["Lombre"] = 2600,
["Ludicolo"] = 6450,
["Seedot"] = 700,
["Nuzleaf"] = 2600,
["Shiftry"] = 7600,
["Taillow"] = 200,
["Swellow"] = 3100,
["Wingull"] = 200,
["Pelipper"] = 3600,
["Ralts"] = 1000,
["Kirlia"] = 3500,
["Gardevoir"] = 8000,
["Surskit"] = 1000,
["Masquerain"] = 3600,
["Shroomish"] = 200,
["Breloom"] = 2300,
["Slakoth"] = 600,
["Vigoroth"] = 3100,
["Slaking"] = 6520,
["Nincada"] = 1000,
["Ninjask"] = 2350,
["Shedinja"] = 6240,
["Whismur"] = 600,
["Loudred"] = 4200,
["Exploud"] = 7750,
["Makuhita"] = 800,
["Hariyama"] = 6400,
["Azurill"] = 900,
["Nosepass"] = 2600,
["Skitty"] = 1000,
["Delcatty"] = 3900,
["Sableye"] = 6700,
["Mawile"] = 2600,
["Aron"] = 720,
["Lairon"] = 2540,
["Aggron"] = 6050,
["Meditite"] = 1800,
["Medicham"] = 3600,
["Electrike"] = 1800,
["Manectric"] = 6450,
["Plusle"] = 1500,
["Minun"] = 1500,
["Volbeat"] = 1800,
["Illumise"] = 1800,
["Roselia"] = 1400,
["Gulpin"] = 1200,
["Swalot"] = 2600,
["Carvanha"] = 1000,
["Sharpedo"] = 4650,
["Wailmer"] = 1100,
["Wailord"] = 7640,
["Numel"] = 1150,
["Camerupt"] = 6410,
["Torkoal"] = 2600,
["Spoink"] = 1230,
["Grumpig"] = 3250,
["Spinda"] = 1200,
["Trapinch"] = 1100,
["Vibrava"] = 3100,
["Flygon"] = 8600,
["Cacnea"] = 1340,
["Cacturne"] = 4610,
["Swablu"] = 1750,
["Altaria"] = 5430,
["Zangoose"] = 6500,
["Seviper"] = 6500,
["Lunatone"] = 6500,
["Solrock"] = 6500,
["Barboach"] = 600,
["Whiscash"] = 2900,
["Corphish"] = 600,
["Crawdaunt"] = 2900,
["Baltoy"] = 1100,
["Claydol"] = 6400,
["Lileep"] = 1000,
["Cradily"] = 3600,
["Anorith"] = 1200,
["Armaldo"] = 6740,
["Feebas"] = 1900,
["Milotic"] = 8300,
["Castform"] = 10000,
["Kecleon"] = 4550,
["Shuppet"] = 120,
["Duskull"] = 1623,
["Dusclops"] = 3670,
["Chimecho"] = 3000,
["Snorunt"] = 1300,
["Spheal"] = 1620,
["Sealeo"] = 2610,
["Walrein"] = 6750,
["Clamperl"] = 1000,
["Huntail"] = 3500,
["Gorebyss"] = 3500,
["Relicanth"] = 3480,
["Luvdisc"] = 3000,
["Turtwig"] = 1000,
["Grotle"] = 5000,
["Torterra"] = 7000,
["Chimchar"] = 1000,
["Monferno"] = 5000,
["Infernape"] = 7000,
["Piplup"] = 1000,
["Prinplup"] = 5000,
["Empoleon"] = 7000,
["Starly"] = 800,
["Staravia"] = 2100,
["Staraptor"] = 5600,
["Bidoof"] = 200,
["Bibarel"] = 2600,
["Kricketot"] = 300,
["Kricketune"] = 3200,
["Shinx"] = 800,
["Luxio"] = 1600,
["Luxray"] = 6800,
["Budew"] = 800,
["Roserade"] = 6789,
["Cranidos"] = 1600,
["Rampardos"] = 5100,
["Shieldon"] = 1600,
["Bastiodon"] = 5100,
["Burmy"] = 300,
["Wormadam"] = 3510,
["Mothim"] = 4520,
["Combee"] = 3000,
["Vespiquen"] = 3100,
["Pachirisu"] = 4600,
["Buizel"] = 1100,
["Floatzel"] = 4970,
["Cherubi"] = 640,
["Cherrim"] = 4375,
["Shellos"] = 1110,
["Gastrodon"] = 6400,
["Ambipom"] = 3200,
["Drifloon"] = 700,
["Drifblim"] = 6800,
["Buneary"] = 500,
["Lopunny"] = 4760,
["Mismagius"] = 7650,
["Glameow"] = 600,
["Purugly"] = 4320,
["Chingling"] = 2340,
["Stunky"] = 700,
["Skuntank"] = 4650,
["Bronzor"] = 1250,
["Bronzong"] = 6480,
["Bonsly"] = 1200,
["Mime Jr."] = 1200,
["Happiny"] = 1200,
["Chatot"] = 3690,
["Spiritomb"] = 7640,
["Gible"] = 1850,
["Gabite"] = 3650,
["Garchomp"] = 8670,
["Munchlax"] = 1200,
["Riolu"] = 2000,
["Hippopotas"] = 1400,
["Hippowdon"] = 3500,
["Skorupi"] = 1100,
["Drapion"] = 6520,
["Croagunk"] = 2510,
["Shiny Azumarill"] = 100000,
["Carnivine"] = 14000,
["Finneon"] = 6000,
["Lumineon"] = 14000,
["Mantyke"] = 6000,
["Snover"] = 8000,
["Abomasnow"] = 18000,
["Weavile"] = 17000,
["Lickilicky"] = 16000,
["Yanmega"] = 16000,
["Magnezone"] = 16000,
["Rhyperior"] = 16000,
["Tangrowth"] = 16000,
["Electivire"] = 16000,
["Magmortar"] = 16000,
["Togekiss"] = 16000,
["Leafeon"] = 16000,
["Glaceon"] = 16000,
["Gliscor"] = 16000,
["Mamoswine"] = 16000,
["Porygonz"] = 16000,
["Gallade"] = 16000,
["Probopass"] = 16000,
["Rotom"] = 16000,
["Megenium"] = 7000,
}
local gastostones = {
[0] = 0,
[1] = 1,
[2] = 2,
[3] = 3,
[4] = 4,
[5] = 6,
[6] = 8,
[7] = 10,
[8] = 12,
[9] = 15,
[10] = 18,
[11] = 21,
[12] = 24,
[13] = 28,
[14] = 32,
[15] = 36,
[16] = 40,
[17] = 45,
[18] = 50,
[19] = 55,
[20] = 60,
[21] = 66,
[22] = 72,
[23] = 78,
[24] = 84,
[25] = 91,
[26] = 98,
[27] = 105,
[28] = 112,
[29] = 120,
[30] = 128,
[31] = 136,
[32] = 144,
[33] = 153,
[34] = 162,
[35] = 171,
[36] = 180,
[37] = 190,
[38] = 200,
[39] = 210,
[40] = 220,
[41] = 231,
[42] = 242,
[43] = 253,
[44] = 264,
[45] = 276,
[46] = 288,
[47] = 300,
[48] = 312,
[49] = 325,
[50] = 338,
}
function sellPokemon(cid, name, price)

	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    if #getCreatureSummons(cid) >= 1 then
       selfSay("Volte seu pokemon para fazer isso!")
       focus = 0                                --alterado v1.8
       return true
    end
    local storages = {17000, 63215, 17001, 13008, 5700}   --alterado v1.8
    for s = 1, #storages do
        if getPlayerStorageValue(cid, storages[s]) >= 1 then
           selfSay("Você não pode fazer isso enquanto está voando, equitação, surf, mergulho ou montar uma bicicleta!") 
           focus = 0 
           return true
        end
    end
    if getPlayerSlotItem(cid, 8).uid ~= 0 then 
	local boosts = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "boost") or 0
		local precocertos = ((gastostones[boosts] * 10) * 100000)
       if string.lower(getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) == string.lower(name) then
          if not getItemAttribute(getPlayerSlotItem(cid, 8).uid, "unique") then  --alterado v1.6
             selfSay("Uau! Obrigado por este maravilhoso "..name.."! Leve o seu "..price.." Dólares Gostaria de vender outro pokemon?")
             doPlayerAddMoney(cid, (price * 100) + precocertos)
			 doRemoveItem(getPlayerSlotItem(cid, 8).uid, 1)              --alterado v1.6
             doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
             return true
          end
       end
    end   
       
	for a, b in pairs(pokeballs) do
		local balls = getItemsInContainerById(bp.uid, b.on)
		for _, ball in pairs (balls) do
			local boost = getItemAttribute(ball, "boost") or 0
	local precocerto = ((gastostones[boost] * 5) * 100000)
			if string.lower(getItemAttribute(ball, "poke")) == string.lower(name) then
				if not getItemAttribute(ball, "unique") then --alterado v1.6
                   selfSay("Uau! Obrigado por este maravilhoso "..getItemAttribute(ball, "poke").."! Leve o seu "..price.." Dólares Gostaria de vender outro pokemon?")
				   				   doPlayerAddMoney(cid, (price * 100) + precocerto)
				   doRemoveItem(ball, 1)
	               return true
                end
			end
		end
	end

	selfSay("Você não tem um "..name..", Certifique-se que está em sua mochila e não está desmaiado e não está em uma bola única!")  --alterado v1.6
return false
end

function onCreatureSay(cid, type, msg)

	local msg = string.lower(msg)

	if string.find(msg, "!") or string.find(msg, ",") then
	return true
	end

	if focus == cid then
		talk_start = os.clock()
	end

	if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
		selfSay('Bem vindo a minha loja! Eu compro pokemons de todas as espécies, basta me dizer o nome do pokemon que você quer vender.')
		focus = cid
		conv = 1
		talk_start = os.clock()
		cost = 0
		pname = ""
	return true
	end

	if msgcontains(msg, 'bye') and focus == cid then
		selfSay('See you around then!')
		focus = 0
	return true
	end

	if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
		selfSay('Diga-me o nome do pokemon que você gostaria de vender.')
		conv = 1
	return true
	end

	if msgcontains(msg, 'no') and conv == 4 and focus == cid then
		selfSay('Ok, vejo você por aí então!')
		focus = 0
	return true
	end

	local common = {"rattata", "caterpie", "weedle", "magikarp"}

	if conv == 1 and focus == cid then
		for a = 1, #common do
			if msgcontains(msg, common[a]) then
				selfSay('Eu não compro um pokemon tão comum!')
			return true
			end
		end
	end

	if msgcontains(msg, 'no') and conv == 3 and focus == cid then
		selfSay('Bem, então que pokémon você gostaria de vender?')
		conv = 1
	return true
	end

	if (conv == 1 or conv == 4) and focus == cid then
		local name = doCorrectPokemonName(msg)
		local pokemon = pokes[name]
		if not pokemon then
			selfSay("Desculpe, eu não sei de qual pokemon você está falando! Tem certeza de que escreveu corretamente?")
		return true
		end

        baseprice = pokePrice[name] or math.floor(pokemon.level * 150)  --alterado v1.6

        cost = baseprice
        pname = name
        selfSay("Tem certeza de que deseja vender um "..name.." para "..cost.." Dólares + boost?")
        conv = 3       
	end

	if isConfirmMsg(msg) and focus == cid and conv == 3 then
		if sellPokemon(cid, pname, cost) then
			conv = 4
		else
			conv = 1
		end
	return true
	end

end

local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Compro Pokemons,mo brisa",
		  "Compro Pokemons",
		 }

function onThink()

	if focus == 0 then
		selfTurn(1)
			delay = delay - 0.5
			if delay <= 0 then
				selfSay(messages[number])
				number = number + 1
					if number > #messages then
						number = 1
					end
				delay = math.random(intervalmin, intervalmax)
			end
		return true
	else

	if not isCreature(focus) then
		focus = 0
	return true
	end

		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)

		if npcpos.z ~= focpos.z then
			focus = 0
		return true
		end
		if (os.clock() - talk_start) > 70 then
			focus = 0
			selfSay("Quando Quiser me Vender ele é so Vim Comigoo!")
		end

		if getDistanceToCreature(focus) > 3 then
			selfSay("Falooow, é o crime e nois")
			focus = 0
		return true
		end

		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end


return true
end 