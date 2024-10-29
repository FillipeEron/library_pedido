import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/visor.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:auxiliar_pedidos/excel.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;
import 'package:auxiliar_pedidos/proposta.dart';
import 'package:auxiliar_pedidos/utils.dart';

void main(List<String> arguments) async {
  var porta01 = PortaHDF(largura: 900, cor: CorHDF.curupixa);

  var proposta = Proposta(
      tabelaPreco: TabelaPreco.revenda,
      data: dataAtual(),
      vendedor: Vendedor.cleberson);

  await proposta.adicionarProduto(porta01, "2");
  proposta.salvar();
  /*var porta = PortaHDF(
    largura: 1000,
    altura: 2100,
    cor: CorHDF.curupixa,
    espessuraFolha: EspessuraFolha.e35,
    furacao: Furacao.frontal,
    identificacao: "P3",
  );

  var proposta = Proposta(
      tabelaPreco: TabelaPreco.revenda,
      data: dataAtual(),
      vendedor: Vendedor.fillipe,
      observacao: "proposta teste");

  await proposta.adicionarProduto(porta, "2");

  proposta.salvar();*/
}
