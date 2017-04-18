# Explorando Marte
Esta é uma solução para o desafio [Explorando Marte](https://gist.github.com/nirev/c42c35eb9a839f7756558519f361bc06)

Considerei que quando uma sonda recebe um comando para se movem além do limite da área do planalto ela não se move.

Implementei entrada e saída usando a saída padrão. Para iniciar, chame `ExploringMars.start`.
Primeiro são solicitadas as coordendas do ponto superior-direito da malha do planalto.
Em seguida, a posição inicial de uma sonda e, depois, as instruções para sua movimentação.
Então, a posição final da sonda é informada.
Os dados de uma nova sonda são solicitados repetidamente, até que a resposta não obedeça o padrão `x y direção`.
