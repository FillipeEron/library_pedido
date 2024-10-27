import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:auxiliar_pedidos/visor.dart';
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
      porta.mantaChumbo = false;
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

  group("MANTA DE CHUMBO", () {
    PortaHDF porta = PortaHDF(
        largura: 400,
        cor: CorHDF.branco,
        mantaChumbo: true,
        espessuraFolha: EspessuraFolha.e35);
    test("LARGURA 400", () {
      porta.largura = 400;
      expect(porta.precificarMantaChumbo(), 1953.60);
    });

    test("LARGURA 500", () {
      porta.largura = 500;
      expect(porta.precificarMantaChumbo(), 1953.60);
    });

    test("LARGURA 501", () {
      porta.largura = 501;
      expect(porta.precificarMantaChumbo(), 2344.32);
    });
    test("LARGURA 600", () {
      porta.largura = 600;
      expect(porta.precificarMantaChumbo(), 2344.32);
    });

    test("LARGURA 601", () {
      porta.largura = 601;
      expect(porta.precificarMantaChumbo(), 2604.8);
    });

    test("LARGURA 700", () {
      porta.largura = 700;
      expect(porta.precificarMantaChumbo(), 2604.8);
    });

    test("LARGURA 701", () {
      porta.largura = 701;
      expect(porta.precificarMantaChumbo(), 2995.52);
    });

    test("LARGURA 800", () {
      porta.largura = 800;
      expect(porta.precificarMantaChumbo(), 2995.52);
    });

    test("LARGURA 801", () {
      porta.largura = 801;
      expect(porta.precificarMantaChumbo(), 3256.00);
    });

    test("LARGURA 900", () {
      porta.largura = 900;
      expect(porta.precificarMantaChumbo(), 3256.00);
    });

    test("LARGURA 901", () {
      porta.largura = 901;
      expect(porta.precificarMantaChumbo(), 3776.96);
    });

    test("LARGURA 1000", () {
      porta.largura = 1000;
      expect(porta.precificarMantaChumbo(), 3776.96);
    });

    test("LARGURA 1001", () {
      porta.largura = 1001;
      expect(porta.precificarMantaChumbo(), 3776.96);
    });

    test("LARGURA 1100", () {
      porta.largura = 1100;
      expect(porta.precificarMantaChumbo(), 3776.96);
    });

    test("LARGURA 1101", () {
      porta.largura = 1101;
      expect(porta.precificarMantaChumbo(), 4297.92);
    });

    test("LARGURA 1200", () {
      porta.largura = 1200;
      expect(porta.precificarMantaChumbo(), 4297.92);
    });

    test("LARGURA 1201", () {
      porta.largura = 1201;
      expect(porta.precificarMantaChumbo(), 4818.88);
    });

    test("LARGURA 1300", () {
      porta.largura = 1300;
      expect(porta.precificarMantaChumbo(), 4818.88);
    });

    test("LARGURA 1301", () {
      porta.largura = 1301;
      expect(() => porta.precificarMantaChumbo(), throwsException);
    });

    test("30 MM LARGURA 600", () {
      porta.largura = 600;
      porta.espessuraFolha = EspessuraFolha.e30;
      expect(() => porta.precificarMantaChumbo(), throwsException);
    });
  });

  group("VISOR", () {
    var visor = Visor(
        moldura: Moldura.madeira,
        espessura: EspessuraVidro.e4,
        largura: 550,
        altura: 650);

    setUp(() {
      visor.moldura = Moldura.madeira;
      visor.espessura = EspessuraVidro.e4;
      visor.largura = 550;
      visor.altura = 650;
    });
    test("MOLDURA MADEIRA", () {
      visor.moldura = Moldura.madeira;
      expect(visor.precificarMoldura(), 85);
    });

    test("MOLDURA ALUMINIO", () {
      visor.moldura = Moldura.aluminio;
      expect(visor.precificarMoldura(), 135);
    });

    test("VIDRO 4X550X650 MM", () {
      visor.espessura = EspessuraVidro.e4;
      expect(visor.precificarVidro(), 115);
    });

    test("VIDRO 6X550X650 MM", () {
      visor.espessura = EspessuraVidro.e6;
      expect(visor.precificarVidro(), 190);
    });
  });
}
