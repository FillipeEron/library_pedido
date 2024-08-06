void main() {
  String valorTiny = "1,50";
  String valorFinal = aplicarPorcentagem(valorTiny, 15.8);
  print(valorFinal);
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
  int formatoInt = formatoDouble.round();

  return "$formatoInt,00";
}
