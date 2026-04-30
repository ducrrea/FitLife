import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

// aqui vamos fazer o dashboard do app, mostrando as principais métricas de desempenho do usuário, como atividades concluídas, calorias queimadas, tempo gasto e progresso em relação à meta semanal. Vamos usar um GridView para organizar essas informações de forma visualmente atraente e fácil de entender. Cada métrica será apresentada em um card com um ícone representativo, o valor atual e uma breve descrição. O objetivo é fornecer ao usuário uma visão geral rápida do seu progresso e motivá-lo a continuar se esforçando para alcançar seus objetivos de fitness.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FitnessController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                _buildCardDashboard(
                  titulo: "Atividades Concluídas",
                  value: controller.totalAtividadesConcluidas.toString(),
                  icon: Icons.check_box,
                  color: Colors.green,
                ),
                _buildCardDashboard(
                  titulo: "Atividades Pendentes",
                  value: controller.totalAtividadesPendentes.toString(),
                  icon: Icons.pending_actions,
                  color: Colors.orange,
                ),
                _buildCardDashboard(
                  titulo: "Calorias Totais",
                  value: "${controller.totalCalorias} kcal",
                  icon: Icons.local_fire_department,
                  color: Colors.red,
                ),
                _buildCardDashboard(
                  titulo: "Tempo Total",
                  value: "${controller.tempoTotal.toStringAsFixed(1)} h",
                  icon: Icons.timer,
                  color: Colors.blue,
                ),
                _buildCardDashboard(
                  titulo: "Meta Semanal",
                  value: "${controller.porcentagemMeta.toStringAsFixed(0)}%",
                  icon: Icons.star,
                  color: Colors.purple,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

//aqui vamos fazer o card do dashboard, que vai ser usado para mostrar as métricas de desempenho do usuário. O card vai ter um título, um valor, um ícone e uma cor de destaque. O título vai descrever a métrica (ex: "Atividades Concluídas"), o valor vai mostrar o número ou a porcentagem correspondente, o ícone vai representar visualmente a métrica (ex: um check para atividades concluídas) e a cor de destaque vai ajudar a diferenciar cada métrica e tornar o dashboard mais atraente visualmente.
  Widget _buildCardDashboard({
    required String titulo,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 12),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}