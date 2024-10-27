import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  group("CODIGO: ", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.mogno);

    setUp(() {
      porta.cor = CorHDF.mogno;
      porta.desenho = Desenho.nenhum;
    });

    //868957520 => FOLHA DE PORTA HDF BRANCA LISA
    test("FOLHA DE PORTA HDF BRANCA LISA", () {
      porta.cor = CorHDF.branco;
      porta.desenho = Desenho.nenhum;

      expect(porta.codigoTiny(), "868957520");
    });
    // 868957602 => FOLHA DE PORTA HDF BRANCA FRIZZATTA
    test("FOLHA DE PORTA HDF BRANCA FRIZZATTA", () {
      porta.cor = CorHDF.branco;
      porta.desenho = Desenho.c04;

      expect(porta.codigoTiny(), "868957602");
    });
    // 868957907 => FOLHA DE PORTA HDF MOGNO LISA
    test("FOLHA DE PORTA HDF MOGNO LISA", () {
      porta.cor = CorHDF.mogno;
      porta.desenho = Desenho.nenhum;

      expect(porta.codigoTiny(), "868957907");
    });

    // 868958081 => FOLHA DE PORTA HDF MOGNO FRIZZATTA
    test("FOLHA DE PORTA HDF MOGNO FRIZZATTA", () {
      porta.cor = CorHDF.mogno;
      porta.desenho = Desenho.r01;

      expect(porta.codigoTiny(), "868958081");
    });

    // 868958144 => FOLHA DE PORTA HDF IMBUIA LISA
    test("FOLHA DE PORTA HDF IMBUIA LISA", () {
      porta.cor = CorHDF.imbuia;
      porta.desenho = Desenho.nenhum;

      expect(porta.codigoTiny(), "868958144");
    });

    // 868958375 => FOLHA DE PORTA HDF IMBUIA FRIZZATTA

    test("FOLHA DE PORTA HDF IMBUIA FRIZZATTA", () {
      porta.cor = CorHDF.imbuia;
      porta.desenho = Desenho.r16;
      expect(porta.codigoTiny(), "868958375");
    });

    // "884482253" => FOLHA DE PORTA HDF CURUPIXA LISA
    test("FOLHA DE PORTA HDF CURUPIXA LISA", () {
      porta.cor = CorHDF.curupixa;
      porta.desenho = Desenho.nenhum;
      expect(porta.codigoTiny(), "884482253");
    });

    // "884483553" => FOLHA DE PORTA HDF CURUPIXA FRIZZATTA
    test("FOLHA DE PORTA HDF CURUPIXA FRIZZATTA", () {
      porta.cor = CorHDF.curupixa;
      porta.desenho = Desenho.r05;
      expect(porta.codigoTiny(), "884483553");
    });
  });
}
