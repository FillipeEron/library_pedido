import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  //print(codigoTiny);

  group("DESCRIÇÃO: ", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.branco);

    test("LISA", () {
      expect(porta.descricao().contains("DESENHO"), isFalse);
    });

    test("DESENHADA SEM PINTURA", () {
      porta.desenho = Desenho.c01;
      porta.pintura = false;
      expect(porta.descricao().contains("DESENHO:"), isTrue);
      expect(porta.descricao().contains("PINTURA"), isFalse);
    });

    test("DESENHADA C/ PINTURA", () {
      porta.desenho = Desenho.c02;
      porta.pintura = true;
      expect(porta.descricao().contains("DESENHO:"), isTrue);
      expect(porta.descricao().contains("PINTURA"), isTrue);
    });

    test("LISA C/ PINTURA", () {
      porta.desenho = Desenho.nenhum;
      porta.pintura = true;
      expect(porta.descricao().contains("DESENHO:"), isFalse);
      expect(porta.descricao().contains("PINTURA"), isFalse);
    });
  });
}
