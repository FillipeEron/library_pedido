import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/utils.dart';

class Visor {
  Moldura moldura;
  EspessuraVidro espessura;
  double largura;
  double altura;

  Visor(
      {required this.moldura,
      required this.espessura,
      required this.largura,
      required this.altura});

  String descricao() {
    return this.descricaoMoldura() +
        this.descricaoVidro() +
        "${this.largura.toInt()}X${this.altura.toInt()} MM; ";
  }

  double precificar() {
    double preco = 0;
    preco += this.precificarMoldura();
    preco += this.precificarVidro();
    return arrendondamento_5(preco);
  }

  String descricaoMoldura() {
    switch (this.moldura) {
      case Moldura.madeira:
        return "VISOR MOLDURA MADEIRA ";
      case Moldura.aluminio:
        return "VISOR MOLDURA ALUMINIO ";
    }
  }

  String descricaoVidro() {
    switch (this.espessura) {
      case EspessuraVidro.e4:
        return "4X";
      case EspessuraVidro.e6:
        return "6X";
    }
  }

  double precificarVidro() {
    double adicionalLargura = 50;
    double largura = converterMetro(this.largura + adicionalLargura);
    double altura = converterMetro(this.altura + adicionalLargura);
    largura = (arrendondamento_5(largura * 100) / 100) % 5;
    altura = (arrendondamento_5(altura * 100) / 100) % 5;
    switch (this.espessura) {
      case EspessuraVidro.e4:
        return arrendondamento_5(largura * altura * 270);
      case EspessuraVidro.e6:
        return arrendondamento_5(largura * altura * 450);
    }
  }

  double precificarMoldura() {
    double largura = converterMetro(this.largura);
    double altura = converterMetro(this.altura);

    switch (this.moldura) {
      case Moldura.madeira:
        return arrendondamento_5(((largura * 2) + (altura * 2)) * 35);
      case Moldura.aluminio:
        return arrendondamento_5(((largura * 2) + (altura * 2)) * 55);
    }
  }
}
