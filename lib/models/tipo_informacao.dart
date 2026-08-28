import 'unidade_de_medida.dart';

class TipoInformacao {
  final int id;
  final String nome;
  final UnidadeDeMedida unidadeDeMedida;

  TipoInformacao({
    required this.id,
    required this.nome,
    required this.unidadeDeMedida,
  });
}