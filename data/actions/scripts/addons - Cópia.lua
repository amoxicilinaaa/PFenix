function onUse(cid, item, fromPosition, itemEx, toPosition)
                local addons = {
                [13075] = {pokemon = "Shiny Charizard" , looktype = 1723, fly = 1722, ride = 0, surf = 0},
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
                                doSetItemAttribute(pb,"addonItem",addonItem)
                                doSetItemAttribute(pb,"addon",addon)
                                doSetItemAttribute(pb,"addonfly",fly)
                                doSetItemAttribute(pb,"addonride",ride)
                                doSetItemAttribute(pb,"addonsurf",surf)
                                
return true
end