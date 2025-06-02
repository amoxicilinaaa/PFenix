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

function onSay(cid, words, param, channel)
param = string.explode(param, ":")

if param[1]:lower() == "go" then
if getTilePzInfo(getCreaturePosition(cid)) then
return doPlayerSendCancel(cid, "You cannot call your pet at protection zone.")
end

local pet = get_pet(cid)
if pet then
return doPlayerSendCancel(cid, "You cannot call your pet two times.")
end

call_pet(cid)
return true
elseif param[1]:lower() == "back" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

pet:back()
return true
elseif param[1]:lower() == "release" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

pet:release()
return true
elseif param[1]:lower() == "cast" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

local index = tonumber(param[2]) or 1
pet:cast(index)
return true
elseif param[1]:lower() == "say" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

pet:say(param[2])
return true
elseif param[1]:lower() == "move" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

if not isInArray({"north", "south", "east", "west"}, param[2]:lower()) then
return doPlayerSendCancel(cid, "Invalid direction.")
end

pet:move((_G[param[2]:upper()] or NORTH))
return true
elseif param[1]:lower() == "addexp" then
local pet = get_pet(cid)
if not pet then
return doPlayerSendCancel(cid, "Please call your pet first.")
end

if getPlayerGroupId(cid) < 3 then
return doPlayerSendCancel(cid, "You cannot use this command.")
end

pet:addexperience(tonumber(param[2]) or 0)
return true
end
return true
end