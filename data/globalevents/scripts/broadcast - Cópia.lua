
CONFIG = {


    [1] = {message = "Site oficial do PKC: www.PokeChampions.com.br"},
    [2] = {message = "D�vidas? fa�a suas d�vidas no Canal Help"},
	[3] = {message = "Kkk eae men seja bem-vindo.(PKC)", color = 19},
    [4] = {message = "Garanta j� seu vip voc� ganhar� experi�ncia dobrada e a captura ser� mais f�cil, e muitas outras vantagens!."},
[5] = {message = "N�o coloque sua senha em outro site a n�o ser o do pokechampions.com.br, assim voc� evitar� de ser hackeado."},
[6] = {message = "Fiquem ligados nas not�cias na nossa pagina oficial: www.facebook.com/Pkc.RPG.Online/ "},
}

function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end