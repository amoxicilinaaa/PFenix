function onThink(interval, lastExecution)
MENSAGEM = {
"{[PokeF�nix]\nN�o deixe de ficar por dentro das atualiza��es e noticias do servidor, acesse nosso discord: dicord.gg/pokefenix}",
"[PokeF�nix]\nLembre-se jogadores premium tem vantagem em: Exp/Catch/dropes.",
"[PokeF�nix]\nGaranta j� sua premium, ganhe benef�cios acesse j� nossa loja.",
"[Sistema-PokeF�nix]\nUse !comandos para ver alguns comandos dispon�veis no servidor.",
"[Sistema-PokeF�nix]\nN�o deixe de atualizar nosso client para evitar erros e percas.",
"[Dica-PokeF�nix]\nVoc� pode usar o atalho CTRL+Z para usar a vara de pesca.",
"[Dica-PokeF�nix]\nD�vidas? tire elas no Canal Help!",
"[Sistema-PokeF�nix]\nPara saber mais dos benef�cios premium acesso nossa loja.",
"[Dica-PokeF�nix]\nUse !comandos para ver alguns comandos dispon�veis.",
"[Sistema-PokeF�nix]\nNosso site: ********",
"[Sistema-PokeF�nix]\nFa�a uma doa��o e ajude o servidor florecer.",
"[Dica-PokeF�nix]\nPara fazer a Mega Box Quest voc� precisa juntar 100 fire piece, 100 water piece e 100 leaf piece para poder entrar. S�o Dropados na outland e em alguns outros pokemons.",
"[Dica-PokeF�nix]\nPara saber quantos Online Points voc� possui, digite: !opshop.",
"[Sistema-PokeF�nix]\nPara saber as vantagens de ser Premium account, acesse nossa loja agora mesmo."
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end