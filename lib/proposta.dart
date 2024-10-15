import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/excel.dart';
import 'package:auxiliar_pedidos/utils.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;

class Proposta {
  var propostaExcel = PropostaExcel();
  static const nomeContato = "BOT";
  static const numeroProposta = "1000";
  TabelaPreco tabelaPreco;
  String desconto;
  String frete;
  String validade;
  String prazoEntrega;
  String data;
  String? observacao;
  Vendedor vendedor;

  Proposta({
    required this.tabelaPreco,
    this.desconto = "0",
    this.frete = "0",
    this.validade = "10",
    this.prazoEntrega = "15 A 20 DIAS UTEIS",
    required this.data,
    required this.vendedor,
  });

  Future<void> adicionarProduto(PortaHDF porta, String quantidade) async {
    var produto = await tiny.fetchProduto(porta.codigoTiny());
    this.propostaExcel.addProduto(
          idProduto: produto.codigo,
          descricao: produto.nome,
          quantidade: quantidade,
          valorUnitario: porta.precificar(tabelaPreco).toString(),
          descricaoComplementar: porta.descricao(),
        );
  }

  void salvar() {
    this.propostaExcel.camposGerais(
          numeroProposta: numeroProposta,
          nomeContato: nomeContato,
          listaPreco: this.tabelaPreco.tabela,
          desconto: this.desconto,
          frete: this.frete,
          validade: this.validade,
          prazoEntrega: this.prazoEntrega,
          data: this.data,
          vendedor: this.vendedor.nome,
        );

    propostaExcel.addObservacao(
        "> PRODUTO DE USO INTERNO, NÃO PODENDO ENTRAR EM CONTATO COM ÁGUA;");
    propostaExcel.save();
  }
}
