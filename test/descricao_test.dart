import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  var brancaDesenhada =
      PortaHDF(largura: 600, cor: CorHDF.branco, desenho: Desenho.c01);
  String idBrancaDesenhada = brancaDesenhada.codigoTiny();

  //print(codigoTiny);

  group("DESCRIÇÃO: ", () {
    test("LISA", () {
      var portaLisa = PortaHDF(largura: 600, cor: CorHDF.branco);
      String descricaoLisa = portaLisa.descricao();
      expect(descricaoLisa.contains("DESENHO"), isFalse);
    });

    test("DESENHADA", () {
      var portaDesenhada =
          PortaHDF(largura: 600, cor: CorHDF.branco, desenho: Desenho.c01);
      String descricaoDesenhada = portaDesenhada.descricao();
      expect(descricaoDesenhada.contains("DESENHO:"), isTrue);
    });
  });
}
