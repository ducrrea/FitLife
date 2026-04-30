import 'package:fitlife/MODEL/FitAtividade.dart';
import 'package:flutter/material.dart';


class FitnessController extends ChangeNotifier {
  // essa parte é pra controlar o estado da navegação entre as telas
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // como vao estas as configurações iniciais do app
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  String _nomeUsuario = "Usuário";
  String get nomeUsuario => _nomeUsuario;
  double _metaSemanal = 70.0;
  double get metaSemanal => _metaSemanal;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void atualizarNome(String novoNome) {
    if (novoNome.trim().isEmpty) return;
    _nomeUsuario = novoNome;
    notifyListeners();
  }

  void atualizarMeta(double novaMeta) {
    _metaSemanal = novaMeta;
    notifyListeners();
  }

  // armazenar atividades
  final List<Atividade> _atividades = [
    Atividade(titulo: "Caminhada", calorias: 150, tempoGasto: 0.5),
    Atividade(titulo: "Corrida", calorias: 300, tempoGasto: 0.75),
    Atividade(titulo: "Treino de Musculação", calorias: 250, tempoGasto: 1.0),
    Atividade(titulo: "Yoga", calorias: 120, tempoGasto: 0.5),
  ];

  List<Atividade> get atividades => _atividades;

  List<Atividade> get atividadesPendentes =>
      _atividades.where((a) => !a.concluida).toList(); // o .where é para filtrar a lista de atividades, retornando apenas as que não estão concluídas

  List<Atividade> get atividadesConcluidas =>
      _atividades.where((a) => a.concluida).toList();

  // add atividsdes
  void createAtividade(String titulo, int calorias, double tempo) {
    if (titulo.trim().isEmpty) return;
    _atividades.add(Atividade(
      titulo: titulo,
      calorias: calorias,
      tempoGasto: tempo,
    ));
    notifyListeners();
  }

  // essa parte e para atualizar o status da atividade (concluida ou não)
  void toggleAtividade(Atividade atividade) {
    atividade.concluida = !atividade.concluida;
    notifyListeners();
  }

  // para ver o progesso 
  void resetProgress() {
    for (var a in _atividades) {
      a.concluida = false;
    }
    notifyListeners();
  }

  // essa parte é para calcular as métricas do dashboard
  int get totalAtividades => _atividades.length;
  int get totalAtividadesConcluidas => atividadesConcluidas.length;
  int get totalAtividadesPendentes => atividadesPendentes.length;

  int get totalCalorias {
    return _atividades
        .where((a) => a.concluida)
        .fold(0, (sum, a) => sum + a.calorias);
  }

  double get tempoTotal {
    return _atividades
        .where((a) => a.concluida)
        .fold(0.0, (sum, a) => sum + a.tempoGasto);
  }

  double get porcentagemMeta {
    if (_atividades.isEmpty) return 0.0;
    return (atividadesConcluidas.length / _atividades.length) * 100;
  }
}