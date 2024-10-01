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

  var proposta = Proposta(
      tabelaPreco: TabelaPreco.revenda,
      data: dataAtual(),
      vendedor: VENDEDOR.fillipe);

  await proposta.adicionarProduto(porta, "2");

  proposta.salvar(porta);

  /*var propostaExcel = PropostaExcel();
  propostaExcel.camposGerais(
    nomeContato: "BOT",
    listaPreco: TabelaPreco.revenda.tabela,
    desconto: "10",
    frete: "10",
    validade: "5",
    prazoEntrega: "10 A 15 DIAS UTEIS",
    data: "12/09/2024",
    observacoes: "> PROPOSTA DE TESTE",
    vendedor: VENDEDOR.fillipe.nome,
  );

  var porta = PortaHDF(
      largura: 710,
      cor: CorHDF.branco,
      desenho: Desenho.c01,
      pintura: true,
      espessuraFolha: EspessuraFolha.e35);

  var produto = await tiny.fetchProduto(porta.codigoTiny());

  propostaExcel.addProduto(
      idProduto: produto.codigo,
      descricao: produto.nome,
      quantidade: "2",
      valorUnitario: porta.precificar(TabelaPreco.revenda).toString(),
      descricaoComplementar: porta.descricao());

  propostaExcel.save();*/
}
