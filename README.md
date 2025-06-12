
# 📐 ZVBF_CALCULATOR - Projeto ABAP

## 📝 Descrição

Este projeto consiste em um programa ABAP do tipo `REPORT`, que simula uma calculadora simples com quatro operações básicas: **adição**, **subtração**, **multiplicação** e **divisão**.

O objetivo é praticar conceitos de **POO em ABAP**, uso de `SELECTION-SCREEN`, e estruturação modular utilizando **classes e métodos**. A operação é escolhida pelo usuário na tela de seleção, e os cálculos são executados por uma classe separada (`ZVBFCL_CALCULADORA`).

---

## 🧠 Estrutura do Projeto

O projeto é dividido em duas partes principais:

### 1. **Report Principal: `ZVBF_CALCULATOR`**
Responsável por:

- Coletar dados do usuário na tela de seleção
- Instanciar a classe de cálculo
- Chamar o método correto com base na operação
- Exibir o resultado ou uma mensagem

### 2. **Classe: `ZVBFCL_CALCULADORA`**
Classe personalizada contendo os métodos:

- `SOMAR()`: retorna a soma dos dois valores
- `SUBTRAIR()`: retorna a subtração
- `MULTIPLICAR()`: retorna a multiplicação
- `DIVIDIR()`: retorna a divisão ou uma mensagem de erro se for divisão por zero

---


## 🧱 Explicação dos Blocos

| Bloco | Função |
|-------|--------|
| **Entrada de dados** | Solicita do usuário a operação e dois valores numéricos |
| **Criar objeto calculadora** | Instancia a classe `ZVBFCL_CALCULADORA` com os dois valores |
| **Verifica operação** | Analisa o operador informado (`+`, `-`, `*`, `/`) |
| **Chamar métodos** | Executa o método correspondente à operação |
| **Tratamento de divisão por zero** | Gera uma mensagem de erro personalizada |
| **Exibir saída** | Mostra o resultado ou a mensagem final ao usuário |

---

## 🧪 Exemplo de Uso

### Entrada na tela de seleção:
```
Operação: +
Valor 1: 10
Valor 2: 5
```

### Saída esperada:
```
Resultado: 15
```

---

## 🚀 Como executar

1. Crie um programa do tipo `REPORT` com o nome `ZVBF_CALCULATOR` no SAP.
2. Crie a classe `ZVBFCL_CALCULADORA` via SE24.
3. Defina os métodos `somar`, `subtrair`, `multiplicar` com `RETURNING`.
4. Defina `dividir` com `EXPORTING` para resultado e mensagem.
5. Ative tudo e execute o programa.

---

## 📌 Observações

- A operação deve ser exatamente uma das seguintes: `+`, `-`, `*`, `/`
- O programa exibe mensagens de erro em caso de divisão por zero ou operação inválida

---

## 👨‍💻 Autor

Desenvolvido por **Vinicius Fujarra** para fins de estudo e prática com ABAP orientado a objetos.
