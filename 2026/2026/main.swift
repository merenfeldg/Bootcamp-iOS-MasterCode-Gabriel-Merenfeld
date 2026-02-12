//
//  main.swift
//  2026
//
//  Created by Gabriel Merenfeld on 11/02/26.
//

import Foundation

//🧩 Desafio 1 — Cadastro de Funcionário com Promoção
//Cenário real:
//Você trabalha em um sistema interno de RH de uma empresa que precisa cadastrar funcionários e gerenciar promoções.
//O que deve existir:
//Uma struct chamada FuncionarioDados
//nome
//idade
//cargo
//Uma class chamada Funcionario
//dados do funcionário
//salário
//Funcionalidades obrigatórias:
//Criar funcionário
//Promover funcionário
//Aumentar salário
//Regras:
//Promoção deve alterar o cargo
//Deve aplicar aumento no salário
//Dicas:
//Use var para permitir alteração
//Métodos dentro da class
//Pense que a struct são dados estáticos e a class gerencia regras

struct FuncionarioDados {
    let nome: String
    var idade: Int
    var cargo: String
}

class Funcionario {
    var dados: FuncionarioDados
    var salario: Double
    
    init(dados: FuncionarioDados, salario: Double) {
        self.dados = dados
        self.salario = salario
    }
    
    func promocao(novoCargo: String, novoSalario: Double) {
        guard novoSalario > salario else { return }
        dados.cargo = novoCargo
        salario = novoSalario
    }
}

var funcionario = Funcionario(
    dados: FuncionarioDados(
        nome: "Gabriel",
        idade: 22,
        cargo: "Desenvolvedor Pleno"
    ),
    salario: 6000
)



//🧩 Desafio 2 — Carrinho de Compras
//Cenário real:
//Você está desenvolvendo um e-commerce e precisa modelar um carrinho.
//O que deve existir:
//struct Produto
//nome
//preço
//class Carrinho
//lista de produtos
//Funcionalidades:
//Adicionar produto
//Remover produto
//Calcular total
//Regras:
//Total = soma de todos os preços
//Carrinho começa vazio
//Dicas:
//Use Array
//Use reduce ou loop
//Crie funções separadas

struct Produto: Equatable {
    var nome: String
    var preco: Double
}

class Carrinho {
    private(set) var produtos: [Produto] = []
    
    func adicionaNovoProduto(_ novoProduto: Produto) {
        produtos.append(novoProduto)
    }
    
    func removeProduto(_ produto: Produto) {
        if let index = produtos.firstIndex(of: produto) {
            produtos.remove(at: index)
        }
    }
    
    func calculaValorTotal() -> Double {
        return produtos.reduce(0) { $0 + $1.preco }
    }
    
    func mostraProdutos() {
        produtos.forEach {
            print($0.nome)
        }
    }
}



//🧩 Desafio 3 — Conta Bancária
//Cenário real:
//Sistema bancário simples.
//Estrutura:
//struct Cliente
//nome
//CPF
//class ContaBancaria
//cliente
//saldo
//Funcionalidades:
//Depositar
//Sacar
//Ver saldo
//Regras:
//Não permitir saque maior que saldo
//Dicas:
//Use if para validação
//Saldo inicia em 0

struct Cliente {
    let nome: String
    let cpf: String
}

class ContaBancaria {
    let cliente: Cliente
    private var saldo: Double = 0
    
    init(cliente: Cliente) {
        self.cliente = cliente
    }
    
    func depositarSaldo(valor: Double) {
        saldo += valor
    }
    
    func sacarSaldo(valor: Double) -> Result<Double, ContaBancariaError> {
        guard valor <= saldo else {
            return .failure(.valorMaiorQueSaldo)
        }
        saldo -= valor
        return .success(valor)
    }
}

enum ContaBancariaError: Error {
    case valorMaiorQueSaldo
    
    var message: String {
        switch self {
            case .valorMaiorQueSaldo:
                return "Não é permitdo sacar um valor maior que o saldo atual"
        }
    }
}



//🧩 Desafio 4 — Sistema Escolar
//Cenário real:
//Sistema que calcula média do aluno.
//Estrutura:
//struct Aluno
//nome
//matrícula
//class Matricula
//notas array
//Funcionalidades:
//Calcular média
//Mostrar situação
//Regras:
//Média ≥ 7 → Aprovado
//Dicas:
//Use array de Double
//Use reduce ou loop

struct Aluno {
    let nome: String
    let matricula: String
}

class Matricula {
    let aluno: Aluno
    var notas: [Double]
    
    init(aluno: Aluno, notas: [Double]) {
        self.aluno = aluno
        self.notas = notas
    }
    
    func calculaMediaAluno() -> Double {
        
        let somaDasNotas: Double = notas.reduce(0) { $0 + $1 }
        let quantidadeDeNotas = Double(notas.count)
        
        return somaDasNotas / quantidadeDeNotas
    }
    
    func mostraSituacaoDoAluno() -> String {
        let mediaNotas: Double = calculaMediaAluno()
        
        return mediaNotas >= 7 ? "Aprovado" : "Reprovado"
    }
}



//🧩 Desafio 5 — Frota de Veículos
//Cenário real:
//Empresa de logística controla veículos.
//Estrutura:
//struct Veiculo
//modelo
//placa
//class Frota
//lista de veículos
//Funcionalidades:
//Adicionar veículo
//Listar veículos
//Dicas:
//Use array
//Faça loop para listar

struct Veiculo {
    let modelo: String
    let placa: String
}

class Frota {
    private var veiculos: [Veiculo]
    
    init(veiculos: [Veiculo]) {
        self.veiculos = veiculos
    }
    
    func adicionaVeiculo(_ novoVeiculo: Veiculo) {
        veiculos.append(novoVeiculo)
    }
    
    func listaVeiculos() {
        veiculos.forEach {
            print("MODELO: \($0.modelo)  |  PLACA: \($0.placa)")
        }
    }
}



//2️⃣ POO (5)
//🧩 Desafio 6 — Sistema de Animais
//Cenário:
//Petshop precisa simular sons.
//Criar:
//Classe base Animal
//Método emitirSom()
//Subclasses:
//Cachorro → Latir
//Gato → Miar
//Dicas:
//Use override
//Use herança

class Animal {
    func emitirSom() {
        print("Emitindo som...")
    }
}

class Cachorro: Animal {
    override func emitirSom() {
        print("Latindo")
    }
}

class Gato: Animal {
    override func emitirSom() {
        print("Miando")
    }
}



//🧩 Desafio 7 — Funcionários e Bônus
//Cenário:
//Empresa paga bônus diferente.
//Classe base:
//Funcionario
//salário
//Subclasses:
//Gerente → 20%
//Dev → 10%
//Dicas:
//Polimorfismo
//Método bonus()

class Funcionario2 {
    var salario: Double
    
    init(salario: Double) {
        self.salario = salario
    }
    
    func calculaBonus() -> Double { 0 }
}

class Gerente: Funcionario2 {
    override func calculaBonus() -> Double {
        return super.salario * 0.2
    }
}

class Desenvolvedor: Funcionario2 {
    override func calculaBonus() -> Double {
        return super.salario * 0.1
    }
}



//🧩 Desafio 8 — Formas Geométricas
//Cenário:
//App educacional de matemática.
//Classe base:
//Forma → método area()
//Subclasses:
//Quadrado
//Círculo
//Dicas:
//Use .pi
//Override

class FormaGeometrica {
    
    let pi: Double = 3.1416
    
    func calculaArea() -> Double { 0.0 }
}

class Quadrado: FormaGeometrica {
    
    let valorLado: Double
    
    init(valorLado: Double) {
        self.valorLado = valorLado
    }
    
    override func calculaArea() -> Double {
        return valorLado * valorLado
    }
}

class Circulo: FormaGeometrica {
    
    let valorRaio: Double
    
    init(valorRaio: Double) {
        self.valorRaio = valorRaio
    }
    
    override func calculaArea() -> Double {
        return super.pi * valorRaio * valorRaio
    }
}

//🧩 Desafio 9 — Pagamentos
//Cenário:
//Gateway de pagamento.
//Classe base: Pagamento
//Subclasses:
//Cartão
//Boleto
//Pix
//Cada um processa diferente.

class Pagamento {
    let valor: Double
    
    init(valor: Double) {
        self.valor = valor
    }
    
    func processar() {
        print("Processando pagamento...")
    }
}

class Cartao: Pagamento {
    
    override func processar() {
        print("Processando pagamento no cartão no valor de R$ \(valor)")
    }
}

class Boleto: Pagamento {
    
    override func processar() {
        print("Gerando boleto no valor de R$ \(valor)")
    }
}

class Pix: Pagamento {
    
    override func processar() {
        print("Processando pagamento via Pix no valor de R$ \(valor)")
    }
}



//🧩 Desafio 10 — Veículos
//Cenário:
//Simulador de direção.
//Base: Veiculo → mover()
//Subclasses:
//Carro
//Moto

class Veiculo2 {
    let modelo: String
    
    init(modelo: String) {
        self.modelo = modelo
    }
    
    func mover() {
        print("O veículo está se movendo.")
    }
}

class Carro: Veiculo2 {
    
    override func mover() {
        print("O carro \(modelo) está dirigindo na estrada...")
    }
}

class Moto: Veiculo2 {
    
    override func mover() {
        print("A moto \(modelo) está acelerando na pista...")
    }
}


//3️⃣ ESTRUTURA DE REPETIÇÃO (5)
//🧩 Desafio 11 — Números Pares
//Objetivo:
//Mostrar pares de 1 a 100.
//Dicas:
//Use for
//Use % 2

func verificaNumeroEhPar(_ numero: Int) -> Bool{
    return numero % 2 == 0
}

for numero in 1...100 {
    if verificaNumeroEhPar(numero) {
        print("O número: \(numero) é par")
    }
}



//🧩 Desafio 12 — Soma de Compras
//Cenário:
//Caixa de supermercado.
//Array: valores de compras.
//Objetivo:
//Somar tudo.
//🧩 Desafio 13 — Tabuada
//Objetivo:
//Gerar tabuada 1 → 10.
//Dicas:
//Loop
//Multiplicação
//🧩 Desafio 14 — Contagem Regressiva
//Objetivo:
//10 até 0.
//Dicas:
//stride
//🧩 Desafio 15 — Média de Notas
//Cenário:
//Professor calculando média.
//Dicas:
//Somar
//Dividir pela quantidade
