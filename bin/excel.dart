import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  var propostaExcel = PropostaExcel();
  propostaExcel.id = "123";
  propostaExcel.numeroProposta = "4";
  propostaExcel.date = "31/08/2028";

  propostaExcel.save();
  /*var now = DateTime.now();
  String date = now.toString().substring(0, 10);
  String time = now.toString().substring(11, 19).replaceAll(':', '-');
  String timeKey = "$date" + "_" + "$time";
  print(timeKey);*/
  /*
  String file = '../docs/propostas.xlsx';
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);
  Sheet sheetObject = excel["Propostas Comerciais"];
  var cell = sheetObject.cell(CellIndex.indexByString("A1"));
  print(cell.value);
  String outputFile =
      "/home/eron/Documentos/library_pedido/docs/propostas_2.xlsx";

  List<int>? fileBytes = excel.save();
  if (fileBytes != null) {
    File(outputFile)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);
  }*/
}

class PropostaExcel {
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
}
