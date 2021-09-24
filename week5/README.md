# Semana 05

## Conteúdo

| Tópico                    | Material de Estudo                                                       | Playlist                                                                 |
| ------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
Monoid e Foldable|https://haskell.pesquisa.ufabc.edu.br/posts/haskell/08.monoids.foldable.html|https://www.youtube.com/playlist?list=PLYItvall0TqIzShhLgcVVti0d0kAaJMWC
Functor|https://haskell.pesquisa.ufabc.edu.br/posts/haskell/09.functors.html|https://www.youtube.com/playlist?list=PLYItvall0TqKtSdeBAjz0GOM_3oq3pP8-

## Resumo (2 pontos)

**⚠️ Não se esqueça de escrever o seu resumo no arquivo `resumo.txt`. Os resumos deverão ser sobre as aulas da tabela acima, possuir no máximo 300 palavras e serão publicados no site da disciplina junto ao tópico de estudo dessa semana.**

# Exercícios (8 pontos + 🏆 1 BÔNUS)


### Tema 1 - 🧿 Monoides

> A princípio o seu código não irá compilar! Será necessário preencher pelo menos das instâncias pedidas, mesmo que com `undefined`s por enquanto. Aproveitamos a oportunidade para lembrar a vocês que códigos que não compilarem receberão a nota 0.

1. ★☆☆ Considere o tipo `data Resultado = Pontuacao Int | Cola`, que representa o resultado das atividades entregues por um aluno. No final do quadrimestre, deseja-se somar a pontuação de todas as atividades entregues. No entanto, no caso de `Cola`, toda a pontuação obtida até o momento deve ser descartada, pois implica reprovação automática. Implemente uma instância de monoide para `Resultado` que modele esse comportamento.

2. ★☆☆ Considere o tipo `data Set a = Set [a]`, que deve representar um conjunto arbitrário de qualquer `a`. 
    **Invariante:** a lista armazenada pelo construtor `Set` deve sempre conter elementos únicos e ordenados.
    - Implemente uma instância de `Show` para o set, que mostre-o conforme o seguinte exemplo: `Set [1,2,4] => "{1,2,4}"` (considere a função `intercalate` do `Data.List`)
    - Implemente uma função `fromList :: Ord a => [a] -> Set a` que gera um conjunto a partir de uma lista.
    - Implemente uma função `member :: Ord a => a -> Set a -> Bool` que retorna se um elemento pertence àquele conjunto
    - Implemente uma função `insert :: Ord a => a -> Set a -> Set a` que adiciona o elemento passado por parâmetro no conjunto passado por parâmetro
    - Implemente uma função `delete ::  Ord a => a -> Set a -> Set a` que faz o inverso da função acima
3. ★★☆ Implemente uma instância de `Monoid` para `Set a`, dado que `a` seja `Ord`, utilizando a operação de união de conjuntos

4. ★★☆ Você está abrindo uma lanchonete diferente, pois não existe um cardápio fixo. Você apenas fornece uma lista de ingredientes possíveis, e os clientes podem combiná-los como bem entenderem. Considere os tipos `data Dieta = Vegano | Vegetariano | Tradicional`, e `data Lanche = Lanche (Set String) Int Dieta`. Dessa forma, um Lanche é composto por um conjunto de ingredientes, um preço em centavos e qual o tipo de Dieta adequado para aquele lanche. Implemente uma instância de monoide para `Dieta`, considerando o seguinte que duas dietas são combinadas usando  "denominador comum", ou seja, duas dietas diferentes resultam na menos restritiva:
    - Se você colocar queijo (alimento vegetariano, mas não vegano) em um lanche vegano, ele deixa de ser vegano
    - Mas colocar queijo em um lanche tradicional não faz com que ele deixe de ser tradicional

5. ★☆☆ Implemente uma instância de monoide para o `Lanche`, conforme as seguintes regras para combinar dois `Lanche`s:
    - A lista de ingredientes deve ser combinada usando união de conjuntos (pode usar sua implementação de `<>`)
    - O preço deve ser simplesmente somado
    - A `Dieta` deve seguir o `<>` implementado anteriormente 

### Tema 2 - 🦸‍♂️ Cálculo Lambda

Parabéns! Você foi contratado para continuar desenvolvendo uma biblioteca de Cálculo Lambda escrita na sua linguagem preferida: Haskell! Para a sua sorte (ou azar), a maior parte das funcionalidades já estão escritas, e estão disponíveis no arquivo `Definitions.hs`. Pode ser uma boa ideia dar uma olhada no arquivo para entender como criar suas próprias funções.

O arquivo `Interpreter.hs` é responsável por interpretar (executar) as funções escritas em cálculo lambda. Você **não precisa** entender como ele está implementado, mas pode ser uma boa ideia se familiarizar com as funções na seção "Lambdações para facilitar o uso do interpretador". Abaixo, seguem alguns exemplos como usar o interpretador no `ghci`, com comentários deixados pelo seu antecessor antes de ele sumir misteriosamente nas proximidades uma ilha do Pacífico:

```hs
> identity -- mostra a definição da função identidade usando os ADTs
> putStrLn $ prettyShow $ identity -- mostra a definição da função identidade de uma forma "bonita"
> Apply not_ true -- aplica a função not na função true
> Apply (Apply and_ true) false -- aplica true && false
> apply2 and_ true false -- idem acima
> run $ apply2 and_ true false -- executa o código, retornando a expressão lambda simplificada/reduzida
> runBool $ apply2 and_ true false -- idem acima, mas converte o resultado para um Bool nativo do Haskell (útil para inspeção)
> runInt $ apply2 add one two -- aplica a função add em 1 e 2, executando-a e convertendo o resultado para Int nativo do Haskell
> intToChurch 7 -- converte o número 7 para Church-encoded
> runInt $ apply2 mul (intToChurch 7) (intToChurch 6) -- resposta da vida, universo e tudo o mais
> apply2 pair one two -- (1, 2)
> runInt $ Apply fst_ $ apply2 pair one two -- fst (1, 2) ==> 1
> runInt $ apply2 yComb factorial (intToChurch 3) -- factorial 3. OBS: 4 já demora um pouco, 5 então...
> runInt $ apply2 yComb fib (intToChurch 5) -- 5o numero de fibonacci
```

A única *feature* que falta ser implementada são as Listas. Como seu antecessor era um bom desenvolvedor que segue as boas práticas de TDD, ele deixou os testes prontos, mas não há quase nenhuma implementação. Além disso, ele deixou os seguintes comentários:

- Uma lista (x:xs) pode ser representada pela tupla (x, xs)
- Uma lista vazia pode ser representada pelo valor false
- Logo, a lista [x] pode ser representada pela tupla (x, false), e a lista [x,y,z] pela tupla (x, (y, (z, false)))
- A implementação do operador `null_` (com comportamento equivalente ao `null` do Haskell) já foi fornecida.
- O operador `nil` devolve uma lista vazia.

Implemente, usando os ADTs da biblioteca de cálculo lambda:

6. ★☆☆ Os operadores `nil`, `cons`, `head_` e `tail_`.
7. ★★☆ As funções de conversão `listOfIntToChurch` e `runListOfInt`, conforme a tipagem fornecida
8. ★★★ A função `at`, que deve funcionar como o operador `!!` em Haskell. Assuma que nunca será passada uma lista vazia, ou uma posição que está fora dos limites da lista
9. ★★★★ 🏆**QUESTÃO BÔNUS**🏆 - Implemente a função `filter_`, que deve ter o mesmo comportamento do Haskell.


# Orientações

- Devido à questão bônus, essa lista vale um total de 9 pontos, sendo possível ficar com 11/10 na atividade 😁
- Consulte as funções já fornecidas em Definitions.hs, elas podem ser úteis.
- Se o código não compilar em qualquer ponto, incluindo a questão bônus, a lista inteira será zerada. Substitua exercícios incompletos por `undefined` antes de submeter
- ☢️ **Não altere** sob hipótese alguma os arquivos `Definitions.hs` e `Interpreter.hs`, nem faça uso de bibliotecas externas. Esses dois arquivos, bem como todos os `.yaml` e `.cabal`, serão substituídos pelos originais na correção.
