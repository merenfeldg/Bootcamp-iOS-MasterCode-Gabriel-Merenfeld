import Foundation

// MARK: Estrutura condicionais

//1- Crie uma função que receba dois parâmetros (nota1: Double, nota2: Double) e retorne "Aluno aprovado” se a media das notas for maior ou igual a 7. Caso contrário retorne "Aluno reprovado"

func verificaSeAlunoPassou(nota1: Double, nota2: Double) -> String {
    let mediaNotas: Double = (nota1 + nota2) / 2
    let mediaMinima: Double = 7.0
    
    if mediaNotas >= mediaMinima {
        return "Aluno aprovado"
    } else {
        return "Aluno reprovado"
    }
}


//2- Crie uma função "desconto" que receba um parâmetro (total: Double). Caso o total (parâmetro) seja menor que 100.0, dê 10% de desconto. Caso o valor esteja entre 100.0 e 200.0 dê 15% de desconto. Valores acima de 200.0 dê 20% de desconto. A função tem que ter um retorno do tipo Double que vai ser o total (parâmetro) com o desconto aplicado de acordo com as condições citadas.
// Dica: return total * 0.9 (isso significa o valor com 10% de desconto)

func aplicaDesconto(total: Double) -> Double {
    if total < 100.0 {
        let desconto = total * 0.1
        return total - desconto
    }
    else if total >= 100.0 && total <= 200.0 {
        let desconto = total * 0.15
        return total - desconto
    } else {
        let desconto = total * 0.2
        return total - desconto
    }
}

//3- Crie uma função semáforo que receba uma parâmetro do tipo string. Se o valor recebido no parâmetro for vermelho, retorne "PARE", se for amarelo, retorne "ATENÇÃO", se for verde, retorne "SIGA EM FRENTE", se não, retorne "PARÂMETRO INVÁLIDO" caso o valor recebido seja diferente dos já citados.

func semaforo(valor: String) -> String {
    let valorEmMinusculo = valor.lowercased()
    
    if valorEmMinusculo == "vermelho" {
        return "PARE"
    }
    else if valorEmMinusculo == "amarelo" {
        return "ATENÇÃO"
    }
    else if valorEmMinusculo == "verde" {
        return "SIGA EM FRENTE"
    } else {
        return "PARÂMETRO INVÁLIDO"
    }
}

//4- Crie uma função que receba dois parâmetros (eFimDeSemana: Bool, tenhoDinheiro: Bool) e caso
//seja final de semana e você tenha dinheiro, print "VAMOS PASSEAR", caso contrário, print "VAMOS FICAR EM CASA"

func decidirPasseio(eFimDeSemana: Bool, tenhoDinheiro: Bool) {
    if eFimDeSemana && tenhoDinheiro {
        print("VAMOS PASSEAR")
    } else {
        print("VAMOS FICAR EM CASA")
    }
}


//5- Crie uma função que receba dois parâmetros do tipo Double e caso o valor do 1° parâmetro seja maior que o valor do 2° parâmetro. Retorne "Bola", caso contrário, retorne "Banana"

func compararValores(valor1: Double, valor2: Double) -> String {
    return valor1 > valor2 ? "Bola" : "Banana"
}

//6- Crie uma função que receba um parâmetro (foiConvidado: Bool). Caso o valor seja true, print "Liberado para a festa" Caso contrário, print "Infelizmente você não foi convidado"

func verificaAcessoFesta(foiConvidado: Bool) -> String {
    if foiConvidado {
        return "Liberado para a festa"
    } else {
        return "Infelizmente você não foi convidado"
    }
}

//7 - Implemente uma função que receba a idade de uma pessoa e determine se ela tem direito a entrada gratuita em um evento. Entrada gratuita é concedida para pessoas com menos de 5 anos ou mais de 65 anos.

func verificaAcessoEvento(idade: Int) -> Bool {
    return idade < 5 || idade > 65
}

//8 - Crie uma função que receba um score de crédito (tipo Int) de 0 a 1000 e retorne se a pessoa tem um "Bom crédito" (score acima de 700), "Crédito regular" (score entre 300 e 700) ou "Mau crédito" (abaixo de 300).



//9 - Implemente uma função que receba um dia da semana (tipo String) e retorne "Dia útil" se for de segunda a sexta, e "Final de semana" se for sábado ou domingo.


//10 - Desenvolva uma função que receba uma senha (tipo String) e retorne "Senha fraca" se tiver menos de 6 caracteres, "Senha média" se tiver entre 6 e 8 caracteres, e "Senha forte" se tiver mais de 8 caracteres.
// Dica: Para descobrir a quantidade de caracteres de uma string, basta utilizar a propriedade .count
// var nome: String = "caio"
// print(nome.count) -> vai printar a quantidade de caracteres


//11 - Crie uma função que receba a altura de uma pessoa em metros (tipo Double) e retorne "Baixa" se for menor que 1.60 metros, "Média" se for entre 1.60 e 1.85 metros, e "Alta" se for maior que 1.85 metros.


//12 - Crie uma função que receba a idade de uma pessoa (tipo Int) e o tempo de serviço em anos (tipo Int). Uma pessoa é elegível para promoção se tiver mais de 30 anos e mais de 5 anos de serviço. A função deve retornar "Promoção Elegível" se ambas as condições forem verdadeiras, e "Promoção Não Elegível" caso contrário.


//13 - Implemente uma função que receba a previsão de chuva (tipo Bool) e a temperatura (tipo Double). O evento ao ar livre deve ser cancelado se chover (true) ou se a temperatura for inferior a 15 graus. A função deve retornar "Evento Cancelado" se alguma das condições for verdadeira, e "Evento Confirmado" caso contrário.


//14 - Desenvolva uma função que receba uma senha (tipo String) e a hora do dia (tipo Int, representando a hora). O acesso é permitido se a senha for "1234" e for entre as 9h e as 17h. A função deve retornar "Acesso Permitido" se ambas as condições forem verdadeiras, e "Acesso Negado" se qualquer uma das condições não for atendida.
