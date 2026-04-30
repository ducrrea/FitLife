# Documentação de Requisitos - Fit Life

## 1. Introdução
Este documento apresenta a especificação técnica dos requisitos do aplicativo móvel **FitLife**. O sistema foi desenvolvido para auxiliar os usuários a monitorarem sua rotina de exercícios físicos, acompanharem metas e visualizarem um painel de desempenho. O projeto utiliza o framework Flutter e o gerenciamento de estado com *Provider*.

---

## 2. Contexto e Descrição Geral
O FitLife é um protótipo de aplicativo móvel voltado para o bem-estar e a saúde. Ele permite navegação fluida, interface responsiva e atualização de dados em tempo real. O aplicativo foi estruturado utilizando boas práticas de desenvolvimento (separação de responsabilidades, reutilização de widgets e código comentado).

**Escopo do Protótipo:** O sistema contempla quatro módulos principais: Apresentação (Home), Atividades (Pendentes e Concluídas), Dashboard e Configurações.

---

## 3. Requisitos Funcionais (RF)

| ID | Descrição | Prioridade |
| :--- | :--- | :--- |
| **01** | O sistema deve permitir a inserção e armazenamento do nome do usuário. | Alta |
| **02** | O usuário deve poder visualizar listas de atividades (pendentes e concluídas) via ListView. | Alta |
| **03** | O sistema deve permitir a marcação/desmarcação de uma atividade como concluída, atualizando o estado do Provider. | Alta |
| **04** | O dashboard deve calcular e exibir métricas de saúde (calorias, tempo, porcentagem da meta). | Alta |
| **05** | O usuário deve poder alterar o tema para modo escuro ou claro, salvando no estado do app. | Média |
| **06** | O sistema deve permitir resetar todas as atividades para o estado inicial. | Baixa |

---

## 4. Requisitos Não-Funcionais (RNF)

* **01 (Usabilidade):** O aplicativo deve ser composto por 3 abas de navegação (BottomNavigationBar) e menu lateral (Drawer).
* **02 (Desempenho):** A atualização da interface deve ser imediata ao modificar o estado via *notifyListeners()*, mantendo a latência baixa.
* **03 (Manutenibilidade):** A arquitetura deve seguir o padrão de separação entre Controller e View, facilitando testes e expansões.

---

## 5. Regras de Negócio e Restrições

Abaixo são descritas as regras que regem o comportamento da aplicação:

* **01 (Cálculo de Calorias):** O sistema calcula as calorias apenas para as atividades que estão concluídas.
* **02 (Meta Semanal):** A meta é baseada na proporção de tarefas concluídas em relação ao total, exibindo o percentual atingido.
* **03 (Restrição de Entrada):** O cadastro de nova atividade exige a definição de título, calorias e tempo de duração (em horas).

## 6. Protótipo
https://www.figma.com/design/FSmItpgktW1PQTqueLuCPS/Widget-Inicial-Flutter--c%C3%B3pia---c%C3%B3pia-?node-id=0-1&t=Fyk1apmxCoGzlmmh-1