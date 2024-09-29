import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';
import 'package:hive/hive.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;

const String pathData = "../data/data_preco/data";

class PortaHDF {
  int largura;
  int altura;
  EspessuraFolha espessuraFolha;
  CorHDF cor;
  Desenho desenho;
  bool pintura;

  PortaHDF({
    required this.largura,
    this.altura = 2100,
    this.espessuraFolha = EspessuraFolha.e30,
    required this.cor,
    this.desenho = Desenho.nenhum,
    this.pintura = false,
  });

  String descricao() {
    if (this.desenho == Desenho.nenhum) {
      return "${this.espessuraFolha.espessura}X${this.largura}X${this.altura} MM;";
    } else {
      if (this.pintura) {
        return "${this.espessuraFolha.espessura}X${this.largura}X${this.altura} MM; DESENHO: ${this.desenho.codigo} C/ PINTURA;";
      } else {
        return "${this.espessuraFolha.espessura}X${this.largura}X${this.altura} MM; DESENHO: ${this.desenho.codigo}";
      }
    }
  }

  String codigoTiny() {
    if (this.cor == CorHDF.branco && this.desenho == Desenho.nenhum) {
      return "868957520";
    } else if (this.cor == CorHDF.branco && this.desenho != Desenho.nenhum) {
      return "868957602";
    } else if (this.cor == CorHDF.mogno && this.desenho == Desenho.nenhum) {
      return "868957907";
    } else if (this.cor == CorHDF.mogno && this.desenho != Desenho.nenhum) {
      return "868958081";
    } else if (this.cor == CorHDF.imbuia && this.desenho == Desenho.nenhum) {
      return "868958144";
    } else if (this.cor == CorHDF.imbuia && this.desenho != Desenho.nenhum) {
      return "868958375";
    } else {
      throw "ERRO AO IDENTIFICAR CODIGO DO PRODUTO";
    }
  }

  double precoSobMedidaLargura() {
    if (this.largura % 100 == 0 && this.largura >= 600) {
      return 0;
    } else {
      return 60;
    }
  }

  double precoSobMedidaAltura() {
    if (this.altura < 2100) {
      return 60;
    } else if (this.altura == 2100) {
      return 0;
    } else if (this.altura > 2100 && this.altura <= 2200) {
      return 60;
    } else if (this.altura > 2200 && this.altura <= 2300) {
      return 90;
    } else if (this.altura > 2300 && this.altura <= 2400) {
      return 120;
    } else if (this.altura > 2400 && this.altura <= 2500) {
      return 150;
    } else {
      throw Exception("ALTURA FORA DOS PADRÕES, CONSULTAR PRODUÇÃO");
    }
  }

  double precoSobMedida() {
    if (precoSobMedidaAltura() == 0) {
      return precoSobMedidaLargura();
    } else {
      return precoSobMedidaAltura();
    }
  }

  double precoBaseRevenda_30mm() {
    if (this.largura < 600) {
      return 150;
    } else if (this.largura >= 600 && this.largura < 700) {
      return 150;
    } else if (this.largura >= 700 && this.largura < 800) {
      return 150;
    } else if (this.largura >= 800 && this.largura <= 820) {
      return 150;
    } else if (this.largura > 820 && this.largura <= 920) {
      return 170;
    } else if (this.largura > 920 && this.largura <= 1020) {
      return 200;
    } else if (this.largura > 1020 && this.largura <= 1120) {
      return 230;
    } else if (this.largura > 1120 && this.largura <= 1220) {
      return 260;
    } else if (this.largura > 1220 && this.largura <= 1320) {
      return 280;
    } else if (this.largura > 1320 && this.largura <= 1420) {
      return 300;
    } else {
      throw Exception("LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO");
    }
  }

  double precoBaseRevenda_35mm() {
    if (this.largura < 600) {
      return 215;
    } else if (this.largura >= 600 && this.largura < 700) {
      return 215;
    } else if (this.largura >= 700 && this.largura < 800) {
      return 215;
    } else if (this.largura >= 800 && this.largura <= 820) {
      return 215;
    } else if (this.largura > 820 && this.largura <= 920) {
      return 245;
    } else if (this.largura > 920 && this.largura <= 1020) {
      return 285;
    } else if (this.largura > 1020 && this.largura <= 1120) {
      return 325;
    } else if (this.largura > 1120 && this.largura <= 1220) {
      return 365;
    } else if (this.largura > 1220 && this.largura <= 1320) {
      return 385;
    } else if (this.largura > 1320 && this.largura <= 1420) {
      return 405;
    } else {
      throw Exception("LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO");
    }
  }

  double precoBaseFinal_30mm() {
    if (this.largura < 600) {
      return 220;
    } else if (this.largura >= 600 && this.largura < 700) {
      return 220;
    } else if (this.largura >= 700 && this.largura < 800) {
      return 220;
    } else if (this.largura >= 800 && this.largura <= 820) {
      return 220;
    } else if (this.largura > 820 && this.largura <= 920) {
      return 260;
    } else if (this.largura > 920 && this.largura <= 1020) {
      return 280;
    } else if (this.largura > 1020 && this.largura <= 1120) {
      return 310;
    } else if (this.largura > 1120 && this.largura <= 1220) {
      return 340;
    } else if (this.largura > 1220 && this.largura <= 1320) {
      return 360;
    } else if (this.largura > 1320 && this.largura <= 1420) {
      return 380;
    } else {
      throw Exception("LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO");
    }
  }

  double precoBaseFinal_35mm() {
    if (this.largura < 600) {
      return 285;
    } else if (this.largura >= 600 && this.largura < 700) {
      return 285;
    } else if (this.largura >= 700 && this.largura < 800) {
      return 285;
    } else if (this.largura >= 800 && this.largura <= 820) {
      return 285;
    } else if (this.largura > 820 && this.largura <= 920) {
      return 385;
    } else if (this.largura > 920 && this.largura <= 1020) {
      return 485;
    } else if (this.largura > 1020 && this.largura <= 1120) {
      return 585;
    } else if (this.largura > 1120 && this.largura <= 1220) {
      return 685;
    } else if (this.largura > 1220 && this.largura <= 1320) {
      return 705;
    } else if (this.largura > 1320 && this.largura <= 1420) {
      return 725;
    } else {
      throw Exception("LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO");
    }
  }

  double precoDesenho() {
    if (this.desenho != Desenho.nenhum) {
      return 7.5;
    } else {
      return 0;
    }
  }

  double precoPintura() {
    if (this.pintura && this.desenho != Desenho.nenhum) {
      return 10;
    } else {
      return 0;
    }
  }

  double precoBaseRevenda() {
    double preco = 0;
    if (espessuraFolha == EspessuraFolha.e30) {
      preco += precoBaseRevenda_30mm();
    } else if (espessuraFolha == EspessuraFolha.e35) {
      preco += precoBaseRevenda_35mm();
    } else {
      throw Exception(
          "ESPESSURA DA FOLHA DE ${this.espessuraFolha} MM NÃO CONDIZ COM A TABELA DE PREÇO.");
    }
    return preco;
  }

  double precoBaseFinal() {
    double preco = 0;
    if (espessuraFolha == EspessuraFolha.e30) {
      preco += precoBaseFinal_30mm();
    } else if (espessuraFolha == EspessuraFolha.e35) {
      preco += precoBaseFinal_35mm();
    } else {
      throw Exception(
          "ESPESSURA DA FOLHA DE ${this.espessuraFolha} MM NÃO CONDIZ COM A TABELA DE PREÇO.");
    }
    return preco;
  }

  double precificar(TabelaPreco tabela) {
    double preco = 0;
    switch (tabela) {
      case TabelaPreco.revenda:
        preco += precoBaseRevenda();
      case TabelaPreco.clinteFinal:
        preco += precoBaseFinal();
    }
    preco += precoSobMedida();
    preco += precoDesenho();
    preco += precoPintura();
    return preco;
  }
}
