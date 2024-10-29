import 'package:auxiliar_pedidos/enums.dart';

class PortaPostorming {
  List<String> descricoes = [];
  double largura;
  double altura;
  EspessuraFolha espessuraFolha;
  CorPostforming cor;
  String identificacao;

  PortaPostorming({
    required this.largura,
    this.altura = 2100,
    this.espessuraFolha = EspessuraFolha.e35,
    required this.cor,
    this.identificacao = "",
  });

  //double precificar(TabelaPreco tabela) {}

  String descricao() {
    this.descricoes.add(descricaoDimensao());
    this.descricoes.add(descricaoCor());
    this.descricoes.add(descricaoIdentificacao());
    return this.descricoes.join();
  }

  String descricaoDimensao() {
    return "${this.espessuraFolha.espessura}X${this.largura.toInt()}X${this.altura.toInt()} MM; ";
  }

  String descricaoIdentificacao() {
    if (this.identificacao == "") {
      return this.identificacao;
    } else {
      return "${this.identificacao}; ";
    }
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
}
