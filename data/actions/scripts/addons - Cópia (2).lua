function onUse(cid, item, fromPosition, itemEx, toPosition)
                local addons = {
                [22903] = {pokemon = "Golem" , looktype = 4095, fly = 0, ride = 0, surf = 0},
				[22893] = {pokemon = "Charmander" , looktype = 3976, fly = 0, ride = 0, surf = 0},
				[22899] = {pokemon = "Feraligatr" , looktype = 3742, fly = 0, ride = 0, surf = 0},
				[22895] = {pokemon = "Snorlax" , looktype = 3752, fly = 0, ride = 0, surf = 0},
				[22914] = {pokemon = "Raichu" , looktype = 3302, fly = 0, ride = 0, surf = 0},
				[22894] = {pokemon = "Shiny Snorlax" , looktype = 3310, fly = 0, ride = 0, surf = 3313},
				[22896] = {pokemon = "Shiny Tangela" , looktype = 3316, fly = 0, ride = 0, surf = 0},
				[22897] = {pokemon = "Shiny Tangela" , looktype = 3317, fly = 0, ride = 0, surf = 0},
				[22905] = {pokemon = "Shiny Tentacruel" , looktype = 3319, fly = 0, ride = 0, surf = 0},
				[22906] = {pokemon = "Shiny Tentacruel" , looktype = 3320, fly = 0, ride = 0, surf = 0},
				[22907] = {pokemon = "Shiny Tentacruel" , looktype = 3321, fly = 0, ride = 0, surf = 0},
				

			   }
 
                if #getCreatureSummons(cid) > 0 then
                                doPlayerSendCancel(cid, "Please back your pokemon.")
                                return false
                end     
                local addon = addons[item.itemid].looktype
                local fly = addons[item.itemid].fly
                local ride = addons[item.itemid].ride
                local surf = addons[item.itemid].surf
 
                local pb = getPlayerSlotItem(cid, 8).uid
                local pk = addons[item.itemid].pokemon
 
                if getItemAttribute(pb,"poke") ~= pk then
                                doPlayerSendCancel(cid, "Sorry, you can't use this addon on this poke.")
                return false
                end
                                doRemoveItem(item.uid, 1)
                                doPlayerSendTextMessage(cid, 27, "Congratulations! Now your pokemon will use the addon.")

                                doSetItemAttribute(pb,"addon",addon)
                                doSetItemAttribute(pb,"addonfly",fly)
                                doSetItemAttribute(pb,"addonride",ride)
                                doSetItemAttribute(pb,"addonsurf",surf)
                                
return true
end