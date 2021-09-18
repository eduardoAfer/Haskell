# week3

Usando map, crie uma função `comprimentoAoQuadrado xs` que recebe uma lista de strings e, como o nome sugere, retorna os seus comprimentos ao quadrado. Exemplo:

```haskell
comprimentoAoQuadrado ["ola", "mundo"] == [9, 25]
```

★☆☆ Defina a função findLast f xs que retorne o último elemento de xs que satisfaz o predicado f. Assuma que a lista sempre conterá ao menos um elemento que satisfaz o predicado.

★☆☆ Crie uma função gerarUsuarios n prefixo que recebe um n inteiro e um prefixo em string e tem o seguinte comportamento:
gerarUsuarios 3 "pessoa" == ["pessoa1", "pessoa2", "pessoa3"]
gerarUsuarios 5 "usuario" == ["usuario1", "usuario2", "usuario3", "usuario4", "usuario5"]


★☆☆ O gerente de uma loja resolveu conceder um desconto de 10 reais em todos os produtos. Porém, como ele é muito supersticioso, caso o valor do produto com o desconto seja múltiplo de 7, esse produto deve ser descartado. Faça uma função descontoDaSorte precos que simule esse comportamento, considerando que a loja só vende produtos com preços inteiros.
descontoDaSorte [17, 22, 35, 31] == [12, 25]


★★☆ Crie uma função limparUsernames usernames que recebe uma lista de strings usernames e limpa cada um dos nomes. Um username limpo, nesse caso, é aquele composto apenas por caracteres alfanuméricos (considere a função isAlphaNum do módulo Data.Char)
limparUsernames ["joao_123", "Maria.456"] == ["joao123", "Maria456"]


★★☆ Crie uma função maisDaMetade f xs que retorne um booleano indicando se mais da metade dos valores da lista xs atende a um dado predicado f. Assuma que a lista nunca estará vazia. Por exemplo:
em uma lista de 3 elementos, ao menos 2 devem satisfazer o predicado;
em uma lista de 4 elementos, ao menos 3 devem safisfazer o predicado.


★★★ Crie uma função filterDesastrado f xs que recebe um predicado f e uma lista xs e remove os elementos que não atendem ao predicado. No entanto, ao encontrar um elemento que deve ser removido, a função (por ser desastrada) também remove o último elemento que ela deixou passar, se existir. Exemplo:
filterDesastrado (\x -> x < 10) [1, 5, 7, 10, 3, 4, 15, 9] = [1, 5, 3, 9]
filterDesastrado (\x -> x < 10) [1, 2, 3, 11, 12, 7] = [1, 7]


★★★ Crie uma função palavraMaisLonga palavras que receba uma lista de strings e retorne aquela que tem o maior comprimento. No caso de empate, a palavra que apareceu primeiro deve prevalecer. Assuma que a lista nunca estará vazia.


★★★ Implemente uma função jogadorBlackJack que recebe uma lista de inteiros de 1 a 10, representando as cartas. Este jogador vai comprando cartas em ordem, até que a soma de sua mão seja >= 18. Retorne se o valor final da mão do jogador é válido, isto é, <= 21. Assuma que a lista fornecida nunca estará vazia.