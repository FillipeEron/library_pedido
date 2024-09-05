import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  var propostaExcel = PropostaExcel();
  propostaExcel.id = "123";
  propostaExcel.numeroProposta = "4";
  propostaExcel.data = "31/08/2028";
  propostaExcel.dataProximoContato = "01/09/2028";
  propostaExcel.idContato = "233";
  propostaExcel.nomeContato = "2R ENGENHARIA E COMERCIO IMOBILIARIO LTDA";
  propostaExcel.aosCuidados = "Fillipe Eron";

  propostaExcel.save();
}

class PropostaExcel {
  static const String file = "../docs/propostas.xlsx";
  static const String pathOutputFile =
      "/home/eron/Documentos/library_pedido/docs/";

  var cellPosition = {
    "id": "A2",
    "numeroProposta": "B2",
    "data": "C2",
    "dataProximoContato": "D2",
    "idContato": "E2",
    "nomeContato": "F2",
    "aosCuidados": "G2",
    "listaDePreco": "H2",
    "TipoPessoa": "I2",
    "CPF/CNPJ": "J2",
    "RG/IE": "K2",
    "CEP": "L2",
  };

  String? id;
  String? numeroProposta;
  String? data;
  String? dataProximoContato;
  String? idContato;
  String? nomeContato;
  String? aosCuidados;
  String? tipoPessoa;
  String? cpf_cnpj;
  String? rg_ie;
  String? cep;

  void save() {
    String timeKey = this.timeKey();
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Sheet sheetObject = excel["Propostas Comerciais"];

    var cellID = sheetObject.cell(CellIndex.indexByString(cellPosition["id"]!));
    var cellNumeroProposta = sheetObject
        .cell(CellIndex.indexByString(cellPosition["numeroProposta"]!));
    var cellDate =
        sheetObject.cell(CellIndex.indexByString(cellPosition["data"]!));
    var cellDataProximoContato = sheetObject
        .cell(CellIndex.indexByString(cellPosition["dataProximoContato"]!));
    var cellIdContato =
        sheetObject.cell(CellIndex.indexByString(cellPosition["idContato"]!));
    var cellNomeContato =
        sheetObject.cell(CellIndex.indexByString(cellPosition["nomeContato"]!));
    var cellAosCuidados =
        sheetObject.cell(CellIndex.indexByString(cellPosition["aosCuidados"]!));

    cellID.value = TextCellValue(id ?? "");
    cellNumeroProposta.value = TextCellValue(numeroProposta ?? "");
    cellDate.value = TextCellValue(data ?? "");
    cellDataProximoContato.value = TextCellValue(dataProximoContato ?? "");
    cellIdContato.value = TextCellValue(idContato ?? "");
    cellNomeContato.value = TextCellValue(nomeContato ?? "");
    cellAosCuidados.value = TextCellValue(aosCuidados ?? "");

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
  static const String positionID = "A2";
  static const String positionNumeroProposta = "B2";
  static const String positionDate = "C2";

  String? id;
  String? numeroProposta;
  String? date;

  void save() {
    String timeKey = this.timeKey();
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Sheet sheetObject = excel["Propostas Comerciais"];
    
    var cellID = sheetObject.cell(CellIndex.indexByString(positionID));
    var cellNumeroProposta =
        sheetObject.cell(CellIndex.indexByString(positionNumeroProposta));
    var cellDate = sheetObject.cell(CellIndex.indexByString(positionDate));

    cellID.value = TextCellValue(id ?? "");
    cellNumeroProposta.value = TextCellValue(numeroProposta ?? "");
    cellDate.value = TextCellValue(date ?? "");

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
