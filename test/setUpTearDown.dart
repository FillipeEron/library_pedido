import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  group("PRECIFICAÇÃO: ", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.branco);

    setUp(() {
      porta.largura = 600;
      porta.cor = CorHDF.branco;
    });

    test("LARGURA 600", () {
      porta.cor = CorHDF.imbuia;
      expect(porta.largura, equals(600));
      expect(porta.cor, CorHDF.imbuia);
    });

    test("LARGURA 700", () {
      porta.largura = 700;
      expect(porta.largura, equals(700));
      expect(porta.cor, CorHDF.branco);
    });

    test("LARGURA 600", () {
      expect(porta.largura, equals(600));
    });
  });
}
