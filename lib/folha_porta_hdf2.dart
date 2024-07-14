import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';

class FolhaPortaHDF {
  int largura;
  int altura;
  EspessuraFolha espessura;
  bool desenhada;

  FolhaPortaHDF({
    required this.largura,
    this.altura = 2100,
    this.espessura = EspessuraFolha.e30,
    this.desenhada = false,
  });

  bool isAlturaFaixaPadrao() {
    if (altura == 2100) {
      return true;
    } else {
      return false;
    }
  }

  bool isLarguraFaixaPadrao() {
    switch (largura) {
      case 600:
        return true;
        break;
      case 700:
        return true;
        break;
      case 800:
        return true;
        break;
      case 900:
        return true;
        break;
      default:
        return false;
    }
  }
}

class Vao {
  int larguraVao;
  int alturaVao;
  int espessuraVao;

  Vao({
    required this.larguraVao,
    required this.alturaVao,
    required this.espessuraVao,
  });
}

class KitPortaHDF {
  FolhaPortaHDF? folhaHDF;
  Caixilho? caixilho;
  Alizar? alizar;
  Vao? vao;

  KitPortaHDF({
    required this.vao,
    required EspessuraFolha espessuraFolha,
    required this.alizar,
  }) {
    int altura = converterParaAlturaFolha(vao!.alturaVao);
    int largura = converterParaLarguraFolha(vao!.larguraVao);
    int espessuraCaixilho = converterParaLarguraCaixilho(vao!.espessuraVao);
    folhaHDF = FolhaPortaHDF(
        largura: largura, altura: altura, espessura: espessuraFolha);
    caixilho = Caixilho(largura: espessuraCaixilho);
  }

  //KitPortaHDF.folha(this.folhaHDF);

  int converterParaAlturaFolha(int alturaVao) {
    if (alturaVao >= 2140 && alturaVao <= 2170) {
      return 2100;
    } else {
      return alturaVao - 40;
    }
  }

  int converterParaLarguraFolha(int larguraVao) {
    if (larguraVao <= 400) {
      throw "Largura do vão não pode ser menor que 400 mm";
    }

    int faixaLargura = extrairDezena(larguraVao);

    if (faixaLargura >= 60 && faixaLargura <= 80) {
      return larguraVao - faixaLargura;
    } else {
      return larguraVao - 70;
    }
  }

  int converterParaLarguraCaixilho(int espessuraVao) {
    int unidade = extrairUnidade(espessuraVao);
    if (unidade <= 5) {
      return (espessuraVao - extrairUnidade(espessuraVao)) - 10;
    } else {
      return espessuraVao - extrairUnidade(espessuraVao);
    }
  }
}

class Caixilho {
  int largura;
  TipoCaixilho tipoCaixilho;

  Caixilho({required this.largura, this.tipoCaixilho = TipoCaixilho.regulavel});
}

class Alizar {
  int espessura;
  int largura;
  TipoAlizar tipoAlizar;

  Alizar(
      {required this.espessura,
      required this.largura,
      this.tipoAlizar = TipoAlizar.regulavel});
}
