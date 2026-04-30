import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';

class AtividadesView extends StatelessWidget {
  const AtividadesView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloInput = TextEditingController();
    final TextEditingController caloriasInput = TextEditingController();
    final TextEditingController tempoInput = TextEditingController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                tabs: [
                  Tab(text: 'Pendentes', icon: Icon(Icons.pending_actions)),
                  Tab(text: 'Concluídas', icon: Icon(Icons.check_circle)),
                ],
              ),
            ],
          ),
        ),
        body: Consumer<FitnessController>(
          builder: (context, controller, child) {
            return TabBarView(
              children: [
                // Aba 1: Atividades Pendentes
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Adicionar novas atividades
                      TextField(
                        controller: tituloInput,
                        decoration: const InputDecoration(
                          labelText: "Nome da Atividade (ex: Corrida)",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: caloriasInput,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Calorias (kcal)",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: tempoInput,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Tempo (h)",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          controller.createAtividade(
                            tituloInput.text,
                            int.tryParse(caloriasInput.text) ?? 0,
                            double.tryParse(tempoInput.text) ?? 0.0,
                          );
                          tituloInput.clear();
                          caloriasInput.clear();
                          tempoInput.clear();
                        },
                        icon: const Icon(Icons.add, color: Colors.green, size: 36),
                      ),
                      // Lista
                      Expanded(
                        child: controller.atividadesPendentes.isEmpty
                            ? const Center(child: Text("Nenhuma atividade pendente!"))
                            : ListView.builder(
                                itemCount: controller.atividadesPendentes.length,
                                itemBuilder: (context, index) {
                                  final atividade = controller.atividadesPendentes[index];
                                  return Card(
                                    elevation: 2,
                                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                    child: ListTile(
                                      leading: Checkbox(
                                        value: atividade.concluida,
                                        onChanged: (_) {
                                          controller.toggleAtividade(atividade);
                                        },
                                      ),
                                      title: Text(
                                        atividade.titulo,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Calorias: ${atividade.calorias} kcal • Tempo: ${atividade.tempoGasto}h',
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),

                // Aba 2: Atividades Concluídas
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.atividadesConcluidas.isEmpty
                      ? const Center(child: Text("Nenhuma atividade concluída ainda!"))
                      : ListView.builder(
                          itemCount: controller.atividadesConcluidas.length,
                          itemBuilder: (context, index) {
                            final atividade = controller.atividadesConcluidas[index];
                            return Card(
                              color: Colors.green.shade50,
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: ListTile(
                                leading: const Icon(Icons.check_circle, color: Colors.green),
                                title: Text(
                                  atividade.titulo,
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Calorias: ${atividade.calorias} kcal • Tempo: ${atividade.tempoGasto}h',
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.undo, color: Colors.orange),
                                  onPressed: () {
                                    controller.toggleAtividade(atividade);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}