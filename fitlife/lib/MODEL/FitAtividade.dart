
class Atividade {
  String titulo;
  bool concluida;
  int calorias; // para a quantidade de calorias gastas
  double tempoGasto; // tempo em horas
  DateTime criadaEm;

  Atividade({
    required this.titulo, //o required torna o campo obrigatório
    this.concluida = false,
    required this.calorias,
    required this.tempoGasto,
    DateTime? criadaEm,
  }) : criadaEm = criadaEm ?? DateTime.now();
}