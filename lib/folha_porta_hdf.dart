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
  bool pintura;

  FolhaPortaHDF({
    required this.largura,
    this.altura = 2100,
    this.espessuraFolha = EspessuraFolha.e30,
    required this.cor,
    this.desenho = Desenho.nenhum,
    this.pintura = false,
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

Future<int> precificar(FolhaPortaHDF folha, TabelaPreco tabelaPreco) async {
  int preco = 0;
  preco += await precificarLargura(folha, tabelaPreco);
  preco += precificarAltura(folha);
  preco += precificarPintura(folha.pintura);
  preco += precificarDesenho(folha.desenho);

  return preco;
}

int precificarDesenho(Desenho desenho) {
  if (desenho == Desenho.nenhum) {
    return 0;
  } else {
    return 5;
  }
}

int precificarPintura(bool pintura) {
  if (pintura) {
    return 5;
  } else {
    return 0;
  }
}

Future<int> precificarLargura(
    FolhaPortaHDF folha, TabelaPreco tabelaPreco) async {
  try {
    String chaveDB = chaveDBLargura(folha, tabelaPreco);
    return await valorDBLargura(chaveDB);
  } catch (e) {
    throw ("ERRO DE BUSCA CHAVE <-> VALOR : $e");
  }
}

int precificarAltura(FolhaPortaHDF folha) {
  if (folha.altura < 2100 && !isLarguraFaixaPadrao(folha.largura)) {
    return 0;
  } else if (folha.altura < 2100 && isLarguraFaixaPadrao(folha.largura)) {
    return 60;
  } else if (folha.altura == 2100) {
    return 0;
  } else if (folha.altura > 2100 && folha.altura < 2200) {
    return 60;
  } else if (folha.altura >= 2200 && folha.altura < 2300) {
    return 90;
  } else if (folha.altura >= 2300 && folha.altura < 2400) {
    return 120;
  } else if (folha.altura >= 2400 && folha.altura < 2500) {
    return 150;
  } else {
    throw "ALTURA FOLHA ${folha.altura} NÃO PERTENCE A FAIXA DE ALTURA DE ANALISE";
  }
}

bool isLarguraFaixaPadrao(int largura) {
  if (largura == 600 ||
      largura == 700 ||
      largura == 800 ||
      largura == 900 ||
      largura == 1000 ||
      largura == 1100 ||
      largura == 1200) {
    return true;
  } else {
    return false;
  }
}

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

class Proposta {
  List<FolhaPortaHDF> folhas = [];

  void adicionarProduto(FolhaPortaHDF folha) {
    folhas.add(folha);
  }
}
