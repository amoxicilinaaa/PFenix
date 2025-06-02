local shinys = {
"Venusaur", "Venonat", "Venomoth", "Tropius", "Togekiss", "Tangrowth", "Swellow", "Swampert", "Stantler", "Scizor", "Sceptile", "Sandslash", "Rapidash", "Politoed", "Oddish", "Ninetales", "Nidoking", "Muk", "Miltank", "Milotic", "Metagross", "Magneton", "Magmortar", "Magikarp", "Magcargo", "Machamp", "Ludicolo", "Lucario", "Larvitar", "Lanturn", "Kingdra", "Kabutops", "Grimer", "Flygon", "Flareon", "Fearow", "Dodrio", "Ariados", "Aggron", "Blastoise", "Butterfree", "Beedrill", "Pidgeot", "Rattata", "Raticate", "Raichu", "Golbat", "Paras", "Parasect", "Magmar", "Typhlosion", "Xatu", "Growlithe", "Arcanine", "Tentacruel", "Farfetch'd", "Krabby", "Tauros", 
"Kingler", "Cubone", "Zeraora", "Gengar", "Horsea", "Seadra", "Weezing", "Hydreigon", "Scyther", "Pinsir", "Crobat", "Zubat", "Tentacool", "Feraligatr", "Machamp", "Tangela", "Ampharos", "Electabuzz", "Jynx", "Charizard", "Voltorb", "Electrode", "Blaziken"}

local raros = {"Dragonair"}                               

local function ShinyName(cid)
if isCreature(cid) then
   if string.find(tostring(getCreatureName(cid)), "Shiny") then
      local newName = tostring(getCreatureName(cid)):match("(.*)")          
      doCreatureSetNick(cid, newName)
      if isMonster(cid) then
         doSetCreatureDropLoot(cid, false)  
      end
   end
end
end

local function doSetRandomGender(cid)
	if not isCreature(cid) then return true end
	if isSummon(cid) then return true end
	local gender = 0
	local name = getCreatureName(cid)
	if not newpokedex[name] then return true end
	local rate = newpokedex[name].gender
		if rate == 0 then
			gender = 3
		elseif rate == 500 then
			gender = 4
		elseif rate == -1 then
			gender = 2
		elseif math.random(1, 500) <= rate then
			gender = 4
		else
			gender = 3
		end
	doCreatureSetSkullType(cid, gender)
end

local function doShiny(cid)
if isCreature(cid) then
   if isSummon(cid) then return true end
   if getPlayerStorageValue(cid, 74469) >= 1 then return true end
   if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
   if isNpcSummon(cid) then return true end
   if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v1.9
   
if isInArray(shinys, getCreatureName(cid)) then  --alterado v1.9 \/
   chance = 2    --1% chance        
elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
   chance = 1   --1% chance       
else
   return true
end    
    if math.random(1, 500) <= chance*10 then  
      doSendMagicEffect(getThingPos(cid), 18)               
      local name, pos = "Shiny ".. getCreatureName(cid), getThingPos(cid)
      doRemoveCreature(cid)
      local shi = doCreateMonster(name, pos, false)
      setPlayerStorageValue(shi, 74469, 1)      
   else
       setPlayerStorageValue(cid, 74469, 1)
   end                                        --/\
else                                                            
return true
end
end

function onSpawn(cid)

    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "DirectionSystem")
	registerCreatureEvent(cid, "CastSystem")
	
	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
	return true
	end
	
	addEvent(doShiny, 10, cid)
	addEvent(ShinyName, 15, cid)
	addEvent(adjustWildPoke, 5, cid)

return true
end