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

    setUp(() {
      porta.largura = 600;
      porta.cor = CorHDF.branco;
      porta.desenho = Desenho.nenhum;
      porta.pintura = false;
      porta.perfilU = false;
      porta.furacao = Furacao.nenhum;
    });

    test("DIMENSÃO", () {
      expect(porta.descricaoDimensao().contains("30X600X2100 MM;"), isTrue);
    });

    test("SEM DESENHO", () {
      porta.desenho = Desenho.nenhum;
      expect(porta.descricaoDesenho().contains(""), isTrue);
    });

    test("DESENHADA SEM PINTURA", () {
      porta.desenho = Desenho.c02;
      porta.pintura = false;
      expect(porta.descricaoDesenho().contains("DESENHO:"), isTrue);
      expect(porta.descricaoDesenho().contains("PINTURA"), isFalse);
    });

    test("DESENHADA C/ PINTURA", () {
      porta.desenho = Desenho.c03;
      porta.pintura = true;
      expect(porta.descricaoDesenho().contains("DESENHO:"), isTrue);
      expect(porta.descricaoDesenho().contains("PINTURA"), isTrue);
    });

    test("SEM DESENHO C/ PINTURA", () {
      porta.desenho = Desenho.nenhum;
      porta.pintura = true;
      expect(porta.descricaoDesenho().contains(""), isTrue);
    });

    test("C/ PERFIL U", () {
      porta.perfilU = true;
      expect(
          porta.descricaoPerfilU().contains("PERFIL U DE ALUMINIO;"), isTrue);
    });

    test("SEM PERFIL U", () {
      porta.perfilU = false;
      expect(porta.descricaoPerfilU().contains(""), isTrue);
    });

    test("SEM FURAÇÃO", () {
      porta.furacao = Furacao.nenhum;
      expect(porta.descricaoFuracao(), "");
    });
    test("C/ FURAÇÃO FRONTAL", () {
      porta.furacao = Furacao.frontal;
      expect(porta.descricaoFuracao().contains("FURAÇÃO FRONTAL;"), isTrue);
    });

    test("C/ FURAÇÃO FRONTAL BROCA 40", () {
      porta.furacao = Furacao.broca40;
      expect(porta.descricaoFuracao().contains("FURAÇÃO BROCA 40;"), isTrue);
    });

    test("C/ FURAÇÃO FRONTAL BROCA 55", () {
      porta.furacao = Furacao.broca55;
      expect(porta.descricaoFuracao().contains("FURAÇÃO BROCA 55;"), isTrue);
    });
  });
}
