programa
{
	/*
	 * Aluno: Carlos Eduardo Corrêa
	 * Sua atividade será elaborar um algoritmo no Portugol, que permita aos atendentes realizarem a gestão de reservas de passagens. 
	*/
	inclua biblioteca Util --> U
	inclua biblioteca Matematica --> M
	const inteiro linha_max = 30,col_max = 10
	inteiro linha = 0, coluna = 0, i = 0, j = 0
	cadeia passageiro[linha_max][col_max], enter, poltrona[linha_max][col_max], busca
	inteiro idade[linha_max][col_max]
	caracter opcao
	
	funcao inicio()
	{
		limpa()
		menu()
	}
	
	funcao menu()
	{
		limpa()
		escreva("Bem vindo..\n\n")
		U.aguarde(500)
		escreva("1 - Cadastrar/Editar Capacidade da Aeronave\n")
		U.aguarde(25)
		escreva("2 - Reservar Poltrona\n")
		U.aguarde(25)
		escreva("3 - Poltronas Disponíveis\n")
		U.aguarde(25)
		escreva("4 - Poltronas Reservadas\n")
		U.aguarde(25)
		escreva("5 - Consultar Passageiro\n")
		U.aguarde(25)
		escreva("6 - Visualizar Status Aeronave(Reservado/Disponível)\n")
		U.aguarde(25)
		escreva("7 - Sair do Sistema\n\n")
		U.aguarde(25)
		escreva("O que deseja?: ")
		leia(opcao)
 
		escolha(opcao)
		{
			caso '1':
			{
				cadastra_aeronave()
				pare
			}
			caso '2':
			{
				reserva()
				pare
			}
			caso '3':
			{
				disponiveis()
				pare
			}
			caso '4':
			{
				reservados()
				pare
			}
			caso '5':
			{
				buscar()
				pare
			}
			caso '6':
			{
				disponiveis_reservado()
				pare
			}
			caso '7':
			{
				sair()
				pare
			}
			caso contrario:
			{
				limpa()
				escreva("Opção Inváida..\nTente novamente!")
				U.aguarde(2000)
				menu()
				pare
			}
		}
		
	}
	
	funcao cadastra_aeronave()
	{
		limpa()
		se(linha > 0 ou coluna > 0)
		{
			inteiro nova_linha = 0, nova_coluna = 0
			escreva("Editar capacidade da aeronave\n(ATENÇÃO! Não há como reduzir a capacidade, somente expandir)\n")
			escreva("Por favor\nInforme a quantidade de fileiras e colunas de poltronas disponibilzados na aeronave:\n")
			escreva("Fileiras: ")
			leia(nova_linha)
			escreva("Colunas: ")
			leia(nova_coluna)
			U.aguarde(100)
			limpa()
			se(nova_linha > linha_max ou nova_coluna > col_max)
			{
				escreva("Os valores inseridos excedem o limite máximo!\n")
				escreva("O numero máximo de linhas é 30 e o máximo de colunas é 10!\n")
				escreva("Por favor, tente novamente...\n")
			}
			senao
			{
				se(nova_linha >= linha e nova_coluna >= coluna)
				{
					linha = nova_linha
					coluna = nova_coluna
					escreva("Edição da capacidade realizada com sucesso!")
				}
				senao
				{
					escreva("Não é possivel reduzir a capacidade da aeronave cadastrada!")
				}
			}
		}
		senao
		{
			escreva("Cadastro da aeronave\n")
			escreva("Por favor\nInforme a quantidade de fileiras e colunas de poltronas disponibilizados na aeronave:\n")
			escreva("Fileiras: ")
			leia(linha)
			escreva("Colunas: ")
			leia(coluna)
			se(linha > linha_max ou coluna > col_max)
			{
				escreva("Os valores inseridos excedem o limite máximo!\n")
				escreva("O numero máximo de linhas é 30 e o máximo de colunas é 10!\n")
				escreva("Por favor, tente novamente...\n")
				linha = 0
				coluna = 0
			}
			senao
			{
				escreva("Cadastro realizado com sucesso!")
			}
		}
		retorna()
	}
	
	funcao sair()
	{
		limpa()
		escreva("Finalizando sistema em 3...")
		U.aguarde(1000)
		limpa()
		escreva("Finalizando sistema em 2...")
		U.aguarde(1000)
		limpa()
		escreva("Finalizando sistema em 1...")
		U.aguarde(1000)
		limpa()
	}

	funcao reserva()
	{
		limpa()
		se(linha == 0 ou coluna == 0)
		{
			escreva("Aeronave não cadastrada!")
		}
		senao
		{
			inteiro fila_poltrona = 0, coluna_poltrona = 0
			escreva("||RESERVA DE POLTRONA||\n")
			escreva("As poltronas marcadas com X já estão ocupadas!\n")
			escreva("Escolha a abaixo a poltrona que deseja:\n")
			para(i = 0;i<linha;i++)
			{
				se(i+1 >= 10)
				{
					escreva(i+1," ")
				}
				senao
				{
					escreva(i+1,"  ")
				}
				para(j = 0;j<coluna;j++)
				{
					escreva(j+1)
					se(poltrona[i][j]=="")
					{
						escreva("[ ]")
					}
					senao
					{
						escreva("[",poltrona[i][j],"]")
					}
				}
				escreva("\n")
			}
			escreva("Informe a linha(horizontal) e a coluna(vertical) da poltrona que deseja\n")
			escreva("Linha: ")
			leia(fila_poltrona)
			escreva("Coluna: ")
			leia(coluna_poltrona)
			se(fila_poltrona>linha ou coluna_poltrona>coluna)
			{
				escreva("O assento escolhido não existe!")
			}
			senao
			{
				se(poltrona[fila_poltrona-1][coluna_poltrona-1] == "X")
				{
					limpa()
					escreva("Poltrona já reservada!\n")
					escreva("Por favor, escolha uma poltrona disponivel")
				}
				senao
				{
					limpa()
					escreva("Informe os dados do passageiro:\n")
					escreva("Nome: ")
					leia(passageiro[fila_poltrona-1][coluna_poltrona-1])
					escreva("Idade: ")
					leia(idade[fila_poltrona-1][coluna_poltrona-1])
					poltrona[fila_poltrona-1][coluna_poltrona-1] = "X"
					U.aguarde(25)
					limpa()
					escreva("Reserva realizada com Sucesso!!\n")
				}
			}
		}
		retorna()
	}

	funcao retorna()
	{
		U.aguarde(1000)
		escreva("\n\nPressione [ENTER] para voltar ao menu")
		leia(enter)
		menu()
	}

	funcao disponiveis_reservado()
	{
		limpa()
		real total_poltronas = linha*coluna, total_disponivel = 0, total_reservado = 0, crianca = 0, adolescente = 0, adultos = 0, idoso = 0 
		se(linha==0 ou coluna==0)
		{
			escreva("Aeronave não cadastrada")
		}
		senao
		{
			escreva("STATUS ATUAL DE DISPONIBILIDADE DA AERONAVE\n\n")
			para(i = 0;i<linha;i++)
			{
				se(i+1 >= 10)
				{
					escreva(i+1," ")
				}
				senao
				{
					escreva(i+1,"  ")
				}
				para(j = 0;j<coluna;j++)
				{
					escreva(j+1)
					se(poltrona[i][j]=="")
					{
						escreva("[ ]")
						total_disponivel++
					}
					senao
					{
						escreva("[",poltrona[i][j],"]")
						total_reservado++
						se(idade[i][j] <= 12)
						{
							crianca++
						}
						senao se(idade[i][j] > 12 e idade[i][j] <= 17)
						{
							adolescente++
						}
						senao se(idade[i][j] > 17 e idade[i][j] <= 59)
						{
							adultos++
						}
						senao se(idade[i][j] >= 60)
						{
							idoso++
						}
					}
				}
				escreva("\n")
			}
			escreva("\n")
			escreva("Total de poltronas: ",total_poltronas,"\n")
			escreva("Disponiveis: ",total_disponivel," - ",M.arredondar(((total_disponivel/total_poltronas)*100),0),"%\n")
			escreva("Reservados: ",total_reservado," - ",M.arredondar(((total_reservado/total_poltronas)*100),0),"%\n")
			escreva("\nCrianças :",crianca," - ",M.arredondar(((crianca/total_reservado)*100),0),"%\n")
			escreva("Adolescentes :",adolescente," - ",M.arredondar(((adolescente/total_reservado)*100),0),"%\n")
			escreva("Adultos :",adultos," - ",M.arredondar(((adultos/total_reservado)*100),0),"%\n")
			escreva("Idosos :",idoso," - ",M.arredondar(((idoso/total_reservado)*100),0),"%\n")
		}
		retorna()
	}

	funcao disponiveis()
	{
		limpa()
		se(linha==0 ou coluna==0)
		{
			escreva("Aeronave não cadastrada")
		}
		senao
		{
			escreva("Poltronas disponiveis\n\n")
			para(i = 0;i<linha;i++)
			{
				se(i+1 >= 10)
				{
					escreva(i+1," ")
				}
				senao
				{
					escreva(i+1,"  ")
				}
				para(j = 0;j<coluna;j++)
				{
					se(poltrona[i][j]=="")
					{
						escreva(j+1)
						escreva("[ ]")
					}
					senao
					{
						escreva("    ")
					}
				}
				escreva("\n")
			}
		}
		retorna()
	}

	funcao reservados()
	{
		limpa()
		se(linha==0 ou coluna==0)
		{
			escreva("Aeronave não cadastrada")
		}
		senao
		{
			escreva("Poltronas reservadas\n\n")
			para(i = 0;i<linha;i++)
			{
				se(i+1 >= 10)
				{
					escreva(i+1," ")
				}
				senao
				{
					escreva(i+1,"  ")
				}
				para(j = 0;j<coluna;j++)
				{
					se(poltrona[i][j]=="")
					{
						escreva("   ")
					}
					senao
					{
						escreva(j+1)
						escreva("[",poltrona[i][j],"]")
					}
				}
				escreva("\n")
			}
			escreva("\n")
			para(i=0;i<linha;i++)
			{
				para(j=0;j<coluna;j++)
				{
					se(poltrona[i][j]=="X")
					{
						escreva("Poltrona: ",i+1,"x",j+1,"\n")
						escreva("Nome: ",passageiro[i][j],"\n")
						escreva("Idade: ",idade[i][j],"\n")
						escreva("\n")
					}
				}
			}
		}
		retorna()
	}

	funcao buscar()
	{
		logico encontrado = falso
		limpa()
		escreva("Informe o nome do passageiro: ")
		leia(busca)

		para(i = 0;i<linha;i++)
		{
			para(j = 0;j<coluna;j++)
			{
				se(passageiro[i][j]==busca)
				{
					encontrado = verdadeiro
					escreva("Poltrona: ",i+1,"x",j+1,"\n")
					escreva("Nome: ",passageiro[i][j],"\n")
					escreva("Idade: ",idade[i][j],"\n")
					escreva("\n")
				}
			}
		}
		se(encontrado==falso)
		{
			escreva("\nPassageiro não encontrado!")
		}
		retorna()
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 177; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */