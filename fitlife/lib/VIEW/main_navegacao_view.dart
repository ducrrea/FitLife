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

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FitnessController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('FitLife — Bem-vindo(a), ${controller.nomeUsuario}'),
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
              title: const Text('Dashboard'),
              onTap: () {
                controller.setIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Atividades'),
              onTap: () {
                controller.setIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                controller.setIndex(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Sair'),
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