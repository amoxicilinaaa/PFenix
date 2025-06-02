local msg = [[
Server Info
|---------- Stage ------------|
Level: 1 ao 49 = 17x
Level: 50 ao 100 = 14x
Level: 101 ao 150 = 12x
Level: 151 ao 200 = 9x
Level: 201 ao 249 = 7x
Level: 250 ao 299 = 5x
Level: 300 ao 349 = 4x
Level: 350 ao 399 = 3x
Level: 400 ao 499 = 2x
Level: 500+ = 1x
]]
function onSay(cid, words, param)
doPlayerPopupFYI(cid, msg)
end