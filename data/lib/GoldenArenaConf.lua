------------- Posiçoes de entrada e saida do safari! ----------------------
SafariEnter = {x=1151, y=1409, z=7}    --alterado v1.8 {x = 1151, y = 1409, z = 7}
SafariOut = {x =1675, y=1388, z=6}  -- 
------------- POS QUANDO O PLAYER MORRER NO PVP ---------------------------
posBackPVP = {x=1051, y=1045, z=5}  --alterado v1.7

------------- Configuraçoes da Golden Arena ---------------------------------           --alterado v1.7  \/\/ algumas pos, soh pro novo mapa!
timeToWaves = 5  --time entre waves, em segs...  --alterado v1.7  -- obrigatorio pegar pelo menos isso!
---------
GoldenUpper = {x=178, y=457, z=6}    --posiçao da ponta superior esquerda da arena! {x = 178, y = 457, z = 6}
GoldenLower = {x=205, y=477, z=6}    --posiçao da ponta inferior direita da arena! {x = 205, y = 477, z = 6}
---------
posGolden = {x=191, y=467, z=6}  --pos da golden pra onde os players vao ser teleportados!  {x = 191, y = 467, z = 6}
posBackGolden = {x=202, y=461, z=7}     --pos da golden pra onde os players vao ser teleportados ao morrerem e quando acabar a golden... {x = 202, y = 461, z = 7}
---------
horas = {"1:00", "6:00", "11:00", "16:00", "21:00"} --alterar aki os horarios da golden arena!
--deixe sempre na ordem do menor pro maior horario!!!
--------
posisGolden = {
{x=182, y=459, z=6}, 
{x=182, y=463, z=6},
{x=182, y=467, z=6},
{x=182, y=471, z=6},
{x=182, y=475, z=6},

{x=201, y=459, z=6},
{x=201, y=463, z=6},
{x=201, y=466, z=6},
{x=201, y=470, z=6},
{x=201, y=474, z=6},

{x=188, y=461, z=6},
{x=195, y=461, z=6},
{x=188, y=474, z=6},
{x=195, y=474, z=6},
{x=191, y=470, z=6},
}
----------
wavesGolden = {                 --waves q vao ter na golden arena... o numero de pokes tem q ser igual ao numero de posis!!                           
[1] = {"Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion", "Mage Exeggutor", "Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion"},                    
[2] = {"Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion", "Mage Exeggutor", "Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion"},                  
[3] = {"Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion", "Mage Exeggutor", "Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion"},              
[4] = {"Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion", "Mage Exeggutor", "Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion"},                    
[5] = {"Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion", "Mage Exeggutor", "Compound Scyther", "Exonered Scizor", "Mom Kangaskhan", "Milk Miltank", "Oriental Feraligatr", "Brave Arcanine", "Exonered Typhlosion"},                  
[6] = {"Hardflame Charizard", "Hardflame Charizard", "Flame Charizard", "Flame Charizard", "Hardflame Charizard", "Flame Charizard", "Flame Charizard", "Flame Charizard", "Hardflame Charizard", "", "Hardflame Charizard", "Flame Charizard", "Hardflame Charizard", "Flame Charizard", "Flame Charizard"},
[7] = {"Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard", "Hardflame Charizard"},
[8] = {"Stronger Snorlax", "Stronger Snorlax", "Brave Snorlax", "Brave Snorlax", "Brave Snorlax", "Brave Snorlax", "Stronger Snorlax", "Brave Snorlax", "Brave Snorlax", "Stronger Snorlax", "Brave Snorlax", "Brave Snorlax", "Brave Snorlax", "Stronger Snorlax", "Stronger Snorlax"},
[9] = {"Brave Snorlax", "Brave Electivire", "Brave Snorlax", "Pharaoh Lucario", "Pharaoh Lucario", "Brave Electivire", "Brave Snorlax", "Brave Snorlax", "Brave Electivire", "Pharaoh Lucario", "Pharaoh Lucario", "Brave Electivire", "Brave Electivire", "Pharaoh Lucario", "Pharaoh Lucario"},
[10] = {"Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire", "Brave Electivire"},

}
----------------------------------------------------------------------------------------------