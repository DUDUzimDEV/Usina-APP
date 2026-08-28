import 'equipamento.dart';
import 'safra.dart';
import 'tipo_informacao.dart';

class Medicao {
  final int id;
  final Safra safra;
  final TipoInformacao tipoInformacao;
  final double valor;
  final DateTime data;
  final Equipamento equipamento;

  Medicao({
    required this.id,
    required this.safra,
    required this.tipoInformacao,
    required this.valor,
    required this.data,
    required this.equipamento,
  });
}