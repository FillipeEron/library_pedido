import 'dart:ffi';

import 'package:auxiliar_pedidos/enums.dart';
import 'package:auxiliar_pedidos/folha_porta_hdf.dart';
import 'package:auxiliar_pedidos/utils.dart' as util;
import 'package:auxiliar_pedidos/tiny.dart' as tiny;
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _token = '3bafd53e2da95f4bd72afb6874d0e563f90b54bf';
const String _formato = 'json';
void main(List<String> arguments) async {
  var folha01 =
      FolhaPortaHDF(largura: 700, cor: CorHDF.mogno, desenho: Desenho.r03);

  var produto = await tiny.fetchProduto(rastrearProdutoTiny(folha01));
  produto.descricaoComplementar = gerarDescricao(folha01);

  var chave = chaveDBLargura(folha01, TabelaPreco.revenda);
  produto.preco = await valorDBLargura(chave);
  print(produto.preco);
}


/*class PrecoKitPortaHDF {
  KitPortaHDF kit;
  TabelaPreco tabelaPreco;

  PrecoKitPortaHDF({required this.kit, required this.tabelaPreco});

  double folha() {
    if (tabelaPreco == TabelaPreco.revenda) {
      if (kit.folhaHDF!.espessura == EspessuraFolha.e30) {
        int dezena = util.extrairDezena(kit.folhaHDF!.largura);
        int centena = kit.folhaHDF!.largura - dezena;
        if (dezena == 0) {
          switch (centena) {
            case 600 || 700 || 800:
              return 145;
            case 900:
              return 165;
            case 1000:
              return 195;
            case 1100:
              return 225;
            case 1200:
              return 255;
            case 1300:
              return 275;
            default:
              throw "Porta com faixa de largura impraticavel";
          }
        } else {
          bool precisaChapaMaior = isPrecisaChapaMaior(kit.folhaHDF!.largura);
        }
      }
    }
    return 123.00;
  }
}

bool isPrecisaChapaMaior(int larguraFolha) {
  int dezena = util.extrairDezena(larguraFolha);
  if (dezena <= 20) {
    return false;
  } else {
    return true;
  }
}*/
