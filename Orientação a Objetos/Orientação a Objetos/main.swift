import Foundation


// MARK: - Exercícios Classe

// Exercício 1: Conta Poupança
// Objetivo: Desenvolver uma classe chamada 'ContaPoupanca' para gerenciar os depósitos em uma conta poupança de banco.
//
// Descrição:
// Propriedades:
// - saldo (Double): O saldo atual na conta.
// Construtor:
// - Inicialize o saldo.
// Métodos:
// - depositar(valor: Double): Adiciona(+) o valor especificado ao saldo atual. (saldo = saldo + valor especificado)
// - consultarSaldo() -> Double: Retorna o saldo atual da conta.

//   Para usar este método, você deve criar uma instância da classe, chamar este método e armazenar o valor retornado em uma variável. Em seguida, você pode imprimir esse valor.
// print("Saldo atual: R$\(saldoAtual)")

class ContaPoupanca {
    var saldo: Double
    
    init(saldo: Double) {
        self.saldo = saldo
    }
    
    func depositar(valor: Double) {
        saldo += valor
    }
    
    func consultarSaldo() -> Double {
        return saldo
    }
}

var saldoPoupanca: ContaPoupanca = ContaPoupanca(saldo: 1000)
saldoPoupanca.depositar(valor: 100)
let saldoAtual: Double = saldoPoupanca.consultarSaldo()

print("Saldo atual: R$\(saldoAtual)")



// Exercício 2: Gerenciador de Filmes
// Objetivo: Desenvolver uma classe chamada 'Filme' para gerenciar informações sobre filmes em um acervo pessoal.
//
// Descrição:
// Propriedades:
// - titulo (String): O título do filme.
// - diretor (String): O diretor do filme.
// - ano (Int): O ano de lançamento do filme.
// Construtor:
// - Inicialize titulo, diretor e ano.
// Métodos:
// - exibirInfo() -> String: Retorna uma string com todas as informações do filme formatadas.

//   Para usar este método, crie uma instância da classe, chame o método e armazene a informação retornada em uma variável. Em seguida, imprima essa variável para visualizar os detalhes do filme.

class Filme {
    let titulo: String
    let diretor: String
    let ano: Int
    
    init(titulo: String, diretor: String, ano: Int) {
        self.titulo = titulo
        self.diretor = diretor
        self.ano = ano
    }
    
    func exibirInfo() -> String {
        return """
        INFORMAÇÕES DO FILME:
            - Nome: \(titulo)
            - Diretor: \(diretor)
            - Ano: \(ano)
        """
    }
}

let filmeClick: Filme = Filme(titulo: "Click", diretor: "Frank Coraci", ano: 2006)
let informacoesFilme: String = filmeClick.exibirInfo()

pulaLinhaNoConsole()
print(informacoesFilme)



// Exercício 3: Sistema de Registro de Alunos
// Objetivo: Criar uma classe chamada 'Aluno' para armazenar dados e calcular a média de notas de alunos em uma escola.
//
// Descrição:
// Propriedades:
// - nome (String): O nome do aluno.
// - notas (Array<Double>): Uma lista de notas do aluno.
// Construtor:
// - Inicialize nome e notas.
// Métodos:
// - calcularMedia() -> Double: Calcula e retorna a média das notas do aluno utilizando um laço de repetição para somar as notas.

//   Para utilizar este método, crie uma instância da classe, invoque o método para calcular a média, armazene esse valor em uma variável e imprima a média para visualizar.
// print("Média das notas de \(aluno.nome): \(media)")

class Aluno {
    let nome: String
    let notas: [Double]
    
    init(nome: String, notas: [Double]) {
        self.nome = nome
        self.notas = notas
    }
    
    func calcularMedia() -> Double {
        var somaDasNotas: Double = 0
        let quantidadeNotas: Double = Double(notas.count)
        
        for nota in notas {
            somaDasNotas += nota
        }
        
        return somaDasNotas / quantidadeNotas
    }
}

let alunoGabriel: Aluno = Aluno(nome: "Gabriel", notas: [10.0, 8.5, 7.0])
let mediaGabriel: Double = alunoGabriel.calcularMedia()

pulaLinhaNoConsole()
print("Média das notas de \(alunoGabriel.nome): \(mediaGabriel)")


// MARK: - DESAFIOS SOBRE ENCAPSULAMENTO E POLIMORFISMO

//Desafio 1 – Sistema de Pagamento
//📌 Descrição
//Você está criando um sistema que processa diferentes formas de pagamento.
//Cada tipo de pagamento calcula a taxa de forma diferente.
// O que precisa ser feito
//Crie uma classe base chamada Pagamento
//Essa classe deve ter um método calcularValorFinal(valor: Double) -> Double
//Crie duas subclasses:
//CartaoCredito
//Pix
//Cada forma de pagamento deve calcular a taxa de forma diferente:
//Cartão de crédito: taxa de 5%
//Pix: sem taxa
//Crie um array do tipo [Pagamento]
//Percorra esse array e imprima o valor final de cada pagamento

// Regras
//Use override
//Não use if ou switch para decidir o tipo de pagamento

pulaLinhaNoConsole()
print("-- EXERCÍCIOS SOBRE ENCAPSULAMENTO E POLIMORFISMO:")


class Pagamento {
    func calcularValorFinal(valor: Double) -> Double {
        return valor
    }
}

class CartaoCredito: Pagamento {
    override func calcularValorFinal(valor: Double) -> Double {
        let valorDescontado = valor * 0.05
        return valor - valorDescontado
    }
}

class Pix: Pagamento {
    override func calcularValorFinal(valor: Double) -> Double {
        return valor
    }
}

let pagamentos: [Pagamento] = [CartaoCredito(), Pix()]
pulaLinhaNoConsole()

for pagamento in pagamentos {
    let valorFinal: Double = pagamento.calcularValorFinal(valor: 1200)
    print("Valor final vai ser de: \(valorFinal)")
}



//Desafio 2 – Notificações do App
// Descrição
//Um app envia notificações por diferentes canais.
//Cada canal envia a mensagem de uma forma diferente.
// O que precisa ser feito

//Crie uma classe base Notificacao
//Crie o método enviar(mensagem: String)
//Crie pelo menos duas subclasses:
//Email
//SMS
//Cada classe deve sobrescrever o método enviar
//Armazene as notificações em um array [Notificacao]
//Envie a mesma mensagem para todas

// Regras
//O código que envia a mensagem não pode saber qual é o tipo da notificação

class Notificacao {
    func enviar(mensagem: String) {}
}

class Email: Notificacao {
    override func enviar(mensagem: String) {
        print("[Email]: \(mensagem)")
    }
}

class Sms: Notificacao {
    override func enviar(mensagem: String) {
        print("[SMS]: \(mensagem)")
    }
}

let notificacoes: [Notificacao] = [Email(), Sms()]
pulaLinhaNoConsole()

for notificacao in notificacoes {
    notificacao.enviar(mensagem: "Eu quero pastel de queijo")
}



//Desafio 3 – Cofre Digital

// Descrição
//Você precisa criar um cofre digital que protege um valor armazenado.
//🎯 O que precisa ser feito
//Crie uma classe Cofre
//O valor armazenado deve ser private
//Crie métodos para:
//Depositar valor
//Sacar valor
//O saque só pode acontecer se houver saldo suficiente
//Crie um método para consultar o saldo

//⚠️ Regras
//O saldo não pode ser acessado diretamente
//Todo acesso deve passar pelos métodos da classe

class Cofre {
    private var saldo: Double
    
    init(valor: Double) {
        saldo = valor
    }
    
    func consultarSaldo() -> Double {
        return saldo
    }
    
    func depositarValor(_ valor: Double) {
        saldo += valor
    }
    
    func sacarValor(_ valor: Double) -> Double {
        if saldo >= valor {
            saldo -= valor
            return valor
        }
        return 0.0
    }
}
pulaLinhaNoConsole()

var cofreGabriel: Cofre = Cofre(valor: 12000)
var saldoAtualD3: Double = cofreGabriel.consultarSaldo()
print("- VALOR ATUAL: R$\(saldoAtualD3)")

cofreGabriel.depositarValor(500)
saldoAtualD3 = cofreGabriel.consultarSaldo()
print("- VALOR ATUAL: R$\(saldoAtualD3)")

var valorSacado: Double = cofreGabriel.sacarValor(100)
saldoAtualD3 = cofreGabriel.consultarSaldo()
print("- SAQUEI O VALOR: R$\(valorSacado)")
print("- VALOR ATUAL: \(saldoAtualD3)")



//Desafio 4 – Usuário Seguro
// Descrição
//Você está criando um sistema de usuários onde a senha precisa ser protegida.
// O que precisa ser feito
//Crie uma classe Usuario
//A senha deve ser private
//A senha só pode ser alterada por um método
//A nova senha deve ter pelo menos 6 caracteres
//Se não for válida, a senha não deve ser alterada

// Regras
//Não permita acesso direto à senha
//A validação deve acontecer dentro da classe

class Usuario {
    private var senha: String
    
    init(senha: String) {
        self.senha = senha
    }
    
    func alterarSenha(novaSenha: String) {
        if novaSenha.count >= 6 {
            senha = novaSenha
        }
    }
    func mostrarSenha() {
        print("SENHA: \(senha)")
    }
}

pulaLinhaNoConsole()
var usuarioGabriel: Usuario = Usuario(senha: "Garfield123")

usuarioGabriel.alterarSenha(novaSenha: "1234")
usuarioGabriel.mostrarSenha()

usuarioGabriel.alterarSenha(novaSenha: "PatolinoVermelho123")
usuarioGabriel.mostrarSenha()

//Desafio 5 – Funcionários da Empresa
// Descrição
//Uma empresa possui funcionários de tipos diferentes, e cada um tem uma forma distinta de cálculo salarial.
// O que precisa ser feito
//Crie uma classe base Funcionario
//Crie um método calcularSalario() -> Double
//Crie subclasses como:
//CLT
//PJ
//Cada tipo deve calcular o salário de forma diferente
//Armazene os funcionários em um array [Funcionario]
//Percorra o array imprimindo o salário de cada funcionário
//Regras
//Use polimorfismo
//Não use if ou switch
//O salário não pode ser um valor público e alterável diretamente

protocol SalarioProtocol {
    func calcularSalario() -> Double
}

class Clt: SalarioProtocol {
    
    private let salarioBase: Double
    private let beneficios: Double
    
    init(salarioBase: Double, beneficios: Double) {
        self.salarioBase = salarioBase
        self.beneficios = beneficios
    }
    
    func calcularSalario() -> Double {
        return salarioBase + beneficios
    }
}

class Pj: SalarioProtocol {
    
    private let valorHora: Double
    private let horasTrabalhadas: Double
    
    init(valorHora: Double, horasTrabalhadas: Double) {
        self.valorHora = valorHora
        self.horasTrabalhadas = horasTrabalhadas
    }
    
    func calcularSalario() -> Double {
        return valorHora * horasTrabalhadas
    }
}

let salarios: [SalarioProtocol] = [Clt(salarioBase: 4000, beneficios: 1500), Pj(valorHora: 120, horasTrabalhadas: 120)]

pulaLinhaNoConsole()

for funcionario in salarios {
    let salario: Double = funcionario.calcularSalario()
    print("- Salário: R$\(salario)")
}





func pulaLinhaNoConsole() {
    print("\n")
}
