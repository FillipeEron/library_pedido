import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/visor.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:auxiliar_pedidos/excel.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;
import 'package:auxiliar_pedidos/proposta.dart';
import 'package:auxiliar_pedidos/utils.dart';

void main(List<String> arguments) async {
  var visor = Visor(
      moldura: Moldura.aluminio,
      espessura: EspessuraVidro.e4,
      largura: 400,
      altura: 400);

  var porta = PortaHDF(
    largura: 830,
    altura: 2240,
    cor: CorHDF.branco,
    desenho: Desenho.c01,
    pintura: true,
    mantaChumbo: true,
    espessuraFolha: EspessuraFolha.e35,
    identificacao: "P1",
  );

  var porta2 = PortaHDF(
    largura: 720,
    altura: 2100,
    cor: CorHDF.mogno,
    espessuraFolha: EspessuraFolha.e35,
    perfilU: true,
    visor: visor,
    identificacao: "P2",
  );

  var porta3 = PortaHDF(
    largura: 700,
    altura: 2100,
    cor: CorHDF.imbuia,
    espessuraFolha: EspessuraFolha.e45,
    acustica: true,
    identificacao: "P2",
  );

  var porta4 = PortaHDF(
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
  await proposta.adicionarProduto(porta2, "1");
  await proposta.adicionarProduto(porta3, "1");
  await proposta.adicionarProduto(porta4, "1");

  proposta.salvar();
}
