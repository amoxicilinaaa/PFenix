local ice_cfg = {
{11640, 1},
{11454, 1},
}
local sto_ice = 3516        
--//--
function onUse(cid, item, frompos, item2, topos)
         if getPlayerLevel(cid) < 80 then   
		 sendMsgToPlayer(cid, 27, "Sorry, you need to have level 80 to completed this quest.")
	     return true
	     end
          --//
         if getPlayerStorageValue(cid, sto_ice) >= 1 then
         sendMsgToPlayer(cid, 27, "Sorry, you've already completed this quest!")
         return true
		 end
		 --//
        for i = 1, #ice_cfg do
       doPlayerAddItem(cid, ice_cfg[i][1], ice_cfg[i][2])
              doPlayerAddExperience(cid, 5000)  --premio
       end
	   --//
setPlayerStorageValue(cid, sto_ice, 1)	   
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
sendMsgToPlayer(cid, 27, "Congratulations, you complete the Ice Quest!")
return true
end