import 'package:auxiliar_pedidos/enums.dart';

class PortaPostorming {
  List<String> descricoes = [];
  double largura;
  double altura;
  EspessuraFolha espessuraFolha;
  CorPostforming cor;
  String identificacao;
  bool acustica;

  PortaPostorming({
    required this.largura,
    this.altura = 2100,
    this.espessuraFolha = EspessuraFolha.e35,
    required this.cor,
    this.acustica = false,
    this.identificacao = "",
  });

  // PRECIFICAÇÃO

  double precificar(TabelaPreco tabela) {
    double preco = 0;

    switch (tabela) {
      case TabelaPreco.revenda:
        preco += precoBaseRevenda();
      case TabelaPreco.clinteFinal:
        preco += precoBaseFinal();
    }

    return preco;
  }

  double precoBaseRevenda() {
    double preco = 0;
    if (espessuraFolha == EspessuraFolha.e30) {
      preco += precoBaseRevenda_35mm();
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

  // preço não segue lógica de chapa hdf
  double precoBaseRevenda_35mm() {
    if (this.largura < 600) {
      return 380;
    } else if (this.largura >= 600 && this.largura < 700) {
      return 380;
    } else if (this.largura >= 700 && this.largura < 800) {
      return 380;
    } else if (this.largura >= 800 && this.largura <= 820) {
      return 380;
    } else if (this.largura > 820 && this.largura <= 920) {
      return 480;
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

  // DESCRIÇÃO

  String descricao() {
    this.descricoes.add(descricaoDimensao());
    this.descricoes.add(descricaoCor());
    this.descricoes.add(descricaoIdentificacao());
    return this.descricoes.join();
  }

  String descricaoDimensao() {
    return "${this.espessuraFolha.espessura}X${this.largura.toInt()}X${this.altura.toInt()} MM; ";
  }

  String descricaoCor() {
    switch (this.cor) {
      case CorPostforming.branco:
        return "COR: BRANCO; ";
      case CorPostforming.preto:
        return "COR: PRETO; ";
      case CorPostforming.cinzaMedio:
        return "COR: CINZA MEDIO; ";
      case CorPostforming.carvalho:
        return "COR: CARVALHO; ";
    }
  }

  String descricaoIdentificacao() {
    if (this.identificacao == "") {
      return this.identificacao;
    } else {
      return "${this.identificacao}; ";
    }
  }
}
