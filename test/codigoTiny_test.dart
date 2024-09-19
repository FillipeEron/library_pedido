import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  group("CODIGO: ", () {
    //868957520 => FOLHA DE PORTA HDF BRANCA LISA
    test("FOLHA DE PORTA HDF BRANCA LISA", () {
      var brancaLisa =
          PortaHDF(largura: 600, cor: CorHDF.branco, desenho: Desenho.nenhum);
      String idBrancaLisa = brancaLisa.codigoTiny();

      expect(idBrancaLisa.contains("868957520"), isTrue);
    });
    // 868957602 => FOLHA DE PORTA HDF BRANCA FRIZZATTA
    test("FOLHA DE PORTA HDF BRANCA FRIZZATTA", () {
      var brancaDesenhada =
          PortaHDF(largura: 600, cor: CorHDF.branco, desenho: Desenho.c01);
      String idBrancaDesenhada = brancaDesenhada.codigoTiny();

      expect(idBrancaDesenhada.contains("868957602"), isTrue);
    });
    // 868957907 => FOLHA DE PORTA HDF MOGNO LISA
    test("FOLHA DE PORTA HDF MOGNO LISA", () {
      var mognoLisa = PortaHDF(largura: 600, cor: CorHDF.mogno);
      String idMognoLisa = mognoLisa.codigoTiny();

      expect(idMognoLisa.contains("868957907"), isTrue);
    });

    // 868958081 => FOLHA DE PORTA HDF MOGNO FRIZZATTA
    test("FOLHA DE PORTA HDF MOGNO FRIZZATTA", () {
      var mognoDesenha =
          PortaHDF(largura: 600, cor: CorHDF.mogno, desenho: Desenho.r08);
      String idMognoDesenhada = mognoDesenha.codigoTiny();

      expect(idMognoDesenhada.contains("868958081"), isTrue);
    });

    // 868958144 => FOLHA DE PORTA HDF IMBUIA LISA
    test("FOLHA DE PORTA HDF IMBUIA LISA", () {
      var imbuiaLisa = PortaHDF(largura: 600, cor: CorHDF.imbuia);
      String idImbuiaLisa = imbuiaLisa.codigoTiny();

      expect(idImbuiaLisa.contains("868958144"), isTrue);
    });

    // 868958375 => FOLHA DE PORTA HDF IMBUIA FRIZZATTA

    test("FOLHA DE PORTA HDF IMBUIA FRIZZATTA", () {
      var imbuiaDesenha =
          PortaHDF(largura: 600, cor: CorHDF.imbuia, desenho: Desenho.c06);
      String idImbuiaDesenhada = imbuiaDesenha.codigoTiny();

      expect(idImbuiaDesenhada.contains("868958375"), isTrue);
    });
  });
}
