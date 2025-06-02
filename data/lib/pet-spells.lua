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

dofile("data/spells/lib/spells.lua")

Dark_Bite = {
name = "Dark Bite",
level = 1,
mana = 100,
type = COMBAT_PHYSICALDAMAGE,
effect = CONST_ME_BLOCKHIT,
shooteffect = CONST_ANI_SMALLSTONE,
target = true,
range = 1,
min = 300,
max = 500,
area = 0,
exhaust = 1000,
}

Rock_Throw = {
name = "Rock Throw",
level = 1,
mana = 10,
type = COMBAT_PHYSICALDAMAGE,
effect = CONST_ME_BLOCKHIT,
shooteffect = CONST_ANI_NONE,
target = true,
range = 1,
min = 20,
max = 25,
area = 0,
exhaust = 1000,
}