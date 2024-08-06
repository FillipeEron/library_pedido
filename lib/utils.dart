import 'package:auxiliar_pedidos/enums.dart';

int extrairUnidade(int valor) {
  String valorToString = valor.toString();
  return int.parse(valorToString[valorToString.length - 1]);
}

int extrairDezena(int valor) {
  String valorToString = valor.toString();
  if (valorToString.length >= 2) {
    return int.parse(valorToString.substring(valorToString.length - 2));
  } else {
    throw "VALOR SÓ TEM 1 DIGITO";
  }
}
