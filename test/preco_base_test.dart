import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

void main() {
  group("PREÇO BASE", () {
    var porta = PortaHDF(largura: 500, cor: CorHDF.branco);
    test("REVENDA 30X500 MM", () {
      expect(porta.precoBaseRevenda_30mm(), 145);
    });
    test("REVENDA 30X599 MM", () {
      porta.largura = 599;
      expect(porta.precoBaseRevenda_30mm(), 145);
    });
    test("REVENDA 30X600 MM", () {
      porta.largura = 600;
      expect(porta.precoBaseRevenda_30mm(), 145);
    });

    test("REVENDA 30X699 MM", () {
      porta.largura = 699;
      expect(porta.precoBaseRevenda_30mm(), 145);
    });

    test("REVENDA 30X700 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseRevenda_30mm(), 145);
    });
    test("REVENDA 30X799 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseRevenda_30mm(), 145);
    });
  });
}
