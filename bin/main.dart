import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart' as pt;
import 'package:auxiliar_pedidos/proposta.dart';

void main(List<String> arguments) {
  int largura = 700;
  int altura = 2100;
  TabelaPreco tabela = TabelaPreco.revenda;
  EspessuraFolha espessura = EspessuraFolha.e30;
  Desenho desenho = Desenho.nenhum;
  bool pintura = true;
  double preco = 0;

  switch (tabela) {
    case TabelaPreco.revenda:
      if (espessura == EspessuraFolha.e30) {
        preco += precoBaseRevenda_30mm(largura);
      } else if (espessura == EspessuraFolha.e35) {
        preco += precoBaseRevenda_35mm(largura);
      } else {
        throw "ESPESSURA ${espessura.espessura} MM NÃO SUPORTADA POR PORTA HDF";
      }
    case TabelaPreco.clinteFinal:
      if (espessura == EspessuraFolha.e30) {
        preco += precoBaseFinal_30mm(largura);
      } else if (espessura == EspessuraFolha.e35) {
        preco += precoBaseFinal_35mm(largura);
      }
  }

  preco += precoSobMedida(largura, altura);
  preco += precoDesenho(desenho);
  preco += precoPintura(pintura, desenho);
  print("30X${largura}X$altura mm: $preco");
}

double precoBaseFinal_35mm(int largura) {
  if (largura < 599) {
    return 250;
  } else if (largura >= 600 && largura < 699) {
    return 250;
  } else if (largura >= 700 && largura < 799) {
    return 250;
  } else if (largura >= 800 && largura <= 820) {
    return 250;
  } else if (largura > 820 && largura <= 920) {
    return 350;
  } else if (largura > 920 && largura <= 1020) {
    return 450;
  } else if (largura > 1020 && largura <= 1120) {
    return 550;
  } else if (largura > 1120 && largura <= 1220) {
    return 650;
  } else if (largura > 1220 && largura <= 1320) {
    return 670;
  } else if (largura > 1320 && largura <= 1420) {
    return 690;
  } else {
    throw "LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO";
  }
}

double precoBaseFinal_30mm(int largura) {
  if (largura < 599) {
    return 190;
  } else if (largura >= 600 && largura < 699) {
    return 190;
  } else if (largura >= 700 && largura < 799) {
    return 190;
  } else if (largura >= 800 && largura <= 820) {
    return 190;
  } else if (largura > 820 && largura <= 920) {
    return 220;
  } else if (largura > 920 && largura <= 1020) {
    return 250;
  } else if (largura > 1020 && largura <= 1120) {
    return 280;
  } else if (largura > 1120 && largura <= 1220) {
    return 310;
  } else if (largura > 1220 && largura <= 1320) {
    return 330;
  } else if (largura > 1320 && largura <= 1420) {
    return 350;
  } else {
    throw "LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO";
  }
}

double precoBaseRevenda_35mm(int largura) {
  if (largura < 599) {
    return 205;
  } else if (largura >= 600 && largura < 699) {
    return 205;
  } else if (largura >= 700 && largura < 799) {
    return 205;
  } else if (largura >= 800 && largura <= 820) {
    return 205;
  } else if (largura > 820 && largura <= 920) {
    return 235;
  } else if (largura > 920 && largura <= 1020) {
    return 275;
  } else if (largura > 1020 && largura <= 1120) {
    return 315;
  } else if (largura > 1120 && largura <= 1220) {
    return 355;
  } else if (largura > 1220 && largura <= 1320) {
    return 375;
  } else if (largura > 1320 && largura <= 1420) {
    return 395;
  } else {
    throw "LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO";
  }
}

double precoBaseRevenda_30mm(int largura) {
  if (largura < 599) {
    return 145;
  } else if (largura >= 600 && largura < 699) {
    return 145;
  } else if (largura >= 700 && largura < 799) {
    return 145;
  } else if (largura >= 800 && largura <= 820) {
    return 145;
  } else if (largura > 820 && largura <= 920) {
    return 165;
  } else if (largura > 920 && largura <= 1020) {
    return 195;
  } else if (largura > 1020 && largura <= 1120) {
    return 225;
  } else if (largura > 1120 && largura <= 1220) {
    return 255;
  } else if (largura > 1220 && largura <= 1320) {
    return 275;
  } else if (largura > 1320 && largura <= 1420) {
    return 295;
  } else {
    throw "LARGURA EXCESSIVAMENTE GRANDE, CONSULTAR PRODUÇÃO";
  }
}

double precoSobMedida(int largura, int altura) {
  if (precoSobMedidaAltura(altura) == 0) {
    return precoSobMedidaLargura(largura);
  } else {
    return precoSobMedidaAltura(altura);
  }
}

double precoSobMedidaLargura(int largura) {
  if (largura % 100 == 0 && largura >= 600) {
    return 0;
  } else {
    return 60;
  }
}

double precoSobMedidaAltura(int altura) {
  if (altura < 2100) {
    return 60;
  } else if (altura == 2100) {
    return 0;
  } else if (altura > 2100 && altura <= 2200) {
    return 60;
  } else if (altura > 2200 && altura <= 2300) {
    return 90;
  } else if (altura > 2300 && altura <= 2400) {
    return 120;
  } else if (altura > 2400 && altura <= 2500) {
    return 150;
  } else {
    throw Exception("ALTURA FORA DOS PADRÕES, CONSULTAR PRODUÇÃO");
  }
}

double precoDesenho(Desenho desenho) {
  if (desenho != Desenho.nenhum) {
    return 5.0;
  } else {
    return 0;
  }
}

double precoPintura(bool pintura, Desenho desenho) {
  if (pintura && desenho != Desenho.nenhum) {
    return 10;
  } else {
    return 0;
  }
}
