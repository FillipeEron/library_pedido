import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

void main() {
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
