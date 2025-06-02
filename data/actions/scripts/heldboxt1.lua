local card_id = {13948, 13983, 13989} -- joga os id dos card aqui
function onUse(cid, item, frompos, item2, topos)
local level = 10 -- level
if item.itemid == 22979 then -- id da box
if getPlayerLevel(cid) >= level then
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você usou um held gift e ganhou >>> ["..getItemNameById(card_id[w]).."] <<<")
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid,"You must be at least level "..level.."")
end return true end  end