import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart' as pt;
import 'package:auxiliar_pedidos/tiny.dart' as tiny;

class Proposta {
  List<Item> itens = [];
  TabelaPreco tabelaPreco;

  Proposta({required this.tabelaPreco});

  Future<void> adicionarProduto(pt.PortaHDF folha, int quantidade) async {
    var produto = await tiny.fetchProduto(pt.rastrearProdutoTiny(folha));
    produto.descricaoComplementar = pt.gerarDescricao(folha);
    produto.preco = await pt.precificar(folha, TabelaPreco.revenda);
    Item item = Item(quantidade: quantidade, produto: produto);
    itens.add(item);
  }

  void printResumo() {
    itens.forEach((element) {
      print(
          "${element.produto.id} | ${element.produto.nome} | ${element.produto.preco} | ${element.quantidade} | ${element.produto.descricaoComplementar}");
    });
  }
}

class Item {
  int quantidade;
  tiny.Produto produto;

  Item({required this.quantidade, required this.produto});
}
