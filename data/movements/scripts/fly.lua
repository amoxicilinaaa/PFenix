local del = {'460', '1022', '1023', '1024'}


function onStepIn(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 17000) <= 0 then
doTeleportThing(cid, topos, false)
doRemoveItem(getTileThingByPos(frompos).uid, 1)
if isPlayer(cid) then
doPlayerSendCancel(cid, "You can't fly.")
end
return true
end
if getPlayerStorageValue(cid, 17000) >= 1 then
if topos.z == frompos.z then
if getCreatureOutfit(cid).lookType == 316 then
effect = 136
else
effect = 2
end
doSendMagicEffect(topos, effect)
end
end
for x=-1,1 do
		for y=-1,1 do
			posa = {x=topos.x+x,y=topos.y+y,z=topos.z}
			if isInArray(del, getTileThingByPos(posa).itemid) then
			doRemoveItem(getTileThingByPos(posa).uid, 1)
			end
end
end
for x=-1,1 do
		for y=-1,1 do
			pose = {x=frompos.x+x,y=frompos.y+y,z=frompos.z}
			if getTileThingByPos(pose).itemid == 0 then
			doCombatAreaHealth(cid, 0, pose, 0, 0, 0, CONST_ME_NONE)
			doCreateItem(460, 1, pose)
end
end
end
doCombatAreaHealth(cid, 0, topos, 0, 0, 0, CONST_ME_NONE)
doCreateItem(460, 1, frompos)
			if topos.z > frompos.z then
			doCreateItem(11676, 1, frompos)
			doTransformItem(getTileThingByPos(frompos).uid, 11676)
			elseif topos.z < frompos.z then
			doCreateItem(11675, 1, frompos)
			doTransformItem(getTileThingByPos(frompos).uid, 11675)
			end
return true
end    

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)

--if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then return false end -- TV

local effect = 2

	if toPosition.z == fromPosition.z and getCreatureOutfit(cid).lookType ~= 316 and getCreatureOutfit(cid).lookType ~= 648 then
		doSendMagicEffect(fromPosition, effect)
	end

local oldtpos = fromPosition
oldtpos.stackpos = STACKPOS_GROUND


if getTileThingByPos(oldtpos).itemid >= 1 then
doRemoveItem(getTileThingByPos(oldtpos).uid, 1)
end

return true
end    