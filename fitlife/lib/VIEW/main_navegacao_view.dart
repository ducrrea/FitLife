import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';
import 'package:fitlife/VIEW/dashboard_view.dart';
import 'package:fitlife/VIEW/atividades_view.dart';
import 'package:fitlife/VIEW/configuracoes_view.dart';
import 'package:fitlife/VIEW/tela_inicial.dart';

class MainNavegacaoView extends StatelessWidget {
  const MainNavegacaoView({super.key});

  // Lista de telas para o bottom navigation
  final List<Widget> _telas = const [
    DashboardView(),
    AtividadesView(),
    ConfiguracoesView(),
  ];

// aqui vamos fazer a navegação principal do app, que vai ser controlada por um BottomNavigationBar. O usuário vai poder alternar entre as telas de Dashboard, Atividades e Configurações. O AppBar vai mostrar uma saudação personalizada com o nome do usuário, e o Drawer vai conter opções para acessar as mesmas telas, além de uma opção para sair do app. A navegação deve ser fluida e intuitiva, garantindo que o usuário possa acessar facilmente todas as funcionalidades do FitLife.
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FitnessController>(context);

// aqui vamos construir a estrutura principal do app, com um Scaffold que contém um AppBar, um Drawer para navegação lateral, o corpo que exibe a tela atual com base no índice selecionado e um BottomNavigationBar para alternar entre as telas. O AppBar vai mostrar uma saudação personalizada usando o nome do usuário, e o Drawer vai conter opções para acessar as mesmas telas do BottomNavigationBar, além de uma opção para sair do app. A navegação deve ser fluida e intuitiva, garantindo que o usuário possa acessar facilmente todas as funcionalidades do FitLife.
    return Scaffold(
      appBar: AppBar(
        title: Text("FitLife — Bem-vindo(a), ${controller.nomeUsuario}"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'FitLife Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                controller.setIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text("Atividades"),
              onTap: () {
                controller.setIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configurações"),
              onTap: () {
                controller.setIndex(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Sair"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaInicial()),
                );
              },
            ),
          ],
        ),
      ),

      // aqui vamos mostrar a tela atual
      body: _telas[controller.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Atividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}