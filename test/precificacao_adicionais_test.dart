import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/test.dart';
import 'package:auxiliar_pedidos/tiny.dart';

// https://www.dhiwise.com/post/dart-test-a-complete-guide-to-unit-testing-in-dart
// https://medium.com/@stefanovskyi/unit-test-naming-conventions-dd9208eadbea

void main() async {
  group("PRECIFICAÇÃO: ", () {
    PortaHDF porta = PortaHDF(largura: 600, cor: CorHDF.branco);
    setUp(() {
      porta.largura = 600;
      porta.altura = 2100;
      porta.cor = CorHDF.branco;
      porta.desenho = Desenho.nenhum;
      porta.pintura = false;
      porta.perfilU = false;
      porta.espessuraFolha = EspessuraFolha.e30;
      porta.furacao = Furacao.nenhum;
      porta.acustica = false;
    });

    test("LISA", () {
      porta.desenho = Desenho.nenhum;
      expect(porta.precoDesenho(), 0);
    });

    test("DESENHADA SEM PINTURA", () {
      porta.desenho = Desenho.c01;
      porta.pintura = false;
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

    test("30 MM DE ESPESSSURA COM PERFIL U", () {
      porta.perfilU = true;
      porta.altura = 2100;
      porta.largura = 600;
      porta.espessuraFolha = EspessuraFolha.e30;
      expect(() => porta.precificarPerfilU(), throwsException);
    });

    test("35 MM DE ESPESSSURA COM PERFIL U", () {
      porta.perfilU = true;
      porta.altura = 2100;
      porta.largura = 600;
      porta.espessuraFolha = EspessuraFolha.e35;
      expect(porta.precificarPerfilU(), 110);
    });

    test("SEM FURAÇÃO", () {
      porta.furacao = Furacao.nenhum;
      expect(porta.precificarFuracao(), 0);
    });

    test("C/ FURAÇÃO FRONTAL", () {
      porta.furacao = Furacao.frontal;
      expect(porta.precificarFuracao(), 10);
    });

    test("C/ FURAÇÃO BRONCA 40", () {
      porta.furacao = Furacao.broca40;
      expect(porta.precificarFuracao(), 15);
    });
    test("C/ FURAÇÃO BRONCA 55", () {
      porta.furacao = Furacao.broca55;
      expect(porta.precificarFuracao(), 20);
    });

    test("SEM ACUSTICA", () {
      porta.acustica = false;
      expect(porta.precificarAcustica(), 0);
    });

    test("C/ ACUSTICA 800 MM LARGURA", () {
      porta.acustica = true;
      porta.espessuraFolha = EspessuraFolha.e45;
      porta.largura = 800;
      expect(porta.precificarAcustica(), 150);
    });

    test("C/ ACUSTICA 900 MM LARGURA", () {
      porta.acustica = true;
      porta.espessuraFolha = EspessuraFolha.e45;
      porta.largura = 900;
      expect(porta.precificarAcustica(), 250);
    });

    test("C/ ACUSTICA 900 MM LARGURA E 35 MM DE ESPESSURA", () {
      porta.acustica = true;
      porta.espessuraFolha = EspessuraFolha.e35;
      porta.largura = 900;
      expect(() => porta.precificarAcustica(), throwsException);
    });
  });
}
