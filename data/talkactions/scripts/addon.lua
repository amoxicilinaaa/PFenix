function onSay(cid, words, param)
local pb = getPlayerSlotItem(cid, 8).uid
local ad = {
[12731] = {pokemon= "Cubone" , name = "Addon Cubone", looktype = 1730, count = 5},
[12730] = {pokemon= "Bulbasaur" ,name = "Addon Bulbasaur", looktype = 1729, count = 1},
[12743] = {pokemon= "Bulbasaur" , name = "Addon Bulbasaur 2", looktype = 1738, count = 1},
}
if param == "" then
doPlayerSendTextMessage(cid,27,"Use !addons remove to remove your pokemon addons.")
return false
end
if param == "remove" then
local pk = getCreatureSummons(cid)[1]
doSetItemAttribute(pb,"addon",0)
doPlayerSendTextMessage(cid,27,"You sucessfuly removed your pokemon addons.")

end
return false 
end