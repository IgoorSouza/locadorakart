Algoritmo "kart-1.0"
// Disciplina   : Conceitos de Algoritmos
// Professor   : Gilberto Viana de Oliveira

Var

   pausar, circuitos: caractere
   decisao, i, aux: inteiro
   valorCircuitos, cadastro, alocar: real
   deletar, devolucao : real

   //KART
   qtdKarts: inteiro
   kartsCadastrado: vetor[1..15] de inteiro
   kartsNum: vetor[1..15] de inteiro
   modelos: vetor[1..15] de caractere
   precos: vetor[1..15] de real
   vezesLocado: vetor[1..15] de inteiro
   estadoLocacao: vetor[1..15] de inteiro
   lucroKart: vetor[1..15] de real
   lucroTotalKart: vetor[1..15] de real
   // circuitos
   nomeCircuito: caractere
   valorCircuito: inteiro

funcao menu: inteiro
var
inicio
   escreval("1. Cadastrar Kart")
   escreval("2. Listar Karts dispon�veis")
   escreval("3. Listar Karts locados")
   escreval("4. Alugar um Kart")
   escreval("5. Devolver um Kart")
   escreval("6. Kart que mais gerou lucro")
   escreval("7. Receita e lucro do dia")
   escreval("8. Loca��o de circuito")
   escreval("9. Atualizar dia")
   escreval("10. Sair do programa")
   leia(decisao)
   limpatela

   retorne decisao
fimfuncao





funcao cadastrar: caractere
var
   valor: inteiro
inicio

   escreval("Quantos Karts voc� quer cadastrar?:")
   leia(valor)
   escreval("")

   para i de 1 ate valor faca
      se (qtdKarts < 15) entao
         escreval("Kart de n�mero: ", kartIndice)
         escreva("Informe o modelo do Kart: ")
         leia(modelos[kartIndice])
         escreva("Digite o valor de loca��o do Kart: ")
         leia(precos[kartIndice])
         escreval("")

         lucroKart[kartIndice] <- (30/100) * precos[kartIndice] //calcula lucro do Kart
         kartsNum[kartIndice] <- kartIndice //Define o numero do Kart
         kartsCadastrado[kartIndice] <- 1 //Marcar que existe um Kart no vetor
         qtdKarts <- qtdKarts + 1 //Contabilizar Karts
      senao
         escreval("N�o � poss�vel cadastrar mais Karts.")
         escreval("")
         interrompa
      fimse
   fimpara

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao
funcao kartIndice: inteiro
var
inicio
   para i de 1 ate 15 faca
      //pega o primeiro Indice vazio
      se (kartsCadastrado[i] = 0) entao
         retorne i
         interrompa
      fimse
   fimpara
fimfuncao





funcao listarDisponiveis: caractere
var
   valor: inteiro
inicio
   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta disponivel
      se ((kartsCadastrado[i] = 1) e (estadoLocacao[i] = 0)) entao
         escreval("N�mero do Kart: ", kartsNum[i])
         escreval("Modelo: ", modelos[i])
         escreval("Pre�o: ", precos[i])
         escreval("Vezes em que foi locado: ", vezesLocado[i])
         escreval("")
      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor=15) entao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("N�o h� nenhum Kart dispon�vel!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   se (aux = 0) entao
      limpatela
   fimse
fimfuncao





funcao listarLocados: caractere
var
   valor: inteiro
inicio
   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta locado
      se(kartsCadastrado[i] = 1) e (estadoLocacao[i] = 1) entao
         escreval("N�mero do Kart: ", kartsNum[i])
         escreval("Modelo: ", modelos[i])
         escreval("Pre�o: ", precos[i])
         escreval("Vezes em que foi locado: ", vezesLocado[i])
         escreval("")
      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor=15) entao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("N�o h� nenhum Kart locado!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao





funcao alocarKart: caractere
var valor: inteiro
inicio

   para i de 1 ate 15 faca
      //se existe um kart cadastrado e esta dispon�vel
      se ((kartsCadastrado[i] = 1) e (estadoLocacao[i] = 0)) entao

      senao
         valor<-valor+1
      fimse
   fimpara

   se (valor <> 15) entao
      escreval("Aperte ENTER para mostrar os Karts dispon�veis para loca��o")
      leia(valor)

      aux <- 1 //Isso � para n�o limpar a tela depois de listar
      escreval(listarDisponiveis)
      aux <- 0 //e isso volta para o valor padr�o depois de mostrar

      escreval("Digite o n�mero do Kart que voc� deseja alocar:")
      leia(valor)

      para i de 1 ate 15 faca
         se ((kartsNum[i] = valor) e (estadoLocacao[i] = 0) e (kartsCadastrado[i] = 1)) entao
            escreval("")
            escreval("Voc� alocou o seguinte Kart:")

            escreval("")
            escreval("N�mero do Kart: ", kartsNum[i])
            escreval("Modelo: ", modelos[i])
            escreval("Pre�o: ", precos[i])
            escreval("Vezes em que foi locado: ", vezesLocado[i])
            escreval("")

            estadoLocacao[i] <- 1 //Marca como locado
            vezesLocado[i] <- vezesLocado[i] + 1 //Conta vezes locado
         fimse
      fimpara

   senao
      se (qtdKarts = 0) entao
         escreval("Nenhum Kart foi cadastrado!")
         escreval("")
      senao
         escreval("N�o h� nenhum Kart locado!")
         escreval("")
      fimse
   fimse

   escreval("Aperte ENTER para continuar")
   leia(pausar)
   limpatela
fimfuncao





funcao locarCircuito: caractere
var
   acao : inteiro
   devolverCircuito, alocarCircuito: caractere
   modificarCircuito: inteiro

inicio
   enquanto (acao<>4) faca
      escreval("O que voc� deseja fazer?")
      escreval("1. Cadastrar um circuito.")
      escreval("2. Alocar um circuito.")
      escreval("3. Devolver um circuito.")
      escreval("4. Sair do menu circuitos.")
      leia (acao)

      se acao = 1 entao
         se (nomeCircuito = "") entao
            escreval("Qual o nome do circuito que voc� deseja cadastrar?")
            leia (nomeCircuito)
            escreval ("Qual o valor do circuito ",nomeCircuito,"?")
            leia (valorCircuitos)
         senao
            escreval ("Voc� deseja modificar o nome ou o valor do seu circuito?")
            escreval ("1. Nome.")
            escreval ("2. Valor.")
            leia (modificarCircuito)
            se (modificarCircuito = 1) entao
               escreval ("Insira um novo nome para o seu circuito.")
               leia (modificarCircuito)
               se (modificarCircuito = 2) entao
                  escreval ("Insira o novo valor do seu circuito.")
                  leia (modificarCircuito)
               fimse
            fimse
         fimse
      fimse


      se acao = 2 entao
         se (nomeCircuito = "") entao
            escreval ("Por favor, cadastre um circuito primeiro.")
         senao faca
            escreval ("Qual circuito voc� deseja alocar?")
            leia(alocarCircuito)
         fimse
      fimse

      se acao = 3 entao
         se (nomeCircuito = "") entao
            escreval ("Por favor, cadastre um circuito primeiro.")
            escreval ("Qual circuito voc� deseja devolver?")
            leia (devolverCircuito)
            escreval("O circuito ",devolverCircuito," foi devolvido.")
            leia (devolverCircuito)
         fimse
      fimse
   fimenquanto
fimfuncao






Inicio
   para i de 1 ate 15 faca
      kartsCadastrado[i] <- 0
   fimpara

   repita
      decisao <- menu

      //Cadastrar Kart
      se (decisao = 1) entao
         escreval(cadastrar)
         escreval("")
      fimse

      //Listar Karts dispon�veis
      se (decisao = 2) entao
         escreval(listarDisponiveis)
         escreval("")
      fimse

      //Listar Karts locados
      se (decisao = 3) entao
         escreval(listarLocados)
         escreval("")
      fimse

      //Alugar um Kart
      se (decisao = 4) entao
         escreval(alocarKart)
         escreval("")
      fimse

      //Loca���o de Circuito
      se (decisao = 8) entao
         escreval(locarCircuito)
         escreval("")
      fimse

   ate (decisao=10)

Fimalgoritmo
