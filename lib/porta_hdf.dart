import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';
import 'package:hive/hive.dart';
import 'package:auxiliar_pedidos/tiny.dart' as tiny;
import 'package:auxiliar_pedidos/visor.dart';

const String pathData = "../data/data_preco/data";

class PortaHDF {
  List<String> descricoes = [];
  double largura;
  double altura;
  EspessuraFolha espessuraFolha;
  CorHDF cor;
  Desenho desenho;
  bool pintura;
  bool perfilU;
  bool acustica;
  Furacao furacao;
  bool mantaChumbo;
  Visor? visor;
  String identificacao;

  PortaHDF(
      {required this.largura,
      this.altura = 2100,
      this.espessuraFolha = EspessuraFolha.e30,
      required this.cor,
      this.desenho = Desenho.nenhum,
      this.furacao = Furacao.nenhum,
      this.pintura = false,
      this.perfilU = false,
      this.acustica = false,
      this.mantaChumbo = false,
      this.visor,
      this.identificacao = ""});

  String descricao() {
    descricoes.add(descricaoDimensao());
    descricoes.add(descricaoDesenho());
    descricoes.add(descricaoFuracao());
    descricoes.add(descricaoPerfilU());
    descricoes.add(descricaoAcustica());
    descricoes.add(descricaoMantaChumbo());
    descricoes.add(descricaoVisor());
    descricoes.add(descricaoIdentificacao());
    return this.descricoes.join();
  }

  String descricaoIdentificacao() {
    if (this.identificacao == "") {
      return this.identificacao;
    } else {
      return "${this.identificacao}; ";
    }
  }

  String descricaoVisor() {
    if (this.visor != null) {
      return this.visor!.descricao();
    } else {
      return "";
    }
  }

  String descricaoFuracao() {
    switch (this.furacao) {
      case Furacao.nenhum:
        return "";
      case Furacao.frontal:
        return "FURAÇÃO FRONTAL; ";
      case Furacao.broca40:
        return "FURAÇÃO BROCA 40; ";
      case Furacao.broca55:
        return "FURAÇÃO BROCA 55;";
    }
  }

  String descricaoDimensao() {
    return "${this.espessuraFolha.espessura}X${this.largura.toInt()}X${this.altura.toInt()} MM; ";
  }

  String descricaoMantaChumbo() {
    if (this.mantaChumbo) {
      return "MANTA DE CHUMBO 1 MM ESPESSURA; ";
    } else {
      return "";
    }
  }

  String descricaoDesenho() {
    if (this.desenho == Desenho.nenhum) {
      return "";
    } else {
      if (this.pintura) {
        return "DESENHO: ${this.desenho.codigo} C/ PINTURA; ";
      } else {
        return "DESENHO: ${this.desenho.codigo}; ";
      }
    }
  }

  String descricaoPerfilU() {
    if (this.perfilU) {
      return "PERFIL U DE ALUMINIO; ";
    } else {
      return "";
    }
  }

  String descricaoAcustica() {
    if (this.acustica) {
      return "ESTRUTURA ACUSTICA C/ LÂ DE ROCHA; ";
    } else {
      return "";
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
    } else if (this.cor == CorHDF.curupixa && this.desenho == Desenho.nenhum) {
      return "884482253";
    } else if (this.cor == CorHDF.curupixa && this.desenho != Desenho.nenhum) {
      return "884483553";
    } else {
      throw "ERRO AO IDENTIFICAR CODIGO DO PRODUTO";
    }
  }

  double precificarVisor() {
    double preco = 0;
    if (this.visor != null) {
      preco += this.visor!.precificarVidro();
      preco += this.visor!.precificarMoldura();
    }
    return preco;
  }

  double precificarMantaChumbo() {
    double preco = 0;
    if (mantaChumbo) {
      if (espessuraPortaMantaChumbo(this.espessuraFolha)) {
        if (this.largura <= 500) {
          preco += 1056.00 + (1056.00 * (85 / 100));
        } else if (this.largura > 500 && this.largura <= 600) {
          preco += 1267.20 + (1267.20 * (85 / 100));
        } else if (this.largura > 600 && this.largura <= 700) {
          preco += 1408.00 + (1408.00 * (85 / 100));
        } else if (this.largura > 700 && this.largura <= 800) {
          preco += 1619.20 + (1619.20 * (85 / 100));
        } else if (this.largura > 800 && this.largura <= 900) {
          preco += 1760.00 + (1760.00 * (85 / 100));
        } else if (this.largura > 900 && this.largura <= 1000) {
          preco += 2041.60 + (2041.60 * (85 / 100));
        } else if (this.largura > 1000 && this.largura <= 1100) {
          preco += 2041.60 + (2041.60 * (85 / 100));
        } else if (this.largura > 1100 && this.largura <= 1200) {
          preco += 2323.20 + (2323.20 * (85 / 100));
        } else if (this.largura > 1200 && this.largura <= 1300) {
          preco += 2604.80 + (2604.80 * (85 / 100));
        } else {
          throw Exception(
              "LARGURA DA PORTA EXCEDEU 13OO MM PARA A CAPACIDADE DA MANTA DE CHUMBO");
        }
      } else {
        throw Exception(
            "ESPESSURA DE FOLHA ${this.espessuraFolha.espessura} NÃO PERMITIDO PARA PORTA COM MANTA DE CHUMBO, APENAS ACIMA DE 35 MM");
      }
    }

    return preco;
  }

  double precificarAcustica() {
    if (acustica == false) {
      return 0;
    } else {
      if (this.espessuraFolha == EspessuraFolha.e45) {
        if (this.largura <= 820) {
          return 150;
        } else {
          return 250;
        }
      } else {
        throw Exception("ESPESSURA DA FOLHA PRECISA SER DE 45 MM");
      }
    }
  }

  double precificarPerfilU() {
    double valorMetroLinear = 20;
    if (this.perfilU) {
      if (this.espessuraFolha == EspessuraFolha.e35) {
        double resultado = ((converterMetro(this.largura) * 2) +
                (converterMetro(this.altura) * 2)) *
            valorMetroLinear;
        return arrendondamento_5(resultado);
      } else {
        throw Exception("PERFIL U É OBRIGATIRIO ESPESSURA DA FOLHA SER 35 MM");
      }
    } else {
      return 0;
    }
  }

  // VERIFICAR OBRIGATORIEDADE DA FURAÇÃO BROCA 40 E 55
  double precificarFuracao() {
    switch (this.furacao) {
      case Furacao.nenhum:
        return 0;
      case Furacao.frontal:
        return 10;
      case Furacao.broca40:
        return 15;
      case Furacao.broca55:
        return 20;
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
      return preco;
    } else if ((espessuraFolha == EspessuraFolha.e35) ||
        (espessuraFolha == EspessuraFolha.e45 && acustica)) {
      preco += precoBaseRevenda_35mm();
      return preco;
    } else {
      throw Exception(
          "ESPESSURA DA FOLHA DE ${this.espessuraFolha.espessura} MM NÃO CONDIZ COM A TABELA DE PREÇO.");
    }
  }

  double precoBaseFinal() {
    double preco = 0;
    if (espessuraFolha == EspessuraFolha.e30) {
      preco += precoBaseFinal_30mm();
      return preco;
    } else if ((espessuraFolha == EspessuraFolha.e35) ||
        (espessuraFolha == EspessuraFolha.e45 && acustica)) {
      preco += precoBaseFinal_35mm();
      return preco;
    } else {
      throw Exception(
          "ESPESSURA DA FOLHA DE ${this.espessuraFolha} MM NÃO CONDIZ COM A TABELA DE PREÇO.");
    }
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
    preco += precificarPerfilU();
    preco += precificarFuracao();
    preco += precificarAcustica();
    preco += precificarMantaChumbo();
    preco += precificarVisor();
    return preco;
  }
}
