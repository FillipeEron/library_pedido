import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  //print(codigoTiny);

  group("PRECIFICAÇÃO: ", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.branco);

    test("LISA", () {
      expect(porta.precoDesenho(), 0);
    });

    test("DESENHADA SEM PINTURA", () {
      porta.desenho = Desenho.c01;
      expect(porta.precoDesenho(), 7.5);
    });

    test("DESENHADA COM PINTURA", () {
      porta.desenho = Desenho.c02;
      porta.pintura = true;
      expect(porta.precoDesenho(), 7.5);
      expect(porta.precoPintura(), 10);
    });

    test("SEM DESENHO COM PINTURA", () {
      porta.desenho = Desenho.nenhum;
      porta.pintura = true;
      expect(porta.precoDesenho(), 0);
      expect(porta.precoPintura(), 0);
    });
  });
}
