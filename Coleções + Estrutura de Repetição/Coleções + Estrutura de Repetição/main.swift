import Foundation

// MARK: Exercício 1: Crie uma lista vazia e depois adicione 3 itens. Por fim, utilize o for para printar esses elementos

var listaNumerosEx1: [Int] = []

listaNumerosEx1.append(1)
listaNumerosEx1.append(2)
listaNumerosEx1.append(3)

for numero in listaNumerosEx1 {
    print(numero)
}



// MARK: Exercício 2: Crie um dicionario String:String com 3 itens. Imprima utilizando o for a chave de cada um deles.

var dicionarioEx2: [String:String] = [:]

dicionarioEx2["RJ"] = "Vasco"
dicionarioEx2["SP"] = "Palmeiras"
dicionarioEx2["MG"] = "Cruzeiro"

for (chave, _) in dicionarioEx2 {
    print(chave)
}



// MARK: Exercício 3: Adicionar chave e valor em um dicionário e imprimir ambos utilizando o for print("\(chave): \(valor)")

var dicionarioEx3: [String:String] = [:]

dicionarioEx3["Nome"] = "Gabriel"

dicionarioEx3.forEach { chave, valor in
    print("\(chave): \(valor)")
}



// MARK: Exercício 4: Crie um array com 3 itens. Percorra o array utilizando o for, e realize o print de cada item. Realize o reverso do array que você criou.

var listaNumerosEx4: [Int] = [1, 2, 3]

for numero in listaNumerosEx4 {
    print(numero)
}
for numero in listaNumerosEx4.reversed() {
    print(numero)
}



// MARK: Exercício 5: Crie um array de números inteiros. Utilizando o for, percorra o array e soma cada valor. Por fim, imprima o valor total de todos os números

var listaNumerosEx5: [Int] = [1, 2, 3, 4, 5]
var soma: Int = 0

for numero in listaNumerosEx5 {
    soma += numero
}

print(soma)



// MARK: DESAFIOS

// MARK: DESAFIO 1
//Você tem uma lista de compras com alguns itens.
//Crie uma coleção com 5 itens de mercado
//Mostre todos os itens no console
//👉 Objetivo: entender Array e acesso aos elementos.

let listaCompras: [String] = ["Arroz", "Farofa", "Ovo", "Batata inglesa", "Frango"]
let quantidadeDeItensNoCarrinho = listaCompras.count

for index in 0..<quantidadeDeItensNoCarrinho {
    print("\(index)º alimento: \(listaCompras[index])")
}

// MARK: DESAFIO 2
//Você tem uma lista com nomes de alunos.
//Crie uma coleção com alguns nomes
//Mostre quantos alunos existem na lista
//👉 Objetivo: usar .count.

let listaAlunos: [String] = ["Gabriel", "Lorran", "Lucas", "Beatriz", "Clara", "Eduardo", "Sofia", "Carolina"]
let quantidadeDeAlunos = listaAlunos.count

print("Na sala tem: \(quantidadeDeAlunos) alunos")

// MARK: DESAFIO 3
//Você tem uma lista de frutas.
//Verifique se a fruta "banana" existe na lista
//Mostre uma mensagem dizendo se existe ou não
//👉 Objetivo: trabalhar com contains.

let listaFrutas: [String] = ["Uva", "Morango", "Abacaxi", "Pêssego", "Banana", "Amora"]
let existeBanana = listaFrutas.contains("Banana")

if existeBanana {
    print("Temos temos banana na lista!")
} else {
    print("Nao temos banana na lista!")
}

// MARK: DESAFIO 4
//Você tem uma lista de tarefas.
//Adicione uma nova tarefa à lista
//Mostre a lista atualizada
//👉 Objetivo: adicionar elementos em uma coleção.

var listaTarefas: [String] = ["Estudar Swift", "Estudar para a faculdade", "Estudar Inglês", "Treinar musculação", "Meditar"]

listaTarefas.append("Escrever diário")

print("\nLISTA ATUALIZADA:")

for tarefa in listaTarefas {
    print(tarefa)
}

// MARK: 🔁 Desafios Básicos — Estruturas de Repetição

// MARK: DESAFIO 1
//Você precisa mostrar números de 1 até 10.
//Use uma estrutura de repetição para mostrar esses números
//👉 Objetivo: entender for.

print("\nLISTAGEM NÚMEROS:")

for numero in 1...10 {
    print("\(numero)")
}



// MARK: DESAFIO 2
//Você tem uma lista de nomes.
//Use um laço de repetição para mostrar cada nome
//👉 Objetivo: percorrer um Array com for.

let listaCantores: [String] = ["Cazuza", "Rita Lee", "Charlie Brown Jr", "MC Marcinho", "Tim Maia", "Lô Borges", "Vanessa da Mata", "Djavan", "Lulu Santos"]

print("\nNA MINHA PLAYLIST TEM:")

for cantor in listaCantores {
    print(cantor)
}

// MARK: DESAFIO 3
//Você tem uma lista de números.
//Some todos os números da lista
//Mostre o resultado final
//👉 Objetivo: repetição + lógica simples.

let listaNumerosDesafio3: [Int] = [10, 9, 8, 7, 6, 5]
var somaDesafio3: Int = 0

for numero in listaNumerosDesafio3 {
    somaDesafio3 += numero
}

print("O resultado da soma foi de: \(somaDesafio3)")

// MARK: DESAFIO 4
//Você quer mostrar números de 0 até 5.
//Use uma estrutura de repetição para isso
//👉 Objetivo: entender intervalo (0...5).



// MARK: Desafios Mistos - Coleções + Repetição

// MARK: DESAFIO MISTO 1
// Lista de alunos
//Você tem uma lista de alunos com idades.
//Guarde os nomes em uma coleção
//Use repetição para mostrar cada nome
//👉 Objetivo: unir Array + for.



// MARK: DESAFIO MISTO 2
//Verificando notas
//Você tem uma lista de notas.
//Use repetição para verificar quais notas são maiores ou iguais a 7
//Mostre apenas essas notas
//👉 Objetivo: for + condição.
