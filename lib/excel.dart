import 'package:excel/excel.dart';
import 'dart:io';

class PropostaExcel {
  static const String file = "../docs/propostas.xlsx";
  static const String pathOutputFile =
      "/home/eron/Documentos/library_pedido/docs/";
  static const int firstLine = 1;
  var campoGerais = Map<String, String>();
  var listaProduto = List.empty(growable: true);
  var cellPosition = {
    "id": 0,
    "numeroProposta": 1,
    "data": 2,
    "idContato": 4,
    "nomeContato": 5,
    "aosCuidados": 6,
    "listaPreco": 7,
    "desconto": 21,
    "frete": 22,
    "observacoes": 23,
    "validade": 24,
    "prazoEntrega": 25,
    "situacao": 26,
    "idProduto": 28,
    "descricao": 29,
    "quantidade": 30,
    "valorUnitario": 31,
    "descricaoComplementar": 32,
    "vendedor": 33,
  };

  void camposGerais({
    String? id,
    String? numeroProposta,
    String? data,
    String? idContato,
    String? nomeContato,
    String? aosCuidados,
    String? listaPreco,
    String? desconto,
    String? frete,
    String? observacoes,
    String? validade,
    String? prazoEntrega,
    String? situacao,
    String? vendedor,
  }) {
    campoGerais["id"] = id ?? "";
    campoGerais["numeroProposta"] = numeroProposta ?? "";
    campoGerais["data"] = data ?? "";
    campoGerais["idContato"] = idContato ?? "";
    campoGerais["nomeContato"] = nomeContato ?? "";
    campoGerais["aosCuidados"] = aosCuidados ?? "";
    campoGerais["listaPreco"] = listaPreco ?? "";
    campoGerais["desconto"] = desconto ?? "";
    campoGerais["frete"] = frete ?? "";
    campoGerais["observacoes"] = observacoes ?? "";
    campoGerais["validade"] = validade ?? "";
    campoGerais["prazoEntrega"] = prazoEntrega ?? "";
    campoGerais["situacao"] = situacao ?? "";
    campoGerais["vendedor"] = vendedor ?? "";
  }

  void addProduto({
    required String idProduto,
    required String descricao,
    required String quantidade,
    required String valorUnitario,
    String? descricaoComplementar,
  }) {
    var produto = Map();
    produto["idProduto"] = idProduto;
    produto["descricao"] = descricao;
    produto["quantidade"] = quantidade;
    produto["valorUnitario"] = valorUnitario;
    produto["descricaoComplementar"] = descricaoComplementar ?? "";
    listaProduto.add(produto);
  }

  void addObservacao(String observacao) {
    campoGerais["observacoes"] = observacao;
  }

  void save() {
    String timeKey = this.timeKey();
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Sheet sheetObject = excel["Propostas Comerciais"];

    for (int countLine = 0; countLine < listaProduto.length; countLine++) {
      campoGerais.forEach((key, value) {
        var cell = sheetObject.cell(CellIndex.indexByColumnRow(
            columnIndex: cellPosition[key]!, rowIndex: firstLine + countLine));
        cell.value = TextCellValue(value);
      });

      Map lista = listaProduto[countLine];
      lista.forEach(((key, value) {
        var cell = sheetObject.cell(CellIndex.indexByColumnRow(
            columnIndex: cellPosition[key]!, rowIndex: firstLine + countLine));
        cell.value = TextCellValue(value);
      }));
    }

    List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      File("$pathOutputFile/proposta_$timeKey.xlsx")
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }
  }

  String timeKey() {
    var now = DateTime.now();
    String date = now.toString().substring(0, 10);
    String time = now.toString().substring(11, 19).replaceAll(':', '-');
    return "$date" + "_" + "$time";
  }
}
