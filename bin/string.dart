void main() {
  print(" ".codeUnits);

  /*String valorTiny = "190,99";
  String valorFinal = aplicarPorcentagem(valorTiny, 18.5);
  print(valorFinal);*/
  //print(valorFinal.runtimeType);
  /*double valorNumerico =
      double.parse(valorTiny.replaceAll('.', '').replaceAll(',', '.'));
  print(valorNumerico * 10.8);
  double value = (valorNumerico * 10.8).roundToDouble();
  String returnValue = value.toString().replaceAll('.', ',');
  print(returnValue);*/
}

String aplicarPorcentagem(String preco, double porcentagem) {
  double formatoDouble =
      double.parse(preco.replaceAll('.', '').replaceAll(',', '.'));
  formatoDouble =
      formatoDouble + (formatoDouble * (porcentagem / 100)).roundToDouble();
  int formatoInt = (formatoDouble + 0.99).round();

  return "$formatoInt,00";
}
