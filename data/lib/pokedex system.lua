local skills = specialabilities                                    --alterado v1.9 \/ peguem tudo!

function doAddPokemonInDexList(cid, poke)
if getPlayerInfoAboutPokemon(cid, poke).dex then return true end
	local a = newpokedex[poke]                                              
	local b = getPlayerStorageValue(cid, a.storage)
	setPlayerStorageValue(cid, a.storage, b.." dex,")
end

function getPokemonEvolutionDescription(name, next)
	local kev = poevo[name]
	local stt = {}
	if isInArray(specialevo, name) then
       if name == "Poliwhirl" then
          if next then
             return "\nPoliwrath or Politoed, requires level 65."
          end   
          table.insert(stt, "Evolve Stone: Water Stone and Punch Stone or Water Stone and Earth Stone\n\n")
          table.insert(stt, "Evolutions:\nPoliwrath, requires level 65.\nPolitoed, requires level 65.")
       elseif name == "Gloom" then
          if next then
             return "\nVileplume or Bellossom, requires level 50."
          end
          table.insert(stt, "Evolve Stone: Leaf Stone or Venom Stone\n\n")
          table.insert(stt, "Evolutions:\nVileplume, requires level 50.\nBellossom, requires level 50.")
	   elseif name == "Burmy" then
          if next then
             return "\nMothim or Wormadam, requires level 60."
          end
          table.insert(stt, "Evolve Stone: Leaf Stone or Heart Stone\n\n")
          table.insert(stt, "Evolutions:\nMothim, requires level 60.\nWormadam, requires level 60.")
       elseif name == "Kirlia" then
          if next then
             return "\nGardevoir, requires level 100.\nGallade, requires level 200."
          end
          table.insert(stt, "Evolve Stone: Enigma Stone or Llade Stone\n\n")
          table.insert(stt, "Evolutions:\nGardevoir, requires level 100.\nGallade, requires level 200.")
	   elseif name == "Clamperl" then
          if next then
             return "\nHuntail or Gorebyss, requires level 80."
          end
          table.insert(stt, "Evolve Stone: Heart Stone or Darkness Stone\n\n")
          table.insert(stt, "Evolutions:\nGorebyss, requires level 80.\nHuntail, requires level 80.")
	   elseif name == "Wurmple" then
          if next then
             return "\nCascoon or Silcoon, requires level 20."
          end
          table.insert(stt, "Evolve Stone: Venom Stone or Heart Stone\n\n")
          table.insert(stt, "Evolutions:\nCascoon, requires level 20.\nSilcoon, requires level 20.")
       elseif name == "Slowpoke" then
          if next then
             return "\nSlowbro, requires level 45."
          end
          table.insert(stt, "Evolve Stone: Enigma Stone\n\n")
          table.insert(stt, "Evolutions:\nSlowbro, requires level 45.")
       elseif name == "Eevee" then
          if next then
             return "\nVaporeon, requires level 80.\nJolteon, requires level 80.\nFlareon, requires level 80.\nUmbreon, requires level 80.\nEspeon, requires level 80.\nGlaceon, requires level 80.\nLeafeon, requires level 80.\nVirus Eevee, requeris level 100."
          end
          table.insert(stt, "Evolve Stone: Water Stone or Thunder Stone or Fire Stone or Darkness Stone or Enigma Stone or Leaf Stone or Ice Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nVaporeon, requires level 80.\nJolteon, requires level 80.\nFlareon, requires level 80.\nUmbreon, requires level 80.\nEspeon, requires level 80.\nLeafeon, requires level 80.\nGlaceon, requires level 80.\nVirus Eevee, requeris level 100.")
       elseif name == "Rhydon" then
          if next then
             return "\nRhyperior, requires level 200.\nShiny Rhydon, requires level 150.\nVirus Rhydon, requires level 200."
          end
          table.insert(stt, "Evolve Stone: Perior Stone or Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nRhyperior, requires level 200.\nShiny Rhydon, requires level 150.\nVirus Rhydon, requires level 200.")
	   elseif name == "Venusaur" then
          if next then
             return "\nShiny Venusaur, requires level 150.\nVirus Venusaur, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Venusaur, requires level 150.\nVirus Venusaur, requires level 200.")
       elseif name == "Alakazam" then
          if next then
             return "\nShiny Alakazam, requires level 150.\nVirus Alakazam, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Alakazam, requires level 150.\nVirus Alakazam, requires level 200.")
	   elseif name == "Blastoise" then
          if next then
             return "\nShiny Blastoise, requires level 150.\Virus Blastoise, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Blastoise, requires level 150.\nVirus Blastoise, requires level 200.")
	   elseif name == "Electivire" then
          if next then
             return "\nShiny Electivire, requires level 250.\nVirus Electivire, requires level 300."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Electivire, requires level 250.\nVirus Electivire, requires level 300.")
	   elseif name == "Flygon" then
          if next then
             return "\nShiny Flygon, requires level 150.\nVirus Flygon, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Flygon, requires level 150.\nVirus Flygon, requires level 200.")
	   elseif name == "Gastly" then
          if next then
             return "\nHaunter, requires level 45.\nVirus Gastly, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Darkness Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nHaunter, requires level 45.\nVirus Gastly, requires level 100.")
	   elseif name == "Geodude" then
          if next then
             return "\nGraveler, requires level 40.\nVirus Geodude, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Rock Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nGraveler, requires level 40.\nVirus Geodude, requires level 100.")
	   elseif name == "Gyarados" then
          if next then
             return "\nShiny Gyarados, requires level 150.\nVirus Gyarados, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Gyarados, requires level 150.\nVirus Gyarados, requires level 200.")
	   elseif name == "Lucario" then
          if next then
             return "\nShiny Lucario, requires level 150.\nVirus Lucario, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Lucario, requires level 150.\nVirus Lucario, requires level 200.")
	   elseif name == "Machamp" then
          if next then
             return "\nShiny Machamp, requires level 150.\nVirus Machamp, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Machamp, requires level 150.\nVirus Machamp, requires level 200.")
	   elseif name == "Machop" then
          if next then
             return "\nMachoke, requires level 45.\nVirus Machop, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Punch Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nMachoke, requires level 45.\nVirus Machamp, requires level 100.")
	   elseif name == "Magikarp" then
          if next then
             return "\nGyarados, requires level 90.\nShiny Magikarp, requeris level 50.\nVirus Magikarp, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Crystal Stone or Virus or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nGyarados, requires level 90.\nShiny Magikarp, requires level 50.\nVirus Magikarp, requires level 100.")
	   elseif name == "Magmortar" then
          if next then
             return "\nShiny Magmortar, requeris level 250.\nVirus Magmortar, requires level 300."
		  end
          table.insert(stt, "Evolve Stone: Virus or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Magmortar, requires level 250.\nVirus Magmortar, requires level 300.")
	   elseif name == "Metagross" then
          if next then
             return "\nShiny Metagross, requeris level 150.\nVirus Metagross, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Virus or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Metagross, requires level 150.\nVirus Metagross, requires level 200.")
	   elseif name == "Oddish" then
          if next then
             return "\nGloom, requires level 30.\nShiny Oddish, requeris level 50.\nVirus Oddish, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Leaf Stone or Virus or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nGloom, requeris level 30.\nShiny Oddish, requires level 50.\nVirus Oddish, requires level 100.")
	   elseif name == "Pidgey" then
          if next then
             return "\nPidgeotto, requeris level 20.\nVirus Pidgey, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Heart Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nPidgeotto, requeris level 20. \nVirus Pidgey, requires level 100.")
	   elseif name == "Pineco" then
          if next then
             return "\nForretress, requires level 65.\nVirus Pineco, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Coccon Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nForretress, requeris level 65. \nVirus Pineco, requires level 100.")
	   elseif name == "Poliwag" then
          if next then
             return "\nPoliwhirl, requires level 25.\nVirus Poliwag, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Water Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nPoliwhirl, requeris level 25. \nVirus Poliwag, requires level 100.")
	   elseif name == "Salamence" then
          if next then
             return "\nShiny Salamence, requires level 150.\nVirus Salamence, requires level 250."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Salamence, requeris level 150. \nVirus Salamence, requires level 250.")
	   elseif name == "Steelix" then
          if next then
             return "\nShiny Steelix, requires level 150.\nVirus Steelix, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Steelix, requeris level 150. \nVirus Steelix, requires level 200.")
	   elseif name == "Togekiss" then
          if next then
             return "\nShiny Togekiss, requires level 200.\nVirus Togekiss, requires level 300."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nShiny Togekiss, requeris level 200. \nVirus Togekiss, requires level 300.")
	   elseif name == "Voltorb" then
          if next then
             return "\nElectrode, requires level 35.\nShiny Voltorb, requeris level 50.\nVirus Voltorb, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Thunder Stone or Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nElectrode, requeris level 35. \nShiny Voltorb, requeris level 50. \nVirus Voltorb, requires level 100.")
	   elseif name == "Vulpix" then
          if next then
             return "\nNinetales, requires level 70.\nVirus Vulpix, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Fire Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nNinetales, requeris level 70. \nVirus Vulpix, requires level 100.")
	   elseif name == "Wooper" then
          if next then
             return "\nQuagsire, requires level 65.\nVirus Wooper, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Earth Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nQuagsire, requeris level 65. \nVirus Wooper, requires level 100.")
	   elseif name == "Zubat" then
          if next then
             return "\nGolbat, requires level 35.\nVirus Zubat, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Shiny Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nGolbat, requeris level 35. \nShiny Zubat, requeris level 50. \nVirus Zubat, requires level 100.")
	   elseif name == "Aron" then
          if next then
             return "\nLairon, requires level 30.\nVirus Aron, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Rock Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nLairon, requeris level 30. \nVirus Aron, requires level 100.")
	   elseif name == "Caterpie" then
          if next then
             return "\nMetapod, requires level 15.\nVirus Caterpie, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Coccon Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nMetapod, requeris level 15. \nVirus Caterpie, requires level 100.")
	   elseif name == "Ekans" then
          if next then
             return "\nArbok, requires level 35.\nVirus Ekans, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Virus\n\n")
          table.insert(stt, "Evolutions:\nArbok, requeris level 35. \nVirus Ekans, requires level 100.")
	   elseif name == "Abra" then
          if next then
             return "\nKadabra, requires level 45.\nShiny Abra, requires level 80."
		  end
          table.insert(stt, "Evolve Stone: Enigma Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nKadabra, requeris level 45. \nShiny Abra, requires level 80.")
	   elseif name == "Cubone" then
          if next then
             return "\nCubone, requires level 65.\nShiny Cubone, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Earth Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nCubone, requeris level 65. \nShiny Cubone, requires level 50.")
	   elseif name == "Dragonair" then
          if next then
             return "\nDragonite, requires level 100.\nShiny Dragonair, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Crystal Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nDragonite, requeris level 100. \nShiny Dragonair, requires level 100.")
	   elseif name == "Dratini" then
          if next then
             return "\nDragonair, requires level 75.\nShiny Dratini, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Crystal Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nDragonair, requeris level 75. \nShiny Dratini, requires level 50.")
	   elseif name == "Electabuzz" then
          if next then
             return "\nElectivire, requires level 200.\nShiny Electabuzz, requires level 120."
		  end
          table.insert(stt, "Evolve Stone: Electri Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nElectivire, requeris level 200. \nShiny Electabuzz, requires level 120.")
	   elseif name == "Golbat" then
          if next then
             return "\nCrobat, requires level 80.\nShiny Golbat, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nCrobat, requeris level 80. \nShiny Golbat, requires level 100.")
	   elseif name == "Grimer" then
          if next then
             return "\nMuk, requires level 80.\nShiny Grimer, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nMuk, requeris level 80. \nShiny Grimer, requires level 50.")
	   elseif name == "Growlithe" then
          if next then
             return "\nArcanine, requires level 80.\nShiny Growlithe, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Fire Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nArcanine, requeris level 80. \nShiny Growlithe, requires level 50.")
	   elseif name == "Horsea" then
          if next then
             return "\nSeadra, requires level 45.\nShiny Horsea, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Water Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nSeadra, requeris level 45. \nShiny Horsea, requires level 50.")
	   elseif name == "Krabby" then
          if next then
             return "\nKingler, requires level 40.\nShiny Krabby, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Water Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nKingler, requeris level 40. \nShiny Krabby, requires level 50.")
	   elseif name == "Larvitar" then
          if next then
             return "\nPupitar, requires level 65.\nShiny Larvitar, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Earth Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nPupitar, requeris level 65. \nShiny Larvitar, requires level 50.")
	   elseif name == "Magmar" then
          if next then
             return "\nMagmortar, requires level 200.\nShiny Magmar, requires level 120."
		  end
          table.insert(stt, "Evolve Stone: Mag Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nMagmortar, requeris level 200. \nShiny Magmar, requires level 120.")
	   elseif name == "Magneton" then
          if next then
             return "\nMagnezone, requires level 200.\nShiny Magneton, requires level 130."
		  end
          table.insert(stt, "Evolve Stone: Zone Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nMagnezone, requeris level 200. \nShiny Magneton, requires level 130.")
	   elseif name == "Onix" then
          if next then
             return "\nSteelix, requires level 100.\nShiny Onix, requires level 80."
		  end
          table.insert(stt, "Evolve Stone: Metal Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nSteelix, requeris level 100. \nShiny Onix, requires level 80.")
	   elseif name == "Paras" then
          if next then
             return "\nParasect, requires level 50.\nShiny Paras, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Coccon Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nParasect, requeris level 50. \nShiny Paras, requires level 50.")
	   elseif name == "Rattata" then
          if next then
             return "\nRaticate, requires level 25.\nShiny Rattata, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Heart Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nRaticate, requeris level 25. \nShiny Rattata, requires level 50.")
	   elseif name == "Scyther" then
          if next then
             return "\nScizor, requires level 100.\nShiny Scyther, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Coccon Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nScizor, requeris level 100. \nShiny Scyther, requires level 100.")
	   elseif name == "Seadra" then
          if next then
             return "\nKingdra, requires level 90.\nShiny Seadra, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Crystal Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nKingdra, requeris level 90. \nShiny Seadra, requires level 100.")
	   elseif name == "Tangela" then
          if next then
             return "\nTangrowth, requires level 200.\nShiny Tangela, requires level 100."
		  end
          table.insert(stt, "Evolve Stone: Green Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nTangrowth, requeris level 200. \nShiny Tangela, requires level 100.")
	   elseif name == "Tentacool" then
          if next then
             return "\nTentacruel, requires level 75.\nShiny Tentacool, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nTentacruel, requeris level 75. \nShiny Tentacool, requires level 50.")
	   elseif name == "Venonat" then
          if next then
             return "\nVenomoth, requires level 50.\nShiny Venonat, requires level 50."
		  end
          table.insert(stt, "Evolve Stone: Venom Stone or Shiny Stone\n\n")
          table.insert(stt, "Evolutions:\nVenomoth, requeris level 50. \nShiny Venonat, requires level 50.")
	   elseif name == "Snorunt" then
          if next then
             return "\nGlalie, requires level 85.\nFroslass, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Ice Stone or Fros Stone\n\n")
          table.insert(stt, "Evolutions:\nGlalie, requeris level 85. \nFroslass, requires level 200.")
	   elseif name == "Dusclops" then
          if next then
             return "\nDusknoir, requires level 200.."
		  end
          table.insert(stt, "Evolve Stone: Gladi Stone\n\n")
          table.insert(stt, "Evolutions:\nDusknoir, requeris level 200.")
	   elseif name == "Dragonite" then
          if next then
             return "\nShiny Dragonite, requires level 150.\nVirus Dragonite, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Virus Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Dragonite, requeris level 150. \nVirus Dragonite, requires level 200.")
	   elseif name == "Gardevoir" then
          if next then
             return "\nShiny Gardevoir, requires level 150."
		  end
          table.insert(stt, "Evolve Stone: Shiny Stone or Super Darkness Stone\n\n")
          table.insert(stt, "Evolutions:\nShiny Gardevoir, requeris level 150.")
	   elseif name == "Tyranitar" then
          if next then
             return "\nVirus Tyranitar, requires level 200."
		  end
          table.insert(stt, "Evolve Stone: Virus Stone or Super Fire Stone\n\n")
          table.insert(stt, "Evolutions:\nVirus Tyranitar, requeris level 150.")
	   elseif name == "Tyrogue" then
          if next then
             return "\nHitmonlee, requires level 60.\nHitmonchan, requires level 60.\nHitmontop, requires level 60."
          end
          table.insert(stt, "Evolve Stone: Punch Stone\n\n")   
          table.insert(stt, "Evolutions:\nHitmonlee, requires level 60.\nHitmonchan, requires level 60.\nHitmontop, requires level 60.")
       end
    elseif kev then
       if next then
          table.insert(stt, "\n"..kev.evolution..", requires level "..kev.level..".")
          return table.concat(stt)
       end
       local id = tonumber(kev.stoneid)
       local id2 = tonumber(kev.stoneid2)
       local stone = ""
       if tonumber(kev.count) == 2 then
          stone = doConvertStoneIdToString(id).." (2x)"
       else
          stone = id2 == 0 and doConvertStoneIdToString(id) or doConvertStoneIdToString(id).." and "..doConvertStoneIdToString(id2)
       end
       table.insert(stt, "Evolve Stone: "..stone.."\n\n")
       table.insert(stt, "Evolutions:\n"..kev.evolution..", requeris level "..kev.level..".")
       table.insert(stt, getPokemonEvolutionDescription(kev.evolution, true))
    else
        if not next then
           table.insert(stt, "Evolutions:\nIt doen't evolve.")
        end
    end   
return table.concat(stt)
end

local function getMoveDexDescr(cid, name, number)
	local x = movestable[name]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	local y = tables[number]
	if not y then return "" end
	
if getTableMove(cid, y.name) == "" then
   print(""..y.name.." faltando")
   return "unknown error"
end
local txt = ""..z..""..y.name.." - m"..number.." - level "..y.level.." - "..(y.t) 
return txt
end      
                                                                                                                                 --alterado v1.8
local skillcheck = {"fly", "ride", "teleport", "rock smash", "cut", "dig", "light", "blink", "control mind", "transform", "levitate_fly"}
local passivas = {
["Shock Counter"] = {"Electabuzz", "Shiny Electabuzz", "Elekid", "Raikou", tpw = "electric"},
["Lava-Counter"] = {"Magmar", "Magby", "Entei", tpw = "fire"},
["Counter Helix"] = {"Scyther", "Shiny Scyther", tpw = "bug"},
["Giroball"] = {"Pineco", "Forretress", tpw = "steel"},
["Counter Claw"] = {"Scizor", tpw = "bug"},
["Counter Spin"] = {"Hitmontop", "Shiny Hitmontop", tpw = "fighting"},
["Demon Kicker"] = {"Hitmonlee", "Shiny Hitmonlee", tpw = "fighting"},
["Demon Puncher"] = {"Hitmonchan", "Shiny Hitmonchan", tpw = "unknow"},               --alterado v1.6
["Stunning Confusion"] = {"Psyduck", "Golduck", "Wobbuffet", "Shiny Wobbuffet", tpw = "psychic"},
["Groundshock"] = {"Kangaskhan", tpw = "normal"},
["Electric Charge"] = {"Pikachu", "Raichu", "Shiny Raichu", tpw = "electric"},
["Melody"] = {"Wigglytuff", tpw = "normal"},
["Dragon Fury"] = {"Dratini", "Dragonair", "Dragonite", "Shiny Dratini", "Shiny Dragonair", "Shiny Dragonite", tpw = "dragon"},
["Fury"] = {"Persian", "Raticate", "Shiny Raticate", tpw = "normal"},
["Mega Drain"] = {"Oddish", "Gloom", "Vileplume", "Kabuto", "Kabutops", "Parasect", "Tangela", "Shiny Vileplume", "Shiny Tangela", tpw = "grass"},
["Spores Reaction"] = {"Oddish", "Gloom", "Vileplume", "Shiny Vileplume", tpw = "grass"},
["Amnesia"] = {"Wooper", "Quagsire", "Swinub", "Piloswine", tpw = "psychic"},
["Zen Mind"] = {"Slowking", tpw = "psychic"}, 
["Mirror Coat"] = {"Wobbuffet", tpw = "psychic"},
["Lifesteal"] = {"Zubat", "Golbat", "Crobat", "Shiny Zubat", "Shiny Golbat", "Shiny Crobat", tpw = "poison"},
["Evasion"] = {"Scyther", "Scizor", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue", "Shiny Scyther", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Ledian", "Ledyba", "Sneasel", tpw = "normal"},
["Foresight"] = {"Machamp", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Hitmontop", "Hitmonlee", "Hitmonchan", tpw = "fighting"},
["Bone Spin"] = {"Cubone", "Marowak", "Shiny Cubone", "Shiny Marowak", tpw = "rock"},
}


function doShowPokedexRegistration(cid, pokemon, ball)
local item2 = pokemon
local virtual = false
   if type(pokemon) == "string" then
      virtual = true
   end
local myball = ball
local name = virtual and pokemon or getCreatureName(item2.uid)

local v = fotos[name]
local stt = {}

table.insert(stt, "Name: "..name.."\n")

if pokes[name].type2 and pokes[name].type2 ~= "no type" then
   table.insert(stt, "Type: "..pokes[name].type.."/"..pokes[name].type2)
else
    table.insert(stt, "Type: "..pokes[name].type)
end

if virtual then
   table.insert(stt, "\nRequired level: "..pokes[name].level.."\n")
else
   table.insert(stt, "\nRequired level: ".. getPokemonLevel(item2.uid, true) .."\n")  --alterado v1.9
end

table.insert(stt, "\n"..getPokemonEvolutionDescription(name).."\n")

table.insert(stt, "\nMoves:")

if name == "Ditto" then
   if virtual then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   elseif getPlayerStorageValue(item2.uid, 1010) == "Ditto" or getPlayerStorageValue(item2.uid, 1010) == -1 then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   else
      for a = 1, 15 do
         table.insert(stt, getMoveDexDescr(item2.uid, getPlayerStorageValue(item2.uid, 1010), a))
      end
   end
else
   for a = 1, 15 do
      table.insert(stt, getMoveDexDescr(item2.uid, name, a))
   end
end

for e, f in pairs(passivas) do
   if isInArray(passivas[e], name) then
      local tpw = passivas[e].tpw
      if name == "Pineco" and passivas[e] == "Giroball" then
         tpw = "bug"
      end
      table.insert(stt, "\n"..e.." - passive - "..tpw)
   end
end
            
table.insert(stt, "\n\nAbility:\n") 
local abilityNONE = true                   --alterado v1.8 \/
			
for b, c in pairs(skills) do
   if isInArray(skillcheck, b) then
      if isInArray(c, name) then
         table.insert(stt, (b == "levitate_fly" and "Levitate" or doCorrectString(b)).."\n")
         abilityNONE = false
      end
   end
end
if abilityNONE then
   table.insert(stt, "None")
end
		
if string.len(table.concat(stt)) > 8192 then
   print("Error while making pokedex info with pokemon named "..name..".\n   Pokedex registration has more than 8192 letters (it has "..string.len(stt).." letters), it has been blocked to prevent fatal error.")
   doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
return true
end	

doShowTextDialog(cid, v, table.concat(stt))
end