import Foundation

// MARK: Funcionalidades
let arquetipos = [
    "classe1": "Guerreiro",
    "classe2": "Mago"
]

var vida: Int
var ouro = 0
var dano: Int
var maxVida: Int

var nome: String

var classeEscolhida: String

var opc: Int

var controle = true

var nomeInimigo = "Lutador"
var numeroInimigo = 1

var vidaInimigo: Int
var danoInimigo: Int

func guerreiro() -> (vida: Int, dano: Int) {
    return (vida: 100, dano: 10)
}

func mago() -> (vida: Int, dano: Int) {
    return (vida: 50, dano: 30)
}

func geraLutadores() -> (vida: Int, dano: Int) {
    let vida = Int.random(in: 50...150)
    let dano = Int.random(in: 10...30)

    return (vida: vida, dano: dano)
}

func calcDano(vida: Int, dano: Int) -> Int{
    return vida - dano
}

//-----------------------------------//

// MARK: Inicio Gameplay
print("""
==================================================
                 MENU DO AVENTUREIRO
==================================================
|                                                |
|   [1] Iniciar aventura                         |
|   [2] Sair                                     |
|                                                |
|                                                |
==================================================
          Escolha uma das opções acima:
==================================================
""" )

opc = Int(readLine() ?? "") ?? 2

switch opc {
case 1:
    print("""
    ==================================================
                     MENU DO AVENTUREIRO
    ==================================================
    |                                                |
    |                                                |
    |               Escreva seu nome:                |
    |                                                |
    |                                                |
    ==================================================
    
    ==================================================
    """ )
    
case 2:
    print("""
    ==================================================
                     MENU DO AVENTUREIRO
    ==================================================
    |                                                |
    |              Adeus aventureiro!                |
    |                                                |
    |                                                |
    ==================================================
          
    ==================================================
    """ )
    
default:
    print("""
    ==================================================
                     MENU DO AVENTUREIRO
    ==================================================
    |                                                |
    |              Adeus aventureiro!                |
    |                                                |
    |                                                |
    ==================================================
          
    ==================================================
    """ )
}

nome = readLine() ?? "Aventureiro"
if nome == " "{
    nome = "Aventureiro"
}else if nome == ""{
    nome = "Aventureiro"
}
            
print("""
==================================================
                 ESCOLHA SUA CLASSE
==================================================
|                                                |
|   [1] Guerreiro                                |
|   [2] Mago                                     |
|                                                |
==================================================
         Escolha uma das opções acima:
==================================================
""")
opc = Int(readLine() ?? "") ?? 1

switch opc{
case 1:
    classeEscolhida = arquetipos["classe1"]!

case 2:
    classeEscolhida = arquetipos["classe2"]!
default:
    exit(0)
}

print("Bem vindo \(classeEscolhida): \(nome)")

switch classeEscolhida{

case "Guerreiro":
    vida = guerreiro().vida
    dano = guerreiro().dano
    maxVida = guerreiro().vida
case "Mago":
    vida = mago().vida
    dano = mago().dano
    maxVida = mago().vida
default:
    vida = guerreiro().vida
    dano = guerreiro().dano
    maxVida = mago().vida
}

// MARK: Gameplay
while controle == true{
    print("""
==================================================
                 MENU DA CIDADE
==================================================
|                                                |
|   [1] Lutar na Arena                           |
|   [2] Loja da Aventura                         |
|   [3] Dormir                                   |
|   [4] Sair da Cidade                           |
|                                                |
==================================================
        Escolha uma das opções acima:
==================================================
""")
    opc = Int(readLine() ?? "") ?? 4
    
    switch opc{
        
    case 1:
        let inimigo = geraLutadores()
        vidaInimigo = inimigo.vida
        danoInimigo = inimigo.dano

        print("O \(nomeInimigo)\(numeroInimigo) chegou na area \n")
        print("Sua vida: \(vida). Seu dano \(dano)\n")
        print("A vida do \(nomeInimigo)\(numeroInimigo): \(vidaInimigo). O dano do \(nomeInimigo)\(numeroInimigo): \(danoInimigo).")

        print("""
        ==================================================
                         AÇÕES DE COMBATE
        ==================================================
        |                                                |
        |   [1] Atacar                                   |
        |   [2] Correr                                   |
        |                                                |
        ==================================================
               Escolha uma das opções acima:
        ==================================================
        """)
        opc = Int(readLine() ?? "") ?? 1
        
        if opc == 1{
            vidaInimigo = calcDano(vida: vidaInimigo, dano: dano)
            print("Você atacou! O inimigo agora tem \(vidaInimigo) de vida.\n")
            
            print("O \(nomeInimigo)\(numeroInimigo) atacou!")
            vida = calcDano(vida: vida, dano: danoInimigo)
            
            var controlinho = true
            while controlinho == true {
                print("Sua vida: \(vida). Seu dano \(dano)\n")
                print("A vida do \(nomeInimigo)\(numeroInimigo): \(vidaInimigo).")
                
                if vida <= 0 {
                    print("""
                    ==================================================
                            O \(classeEscolhida) \(nome) morreu
                    ==================================================
                    """)
                    exit(0)
                }
                
                if vidaInimigo <= 0 {
                    print("Você derrotou o \(nomeInimigo)\(numeroInimigo)!")
                    let ganho = Int.random(in: 20...50)
                    ouro += ganho
                    print("Você encontrou \(ganho) de ouro! Agora tem \(ouro) no total.\n")
                    numeroInimigo += 1
                    controlinho = false
                    break
                }
                
                print("""
                ==================================================
                                 AÇÕES DE COMBATE
                ==================================================
                |                                                |
                |   [1] Atacar                                   |
                |   [2] Correr                                   |
                |                                                |
                ==================================================
                       Escolha uma das opções acima:
                ==================================================
                """)

                opc = Int(readLine() ?? "") ?? 1

                if opc == 1 {

                    vidaInimigo = calcDano(vida: vidaInimigo, dano: dano)
                    print("Você atacou! O inimigo agora tem \(vidaInimigo) de vida.\n")

                    if vidaInimigo <= 0 {
                        print("Você derrotou o \(nomeInimigo)\(numeroInimigo)!")
                        let ganho = Int.random(in: 5...10)
                        ouro += ganho
                        print("Você encontrou \(ganho) de ouro! Agora tem \(ouro) no total.\n")
                        numeroInimigo += 1
                        controlinho = false
                        break
                    }

                    print("O \(nomeInimigo)\(numeroInimigo) atacou!")
                    vida = calcDano(vida: vida, dano: danoInimigo)
                    print("Você agora tem \(vida) de vida.\n")

                    if vida <= 0 {
                        print("""
                        ==================================================
                                O \(classeEscolhida) \(nome) morreu
                        ==================================================
                        """)
                        exit(0)
                    }

                } else if opc == 2 {
                    print("Você correu do combate!")
                    controlinho = false
                    break
                }
            }
        }
        
    case 2:
        var naLoja = true

        while naLoja {
            print("""
            ==================================================
                            LOJA DA AVENTURA
            ==================================================
            |                                                |
            |   Ouro atual: \(ouro)                          |
            |                                                |
            |   [1] Comprar +5 Vida  (10 ouro)               |
            |   [2] Comprar +5 Dano  (20 ouro)               |
            |   [3] Sair da Loja                             |
            |                                                |
            ==================================================
                   Escolha uma das opções acima:
            ==================================================
            """)

            let escolhaLoja = Int(readLine() ?? "") ?? 3

            switch escolhaLoja {

            case 1:
                if ouro >= 10 {
                    ouro -= 10
                    vida += 5
                    maxVida += 5
                    print("\nVocê comprou +5 de vida! Vida atual: \(vida) | Vida Máxima: \(maxVida) | Ouro: \(ouro)\n")
                } else {
                    print("\nVocê não tem ouro suficiente!\n")
                }

            case 2:
                if ouro >= 20 {
                    ouro -= 20
                    dano += 5
                    print("\nVocê comprou +5 de dano! Dano atual: \(dano) | Ouro: \(ouro)\n")
                } else {
                    print("\nVocê não tem ouro suficiente!\n")
                }

            case 3:
                print("\nVocê saiu da loja.\n")
                naLoja = false

            default:
                print("\nOpção inválida!\n")
            }
        }

    case 3:
        vida = maxVida
        print("\nVocê dormiu e recuperou toda sua vida! Vida atual: \(vida)\n")

    default:
        print("""
        ==================================================
                         MENU DO AVENTUREIRO
        ==================================================
        |                                                |
        |              Adeus aventureiro!                |
        |                                                |
        |                                                |
        ==================================================
              
        ==================================================
        """ )
        exit(0)
    }
}
