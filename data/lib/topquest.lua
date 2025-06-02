function getTopQuest(cid)
local check6 = db.getResult("SELECT `topquest` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
return check6:getDataInt("topquest") <= 0 and 0 or check6:getDataInt("topquest") end
function addTopQuest(cid,amount)
db.executeQuery("UPDATE `players` SET `topquest` = "..getTopQuest(cid).."+"..amount.." WHERE `id` = "..getPlayerGUID(cid)) end

function removeTopQuest(cid,amount)
db.executeQuery("UPDATE `players` SET `topquest` = "..getTopQuest(cid).."-"..amount.." WHERE `id` = "..getPlayerGUID(cid)) end
function setTopQuest(cid,value)
db.executeQuery("UPDATE `players` SET `topquest` = "..value.." WHERE `id` = "..getPlayerGUID(cid)) end