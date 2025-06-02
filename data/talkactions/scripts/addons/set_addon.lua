local function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)

   while s do
      if s ~= 1 or cap ~= "" then
        table.insert(t,cap)
      end

      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end

   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end

   return t
end

function onSay(cid, words, param, channel)

	local mypb = getPlayerSlotItem(cid, 8)

	if mypb.itemid ~= 0 and isPokeball(mypb.itemid) then
		local pk = getCreatureSummons(cid)[1]
		local addon = split(param, "@")

		if addon[1] == "Default" then
			addon[1] = "normal"
		end

		if pk and isCreature(pk) and setAsCurrentAddon(mypb.uid, addon[1], {head = addon[2], body = addon[3], legs = addon[4], feet = addon[5]}) then
			local current_addon = getCurrentAddon(mypb.uid)
			local outfit = getPokeOutfit(getPokemonName(pk), current_addon).normal
			doSetCreatureOutfit(pk, {lookType = outfit, lookHead = addon[2], lookBody = addon[3], lookLegs = addon[4], lookFeet = addon[5]}, -1)
			
			local infoToSend = {
				action = "setCurrentAddon",
				new_addon = current_addon
			}
		
			--doPlayerSendCancel(cid, "setCurrentAddon#"..getCurrentAddon(mypb.uid).."")
			doSendPlayerExtendedOpcode(cid, 23, json.encode(infoToSend))
			return true
		end
	end
	return true
end