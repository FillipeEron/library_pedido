enum TipoCaixilho {
  regulavel,
  fixo,
}

enum TipoAlizar {
  regulavel,
  fixo,
}

enum TabelaPreco {
  revenda,
  clinteFinal;

  String get tabela {
    switch (this) {
      case TabelaPreco.revenda:
        return "Revenda";
      case TabelaPreco.clinteFinal:
        return "Padrão";
    }
  }
}

enum EspessuraFolha {
  e30,
  e32,
  e35,
  e40,
  e45;

  String get espessura {
    switch (this) {
      case EspessuraFolha.e30:
        return "30";
      case EspessuraFolha.e32:
        return "32";
      case EspessuraFolha.e35:
        return "35";
      case EspessuraFolha.e40:
        return "40";
      case EspessuraFolha.e45:
        return "45";
    }
  }
}

enum CorHDF {
  branco,
  mogno,
  imbuia,
  curupixa;

  String get cor {
    switch (this) {
      case CorHDF.branco:
        return "BRANCO";
      case CorHDF.mogno:
        return "MOGNO";
      case CorHDF.imbuia:
        return "IMBUIA";
      case CorHDF.curupixa:
        return "CURUPIXA";
    }
  }
}

enum CorPostforming {
  branco,
  preto,
  cinzaMedio,
  carvalho;

  String get cor {
    switch (this) {
      case CorPostforming.branco:
        return "BRANCO";
      case CorPostforming.preto:
        return "PRETO";
      case CorPostforming.cinzaMedio:
        return "CINZA MEDIO";
      case CorPostforming.carvalho:
        return "CARVALHO";
    }
  }
}

enum Desenho {
  nenhum,
  c01,
  c02,
  c03,
  c04,
  c05,
  c06,
  c07,
  r01,
  r02,
  r03,
  r04,
  r05,
  r06,
  r07,
  r08,
  r09,
  r10,
  r11,
  r12,
  r13,
  r14,
  r15,
  r16,
  r17,
  r18;

  String get codigo {
    switch (this) {
      case Desenho.nenhum:
        return "NENHUM";
      case Desenho.c01:
        return "C01";
      case Desenho.c02:
        return "C02";
      case Desenho.c03:
        return "C03";
      case Desenho.c04:
        return "C04";
      case Desenho.c05:
        return "C05";
      case Desenho.c06:
        return "C06";
      case Desenho.c07:
        return "C07";
      case Desenho.r01:
        return "R01";
      case Desenho.r02:
        return "R02";
      case Desenho.r03:
        return "R03";
      case Desenho.r04:
        return "R04";
      case Desenho.r05:
        return "R05";
      case Desenho.r06:
        return "R06";
      case Desenho.r07:
        return "R07";
      case Desenho.r08:
        return "R08";
      case Desenho.r09:
        return "R09";
      case Desenho.r10:
        return "R10";
      case Desenho.r11:
        return "R11";
      case Desenho.r12:
        return "R12";
      case Desenho.r13:
        return "R13";
      case Desenho.r14:
        return "R14";
      case Desenho.r15:
        return "R15";
      case Desenho.r16:
        return "R16";
      case Desenho.r17:
        return "R17";
      case Desenho.r18:
        return "R18";
    }
  }
}

enum Vendedor {
  naldo,
  fillipe,
  cleberson,
  rissa;

  String get nome {
    switch (this) {
      case Vendedor.naldo:
        return "NALDO MATOS";
      case Vendedor.fillipe:
        return "FILLIPE  ERON FORTES MATOS";
      case Vendedor.cleberson:
        return "CLEBERSON";
      case Vendedor.rissa:
        return "RISSA TAMILE";
    }
  }
}

enum Furacao {
  nenhum,
  frontal,
  broca40,
  broca55;
}

enum Moldura {
  madeira,
  aluminio;
}

enum EspessuraVidro {
  e4,
  e6;
}
