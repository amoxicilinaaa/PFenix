-- V1.3 ->Developed by: Tony Araújo (OrochiElf) ~~ www.OTCodes.com ~~

CW_Pokes = {
	["bulbasaur"] = {DB_Balls = 500001, DB_PK = 900001, ID_Portrait = 11989, P_Experience = 5000},
	["ivysaur"] = {DB_Balls = 500002, DB_PK = 900002, ID_Portrait = 11990, P_Experience = 10000},
	["venusaur"] = {DB_Balls = 500003, DB_PK = 900003, ID_Portrait = 11991, P_Experience = 15000},
	["treecko"] = {DB_Balls = 500004, DB_PK = 900004, ID_Portrait = 14120, P_Experience = 5000},
	["mudkip"] = {DB_Balls = 500005, DB_PK = 900005, ID_Portrait = 14105, P_Experience = 5000},
	["torchic"] = {DB_Balls = 500006, DB_PK = 900006, ID_Portrait = 14085, P_Experience = 5000},
	["grovyle"] = {DB_Balls = 500007, DB_PK = 900007, ID_Portrait = 11925, P_Experience = 10000},
	["marshtomp"] = {DB_Balls = 500008, DB_PK = 900008, ID_Portrait = 11090, P_Experience = 10000},
	["combusken"] = {DB_Balls = 500009, DB_PK = 900009, ID_Portrait = 11110, P_Experience = 10000},
	["blaziken"] = {DB_Balls = 500010, DB_PK = 900010, ID_Portrait = 14225, P_Experience = 15000},
	["shiny blaziken"] = {DB_Balls = 500011, DB_PK = 900011, ID_Portrait = 14100, P_Experience = 70000},
	["toxicroak"] = {DB_Balls = 500012, DB_PK = 900012, ID_Portrait = 14283, P_Experience = 25000},
	["shiny onix"] = {DB_Balls = 500013, DB_PK = 900013, ID_Portrait = 14284, P_Experience = 75000},
	["shiny rhydon"] = {DB_Balls = 500014, DB_PK = 900014, ID_Portrait = 12367, P_Experience = 75000},
	["shiny magneton"] = {DB_Balls = 500015, DB_PK = 900015, ID_Portrait = 12369, P_Experience = 75000},
	["shiny politoed"] = {DB_Balls = 500016, DB_PK = 900016, ID_Portrait = 12365, P_Experience = 75000},
	["shiny ampharos"] = {DB_Balls = 500017, DB_PK = 900017, ID_Portrait = 12836, P_Experience = 75000},
	["shiny feraligatr"] = {DB_Balls = 500018, DB_PK = 900018, ID_Portrait = 12838, P_Experience = 75000},
	["shiny magcargo"] = {DB_Balls = 500019, DB_PK = 900019, ID_Portrait = 13915, P_Experience = 75000},
	["shiny magmortar"] = {DB_Balls = 500020, DB_PK = 900020, ID_Portrait = 13932, P_Experience = 75000},
	["shiny electivire"] = {DB_Balls = 500021, DB_PK = 900021, ID_Portrait = 13936, P_Experience = 75000},
	["electivire"] = {DB_Balls = 500022, DB_PK = 900022, ID_Portrait = 14019, P_Experience = 25000},
	["metang"] = {DB_Balls = 500023, DB_PK = 900023, ID_Portrait = 14037, P_Experience = 15000},
	["metagross"] = {DB_Balls = 500024, DB_PK = 900024, ID_Portrait = 14042, P_Experience = 25000},
	["aron"] = {DB_Balls = 500025, DB_PK = 900025, ID_Portrait = 14055, P_Experience = 5000},
	["lairon"] = {DB_Balls = 500026, DB_PK = 900026, ID_Portrait = 14060, P_Experience = 10000},
	["aggron"] = {DB_Balls = 500027, DB_PK = 900027, ID_Portrait = 14065, P_Experience = 45000},
	["bagon"] = {DB_Balls = 500028, DB_PK = 900028, ID_Portrait = 14070, P_Experience = 5000},
	["shelgon"] = {DB_Balls = 500029, DB_PK = 900029, ID_Portrait = 14075, P_Experience = 10000},
	["salamence"] = {DB_Balls = 500030, DB_PK = 900030, ID_Portrait = 14080, P_Experience = 45000},
	["absol"] = {DB_Balls = 500031, DB_PK = 900031, ID_Portrait = 14140, P_Experience = 25000},
	["shiny xatu"] = {DB_Balls = 500032, DB_PK = 900032, ID_Portrait = 12852, P_Experience = 75000},
	["shiny ninetales"] = {DB_Balls = 500033, DB_PK = 900033, ID_Portrait = 12370, P_Experience = 75000},
	["milotic"] = {DB_Balls = 500034, DB_PK = 900034, ID_Portrait = 14150, P_Experience = 25000},
	["tropius"] = {DB_Balls = 500035, DB_PK = 900035, ID_Portrait = 14156, P_Experience = 45000},
	["shiny salamence"] = {DB_Balls = 500036, DB_PK = 900036, ID_Portrait = 14162, P_Experience = 75000},
	["abomasnow"] = {DB_Balls = 500037, DB_PK = 900037, ID_Portrait = 14214, P_Experience = 25000},
	["tangrowth"] = {DB_Balls = 500038, DB_PK = 900038, ID_Portrait = 14293, P_Experience = 25000},
	["rhyperior"] = {DB_Balls = 500039, DB_PK = 900039, ID_Portrait = 14288, P_Experience = 25000},
	["gardevoir"] = {DB_Balls = 500040, DB_PK = 900040, ID_Portrait = 14329, P_Experience = 30000},
	["flygon"] = {DB_Balls = 500041, DB_PK = 900041, ID_Portrait = 14339, P_Experience = 25000},
	["mawile"] = {DB_Balls = 500042, DB_PK = 900042, ID_Portrait = 14344, P_Experience = 25000},
	["slaking"] = {DB_Balls = 500043, DB_PK = 900043, ID_Portrait = 14354, P_Experience = 25000},
	["rattata"] = {DB_Balls = 500044, DB_PK = 900044, ID_Portrait = 12007, P_Experience = 2000},
}

CW_Balls = {
	["normal"] = "pb", -- PokeBall
	["great"] = "gb", -- GreatBall
	["super"] = "sb", -- SuperBall
	["ultra"] = "ub", -- UltraBall
}

-------- Functions ----------
function CW_Count(cid, pokeName, ball)
	local name = nil
	if tostring(pokeName) then

		name = pokeName:lower()
	else

		name = getCreatureName(pokeName):lower()
	end

	local pk = CW_Pokes[name]

	if pk then
		if tonumber(getPlayerStorageValue(cid, pk.DB_Balls)) then

			setPlayerStorageValue(cid, pk.DB_Balls, "pb=0,gb=0,sb=0,ub=0,")
		end

		local txt = getPlayerStorageValue(cid, pk.DB_Balls)
		local change = txt:match(CW_Balls[ball].."=(.-),")
		local num = tonumber(change)

		local ret = string.gsub(txt, CW_Balls[ball].."="..num, CW_Balls[ball].."="..(num+1))
		return setPlayerStorageValue(cid, pk.DB_Balls, ret) and true
	end
end

function CW_Caught(cid, pokeName)
	local name = nil
	if tostring(pokeName) then

		name = pokeName:lower()
	else

		name = getCreatureName(pokeName):lower()
	end

	local pk = CW_Pokes[name]

	if pk then
		if getPlayerStorageValue(cid, pk.DB_PK) <= 0 then

			doPlayerSendCancel(cid, "%#CatcherWindow@"..getItemInfo(pk.ID_Portrait).clientId.."@"..pokeName.."@"..pk.P_Experience.."@"..getPlayerStorageValue(cid, pk.DB_Balls))
			setPlayerStorageValue(cid, pk.DB_Balls, "pb=0,gb=0,sb=0,ub=0,")
			doPlayerAddExp(cid, pk.P_Experience)
			setPlayerStorageValue(cid, pk.DB_PK, 1)
		end
	end
	return true
end