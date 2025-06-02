function doPlayerStartCards(cid, namecard, pos)

dofile("./cardsytem.lua")

local n = namecard

local monster = tab[n]

 

pk = doSummonCreature(monster[1], pos)

doConvinceCreature(cid, pk)

return true

end

function doShowTextDialgListCards(cid, itemid)

dofile("./cardsytem.lua")

local n = namecard

local str = ""

str = str .. "Cards :\n\n"

for name, tab in pairs(tab) do

str = str..name.."\n"

end

str = str .. ""

doShowTextDialog(cid, itemid, str)

return TRUE

end

 

function getPlayerCard(cid, namecard)

dofile("./cardsytem.lua")

local n = namecard

local card = tab[n]

local cardname = card[2]

local cardnumber = getPlayerStorageValue(cid, cardname)

return cardnumber

end

 

function doPlayerAddNewCards(cid, namecard)

dofile("./cardsytem.lua")

local n = namecard

local newcard = tab[n]

setPlayerStorageValue(cid, newcard[2], 1)

return true

end

function getLevelCard(namecard)

dofile("./cardsytem.lua")

local n = namecard

local newcard = tab[n]

local cardlevel = newcard[3]

return cardlevel

end

function getCardprice(namecard)

dofile("./cardsytem.lua")

local n = namecard

local newcard = tab[n]

local newcardlevel = newcard[3]*4

return newcardlevel

end

function getCardId(namecard)

dofile("./cardsytem.lua")

local n = namecard

local newcard = tab[n]

local pricecard = newcard[2]-50000

return pricecard

end

function getPlayerPositionPz(cid)

local pz = getTilePzInfo(getCreaturePosition(cid))

return pz

end

 

function getCardStorage(namecard)

dofile("./cardsytem.lua")

local n = namecard

local newcard = tab[n]

local pricecard = newcard[2]

return pricecard

end

function getExistNameCard(namecard)

dofile("./cardsytem.lua")

local monster = tab

return monster[namecard]

end