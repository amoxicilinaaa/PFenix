-- This script is part of Pet System
-- Copyright (C) 2013 Oneshot
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.

-- storages for pet system
PET_UID = 80001
PET_SPECIE = 80002
PET_LEVEL = 80003
PET_EXPERIENCE = 80004
PET_HEALTH = 80005
PET_HEALTHMAX = 80006
PET_MANA = 80007
PET_MANAMAX = 80008
PET_EXHAUST = 80009
PET_ALIVE = 80010

Pets = {}

-- class for pet species
PetSpecie = {
type = "",

basehp = 0,
basemp = 0,

gainhp = 0,
gainmp = 0,

spells = {},

evolution = "",
evolve = 0,
}

-- class for pets
Pet = {
it = nil,

attributes = nil,

level = 0,
experience = 0,

health = 0,
healthmax = 0,

mana = 0,
manamax = 0,
}

-- create new instances of PetSpecie
function PetSpecie:new(type, basehp, basemp, gainhp, gainmp, spells, evolution, evolve)
local new_specie = {
type = type,
basehp = basehp,
basemp = basemp,
gainhp = gainhp,
gainmp = gainmp,
spells = spells,
evolution = evolution,
evolve = evolve,
}
local obj = setmetatable(new_specie, {__index = self})
Pets[type:lower()] = obj
return obj
end

-- create new instances of Pet
function PetSpecie:create()
local new_pet = {
it = nil,
attributes = self,
level = 1,
experience = 0,
health = self.basehp,
healthmax = self.basehp,
mana = self.basemp,
manamax = self.basemp,
}
return setmetatable(new_pet, {__index = Pet})
end

-- summon a player pet for the first time
function Pet:hatch(cid)
if getCreatureStorage(cid, PET_SPECIE) ~= -1 then
return doPlayerSendCancel(cid, "You already have a pet.")
end

local pet = doCreateMonster(self.attributes.type, getCreaturePosition(cid))
if not pet then
return false
end

if not doConvinceCreature(cid, pet) then
doRemoveCreature(pet)
return false
end

self:setit(pet)
setCreatureMaxHealth(pet, self.healthmax)
doCreatureAddHealth(pet, self.healthmax)
doCreatureSetStorage(cid, PET_SPECIE, self.attributes.type)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your new pet has born.")
self:save()
doSendMagicEffect(getCreaturePosition(pet), CONST_ME_HOLYDAMAGE)
return self
end

-- make player pet say something
function Pet:say(strt)
doCreatureSay(self.it, strt, TALKTYPE_ORANGE_1)
end

-- gather a summoned player pet back
function Pet:back()
self:save()
doSendMagicEffect(self:position(), CONST_ME_POFF)
doCreatureSay(getCreatureMaster(self.it), "It's enough, ".. getCreatureName(self.it))
doRemoveCreature(self.it)
end

-- free a player pet forever
function Pet:release()
local cid = getCreatureMaster(self.it)
doCreatureSay(cid, "Good bye, ".. getCreatureName(self.it) .."... :'(")
doCreatureSetStorage(cid, PET_UID, -1)
doCreatureSetStorage(cid, PET_SPECIE, -1)
doCreatureSetStorage(cid, PET_LEVEL, -1)
doCreatureSetStorage(cid, PET_EXPERIENCE, -1)
doCreatureSetStorage(cid, PET_HEALTH, -1)
doCreatureSetStorage(cid, PET_HEALTHMAX, -1)
doCreatureSetStorage(cid, PET_MANA, -1)
doCreatureSetStorage(cid, PET_MANAMAX, -1)
doSendMagicEffect(self:position(), CONST_ME_POFF)
doRemoveCreature(self.it)
end

-- add experience to player pet
function Pet:addexperience(value)
local prevLevel = self.level
local nextLevelExp = getExperienceForLevel(self.level + 1)

self.experience = self.experience + value
while self.experience >= nextLevelExp do
self.healthmax = self.healthmax + self.attributes.gainhp
self.manamax = self.manamax + self.attributes.gainmp

self.level = self.level + 1
nextLevelExp = getExperienceForLevel(self.level + 1)
end

if prevLevel ~= self.level then
self.mana = self.manamax
self.health = self.healthmax
doPlayerSendTextMessage(getCreatureMaster(self.it), MESSAGE_STATUS_CONSOLE_BLUE, "Your pet advanced from level ".. prevLevel .." to level ".. self.level ..".")
setCreatureMaxHealth(self.it, self.healthmax)
doCreatureAddHealth(self.it, getCreatureMaxHealth(self.it))
self:save()
if self.attributes.evolution then
if self.attributes.evolve and self.level >= self.attributes.evolve then
doCreatureSay(getCreatureMaster(self.it), "What's happening?!")
addEvent(function()
local cid = getCreatureMaster(self.it)
local position = self:position()
doRemoveCreature(self.it)
local pet = doCreateMonster(self.attributes.evolution, position)

if not doConvinceCreature(cid, pet) then
doRemoveCreature(pet)
call_pet(cid)
return
end

doCreatureSetStorage(cid, PET_UID, pet)
setCreatureMaxHealth(pet, self.healthmax)
doCreatureAddHealth(pet, getCreatureMaxHealth(pet))
doSendMagicEffect(getCreaturePosition(pet), CONST_ME_MORTAREA)
doCreatureSetStorage(cid, PET_SPECIE, self.attributes.evolution)
end, 100)
end
end
end
end

-- make pet cast a spell
function Pet:cast(index)
local cid = getCreatureMaster(self.it)
if not self.attributes.spells[index] then
return doPlayerSendCancel(cid, "This spell is unknown.")
end

local spell = self.attributes.spells[index]

if self.level < spell.level then
doPlayerSendCancel(cid, "Your pet doesn't have enough level to cast this spell.")
return
end

if self.mana < spell.mana then
doPlayerSendCancel(cid, "Your pet doesn't have enough mana to cast this spell.")
return
end

if getCreatureStorage(cid, PET_EXHAUST) > os.clock() then
doSendMagicEffect(self:position(), CONST_ME_POFF)
doPlayerSendCancel(cid, "Your pet is exhausted.")
return
end

if spell.target then
local target = getCreatureTarget(self.it)
if target == 0 then
doPlayerSendCancel(cid, "First, select a target.")
return
end

spell.range = spell.range or 1
if getDistanceBetween(self:position(), getCreaturePosition(target)) > spell.range then
doPlayerSendCancel(cid, "Too far to cast spell.")
return
end
doSendDistanceShoot(self:position(), getCreaturePosition(target), spell.shooteffect)
doTargetCombatHealth(self.it, target, spell.type, -spell.min, -spell.max, spell.effect)
else
doAreaCombatHealth(self.it, spell.type, self:position(), (spell.area or 0), -min, -max, spell.effect)
end
self.mana = self.mana - spell.mana
doCreatureSetStorage(cid, PET_EXHAUST, os.clock() + (spell.exhaust / 1000))
doCreatureSay(cid, getCreatureName(self.it) ..", use ".. spell.name .."!")
self:say(spell.name)
end

-- set pet uid
function Pet:setit(uid)
self.it = uid
end

-- get player pet position
function Pet:position()
return getCreaturePosition(self.it)
end

-- move player pet to a direction
function Pet:move(direction)
local toPosition = getPosByDir(self:position(), direction, 1)

if getCreatureStorage(getCreatureMaster(self.it), PET_EXHAUST) > os.clock() then
doSendMagicEffect(self:position(), CONST_ME_POFF)
doPlayerSendCancel(cid, "Your pet is exhausted.")
return
end

if queryTileAddThing(self.it, toPosition) == RETURNVALUE_NOERROR then
doMoveCreature(self.it, direction)
doCreatureSetStorage(cid, PET_EXHAUST, os.clock() + 0.5)
doCreatureSay(cid, "Move, ".. getCreatureName(self.it) .."!")
end
end

-- save player pet attributes
function Pet:save()
local cid = getCreatureMaster(self.it)
doCreatureSetStorage(cid, PET_UID, self.it)
doCreatureSetStorage(cid, PET_SPECIE, getCreatureName(self.it))
doCreatureSetStorage(cid, PET_LEVEL, self.level)
doCreatureSetStorage(cid, PET_EXPERIENCE, self.experience)
doCreatureSetStorage(cid, PET_HEALTH, self.health)
doCreatureSetStorage(cid, PET_HEALTHMAX, self.healthmax)
doCreatureSetStorage(cid, PET_MANA, self.mana)
doCreatureSetStorage(cid, PET_MANAMAX, self.manamax)
end

-- get player pet and return instance
function get_pet(cid)
local uid, it = getCreatureStorage(cid, PET_UID)
for _, pet in ipairs(getCreatureSummons(cid)) do
if pet == uid then
it = pet
break
end
end

if not it then
return false
end

local this_pet = {
it = it,
attributes = Pets[getCreatureName(it):lower()],
level = getCreatureStorage(cid, PET_LEVEL),
experience = getCreatureStorage(cid, PET_EXPERIENCE),
health = getCreatureHealth(it),
healthmax = getCreatureMaxHealth(it),
mana = getCreatureStorage(cid, PET_MANA),
manamax = getCreatureStorage(cid, PET_MANAMAX),
}
return setmetatable(this_pet, {__index = Pet})
end

-- summon a existing player pet
function call_pet(cid)
if get_pet(cid) then
return doPlayerSendCancel(cid, "You cannot summon your pet more than one time.")
end

if getCreatureStorage(cid, PET_SPECIE) == -1 then
return doPlayerSendCancel(cid, "You don't have a pet.")
end

if getCreatureStorage(cid, PET_ALIVE) == 0 then
return doPlayerSendCancel(cid, "You need to revive your pet")
end

local pet = doCreateMonster(getCreatureStorage(cid, PET_SPECIE), getCreaturePosition(cid))
if not pet then
return false
end

if not doConvinceCreature(cid, pet) then
doRemoveCreature(pet)
return false
end

local health, healthmax = getCreatureStorage(cid, PET_HEALTH), getCreatureStorage(cid, PET_HEALTHMAX)
setCreatureMaxHealth(pet, healthmax)
doCreatureAddHealth(pet, healthmax)
doCreatureAddHealth(pet, (health - healthmax))
doCreatureSay(cid, "Go, ".. getCreatureName(pet) .."!")
doSendMagicEffect(getCreaturePosition(pet), CONST_ME_MAGIC_GREEN)
doCreatureSetStorage(cid, PET_UID, pet)

return true
end

-- is pet

function is_pet(cid)
return getCreatureMaster(cid) == 0 and false or isPlayer(getCreatureMaster(cid))
end

dofile(getDataDir() .."/lib/pet-spells.lua")

Pet_Rat = PetSpecie:new("Raikou", 1000, 0, 100, 100, {[0] = Rock_Throw, [0] = Dark_Bite}, "Cave Rat", 14)