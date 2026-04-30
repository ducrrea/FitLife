import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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