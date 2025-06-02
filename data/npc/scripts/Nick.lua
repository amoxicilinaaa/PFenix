

local focus = 0
local talk_start = 0
local conv = 0
local target = 0
local following = false
local attacking = false
local talkState = {}
local finalname = ""

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msge)
local msg = string.lower(msge)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


    if focus == cid then
        talk_start = os.clock()
    end

local auras = {"red aura", "blue aura", "green aura", "yellow aura", "white aura", "gray aura", "cyan aura", "purple aura", "orange aura"}


if (msgcontains(msg, 'hi') and (focus == 0) and (getDistanceToCreature(cid) <= 4)) then

    focus = cid
    conv = 1
    talk_start = os.clock()
    selfSay("Ola, "..getCreatureName(cid).."! Eu posso dar ao seu Pokémon um {apelido} ou eu posso colocar no seu pokemon uma {aura} elementar, se ele for Boost pelo menos +50")

elseif (msgcontains(msg, "nao") or msgcontains(msg, "no")) and focus == cid and conv ~= 3 then

    selfSay("Sem problema, então , senhor. Volte quando você quiser!")
    focus = 0

elseif (msgcontains(msg, "nick") or msgcontains(msg, "apelido")) and focus == cid and conv == 1 then

        if getPlayerSlotItem(cid, 8).uid <= 0 then
            selfSay("Desculpe, voce nao tem pokemon no slot principal")
            focus = 0
        return true
        end

    selfSay("Coloque o seu pokemon no Slot principal e me diga, o apelido que gostaria de dar a seu pokemon ?")
    conv = 3
    
elseif msgcontains(msg, "aura") and focus == cid and conv == 1 then

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Desculpe, você não tem um pokemon no Slot principal!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Desculpe, seu pokemon tem que ter no minimo Boost +50!")
        focus = 0
     return true
     end  
     
     if getItemAttribute(pb, "aura") and getItemAttribute(pb, "aura") ~= "" then
        selfSay("Desculpe, seu pokemon já tem uma aura elementar !")
        focus = 0
     return true
     end
     
     if #getCreatureSummons(cid) >= 1 then
        selfSay("Volte seu pokemon para a pokebola!")
        focus = 0
     return true
     end       
          
     selfSay("Escolha uma aura: red aura, blue aura, green aura, yellow aura, white aura, gray aura, cyan aura, purple aura, orange aura. Qual a sua preferida?")
     conv = 9
     
elseif isInArray(auras, msg) and focus == cid and conv == 9 then

       selfSay("Tem certeza que deseja colocar uma "..msg.." no seu pokemon?")
       conv = 11
       local d, e = msg:find('(.-) aura')
       auraFinal = string.sub(msg, d -1, e - 5)
       
elseif msgcontains(msg, "yes") and focus == cid and conv == 11 then        

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Desculpe, voce nao tem pokemon no slot principal!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Desculpe, seu pokemon nao e boost +50!")
        focus = 0
     return true
     end
     
     if #getCreatureSummons(cid) >= 1 then
        selfSay("Volte seu pokemon para a pokebola!")
        focus = 0
     return true
     end   
     
     doItemSetAttribute(pb, "aura", auraFinal)   
     selfSay("Pronto! Agora seu pokemon tem uma aura elementar, aproveite!")
     focus = 0
     conv = 0
       
elseif conv == 3 and focus == cid then

    local tablee = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "w", "y", "z", ".", ":", "'", '"', "~", "^", "@", "#", "$", "%", "&", "*", "(", ")", "-", "+", "_", "?", ">", "<", "•", ";", "°", "¹", "²", "³", "£", "¢", "¬", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
    local table = {"'", '"', "!", "ã", "õ", "ç", "´", "`", "á", "à", "ó", "ò", "é", "è", "í", "ì", "ú", "ù", "¹", "²", "³", "£", "¢", "¬", "§", "°", "º", "ª", "•", "|"}

    for a = 1, #table do
        if string.find(msg, table[a]) then
            selfSay("Desculpe, o nome possui simbolos invalidos.")
        return true
        end
    end

    if string.len(msg) <= 1 or string.len(msg) >= 19 then
        selfSay("Desculpe, o nome e muito grande ou muito pequeno.")
    return true
    end

    local pokename = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")


    selfSay("Tem certeza que deseja mudar o nome do seu "..pokename.." para \""..msge.."\"? isso custara 10 TDS.")
    conv = 5
    finalname = msge

elseif msgcontains(msg, "yes") and focus == cid and conv == 5 then

    if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Onde esta seu pokemon? voce deve mante-lo no slot principal")
        focus = 0
    return true
    end

    if doPlayerRemoveMoney(cid, 10000000) == false then
        selfSay("Voce nao tem dinheiro para pagar o servico, volte mais tarde.")
        focus = 0
        conv = 0
    return true
    end

    local nick = ""..finalname..""
    local description = "Contains a "..getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke").."."
    selfSay("Pronto! Seu pokemon agora possui um nome, aproveite!")
    doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "nick", nick)
    local newdes = description.."\nIt's nickname is: "..finalname.."."
    doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "description", newdes)
    local hp = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "happy")
    doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "happy", hp + 25)
    if #getCreatureSummons(cid) >= 1 then
        adjustStatus(getCreatureSummons(cid)[1], getPlayerSlotItem(cid, 8).uid)
    end
    focus = 0
    conv = 0
    end
end
 
local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Quer dar alguns apelidos para o seu pokemon ? Fale comigo!",
          "Voce pode por um nome legal em seu pokemon!",
          "Cada pokemon quer ter um apelido ! Venha falar comigo!",
          "Pokemons adoram nomes, de um para o seu agora.",
         }

function onThink()

    if focus == 0 then
        selfTurn(1)
            delay = delay - 0.5
            if delay <= 0 then
                selfSay(messages[number])
                number = number + 1
                    if number > #messages then
                        number = 1
                    end
                delay = math.random(intervalmin, intervalmax)
            end
        return true
    else

    if not isCreature(focus) then
        focus = 0
    return true
    end

        local npcpos = getThingPos(getThis())
        local focpos = getThingPos(focus)

        if npcpos.z ~= focpos.z then
            focus = 0
        return true
        end

        if (os.clock() - talk_start) > 45 then
            focus = 0
            selfSay("Volte outra hora!")
        end

        if getDistanceToCreature(focus) > 3 then
            selfSay("Ate logo!")
            focus = 0
        return true
        end

        local dir = doDirectPos(npcpos, focpos)    
        selfTurn(dir)
    end


return true
end
