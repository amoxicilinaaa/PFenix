
CONFIG = {


    [1] = {message = "Site oficial do PKC: www.PokeChampions.com.br"},
    [2] = {message = "Dúvidas? faça suas dúvidas no Canal Help"},
	[3] = {message = "Kkk eae men seja bem-vindo.(PKC)", color = 19},
    [4] = {message = "Garanta já seu vip você ganhará experiência dobrada e a captura será mais fácil, e muitas outras vantagens!."},
[5] = {message = "Não coloque sua senha em outro site a não ser o do pokechampions.com.br, assim você evitará de ser hackeado."},
[6] = {message = "Fiquem ligados nas notícias na nossa pagina oficial: www.facebook.com/Pkc.RPG.Online/ "},
}

function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end