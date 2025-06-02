function onUse(cid)
setPlayerStorageValue(69800, 1)
local monster  = {

["Suicune"] = {1, 1800}
}


local cd = {
cdtime = 20,  --//-- quanto tempo fica sem usar o item 86400
str = 69891,
		}
		
		
tempo = 60*1	--//-- tempo em segundos que o monstro vai ajudar o player
summon = getCreatureSummons(cid)
		
	
for l, m in pairs(monster) do
if getPlayerStorageValue(cid, cd.str) < os.time() and summon then
	setPlayerStorageValue(cid, cd.str, os.time() + cd.cdtime)
	setPlayerStorageValue(69874, 1)
	
	doConvinceCreature(cid, doSummonCreature(l, getCreaturePosition(cid)))
	doCreatureSay(cid, "Go!", 1)
	doSendMagicEffect(getThingPos(cid), 10)
	break
else
return doPlayerSendTextMessage(cid, 25, 'You can not use this item unless you wait..') and doSendMagicEffect(getThingPos(cid), 2)
end 
end
	
	
	for _, monster in ipairs(getCreatureSummons(cid)) do
				addEvent(doRemoveCreature, tempo, monster)
					setPlayerStorageValue(69874, 0)
			end
				



if summon and getPlayerStorageValue(cid, cd.str) >= os.time() or getPlayerStorageValue(cid, cd.str) < os.time() then
for n, p in ipairs(summon) do
	setPlayerStorageValue(69874, 0)
  doRemoveCreature(p)
end
end

	if useKpdoDlls then
		doUpdateMoves(cid)
	end
return true
end