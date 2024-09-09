import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  var propostaExcel = PropostaExcel();

  propostaExcel.addProduto(
      idProduto: "868957907",
      descricao: "FOLHA DE PORTA HDF MOGNO LISA",
      quantidade: "2",
      valorUnitario: "150,0");

  propostaExcel.addProduto(
      idProduto: "786375476",
      descricao: "ESPUMA EXPANSIVA 460G",
      quantidade: "2",
      valorUnitario: "35,00",
      descricaoComplementar: "Porta conta da casa");

  propostaExcel.camposGerais(
      numeroProposta: "999",
      data: "13/08/2024",
      idContato: "233",
      nomeContato: "2R ENGENHARIA E COMERCIO IMOBILIARIO LTDA",
      aosCuidados: "Fillipe Eron",
      listaPreco: "Padrão",
      desconto: "35,00",
      frete: "100,00",
      observacoes: "Coisas de teste",
      validade: "5",
      prazoEntrega: "29/10/2024",
      situacao: "rascunho",
      vendedor: "Cleberson");

  propostaExcel.save();
}

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



/*class PropostaExcel {
  static const String file = "../docs/propostas.xlsx";
  static const String pathOutputFile =
      "/home/eron/Documentos/library_pedido/docs/";

  var cellPosition = {
    "id": "A2",
    "numeroProposta": "B2",
    "data": "C2",
    "idContato": "E2",
    "nomeContato": "F2",
    "aosCuidados": "G2",
    "listaDePreco": "H2",
    "TipoPessoa": "I2",
    "listaPreco": "H2",
    "desconto": "V2",
    "frete": "W2",
    "observacoes": "X2",
    "validade": "Y2",
    "prazoEntrega": "Z2",
    "situacao": "AA2",
    "idProduto": "AC2",
    "descricao": "AD2",
    "quantidade": "AE2",
    "valorUnitario": "AF2",
    "descricaoComplementar": "AG2",
    "vendedor": "AH2",
  };

  String? id,
      numeroProposta,
      data,
      idContato,
      nomeContato,
      aosCuidados,
      listaPreco,
      desconto,
      frete,
      observacoes,
      validade,
      prazoEntrega,
      situacao,
      idProduto,
      descricao,
      quantidade,
      valorUnitario,
      descricaoComplementar,
      vendedor;

  void save() {
    String timeKey = this.timeKey();
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Sheet sheetObject = excel["Propostas Comerciais"];

    var cellID = sheetObject.cell(CellIndex.indexByString(cellPosition["id"]!));
    var cellNumeroProposta = sheetObject
        .cell(CellIndex.indexByString(cellPosition["numeroProposta"]!));
    var cellData =
        sheetObject.cell(CellIndex.indexByString(cellPosition["data"]!));
    var cellIdContato =
        sheetObject.cell(CellIndex.indexByString(cellPosition["idContato"]!));
    var cellNomeContato =
        sheetObject.cell(CellIndex.indexByString(cellPosition["nomeContato"]!));
    var cellAosCuidados =
        sheetObject.cell(CellIndex.indexByString(cellPosition["aosCuidados"]!));
    var cellListaPreco =
        sheetObject.cell(CellIndex.indexByString(cellPosition["listaPreco"]!));
    var cellDesconto =
        sheetObject.cell(CellIndex.indexByString(cellPosition["desconto"]!));
    var cellFrete =
        sheetObject.cell(CellIndex.indexByString(cellPosition["frete"]!));
    var cellObservacoes =
        sheetObject.cell(CellIndex.indexByString(cellPosition["observacoes"]!));
    var cellValidade =
        sheetObject.cell(CellIndex.indexByString(cellPosition["validade"]!));
    var cellPrazoEntrega = sheetObject
        .cell(CellIndex.indexByString(cellPosition["prazoEntrega"]!));
    var cellSituacao =
        sheetObject.cell(CellIndex.indexByString(cellPosition["situacao"]!));
    var cellIdProduto =
        sheetObject.cell(CellIndex.indexByString(cellPosition["idProduto"]!));
    var cellDescricao =
        sheetObject.cell(CellIndex.indexByString(cellPosition["descricao"]!));
    var cellQuantidade =
        sheetObject.cell(CellIndex.indexByString(cellPosition["quantidade"]!));
    var cellValorUnitario = sheetObject
        .cell(CellIndex.indexByString(cellPosition["valorUnitario"]!));
    var cellDescricaoComplementar = sheetObject
        .cell(CellIndex.indexByString(cellPosition["descricaoComplementar"]!));
    var cellVendedor =
        sheetObject.cell(CellIndex.indexByString(cellPosition["vendedor"]!));

    cellID.value = TextCellValue(id ?? "");
    cellNumeroProposta.value = TextCellValue(numeroProposta ?? "");
    cellData.value = TextCellValue(data ?? "");
    cellIdContato.value = TextCellValue(idContato ?? "");
    cellNomeContato.value = TextCellValue(nomeContato ?? "");
    cellAosCuidados.value = TextCellValue(aosCuidados ?? "");
    cellListaPreco.value = TextCellValue(listaPreco ?? "");
    cellDesconto.value = TextCellValue(desconto ?? "");
    cellFrete.value = TextCellValue(frete ?? "");
    cellObservacoes.value = TextCellValue(observacoes ?? "");
    cellValidade.value = TextCellValue(validade ?? "");
    cellPrazoEntrega.value = TextCellValue(prazoEntrega ?? "");
    cellSituacao.value = TextCellValue(situacao ?? "");
    cellIdProduto.value = TextCellValue(idProduto ?? "");
    cellDescricao.value = TextCellValue(descricao ?? "");
    cellQuantidade.value = TextCellValue(quantidade ?? "");
    cellValorUnitario.value = TextCellValue(valorUnitario ?? "");
    cellDescricaoComplementar.value =
        TextCellValue(descricaoComplementar ?? "");
    cellVendedor.value = TextCellValue(vendedor ?? "");

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
}*/
