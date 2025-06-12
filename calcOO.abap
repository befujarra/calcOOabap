*&---------------------------------------------------------------------*
*& Report ZVBF_CALCULATOR
*&---------------------------------------------------------------------*
REPORT zvbf_calculator. " Início do programa ABAP tipo report

" Definição da classe local principal que organiza a lógica do programa
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    " Método principal que será executado na inicialização do programa
    CLASS-METHODS main.

    " Declaração de variáveis globais da classe
    CLASS-DATA:
      go_calculator TYPE REF TO zvbfcl_calculadora, " Referência ao objeto calculadora
      gv_result     TYPE zvbf_valores_calc,         " Resultado da operação
      gv_msg        TYPE string.                    " Mensagem de erro ou informação

  PRIVATE SECTION.
    " Métodos auxiliares privados, utilizados internamente
    CLASS-METHODS:
      instance_calculator,  " Instancia o objeto da calculadora
      process_calculator,   " Realiza a operação com base no parâmetro
      display_result.       " Exibe o resultado ou mensagem
ENDCLASS.

" Tela de seleção para entrada de dados do usuário
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS:
    p_oper   TYPE char1 OBLIGATORY,            " Operação a ser realizada: + - * /
    p_valor1 TYPE zvbf_valores_calc OBLIGATORY, " Primeiro valor da operação
    p_valor2 TYPE zvbf_valores_calc OBLIGATORY. " Segundo valor da operação
SELECTION-SCREEN END OF BLOCK b1.

" Implementação da lógica da classe principal
CLASS lcl_main IMPLEMENTATION.

  " Método principal que orquestra a execução do programa
  METHOD main.
    lcl_main=>instance_calculator( ).    " Cria o objeto da calculadora com os valores informados

    IF go_calculator is BOUND.

       lcl_main=>process_calculator( ).     " Executa a operação matemática
       lcl_main=>display_result( ).         " Exibe o resultado ou erro na tela

     else.
       WRITE text-002.

    ENDIF.

  ENDMETHOD.

  " Instancia o objeto da classe calculadora com os dois valores informados pelo usuário
  METHOD instance_calculator.
    CREATE OBJECT go_calculator
      EXPORTING
        iv_valor1 = p_valor1
        iv_valor2 = p_valor2.
  ENDMETHOD.

  " Executa a operação selecionada, com base no valor de p_oper
  METHOD process_calculator.
    " Verifica se o objeto foi criado corretamente
    IF go_calculator IS BOUND.

      " Escolhe a operação a partir do valor digitado pelo usuário
      CASE p_oper.
        WHEN '+'.
          gv_result = go_calculator->somar( ).        " Chama o método de soma
        WHEN '-'.
          gv_result = go_calculator->subtrair( ).     " Chama o método de subtração
        WHEN '*'.
          gv_result = go_calculator->multiplicar( ).  " Chama o método de multiplicação
        WHEN '/'.
          " Chama o método de divisão e retorna tanto o resultado quanto uma possível mensagem
          go_calculator->dividir(
            IMPORTING
              ev_result = gv_result
              ev_msg    = gv_msg
          ).
        WHEN OTHERS.
          " Caso a operação seja inválida, define mensagem de erro
          gv_msg = 'Operação inválida. Use + - * /'.
      ENDCASE.

    ENDIF.
  ENDMETHOD.

  " Exibe o resultado da operação ou uma mensagem de erro, se existir
  METHOD display_result.
    IF gv_msg IS NOT INITIAL.
      " Se houver mensagem, exibe-a
      WRITE: / gv_msg.
    ELSE.
      " Caso contrário, exibe o resultado da operação
      WRITE: / 'Resultado: ', gv_result.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

" Ponto de entrada principal do programa
START-OF-SELECTION.
  lcl_main=>main( ). " Chama o método principal da classe
