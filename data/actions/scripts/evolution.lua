local special = specialevo                  --alterado v1.9 \/ peguem ele todo!
 
local types = {
[leaf] = {"Bulbasaur", "Ivysaur", "Oddish", "Gloom", "Bellsprout", "Weepinbell", "Exeggcute", "Chikorita", "Bayleef", "Hoppip", "Skiploom", "Sunkern"},
[water] = {"Squirtle", "Clamperl", "Wartortle", "Horsea", "Goldeen", "Magikarp", "Psyduck", "Poliwag", "Poliwhirl", "Tentacool", "Krabby", "Staryu", "Omanyte", "Eevee", "Totodile", "Croconow", "Chinchou", "Marill", "Wooper", "Slowpoke", "Remoraid", "Seadra"},
[venom] = {"Zubat", "Ekans", "Nidoran male", "Nidoran female", "Nidorino", "Nidorina", "Gloom", "Venonat", "Tentacool", "Grimer", "Koffing", "Spinarak", "Golbat"},
[thunder] = {"Magnemite", "Pikachu", "Voltorb", "Eevee", "Chinchou", "Pichu", "Mareep", "Flaaffy", "Elekid"},
[rock] = {"Geodude", "Graveler", "Rhyhorn", "Kabuto", "Slugma", "Pupitar"},
[punch] = {"Machop", "Machoke", "Mankey", "Poliwhirl", "Tyrogue"},
[fire] = {"Charmander", "Charmeleon", "Vulpix", "Growlithe", "Ponyta", "Eevee", "Cyndaquil", "Quilava", "Slugma", "Houndour", "Magby"},
[coccon] = {"Caterpie", "Metapod", "Weedle", "Kakuna", "Paras", "Venonat", "Scyther", "Ledyba", "Spinarak", "Pineco"},
[crystal] = {"Dratini", "Dragonair", "Magikarp", "Omanyte", "Kabuto", "Seadra"},
[dark] = {"Gastly", "Haunter", "Eevee", "Houndour", "Pupitar"},
[earth] = {"Cubone", "Sandshrew", "Nidorino", "Nidorina", "Diglett", "Onix", "Rhyhorn", "Wooper", "Swinub", "Phanpy", "Larvitar"},
[enigma] = {"Abra", "Kirlia", "Kadabra", "Psyduck", "Slowpoke", "Drowzee", "Eevee", "Natu", "Smoochum"},
[heart] = {"Rattata", "Pidgey", "Pidgeotto", "Spearow", "Clefairy", "Jigglypuff", "Meowth", "Doduo", "Porygon", "Chansey", "Sentret", "Hoothoot", "Cleffa", "Igglybuff", "Togepi", "Snubull", "Teddiursa"},
[ice] = {"Seel", "Shellder", "Smoochum", "Swinub"},
[metal] = {"Onix", "Scyther"},
[dragon] = {"venusaur", "Ampharos"},
[mega] = {"Charizard", "Shiny Charizard"},
[ancient] = {"Sunkern", "Gloom", "Slowpoke", "Poliwhirl", "Seadra", "Porygon"},
[sfire] = {"Shiny Charmander", "Shiny Charmeleon", "Shiny Magmortar", "Shiny Vulpix", "Shiny Growlithe", "Shiny Ponyta", "Shiny Eevee"},
[swater] = {"Shiny Squirtle", "Shiny Wartortle", "Shiny Horsea", "Shiny Goldeen", "Shiny Magikarp", "Shiny Psyduck", "Shiny Poliwag", "Shiny Poliwhirl", "Shiny Tentacool", "Shiny Krabby", "Shiny Staryu", "Shiny Omanyte", "Shiny Eevee"},
[sleaf] = {"Shiny Bulbasaur", "Shiny Ivysaur", "Shiny Oddish", "Shiny Gloom", "Shiny Bellsprout", "Shiny Weepinbell", "Shiny Exeggcute"},
[sheart] = {"Shiny Rattata", "Shiny Pidgey", "Shiny Pidgeotto", "Shiny Spearow", "Shiny Clefairy", "Shiny Jigglypuff", "Shiny Meowth", "Shiny Doduo", "Shiny Porygon", "Shiny Chansey"},
[senigma] = {"Shiny Abra", "Shiny Kadabra", "Shiny Psyduck", "Shiny Slowpoke", "Shiny Drowzee", "Shiny Eevee"},
[srock] = {"Shiny Geodude", "Shiny Graveler", "Shiny Rhyhorn", "Shiny Kabuto"},
[svenom] = {"Shiny Zubat", "Shiny Ekans", "Shiny Nidoran male", "Shiny Nidoran female", "Shiny Nidorino", "Shiny Nidorina", "Shiny Gloom", "Shiny Venonat", "Shiny Tentacool", "Shiny Grimer", "Shiny Koffing"},
[sice] = {"Shiny Seel", "Shiny Shellder"},
[sthunder] = {"Shiny Magnemite", "Shiny Pikachu", "Shiny electivire", "Shiny Voltorb", "Shiny Eevee"},
[scrystal] = {"Shiny Dratini", "Shiny Dragonair", "Shiny Magikarp", "Shiny Omanyte", "Shiny Kabuto"},
[scoccon] = {"Shiny Caterpie", "Shiny Metapod", "Shiny Weedle", "Shiny Kakuna", "Shiny Paras", "Shiny Venonat", "Shiny Scyther"},
[sdarkness] = {"Shiny Gastly", "Shiny Haunter", "Shiny Eevee"},
[spunch] = {"Shiny Machop", "Shiny Machoke", "Shiny Mankey", "Shiny Poliwhirl"},
[searth] = {"Shiny Cubone", "Shiny Sandshrew", "Shiny Nidorino", "Shiny Nidorina", "Shiny Diglett", "Shiny Onix", "Shiny Rhyhorn"},
[virus] = {"Virus Alakazam", "Virus Zoroark", "Virus Aron", "Virus Blastoise", "Virus Blissey", "Virus Caterpie", "Virus Dragonite", "Virus Eevee", "Virus Ekans", "Virus Electivire", "Virus Flygon", "Virus Gastly", "Virus Geodude", "Virus Gyarados", "Virus Lucario", "Virus Machamp", "Virus Machop", "Virus Magikarp", "Virus Magmortar", "Virus Magnezone", "Virus Metagross", "Virus Oddish", "Virus Pidgey", "Virus Pineco", "Virus Poliwag", "Virus Rhydon", "Virus Salamence", "Virus Slaking", "Virus Steelix", "Virus Togekiss", "Virus Tyranitar", "Virus Venusaur", "Virus Voltorb", "Virus Vulpix", "Virus Wooper", "Virus Zubat"},
[glice] = {"Mamoswine"},
[green] = {"Tangrowth"},
[mag] = {"Magmortar"},
[electri] = {"Electivire"},
[perior] = {"Rhyperior"},
[kiss] = {"Togekiss"},
[zone] = {"Magnezone"},
[gladi] = {"Dusknoir"},
[llade] = {"Gallade"},
[scor] = {"Gliscor"},
[licky] = {"Lickilicky"},
[poryz] = {"Porygon-z"},
[probo] = {"Probopass"},
[wea] = {"Weavile"},
[yanm] = {"Yanmega"},
[fros] = {"Froslass"},
[special] = {"Shinys"},
[superice] = {"Ice Alakazam"},
[superdarkness] = {"Dark Gardevoir"},
[superfire] = {"Fire Tyranitar"},
[superwater] = {"Water Dragonite"},
}
 
local specEvos = {   --alterado v1.9 \/
["Eevee"] = {
               [thunder] = "Jolteon",
               [water] = "Vaporeon",
               [fire] = "Flareon",
               [enigma] = "Espeon",
               [dark] = "Umbreon",
               [leaf] = "Leafeon",
               [ice] = "Glaceon",
               [virus] = "Virus Eevee",
            },
["Gloom"] = {
               [venom] = "Vileplume",
               [leaf] = "Bellossom",
            },
["Burmy"] = {
               [leaf] = "Wormadam",
               [heart] = "Mothim",
            },
["Kirlia"] = {
               [llade] = "Gallade",
               [enigma] = "Gardevoir",
            },
["Clamperl"] = {
               [dark] = "Huntail",
               [heart] = "Gorebyss",
            },
["Wurmple"] = {
               [heart] = "Silcoon",
               [venom] = "Cascoon",
            },
["Rhydon"] = {
               [virus] = "Virus Rhydon",
               [shiny] = "Shiny Rhydon",
               [perior] = "Rhyperior",
            },
["Venusaur"] = {
               [virus] = "Virus Venusaur",
               [shiny] = "Shiny Venusaur",
            },
["Alakazam"] = {
               [virus] = "Virus Alakazam",
               [shiny] = "Shiny Alakazam",
               [superice] = "Ice Alakazam",
            },
["Blastoise"] = {
               [virus] = "Virus Blastoise",
               [shiny] = "Shiny Blastoise",
            },
["Electivire"] = {
               [virus] = "Virus Electivire",
               [shiny] = "Shiny Electivire",
            },
["Flygon"] = {
               [virus] = "Virus Flygon",
               [shiny] = "Shiny Flygon",
            },
["Gastly"] = {
               [virus] = "Virus Gastly",
               [dark] = "Haunter",
            },
["Geodude"] = {
               [virus] = "Virus Geodude",
               [rock] = "Graveler",
            },
["Gyarados"] = {
               [virus] = "Virus Gyarados",
               [shiny] = "Shiny Gyarados",
            },
["Lucario"] = {
               [virus] = "Virus Lucario",
               [shiny] = "Shiny Lucario",
            },
["Machamp"] = {
               [virus] = "Virus Machamp",
               [shiny] = "Shiny Machamp",
            },
["Machop"] = {
               [virus] = "Virus Machop",
               [punch] = "Machoke",
            },
["Magikarp"] = {
               [virus] = "Virus Magikarp",
               [shiny] = "Shiny Magikarp",
               [crystal] = "Gyarados",
            },
["Magmortar"] = {
               [virus] = "Virus Magmortar",
               [shiny] = "Shiny Magmortar",
            },
["Metagross"] = {
               [virus] = "Virus Metagross",
               [shiny] = "Shiny Metagross",
            },
["Oddish"] = {
               [leaf] = "Gloom",
               [virus] = "Virus Oddish",
               [shiny] = "Shiny Oddish",
            },
["Pidgey"] = {
               [heart] = "Pidgeotto",
               [virus] = "Virus Pidgey",
            },
["Pineco"] = {
               [coccon] = "Forretress",
               [virus] = "Virus Pineco",
            },
["Poliwag"] = {
               [water] = "Poliwhirl",
               [virus] = "Virus Poliwag",
            },
["Salamence"] = {
               [shiny] = "Shiny Salamence",
               [virus] = "Virus Salamence",
            },
["Steelix"] = {
               [shiny] = "Shiny Steelix",
               [virus] = "Virus Steelix",
            },
["Togekiss"] = {
               [shiny] = "Shiny Togekiss",
               [virus] = "Virus Togekiss",
            },
["Voltorb"] = {
               [thunder] = "Electrode",
               [shiny] = "Shiny Voltorb",
               [virus] = "Virus Voltorb",
            },
["Vulpix"] = {
               [fire] = "Ninetales",
               [virus] = "Virus Vulpix",
            },
["Wooper"] = {
               [earth] = "Quagsire",
               [virus] = "Virus Wooper",
            },
["Zubat"] = {
               [venom] = "Golbat",
               [shiny] = "Shiny Zubat",
               [virus] = "Virus Zubat",
            },
["Aron"] = {
               [rock] = "Lairon",
               [virus] = "Virus Aron",
            },
["Caterpie"] = {
               [coccon] = "Metapod",
               [virus] = "Virus Caterpie",
            },
["Ekans"] = {
               [venom] = "Arbok",
               [virus] = "Virus Ekans",
            },
["Abra"] = {
               [enigma] = "Kadabra",
               [shiny] = "Shiny Abra",
            },
["Cubone"] = {
               [earth] = "Marowak",
               [shiny] = "Shiny Cubone",
            },
["Dragonair"] = {
               [crystal] = "Dragonite",
               [shiny] = "Shiny Dragonair",
            },
["Dratini"] = {
               [crystal] = "Dragonair",
               [shiny] = "Shiny Dratini",
            },
["Electabuzz"] = {
               [electri] = "Electivire",
               [shiny] = "Shiny Electabuzz",
            },
["Golbat"] = {
               [venom] = "Crobat",
               [shiny] = "Shiny Golbat",
            },
["Grimer"] = {
               [venom] = "Muk",
               [shiny] = "Shiny Grimer",
            },
["Growlithe"] = {
               [fire] = "Arcanine",
               [shiny] = "Shiny Growlithe",
            },
["Horsea"] = {
               [water] = "Seadra",
               [shiny] = "Shiny Horsea",
            },
["Krabby"] = {
               [water] = "Kingler",
               [shiny] = "Shiny Krabby",
            },
["Larvitar"] = {
               [earth] = "Pupitar",
               [shiny] = "Shiny Larvitar",
            },
["Magmar"] = {
               [mag] = "Magmortar",
               [shiny] = "Shiny Magmar",
            },
["Magneton"] = {
               [zone] = "Magnezone",
               [shiny] = "Shiny Magneton",
            },
["Onix"] = {
               [metal] = "Steelix",
               [shiny] = "Shiny Onix",
            },
["Paras"] = {
               [coccon] = "Parasect",
               [shiny] = "Shiny Paras",
            },
["Rattata"] = {
               [heart] = "Raticate",
               [shiny] = "Shiny Rattata",
            },
["Scyther"] = {
               [coccon] = "Scizor",
               [shiny] = "Shiny Scyther",
            },
["Seadra"] = {
               [crystal] = "Kingdra",
               [shiny] = "Shiny Seadra",
            },
["Tangela"] = {
               [green] = "Tangrowth",
               [shiny] = "Shiny Tangela",
            },
["Tentacool"] = {
               [venom] = "Tentacruel",
               [shiny] = "Shiny Tentacool",
            },
["Venonat"] = {
               [venom] = "Venomoth",
               [shiny] = "Shiny Venonat",
            },
["Snorunt"] = {
               [ice] = "Glalie",
               [fros] = "Froslass",
            },
["Dusclops"] = {
               [gladi] = "Dusknoir",
            },
["Dragonite"] = {
               [shiny] = "Shiny Dragonite",
               [virus] = "Virus Dragonite",
               [superwater] = "Water Dragonite",
            },
["Gardevoir"] = {
               [shiny] = "Shiny Gardevoir",
               [superdarkness] = "Dark Gardevoir",
            },
["Tyranitar"] = {
               [virus] = "Virus Tyranitar",
               [superfire] = "Fire Tyranitar",
            },
["Zoroark"] = {
               [virus] = "Virus Zoroark",
            },
}
 
function onUse(cid, item, frompos, item2, topos)
 
    if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
      doPlayerSendCancel(cid, "Você não pode evoluir o pokemon de outra pessoa.")
      return true
   end
 
 
local pokeball = getPlayerSlotItem(cid, 8)
 
if not isMonster(item2.uid) or not isSummon(item2.uid) then
   return true
end
if #getCreatureSummons(cid) > 1 then
   return true                           --alterado v1.9
end
 
if getCreatureCondition(item2.uid, CONDITION_INVISIBLE) then return true end
 
local pevo = poevo[getCreatureName(item2.uid)]
 
if not isInArray(specialevo, getCreatureName(item2.uid)) then
   if not pevo then
      doPlayerSendCancel(cid, "This pokemon can't evolve.")
      return true
   end
   -- if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
      -- doPlayerSendCancel(cid, "Você não pode evoluir o pokemon de outra pessoa.")
      -- return true
   -- end
   if pevo.stoneid ~= item.itemid and pevo.stoneid2 ~= item.itemid then
      doPlayerSendCancel(cid, "This isn't the needed stone to evolve this pokemon.")
      return true
   end
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Eevee" then
   local eevee = specEvos["Eevee"][item.itemid]
   if not eevee then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[eevee].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, eevee, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Venonat" then
   local venonat = specEvos["Venonat"][item.itemid]
   if not venonat then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[venonat].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, venonat, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Dusclops" then
   local dusclops = specEvos["Dusclops"][item.itemid]
   if not dusclops then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[dusclops].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, dusclops, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Tyranitar" then
   local tyranitar = specEvos["Tyranitar"][item.itemid]
   if not tyranitar then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[tyranitar].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, tyranitar, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Gardevoir" then
   local gardevoir = specEvos["Gardevoir"][item.itemid]
   if not gardevoir then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[gardevoir].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gardevoir, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Dragonite" then
   local dragonite = specEvos["Dragonite"][item.itemid]
   if not dragonite then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[dragonite].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, dragonite, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Tentacool" then
   local tentacool = specEvos["Tentacool"][item.itemid]
   if not tentacool then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[tentacool].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, tentacool, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Tangela" then
   local tangela = specEvos["Tangela"][item.itemid]
   if not tangela then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[tangela].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, tangela, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Seadra" then
   local seadra = specEvos["Seadra"][item.itemid]
   if not seadra then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[seadra].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, seadra, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Onix" then
   local onix = specEvos["Onix"][item.itemid]
   if not onix then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[onix].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, onix, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Scyther" then
   local scyther = specEvos["Scyther"][item.itemid]
   if not scyther then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[scyther].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, scyther, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Rattata" then
   local rattata = specEvos["Rattata"][item.itemid]
   if not rattata then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[rattata].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, rattata, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Paras" then
   local paras = specEvos["Paras"][item.itemid]
   if not paras then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[paras].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, paras, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Larvitar" then
   local larvitar = specEvos["Larvitar"][item.itemid]
   if not larvitar then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[larvitar].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, larvitar, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Magmar" then
   local magmar = specEvos["Magmar"][item.itemid]
   if not magmar then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[magmar].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, magmar, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Magneton" then
   local magneton = specEvos["Magneton"][item.itemid]
   if not magneton then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[magneton].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, magneton, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Krabby" then
   local krabby = specEvos["Krabby"][item.itemid]
   if not krabby then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[krabby].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, krabby, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Rhydon" then
   local rhydon = specEvos["Rhydon"][item.itemid]
   if not rhydon then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[rhydon].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, rhydon, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Horsea" then
   local horsea = specEvos["Horsea"][item.itemid]
   if not horsea then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[horsea].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, horsea, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Growlithe" then
   local growlithe = specEvos["Growlithe"][item.itemid]
   if not growlithe then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[growlithe].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, growlithe, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Grimer" then
   local grimer = specEvos["Grimer"][item.itemid]
   if not grimer then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[grimer].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, grimer, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Golbat" then
   local golbat = specEvos["Golbat"][item.itemid]
   if not golbat then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[golbat].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, golbat, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Electabuzz" then
   local electabuzz = specEvos["Electabuzz"][item.itemid]
   if not electabuzz then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[electabuzz].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, electabuzz, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Dragonair" then
   local dragonair = specEvos["Dragonair"][item.itemid]
   if not dragonair then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[dragonair].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, dragonair, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Dratini" then
   local dratini = specEvos["Dratini"][item.itemid]
   if not dratini then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[dratini].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, dratini, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Abra" then
   local abra = specEvos["Abra"][item.itemid]
   if not abra then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[abra].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, abra, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Cubone" then
   local cubone = specEvos["Cubone"][item.itemid]
   if not cubone then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[cubone].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, cubone, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Caterpie" then
   local caterpie = specEvos["Caterpie"][item.itemid]
   if not caterpie then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[caterpie].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, caterpie, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Ekans" then
   local ekans = specEvos["Ekans"][item.itemid]
   if not ekans then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[ekans].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, ekans, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Aron" then
   local aron = specEvos["Aron"][item.itemid]
   if not aron then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[aron].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, aron, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Wooper" then
   local wooper = specEvos["Wooper"][item.itemid]
   if not wooper then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[wooper].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, wooper, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Zubat" then
   local zubat = specEvos["Zubat"][item.itemid]
   if not zubat then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[zubat].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, zubat, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Vulpix" then
   local vulpix = specEvos["Vulpix"][item.itemid]
   if not vulpix then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[vulpix].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, vulpix, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Togekiss" then
   local togekiss = specEvos["Togekiss"][item.itemid]
   if not togekiss then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[togekiss].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, togekiss, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Voltorb" then
   local voltorb = specEvos["Voltorb"][item.itemid]
   if not voltorb then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[voltorb].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, voltorb, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Steelix" then
   local steelix = specEvos["Steelix"][item.itemid]
   if not steelix then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[steelix].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, steelix, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Salamence" then
   local salamence = specEvos["Salamence"][item.itemid]
   if not salamence then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[salamence].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, salamence, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Pineco" then
   local pineco = specEvos["Pineco"][item.itemid]
   if not pineco then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[pineco].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, pineco, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
local minlevel = 0
 
if getPokemonName(item2.uid) == "Poliwag" then
   local poliwag = specEvos["Poliwag"][item.itemid]
   if not poliwag then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[poliwag].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, poliwag, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Oddish" then
   local oddish = specEvos["Oddish"][item.itemid]
   if not oddish then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[oddish].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, oddish, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Pidgey" then
   local pidgey = specEvos["Pidgey"][item.itemid]
   if not pidgey then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[pidgey].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, pidgey, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Magmortar" then
   local magmortar = specEvos["Magmortar"][item.itemid]
   if not magmortar then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[magmortar].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, magmortar, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
local minlevel = 0
 
if getPokemonName(item2.uid) == "Metagross" then
   local metagross = specEvos["Metagross"][item.itemid]
   if not metagross then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[metagross].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, metagross, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Machop" then
   local machop = specEvos["Machop"][item.itemid]
   if not machop then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[machop].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, machop, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Magikarp" then
   local magikarp = specEvos["Magikarp"][item.itemid]
   if not magikarp then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[magikarp].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, magikarp, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Lucario" then
   local lucario = specEvos["Lucario"][item.itemid]
   if not lucario then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[lucario].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, lucario, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
local minlevel = 0
 
if getPokemonName(item2.uid) == "Machamp" then
   local machamp = specEvos["Machamp"][item.itemid]
   if not machamp then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[machamp].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, machamp, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Geodude" then
   local geodude = specEvos["Geodude"][item.itemid]
   if not geodude then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[geodude].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, geodude, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
local minlevel = 0
 
if getPokemonName(item2.uid) == "Gyarados" then
   local gyarados = specEvos["Gyarados"][item.itemid]
   if not gyarados then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[gyarados].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gyarados, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Electivire" then
   local electivire = specEvos["Electivire"][item.itemid]
   if not electivire then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[electivire].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, electivire, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Flygon" then
   local flygon = specEvos["Flygon"][item.itemid]
   if not flygon then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[flygon].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, flygon, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Blastoise" then
   local blastoise = specEvos["Blastoise"][item.itemid]
   if not blastoise then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[blastoise].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, blastoise, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Gastly" then
   local gastly = specEvos["Gastly"][item.itemid]
   if not gastly then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[gastly].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gastly, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Alakazam" then
   local alakazam = specEvos["Alakazam"][item.itemid]
   if not alakazam then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[alakazam].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, alakazam, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Venusaur" then
   local venusaur = specEvos["Venusaur"][item.itemid]
   if not venusaur then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[venusaur].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, venusaur, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Kirlia" then
   local kirlia = specEvos["Kirlia"][item.itemid]
   if not kirlia then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[kirlia].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, kirlia, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Clamperl" then
   local clamperl = specEvos["Clamperl"][item.itemid]
   if not clamperl then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[clamperl].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, clamperl, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Burmy" then
   local burmy = specEvos["Burmy"][item.itemid]
   if not burmy then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[burmy].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, burmy, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Wurmple" then
   local wurmple = specEvos["Wurmple"][item.itemid]
   if not wurmple then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[wurmple].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, wurmple, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
local minlevel = 0
 
if getPokemonName(item2.uid) == "Gloom" then
   local gloom = specEvos["Gloom"][item.itemid]
   if not gloom then
      doPlayerSendCancel(cid, "This isn't the required stone to evolve this pokemon.")
      return true
   end  
 
   minlevel = pokes[gloom].level
 
   if getPlayerLevel(cid) < minlevel then
      doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end
 
   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, item2, gloom, 0, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
   return true
end
 
if isInArray(specialevo, getPokemonName(item2.uid)) then
   if getPokemonName(item2.uid) == "Poliwhirl" then
      local evolution = 0
      local theevo = ""
     
      if item.itemid == water then
         if getPlayerItemCount(cid, earth) >= 1 then
            evolution = earth
            theevo = "Politoed"
         elseif getPlayerItemCount(cid, punch) >= 1 then
            evolution = punch
            theevo = "Poliwrath"
         else
            doPlayerSendCancel(cid, "You need a water stone and a punch stone (Poliwrath) or a earth stone (Politoed) to evolve this pokemon.")
            return true
         end
         
         minlevel = pokes[theevo].level
         
         if getPlayerLevel(cid) < minlevel then
            doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
            return true
         end
         if getPlayerItemCount(cid, punch) >= 1 and getPlayerItemCount(cid, earth) >= 1 then
            doPlayerSendCancel(cid, "Please, use your Punch Stone to evolve this pokemon to a Poliwrath, or a earth stone a Politoed.")
            return true
         end
         doEvolvePokemon(cid, item2, theevo, evolution, water)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemEraseAttribute(ball, "boost")  
              doTransformItem(ball, pokeballs[theevo:lower()].use)
 
      elseif item.itemid == punch then
         minlevel = pokes["Poliwrath"].level
         
         if getPlayerLevel(cid) < minlevel then
            doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
            return true
         end
         if getPlayerItemCount(cid, water) <= 0 then
            doPlayerSendCancel(cid, "You need at least one Punch Stone and one Water Stone to evolve this pokemon.")
            return true
         end
 
         local theevo = "Poliwrath"
         doEvolvePokemon(cid, item2, theevo, water, punch)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemEraseAttribute(ball, "boost")  
              doItemSetAttribute(ball, "morta", "no")
              doItemSetAttribute(ball, "Icone", "yes") 
              doTransformItem(ball, pokeballs[theevo:lower()].use)
   
      elseif item.itemid == earth then
         minlevel = pokes["Politoed"].level
 
         if getPlayerLevel(cid) < minlevel then
            doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
            return true
         end
         if getPlayerItemCount(cid, water) <= 0 then
            doPlayerSendCancel(cid, "You need at least one Punch Stone and one Earth Stone to evolve this pokemon.")
            return true
         end
         local theevo = "Politoed"
         doEvolvePokemon(cid, item2, theevo, water, earth)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemEraseAttribute(ball, "boost")  
              doItemSetAttribute(ball, "morta", "no")
              doItemSetAttribute(ball, "Icone", "yes") 
              doTransformItem(ball, pokeballs[theevo:lower()].use)
      end
       
    elseif getPokemonName(item2.uid) == "Slowpoke" then
       if item.itemid == enigma then
          minlevel = pokes["Slowbro"].level
 
          if getPlayerLevel(cid) < minlevel then
             doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
             return true
          end
          doEvolvePokemon(cid, item2, "Slowbro", enigma, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)              
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
 
        elseif item.itemid == water then
          minlevel = pokes["Slowking"].level
 
          if getPlayerLevel(cid) < minlevel then
             doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
             return true
          end
          doEvolvePokemon(cid, item2, "Slowking", water, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)              
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
        end
 
    elseif getPokemonName(item2.uid) == "Tyrogue" then
        local evolution = ""
 
        evolution = choose("Hitmonlee", "Hitmonchan", "Hitmontop")
        minlevel = pokes[evolution].level
 
        if getPlayerLevel(cid) < minlevel then
           doPlayerSendCancel(cid, "You don't have enough level to evolve this pokemon ("..minlevel..").")
           return true
        end
        doEvolvePokemon(cid, item2, evolution, punch, 0)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)              
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
    end
return true
end
 
local count = poevo[getPokemonName(item2.uid)].count
local stnid = poevo[getPokemonName(item2.uid)].stoneid
local stnid2 = poevo[getPokemonName(item2.uid)].stoneid2
local evo = poevo[getPokemonName(item2.uid)].evolution
 
if stnid2 > 1 and (getPlayerItemCount(cid, stnid2) < count or getPlayerItemCount(cid, stnid) < count) then
   doPlayerSendCancel(cid, "You need at least one "..getItemNameById(stnid).." and one "..getItemNameById(stnid2).." to evolve this pokemon!")
   return true
end
 
if getPlayerItemCount(cid, stnid) < count then
   local str = ""
   if count >= 2 then
      str = "s"
   end
return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." to evolve this pokemon!")
end
 
minlevel = pokes[evo].level
 
if getPlayerLevel(cid) < minlevel then
   doPlayerSendCancel(cid, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
   return true
end
 
if count >= 2 then
   stnid2 = stnid
end
 
doEvolvePokemon(cid, item2, evo, stnid, stnid2)
           local ball = getPlayerSlotItem(cid, 8).uid
              doItemSetAttribute (ball, "addon", 0)              
              doItemEraseAttribute(ball, "boost")  
 doItemSetAttribute(ball, "morta", "no")
 doItemSetAttribute(ball, "Icone", "yes")  
 doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
 
         

		 adjustStatus(pk, item.uid, true, false, true)
 
return TRUE
end