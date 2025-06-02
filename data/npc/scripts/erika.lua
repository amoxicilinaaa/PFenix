local focus = 0
local max_distance = 8
local talk_start = 0
local conv = 0
local fighting = false
local challenger = 0
local afk_limit_time = 100 -- seconds
local afk_time = 0 -- don't change
local battle_turn = 1 -- don't change
local challenger_turn = 0 -- don't change
 
local pokemons = {
{name = "Tangela", optionalLevel = 450, sex = SEX_MALE, nick = "", ball = "normal"},
{name = "Vileplume", optionalLevel = 450, sex = SEX_FEMALE, nick = "", ball = "normal"},
{name = "Exeggutor", optionalLevel = 450, sex = SEX_MALE, nick = "", ball = "normal"},
{name = "Venusaur", optionalLevel = 450, sex = SEX_MALE, nick = "", ball = "normal"},
{name = "Victreebel", optionalLevel = 450, sex = SEX_MALE, nick = "", ball = "normal"},

}


local function doSummonGymPokemon(npc)
	local this = npc
	if #getCreatureSummons(this) >= 1 or focus == 0 then return true end
	local it = pokemons[battle_turn]
	doSummonMonster(this, it.name)
	local summon = getCreatureSummons(this)[1]
	local balleffect = pokeballs["normal"].effect
		if it.ball and pokeballs[it.ball] then
			balleffect = pokeballs[it.ball].effect
		end
	doSendMagicEffect(getThingPos(summon), balleffect)
	setPlayerStorageValue(summon, 10000, balleffect)
	setPlayerStorageValue(summon, 10001, gobackmsgs[math.random(#gobackmsgs)].back:gsub("doka", it.nick ~= "" and it.nick or it.name))
	setPlayerStorageValue(summon, 1007, it.nick ~= "" and it.nick or it.name)
	doSetMonsterGym(summon, focus)
	addEvent(adjustWildPoke, 15, summon, it.optionalLevel)
	local name = it.nick ~= "" and it.nick or getCreatureName(this).."s "..it.name
	doCreatureSay(this, gobackmsgs[math.random(#gobackmsgs)].go:gsub("doka", getPlayerStorageValue(summon, 1007)), 1)
	fighting = true
	battle_turn = battle_turn + 1
end

local function doWinDuel(cid, npc)
	if not isCreature(cid) then return true end
	local this = npc
	local a = gymbadges[getCreatureName(this)] + 8
	doCreatureSay(npc, "Você ganhou o duelo! Parabéns, pegue isso "..getItemNameById(a - 8).." Como um prêmio.", 1)
	local b = getPlayerItemById(cid, true, a)
	if b.uid > 0 then doTransformItem(b.uid, b.itemid - 8) end
doPlayerSendCancel(cid, "#getBadges# "..getCreatureName(this).." "..getPlayerItemCount(cid, gymbadges[getCreatureName(this)]))
end

function onCreatureSay(cid, type, msg)

	local msg = string.lower(msg)

	if focus == cid then
		talk_start = os.clock()
	end

	if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 4 then
		focus = cid
		talk_start = os.clock()
		conv = 1
		selfSay("Olá "..getCreatureName(cid)..", Meu nome é Erika e eu sou Celadon's Gym Líder. Como posso ajudá-lo?")
	return true
	end

	if isDuelMsg(msg) and conv == 1 and focus == cid then

		--if getPlayerItemCount(cid, gymbadges[getCreatureName(getThis())]) >= 1 then
		--	selfSay("You have already won my Rainbow Badge, maybe some other day we can fight.")
		--	focus = 0
		--return true
		--end

		if not hasPokemon(cid) then
			selfSay("Para lutar de novo contra um líder de ginásio você precisa de pokemons.")
		return true
		end

		selfSay("Você está me desafiando a uma batalha. Será uma "..#pokemons.." Batalha limite pokemon, vamos começar?")
		conv = 2

	return true
	end

	if isConfirmMsg(msg) and conv == 2 and focus == cid then

		challenger = focus
		setPlayerStorageValue(cid, 990, 1)
		selfSay("Sim, vamos lutar!")
		talk_start = os.clock()
		addEvent(doSummonGymPokemon, 850, getThis())
		conv = 3

	return true
	end

	if isNegMsg(msg) and conv == 2 and focus == cid then

		focus = 0
		selfSay("É melhor para você recusar uma batalha contra mim!")

	return true
	end

	if msgcontains(msg, 'bye') and focus == cid then
		selfSay('Tchau você fez o seu melhor treinador!')
		setPlayerStorageValue(focus, 990, -1)
		focus = 0
	return true
	end
end

local afk_warning = false

function onThink()

	--doSendAnimatedText(getThingPos(getThis()), getCreatureName(getThis()), 215)

  	if focus == 0 then
   		selfTurn(1)
   		fighting = false
   		challenger = 0
   		challenger_turn = 1
		battle_turn = 1
		afk_time = 0
		afk_warning = false  

		if #getCreatureSummons(getThis()) >= 1 then
			setPlayerStorageValue(getCreatureSummons(getThis())[1], 1006, 0)
			doCreatureAddHealth(getCreatureSummons(getThis())[1], -getCreatureMaxHealth(getCreatureSummons(getThis())[1]))
		end

	return true
	else

	if not isCreature(focus) then
		focus = 0
	return true
	end

	if fighting then

		talk_start = os.clock()

		if not isCreature(getCreatureTarget(getThis())) then
			if #getCreatureSummons(challenger) >= 1 then
				if getCreatureOutfit(getCreatureSummons(challenger)[1]).lookType ~= 2 then --alterado v1.6
				  selfAttackCreature(getCreatureSummons(challenger)[1])
				  challenger_turn = challenger_turn + 1
				  afk_time = 0
	            end
			else
				afk_time = afk_time + 0.5
			end
		end

		if afk_time > afk_limit_time then
			setPlayerStorageValue(focus, 990, -1)
			focus = 0
			selfSay("Eu esperei muito tempo, volte quando você estiver pronto!")
		return true
		end

		if not afk_warning and afk_time > afk_limit_time / 2 then
			selfSay("Onde está o seu pokemon? Vamos lutar!")
			afk_warning = true
		end


		if #getCreatureSummons(getThis()) == 0 then
			if battle_turn > #pokemons then
				addEvent(doWinDuel, 1000, focus, getThis())
				setPlayerStorageValue(focus, 990, -1)
				focus = 0
			return true
			end
			addEvent(doSummonGymPokemon, 1000, getThis())
		end

		if not hasPokemon(challenger) or challenger_turn >= 7 or challenger_turn > #pokemons then
			selfSay("Você perdeu nosso duelo! Talvez alguma outra vez você me derrote.")
			setPlayerStorageValue(focus, 990, -1)
			focus = 0
		return true
		end

	end

		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)

		if npcpos.z ~= focpos.z then
			setPlayerStorageValue(focus, 990, -1)
			focus = 0
			selfSay("Então tchau.")
		return true
		end

		if (os.clock() - talk_start) > 30 then
			selfSay("Adeus e continue treinando!")
			setPlayerStorageValue(focus, 990, -1)
			focus = 0
		end

		if getDistanceToCreature(focus) > max_distance then
			setPlayerStorageValue(focus, 990, -1)
			focus = 0
		return true
		end

		local dir = doRedirectDirection(getDirectionTo(npcpos, focpos))	
		selfTurn(dir)
	end
return true
end