import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';

class ConfiguracoesView extends StatelessWidget {
  const ConfiguracoesView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController metaController = TextEditingController();

    return Scaffold(
      body: Consumer<FitnessController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text("Modo Escuro"),
                  value: controller.isDarkMode,
                  onChanged: (bool value) {
                    controller.toggleDarkMode();
                  },
                ),
                const Divider(),
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "Alterar nome de usuário",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.save, color: Colors.green),
                      onPressed: () {
                        controller.atualizarNome(nomeController.text);
                        nomeController.clear();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: metaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Meta Semanal (%)",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.save, color: Colors.green),
                      onPressed: () {
                        final novaMeta = double.tryParse(metaController.text);
                        if (novaMeta != null) {
                          controller.atualizarMeta(novaMeta);
                          metaController.clear();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    controller.resetProgress();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Progresso resetado com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text(
                    "Resetar Progresso",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}