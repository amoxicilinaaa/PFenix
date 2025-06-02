focus1 = 0
focus2 = 0
talk_start = 0
target = 0
following = false
attacking = false
talkstate = 0
moved=0
function onThingMove(creature, thing, oldpos, oldstackpos)
end
function onCreatureAppear(creature)
end
function onCreatureDisappear(id, stackpos)
if id == focus1 or id == focus1 then
ceremonyend('Goodbye, then.')
end
end
function onCreatureTurn(creature)
end
function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
function ceremonyend(msg)
focus1 = 0
focus2 = 0
talk_start = 0
talkstate = 0
selfSay(msg)
end
function onCreatureSay(cid, type, msg)
msg = string.lower(msg)
if talkstate == 1 then
if cid == focus2 then
if msgcontains(msg, 'yes') then
talkstate=2
selfSay('' .. creatureGetName(focus1) .. ' should I begin the ceremony?')
else
ceremonyend('Come back when you are ready.')
end
end
end
if talkstate == 2 then
if cid == focus1 then
if msgcontains(msg, 'yes') then
talkstate=3
else
ceremonyend('Come back when you are ready.')
end
end
end
if talkstate == 9 then
if cid == focus1 then
if string.find(msg, '(%a*)yes(%a*)') then
talkstate=10
else
ceremonyend('Come back when you are ready.')
end
end
end
if talkstate == 11 then
if cid == focus2 then
if string.find(msg, '(%a*)yes(%a*)') then
talkstate=12
else
ceremonyend('Volte quando estiver pronto.')
end
end
end
if msgcontains(msg, 'hi') and focus1 > 0 and focus2 == 0 and not(cid==focus1) and isPromoted(cid) and getDistanceToCreature(cid) < 4 then
if getPlayerStorageValue(cid,2001) == -1 then
selfSay('Olá, ' .. creatureGetName(cid) .. '! Eu sou um Padre, posso te casar. Podemos começar?!?')
focus2 = cid
talk_start = os.clock()
talkstate=1
else
selfSay('You are already married.')
end
end
if msgcontains(msg, 'hi') and focus1 == 0 and isPromoted(cid) and getDistanceToCreature(cid) < 4 then
if getPlayerStorageValue(cid,2001) == -1 then
selfSay('Oi, ' .. creatureGetName(cid) .. '! Eu sou um Padre, e posso te casar.')
focus1 = cid
talk_start = os.clock()
else
selfSay('Tú já se casou.')
end
end
if msgcontains(msg, 'ishtar') and (focus1 == cid or focus2 == cid) then
selfSay('Ishtar é uma #####...Aquela gorda me chifrou com o Porteiro do prédio...Era um negão com um bigode na testa...')
talk_start = os.clock()
end
if string.find(msg, '(%a*)bye(%a*)') and (focus1 == cid or focus2 == cid) and getDistanceToCreature(cid) < 6 then
ceremonyend('Adeus, ' .. creatureGetName(cid) .. '!')
end
end
function onCreatureChangeOutfit(creature)
end
function onThink()
if talkstate==3 and (os.clock() - talk_start) > 10 then
selfSay('Blablablablablablabla..');
talk_start = os.clock()
talkstate=4
end
if talkstate==4 and (os.clock() - talk_start) > 6 then
selfSay('Blablablablablablabla..');
talk_start = os.clock()
talkstate=5
end
if talkstate==5 and (os.clock() - talk_start) > 6 then
selfSay('Blablablablablablabla..');
talk_start = os.clock()
talkstate=6
end
if talkstate==6 and (os.clock() - talk_start) > 8 then
selfSay('Blablablablablablabla..');
talk_start = os.clock()
talkstate=7
end
if talkstate==7 and (os.clock() - talk_start) > 6 then
selfSay('Blablablablablablabla...');
talk_start = os.clock()
talkstate=8
end
if talkstate==8 and (os.clock() - talk_start) > 6 then
selfSay(creatureGetName(focus1) .. ' quer se casar com ' .. creatureGetName(focus2) .. '?');
talk_start = os.clock()
talkstate=9
end
if talkstate==10 and (os.clock() - talk_start) > 6 then
selfSay(creatureGetName(focus2) .. ' quer se casar com ' .. creatureGetName(focus1) .. '?');
talk_start = os.clock()
talkstate=11
end
if talkstate==12 and (os.clock() - talk_start) > 6 then
pla1 = creatureGetName(focus1)
pla2 = creatureGetName(focus2)
getMarried(focus2,pla1)
getMarried(focus1,pla2)
ceremonyend('Estão casados.');
talk_start = os.clock()
end
if (os.clock() - talk_start) > 100 then
if focus1 > 0 or focus2 > 0 then
ceremonyend('Goodbye, then.')
end
end
--if moved==0 then
--x, y, z = selfGetPosition()
--moveToPosition(x+1, y, z)
--moved=1
--end
end