import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  var propostaExcel = PropostaExcel();
  propostaExcel.id = "123";
  propostaExcel.numeroProposta = "4";
  propostaExcel.data = "31/08/2028";
  propostaExcel.idContato = "233";
  propostaExcel.nomeContato = "2R ENGENHARIA E COMERCIO IMOBILIARIO LTDA";
  propostaExcel.aosCuidados = "Fillipe Eron";
  propostaExcel.listaPreco = "Padrão";
  propostaExcel.desconto = "35,90";
  propostaExcel.frete = "40,00";
  propostaExcel.observacoes = "> SEM NOTA FISCAL";
  propostaExcel.validade = "4";
  propostaExcel.prazoEntrega = "15 A 2O DIAS UTEIS";
  propostaExcel.situacao = "Rascunho";
  propostaExcel.idProduto = "868957907";
  propostaExcel.descricao = "FOLHA DE PORTA HDF MOGNO LISA";
  propostaExcel.quantidade = "2";
  propostaExcel.valorUnitario = "200";
  propostaExcel.descricaoComplementar = "30X800X2100 MM";
  propostaExcel.vendedor = "CLEBERSON";

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
}
