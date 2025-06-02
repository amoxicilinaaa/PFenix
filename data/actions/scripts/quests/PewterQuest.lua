local pewter_cfg = {
{11445, 1},
{2392, 5},
}
local sto_pewter = 3512
--//--
function onUse(cid, item, frompos, item2, topos)
         if getPlayerLevel(cid) < 85 then   
		 sendMsgToPlayer(cid, 27, "Sorry, you need to have level 35 to completed this quest.")
	     return true
	     end
          --//
         if getPlayerStorageValue(cid, sto_pewter) >= 1 then
         sendMsgToPlayer(cid, 27, "Sorry, you've already completed this quest!")
         return true
		 end
		 --//
        for i = 1, #pewter_cfg do
       doPlayerAddItem(cid, pewter_cfg[i][1], pewter_cfg[i][2])
       end
	   --//
setPlayerStorageValue(cid, sto_pewter, 1)	   
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
sendMsgToPlayer(cid, 27, "Congratulations, you complete the Pewter Quest!")
return true
end