import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart' as pt;
import 'package:auxiliar_pedidos/proposta.dart';

void main(List<String> arguments) async {
  var folha01 = pt.PortaHDF(
      largura: 68,
      cor: CorHDF.mogno,
      desenho: Desenho.c02,
      altura: 2100,
      pintura: false);

  var proposta = Proposta(tabelaPreco: TabelaPreco.revenda);
  await proposta.adicionarProduto(folha01, 2);
  proposta.printResumo();
}
