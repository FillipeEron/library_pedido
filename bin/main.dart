import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:auxiliar_pedidos/excel.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;
import 'package:auxiliar_pedidos/proposta.dart';
import 'package:auxiliar_pedidos/utils.dart';

void main(List<String> arguments) async {
  var porta = PortaHDF(
      largura: 710,
      cor: CorHDF.branco,
      desenho: Desenho.c01,
      pintura: true,
      espessuraFolha: EspessuraFolha.e30);

  var porta2 = PortaHDF(
      largura: 700,
      altura: 2100,
      cor: CorHDF.mogno,
      espessuraFolha: EspessuraFolha.e35,
      perfilU: true);

  var proposta = Proposta(
      tabelaPreco: TabelaPreco.revenda,
      data: dataAtual(),
      vendedor: Vendedor.fillipe);

  await proposta.adicionarProduto(porta, "2");
  await proposta.adicionarProduto(porta2, "1");

  proposta.salvar();
}



// https://medium.com/@aigbekelvin/how-to-use-mockito-in-flutter-9e67c5a09bb1