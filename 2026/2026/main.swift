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
//🧩 Desafio 9 — Pagamentos
//Cenário:
//Gateway de pagamento.
//Classe base: Pagamento
//Subclasses:
//Cartão
//Boleto
//Pix
//Cada um processa diferente.
//🧩 Desafio 10 — Veículos
//Cenário:
//Simulador de direção.
//Base: Veiculo → mover()
//Subclasses:
//Carro
//Moto
//3️⃣ ESTRUTURA DE REPETIÇÃO (5)
//🧩 Desafio 11 — Números Pares
//Objetivo:
//Mostrar pares de 1 a 100.
//Dicas:
//Use for
//Use % 2
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
