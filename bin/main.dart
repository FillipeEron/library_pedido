import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
//import 'package:auxiliar_pedidos/proposta.dart';

void main(List<String> arguments) {
  var porta = PortaHDF(
      largura: 710,
      cor: CorHDF.branco,
      desenho: Desenho.c01,
      pintura: true,
      espessuraFolha: EspessuraFolha.e35);
  print(porta.precificar(TabelaPreco.revenda));

  print(porta.descricao());

  var proposta = proposta(
    tabela: TabelaPreco.revenda,
    vendedor: VENDEDOR.fillipe,
    data: "28/09/2024",
  );

  proposta.adicionarItem(porta, 2);
  proposta.exportar();
}
