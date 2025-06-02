local config = {
	vaultId = ID, -- itemid do vault
	vaultStorage = 99991 -- storage em que ficara armazenado os golds
}

function onLook(cid, thing, position, lookDistance)
	local show = getPlayerStorageValue(cid, config.vaultStorage)
	if(thing.itemid == config.vaultId) then
		local str = "You see"..(getItemInfo(thing.itemid).article and " "..getItemInfo(thing.itemid).article.." " or " ")..getItemInfo(thing.itemid).name..".\nYou have "..(show < 0 and 0 or show).." gold"..(show > 1 and "s" or "").." in the vault."
		if(getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) then
			str = str .. "\nItemID: ["..thing.itemid.."].\nPosition: [X: "..getThingPos(thing.uid).x.."] [Y: "..getThingPos(thing.uid).y.."] [Z: "..getThingPos(thing.uid).z.."]."
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
		return false
	end
	return true
end