import 'package:fitlife/CONTROLLER/fit_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/VIEW/main_navegacao_view.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeInput = TextEditingController();

// toda essa parte é para a tela inicial do app, onde o usuário vai digitar o nome e clicar no botão para entrar no app, e essas informações vão ser armazenadas no controller para serem usadas nas outras telas
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                "FitLife",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Text(
                "O seu companheiro de saúde e bem-estar",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: nomeInput,
                decoration: const InputDecoration(
                  labelText: "Digite seu nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (nomeInput.text.trim().isNotEmpty) {
                    context.read<FitnessController>().atualizarNome(nomeInput.text);
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavegacaoView()), 
                  );
                },
                child: const Text("Começar", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}