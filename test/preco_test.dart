import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

void main() {
  group("SOB MEDIDA LARGURA", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.branco);

    test("600 MM", () {
      expect(porta.precoSobMedidaLargura(), 0);
    });

    test("500 MM", () {
      porta.largura = 500;
      expect(porta.precoSobMedidaLargura(), 60);
    });

    test("934 MM", () {
      porta.largura = 934;
      expect(porta.precoSobMedidaLargura(), 60);
    });
  });

  group("SOB MEDIDA ALTURA", () {
    var porta = PortaHDF(largura: 600, cor: CorHDF.branco);
    test("2100 MM", () {
      expect(porta.precoSobMedidaAltura(), 0);
    });

    test("2090 MM", () {
      porta.altura = 2090;
      expect(porta.precoSobMedidaAltura(), 60);
    });
    test("2200 MM", () {
      porta.altura = 2200;
      expect(porta.precoSobMedidaAltura(), 60);
    });

    test("2300 MM", () {
      porta.altura = 2300;
      expect(porta.precoSobMedidaAltura(), 90);
    });
    test("2400 MM", () {
      porta.altura = 2400;
      expect(porta.precoSobMedidaAltura(), 120);
    });
    test("2500 MM", () {
      porta.altura = 2500;
      expect(porta.precoSobMedidaAltura(), 150);
    });

    test("2501 MM", () {
      porta.altura = 2501;
      expect(porta.precoSobMedidaAltura(), isUnsupportedError);
    });
    /*test('expect: throwsA', () {
      final result = (int value) => (value as dynamic).length;
      expect(() => result(0), isException);
    });*/
  });
}
