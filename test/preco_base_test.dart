import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/porta_hdf.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

void main() {
  group("PREÇO BASE", () {
    var porta = PortaHDF(largura: 800, cor: CorHDF.branco);
    setUp(() {
      porta.largura = 800;
      porta.espessuraFolha = EspessuraFolha.e30;
      porta.acustica = false;
    });
    test("30 MM", () {
      expect(porta.precoBaseRevenda(), 150);
      expect(porta.precoBaseFinal(), 220);
    });

    test("35 MM", () {
      porta.espessuraFolha = EspessuraFolha.e35;
      expect(porta.precoBaseRevenda(), 215);
      expect(porta.precoBaseFinal(), 285);
    });

    test("45 MM ACUSTICA", () {
      porta.espessuraFolha = EspessuraFolha.e45;
      porta.acustica = true;
      porta.largura = 800;
      expect(porta.precoBaseRevenda(), 365);
      expect(porta.precoBaseFinal(), 435);
    });

    test("35 MM ACUSTICA", () {
      porta.espessuraFolha = EspessuraFolha.e45;
      porta.acustica = false;
      porta.largura = 800;
      expect(porta.precoBaseRevenda(), 365);
      expect(porta.precoBaseFinal(), 435);
    }, skip: "implementar ainda");

    test("32 MM", () {
      porta.espessuraFolha = EspessuraFolha.e32;
      expect(() => porta.precoBaseRevenda(), throwsException);
    });
  });
  group("REVENDA 30 MM", () {
    var porta = PortaHDF(largura: 500, cor: CorHDF.branco);
    test("500 MM", () {
      expect(porta.precoBaseRevenda_30mm(), 150);
    });
    test("599 MM", () {
      porta.largura = 599;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });
    test("600 MM", () {
      porta.largura = 600;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });

    test("699 MM", () {
      porta.largura = 699;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });

    test("700 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });
    test("799 MM", () {
      porta.largura = 799;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });

    test("800 MM", () {
      porta.largura = 800;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });

    test("820 MM", () {
      porta.largura = 820;
      expect(porta.precoBaseRevenda_30mm(), 150);
    });

    test("900 MM", () {
      porta.largura = 900;
      expect(porta.precoBaseRevenda_30mm(), 170);
    });

    test("920 MM", () {
      porta.largura = 920;
      expect(porta.precoBaseRevenda_30mm(), 170);
    });

    test("1000 MM", () {
      porta.largura = 1000;
      expect(porta.precoBaseRevenda_30mm(), 200);
    });

    test("1020 MM", () {
      porta.largura = 1020;
      expect(porta.precoBaseRevenda_30mm(), 200);
    });

    test("1100 MM", () {
      porta.largura = 1100;
      expect(porta.precoBaseRevenda_30mm(), 230);
    });

    test("1120 MM", () {
      porta.largura = 1120;
      expect(porta.precoBaseRevenda_30mm(), 230);
    });

    test("1200 MM", () {
      porta.largura = 1200;
      expect(porta.precoBaseRevenda_30mm(), 260);
    });

    test("1220 MM", () {
      porta.largura = 1220;
      expect(porta.precoBaseRevenda_30mm(), 260);
    });

    test("1300 MM", () {
      porta.largura = 1300;
      expect(porta.precoBaseRevenda_30mm(), 280);
    });

    test("1320 MM", () {
      porta.largura = 1320;
      expect(porta.precoBaseRevenda_30mm(), 280);
    });

    test("1400 MM", () {
      porta.largura = 1400;
      expect(porta.precoBaseRevenda_30mm(), 300);
    });

    test("1420 MM", () {
      porta.largura = 1420;
      expect(porta.precoBaseRevenda_30mm(), 300);
    });
    test("1421 MM", () {
      porta.largura = 1421;
      expect(() => porta.precoBaseRevenda_30mm(), throwsException);
    });
  });

  group("REVENDA 35 MM", () {
    var porta = PortaHDF(largura: 500, cor: CorHDF.branco);
    test("500 MM", () {
      expect(porta.precoBaseRevenda_35mm(), 215);
    });
    test("599 MM", () {
      porta.largura = 599;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });
    test("600 MM", () {
      porta.largura = 600;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });

    test("699 MM", () {
      porta.largura = 699;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });

    test("700 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });
    test("799 MM", () {
      porta.largura = 799;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });

    test("800 MM", () {
      porta.largura = 800;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });

    test("820 MM", () {
      porta.largura = 820;
      expect(porta.precoBaseRevenda_35mm(), 215);
    });

    test("900 MM", () {
      porta.largura = 900;
      expect(porta.precoBaseRevenda_35mm(), 245);
    });

    test("920 MM", () {
      porta.largura = 920;
      expect(porta.precoBaseRevenda_35mm(), 245);
    });

    test("1000 MM", () {
      porta.largura = 1000;
      expect(porta.precoBaseRevenda_35mm(), 285);
    });

    test("1020 MM", () {
      porta.largura = 1020;
      expect(porta.precoBaseRevenda_35mm(), 285);
    });

    test("1100 MM", () {
      porta.largura = 1100;
      expect(porta.precoBaseRevenda_35mm(), 325);
    });

    test("1120 MM", () {
      porta.largura = 1120;
      expect(porta.precoBaseRevenda_35mm(), 325);
    });

    test("1200 MM", () {
      porta.largura = 1200;
      expect(porta.precoBaseRevenda_35mm(), 365);
    });

    test("1220 MM", () {
      porta.largura = 1220;
      expect(porta.precoBaseRevenda_35mm(), 365);
    });

    test("1300 MM", () {
      porta.largura = 1300;
      expect(porta.precoBaseRevenda_35mm(), 385);
    });

    test("1320 MM", () {
      porta.largura = 1320;
      expect(porta.precoBaseRevenda_35mm(), 385);
    });

    test("1400 MM", () {
      porta.largura = 1400;
      expect(porta.precoBaseRevenda_35mm(), 405);
    });

    test("1420 MM", () {
      porta.largura = 1420;
      expect(porta.precoBaseRevenda_35mm(), 405);
    });
    test("1421 MM", () {
      porta.largura = 1421;
      expect(() => porta.precoBaseRevenda_35mm(), throwsException);
    });
  });

  group("FINAL 30 MM", () {
    var porta = PortaHDF(largura: 500, cor: CorHDF.branco);
    test("500 MM", () {
      expect(porta.precoBaseFinal_30mm(), 220);
    });
    test("599 MM", () {
      porta.largura = 599;
      expect(porta.precoBaseFinal_30mm(), 220);
    });
    test("600 MM", () {
      porta.largura = 600;
      expect(porta.precoBaseFinal_30mm(), 220);
    });

    test("699 MM", () {
      porta.largura = 699;
      expect(porta.precoBaseFinal_30mm(), 220);
    });

    test("700 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseFinal_30mm(), 220);
    });
    test("799 MM", () {
      porta.largura = 799;
      expect(porta.precoBaseFinal_30mm(), 220);
    });

    test("800 MM", () {
      porta.largura = 800;
      expect(porta.precoBaseFinal_30mm(), 220);
    });

    test("820 MM", () {
      porta.largura = 820;
      expect(porta.precoBaseFinal_30mm(), 220);
    });

    test("900 MM", () {
      porta.largura = 900;
      expect(porta.precoBaseFinal_30mm(), 260);
    });

    test("920 MM", () {
      porta.largura = 920;
      expect(porta.precoBaseFinal_30mm(), 260);
    });

    test("1000 MM", () {
      porta.largura = 1000;
      expect(porta.precoBaseFinal_30mm(), 280);
    });

    test("1020 MM", () {
      porta.largura = 1020;
      expect(porta.precoBaseFinal_30mm(), 280);
    });

    test("1100 MM", () {
      porta.largura = 1100;
      expect(porta.precoBaseFinal_30mm(), 310);
    });

    test("1120 MM", () {
      porta.largura = 1120;
      expect(porta.precoBaseFinal_30mm(), 310);
    });

    test("1200 MM", () {
      porta.largura = 1200;
      expect(porta.precoBaseFinal_30mm(), 340);
    });

    test("1220 MM", () {
      porta.largura = 1220;
      expect(porta.precoBaseFinal_30mm(), 340);
    });

    test("1300 MM", () {
      porta.largura = 1300;
      expect(porta.precoBaseFinal_30mm(), 360);
    });

    test("1320 MM", () {
      porta.largura = 1320;
      expect(porta.precoBaseFinal_30mm(), 360);
    });

    test("1400 MM", () {
      porta.largura = 1400;
      expect(porta.precoBaseFinal_30mm(), 380);
    });

    test("1420 MM", () {
      porta.largura = 1420;
      expect(porta.precoBaseFinal_30mm(), 380);
    });
    test("1421 MM", () {
      porta.largura = 1421;
      expect(() => porta.precoBaseFinal_30mm(), throwsException);
    });
  });

  group("FINAL 35 MM", () {
    var porta = PortaHDF(largura: 500, cor: CorHDF.branco);
    test("500 MM", () {
      expect(porta.precoBaseFinal_35mm(), 285);
    });
    test("599 MM", () {
      porta.largura = 599;
      expect(porta.precoBaseFinal_35mm(), 285);
    });
    test("600 MM", () {
      porta.largura = 600;
      expect(porta.precoBaseFinal_35mm(), 285);
    });

    test("699 MM", () {
      porta.largura = 699;
      expect(porta.precoBaseFinal_35mm(), 285);
    });

    test("700 MM", () {
      porta.largura = 700;
      expect(porta.precoBaseFinal_35mm(), 285);
    });
    test("799 MM", () {
      porta.largura = 799;
      expect(porta.precoBaseFinal_35mm(), 285);
    });

    test("800 MM", () {
      porta.largura = 800;
      expect(porta.precoBaseFinal_35mm(), 285);
    });

    test("820 MM", () {
      porta.largura = 820;
      expect(porta.precoBaseFinal_35mm(), 285);
    });

    test("900 MM", () {
      porta.largura = 900;
      expect(porta.precoBaseFinal_35mm(), 385);
    });

    test("920 MM", () {
      porta.largura = 920;
      expect(porta.precoBaseFinal_35mm(), 385);
    });

    test("1000 MM", () {
      porta.largura = 1000;
      expect(porta.precoBaseFinal_35mm(), 485);
    });

    test("1020 MM", () {
      porta.largura = 1020;
      expect(porta.precoBaseFinal_35mm(), 485);
    });

    test("1100 MM", () {
      porta.largura = 1100;
      expect(porta.precoBaseFinal_35mm(), 585);
    });

    test("1120 MM", () {
      porta.largura = 1120;
      expect(porta.precoBaseFinal_35mm(), 585);
    });

    test("1200 MM", () {
      porta.largura = 1200;
      expect(porta.precoBaseFinal_35mm(), 685);
    });

    test("1220 MM", () {
      porta.largura = 1220;
      expect(porta.precoBaseFinal_35mm(), 685);
    });

    test("1300 MM", () {
      porta.largura = 1300;
      expect(porta.precoBaseFinal_35mm(), 705);
    });

    test("1320 MM", () {
      porta.largura = 1320;
      expect(porta.precoBaseFinal_35mm(), 705);
    });

    test("1400 MM", () {
      porta.largura = 1400;
      expect(porta.precoBaseFinal_35mm(), 725);
    });

    test("1420 MM", () {
      porta.largura = 1420;
      expect(porta.precoBaseFinal_35mm(), 725);
    });
    test("1421 MM", () {
      porta.largura = 1421;
      expect(() => porta.precoBaseFinal_35mm(), throwsException);
    });
  });
}
