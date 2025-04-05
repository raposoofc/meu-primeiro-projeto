programa
{
	inclua biblioteca Util -->u
	
    cadeia matriz[100][7]
    inteiro contador = 1 // Variável para iniciar o contador para o IdBem automático.

    funcao inicio()
    {
        // Tela inicial irá exibir a "logo" do sistema, aqui no Portugol vai ser em texto.
        escreva("*****************************************************************\n")
        escreva("*    KDBENS  -  SISTEMA DE GERENCIAMENTO DE BENS PATRIMONIAIS  *\n")
        escreva("*****************************************************************\n\n")
        u.aguarde(2000)
        // Na tela inicial, será solicitado que o usuário - pré-definido como usuário único, Administrador - realize seu login,
        //entrando com o usuário e senha.
        cadeia login
        cadeia senha

        escreva("Digite seu login: ")
        leia(login)
        escreva("Digite sua senha: ")
        leia(senha)
        u.aguarde(2000)
        	
        // Aqui será validado se o login e a senha estão corretos.
        se (login == "admin" e senha == "*****"){
            escreva("\nBem-vindo ao sistema!\n")
            menu()
        }senao
        {escreva("\nLogin ou senha incorretos!\n")
        //Caso o login e/ou a senha estão incorretos, retorne ao Menu Principal.
        }
    }
    // Esta função é referente a exibição do Menu Principal
    funcao menu()
    {
        inteiro opcao
        // Condicional para exibir o Menu Principal e ler a opção escolhida pelo usuário
        enquanto (verdadeiro){
            escreva("\nMENU PRINCIPAL\n")
            escreva("1 - Cadastrar\n")
            escreva("2 - Consultar\n")
            escreva("3 - Transferir\n")
            escreva("4 - Encerrar Sessão\n")
            escreva("Escolha uma opção: ")
            leia(opcao)
            u.aguarde(1500)
            // Aqui a condicional irá executar a ação correspondente à opção escolhida pelo usuário.
            escolha (opcao)
            {  caso 1:
                    cadastrar()
                    pare
                caso 2:
                    consultar()
                    pare
                caso 3:
                    transferir()
                    pare
                caso 4:
                    escreva("\nSessão encerrada. Até logo!\n")
                    pare
                caso contrario:
                    escreva("\nOpção inválida! Tente novamente.\n")
            }

            // Verifica se o usuário quer encerrar a sessão
            se (opcao == 4)
            { pare }
        }
    }

    // Aqui inicia a função para cadastrar um item na matriz de 100 linhas e 07 colunas.
    funcao cadastrar()
    {
        se (contador <= 100) // Essa condição 'se' irá verificar se há espaço na matriz para novos registros.
        {
            inteiro linha = contador - 1

            // Gerar automaticamente o ID com seis dígitos
            cadeia id = gerarId(contador)
            matriz[linha][0] = id

            // Aqui irá solicitar as demais informações ao usuário, referentes ao Bem Patrimonial que está sendo cadastrado.
            escreva("\n== Cadastro de Item ==\n")
            escreva("Digite o nome: ")
            leia(matriz[linha][1])

            escreva("Digite a data de aquisição: ")
            leia(matriz[linha][2])

            escreva("Digite o valor: ")
            leia(matriz[linha][3])

            escreva("Digite o setor: ")
            leia(matriz[linha][4])

            escreva("Digite o responsável: ")
            leia(matriz[linha][5])

            escreva("Digite a casa: ")
            leia(matriz[linha][6])

            escreva("\nItem cadastrado com sucesso!\n")

            contador = contador + 1 // Incrementar ou Adicionar o contador para o próximo ID que será registrado, retornando ao Menu Principal.
        }
        senao
        {
            escreva("\nErro: A matriz de cadastros está cheia!\n")
        }
    }

    // Função para gerar o ID com seis dígitos
    funcao cadeia gerarId(inteiro num) // Adicionado o tipo de retorno
    {
        cadeia entradaId = ""

        se (num < 10)
        {
            entradaId = "00000" + num
        }
        senao se (num < 100)
        {
            entradaId = "0000" + num
        }
        senao se (num < 1000)
        {
            entradaId = "000" + num
        }
        senao se (num < 10000)
        {
            entradaId = "00" + num
        }
        senao se (num < 100000)
        {
            entradaId = "0" + num
        }
        senao
        {
            entradaId = "" + num
        }

        retorne entradaId // Aqui, irá ser tilizado a condicional 'retorne' para devolver o valor da entrada do registro.
    }

    // As próximas funções para as demais opções do menu ainda não estão definidas.
    funcao consultar()
	{
	    escreva("\n\n== Consulta de Informações ==\n\n")
	    escreva("\nEscolha uma opção de consulta:\n")
	    escreva("1 - Consultar por Nome\n")
	    escreva("2 - Consultar por IdBem\n")
	    escreva("3 - Consultar por Setor\n")
	    escreva("4 - Consultar por Casa\n")
	    escreva("\nEscolha uma opção: ")
    
    		inteiro consulta
    		leia(consulta)
    
    		cadeia busca
    		escreva("\nDigite o termo de busca: \n")
    		leia(busca)
    
    		inteiro i
    		logico encontrado = falso
    
    		para (i = 0; i < contador - 1; i++)
    		{
        		escolha (consulta)
        		{
            		caso 1:
                	se (matriz[i][1] == busca)
                	{
                    	exibirBem(i)
                    	encontrado = verdadeiro
                	}
                	pare
            		caso 2:
                	se (matriz[i][0] == busca)
                	{
                    	exibirBem(i)
                    	encontrado = verdadeiro
                	}
                	pare
            		caso 3:
                	se (matriz[i][4] == busca)
                	{
                    	exibirBem(i)
                    	encontrado = verdadeiro
                	}
                	pare
            		caso 4:
                	se (matriz[i][6] == busca)
                	{
                    	exibirBem(i)
                    	encontrado = verdadeiro
                	}
                	pare
            		caso contrario:
                	escreva("\nOpção inválida!\n")
                	pare
        		}
    		}
    
    		se (nao encontrado)
    		{
        	escreva("\nNenhum bem encontrado com o termo de busca fornecido.\n")
    		}
	}

	// Função auxiliar para exibir os detalhes de um bem
	funcao exibirBem(inteiro indice)
	{
    	escreva("\n\n===== DETALHES DO BEM PATRIMONIAL BUSCADO =====\n\n")
    	escreva("IdBem: ", matriz[indice][0], "\n")
    	escreva("Nome: ", matriz[indice][1], "\n")
    	escreva("Data de Aquisição: ", matriz[indice][2], "\n")
    	escreva("Valor: ", matriz[indice][3], "\n")
    	escreva("Setor: ", matriz[indice][4], "\n")
    	escreva("Responsável: ", matriz[indice][5], "\n")
    	escreva("Casa: ", matriz[indice][6], "\n")
	}

    funcao transferir()
    {
        escreva("\n== Transferência de Dados ==\n")
        // Adicione o código de transferência aqui
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2502; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matriz, 5, 11, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */