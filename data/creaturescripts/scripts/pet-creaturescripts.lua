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

function onKill(cid, target, lastHit)
local pet = get_pet(cid)

if not isMonster(target) or getMonsterInfo(getCreatureName(target)) and getMonsterInfo(getCreatureName(target)).experience == 0 then
return true
end

if not pet then
return true
end

pet:addexperience(getMonsterInfo(getCreatureName(target)).experience)
return true
end

function onDeath(cid, corpse, deathList)
if not is_pet(cid) then
return true
end

local master = getCreatureMaster(cid)
doPlayerSendTextMessage(master, MESSAGE_EVENT_ADVANCE, "Your pet is dead.")
doCreatureSetStorage(master, PET_ALIVE, 0)
doCreatureSetStorage(master, PET_HEALTH, getCreatureMaxHealth(cid))
return true
end