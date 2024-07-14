import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';
import 'package:hive/hive.dart';

const String pathData = "../data/data_preco/data";

class FolhaPortaHDF {
  int largura;
  int altura;
  EspessuraFolha espessuraFolha;
  CorHDF cor;
  Desenho desenho;

  FolhaPortaHDF({
    required this.largura,
    this.altura = 2100,
    this.espessuraFolha = EspessuraFolha.e30,
    required this.cor,
    this.desenho = Desenho.nenhum,
  });
}

String gerarDescricao(FolhaPortaHDF folha) {
  if (folha.desenho == Desenho.nenhum) {
    return "${folha.espessuraFolha.espessura}X${folha.largura}X${folha.altura} MM;";
  } else {
    return "${folha.espessuraFolha.espessura}X${folha.largura}X${folha.altura} MM; DESENHO: ${folha.desenho.codigo};";
  }
}

String chaveDBLargura(FolhaPortaHDF folha, TabelaPreco tabelaPreco) {
  if (folha.largura == 600 || folha.largura == 700 || folha.largura == 800) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X600/700/800#";
  } else if (folha.largura <= 820) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X600/700/800#SOBMEDIDA#";
  } else if (folha.largura == 900) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X900#";
  } else if (folha.largura <= 920) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X900#SOBMEDIDA#";
  } else if (folha.largura == 1000) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1000#";
  } else if (folha.largura <= 1020) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1000#SOBMEDIDA#";
  } else if (folha.largura == 1100) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1100#";
  } else if (folha.largura <= 1120) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1100#SOBMEDIDA#";
  } else if (folha.largura == 1200) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1200#";
  } else if (folha.largura <= 1220) {
    return "${tabelaPreco.tabela}#HDF#${folha.espessuraFolha.espessura}X1200#SOBMEDIDA#";
  } else {
    throw "Faixa não encontrada";
  }
}

Future<int> valorDBLargura(String chave) async {
  var box = await Hive.openBox("PRECO", path: pathData);
  return box.get(chave);
}

/*String gerarPreco(FolhaPortaHDF folha, TabelaPreco tabela) {
  if (tabela == TabelaPreco.revenda) {
    if (folha.largura == 600 || folha.largura == 700 || folha.largura == 800) {
      return "REVENDA#${folha.espessuraFolha.espessura}X600/700/800";
    } else if (folha.largura <= 820) {
      return "REVENDA#${folha.espessuraFolha.espessura}X600/700/800*";
    } else if (folha.largura <= 900) {
      return "REVENDA#${folha.espessuraFolha.espessura}X900";
    }
  }
}*/

/*Future<int> gerarPreco(FolhaPortaHDF folha, TabelaPreco tabela) async {
  var box = await Hive.openBox("PRECO", path: pathData);
  int sobmedida = 60;
  int preco = 0;

  if (tabela == TabelaPreco.revenda) {
    if (folha.largura == 600 || folha.largura == 700 || folha.largura == 800) {
      preco +=
          box.get("REVENDA#HDF#${folha.espessuraFolha.espessura}X600/700/800#")
              as int;
    } else if (folha.largura <= 820) {
      preco += sobmedida +
              box.get(
                  "REVENDA#HDF#${folha.espessuraFolha.espessura}X600/700/800#")
          as int;
    } else {
      return 567;
    }
  } else {
    return 123;
  }
}*/

String rastrearProdutoTiny(FolhaPortaHDF folha) {
  if (folha.cor == CorHDF.branco && folha.desenho == Desenho.nenhum) {
    return "868957520";
  } else if (folha.cor == CorHDF.branco && folha.desenho != Desenho.nenhum) {
    return "868957602";
  } else if (folha.cor == CorHDF.mogno && folha.desenho == Desenho.nenhum) {
    return "868957907";
  } else if (folha.cor == CorHDF.mogno && folha.desenho != Desenho.nenhum) {
    return "868958081";
  } else if (folha.cor == CorHDF.imbuia && folha.desenho == Desenho.nenhum) {
    return "868958144";
  } else if (folha.cor == CorHDF.imbuia && folha.desenho != Desenho.nenhum) {
    return "868958375";
  } else {
    throw "ERRO AO ACHAR PRODUTO NO TINY";
  }
}

/*String gerarChaveDBProduto(FolhaPortaHDF folha) {
  if (folha.cor == CorHDF.branco && folha.desenhada == false) {
    return "BRANCO#LISA";
  }

  if (folha.desenhada == false) {
    return "LISA";
  } else {
    return "FRIZZATTA";
  }
}

Future<String> rastrearDBProduto(String chave) async {
  var box = await Hive.openBox("PRODUTO", path: pathData);
  return box.get(chave);
}*/
