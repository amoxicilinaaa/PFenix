function onSay(cid, words, param, channel)

	local mypb = getPlayerSlotItem(cid, 8)

	if mypb.itemid ~= 0 and isPokeball(mypb.itemid) then
		local addons = getPokeAddons(getItemAttribute(mypb.uid, "poke"))
		local my_addons = getPokeAddons(mypb.uid)
		local addons_amount = #addons

		local infoToSend = {
			action = "showAddonOptions",
			addons = {},
		}
		
		infoToSend.addons[1] = {name = "Default", outfits = getPokeOutfit(getItemAttribute(mypb.uid, "poke"), "normal")}
		
		for index, addon in pairs(addons) do
			local own = false
			for index, my_addon in pairs(my_addons) do
				if addon == my_addon then
					own = true
				end
			end

			infoToSend.addons[index+1] = {name = addon, outfits = getPokeOutfit(getItemAttribute(mypb.uid, "poke"), addon), lock = (not own)}
		end
		
		doSendPlayerExtendedOpcode(cid, 23, json.encode(infoToSend))

	end
	return true
end