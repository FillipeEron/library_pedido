import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:io';

import 'package:puppeteer/plugin.dart';
import 'package:puppeteer/puppeteer.dart';

// CLIENTE EXEMPLO - PROPOSTA NUMERO 4;
// dart imposto.dart 4 18.5
void main(List<String> arg) async {
  if (arg.length != 2) {
    throw "NECESSÁRIO TRÊS ARGUMENTOS";
  }

  bool buttonLogin = false;

  String codigo = arg[0];
  double porcentagem = double.parse(arg[1]);

  var browser = await puppeteer.launch(
      headless: true,
      waitForInitialPage: true,
      slowMo: Duration(milliseconds: 40),
      defaultViewport: LaunchOptions.viewportNotOverride);

  var page = await browser.newPage();

  await page.goto(
      "https://accounts.tiny.com.br/realms/tiny/protocol/openid-connect/auth?client_id=tiny-webapp&redirect_uri=https://erp.tiny.com.br/login&scope=openid&response_type=code",
      wait: Until.domContentLoaded);

  await page.type('input[name="username"]', 'feron@fpmatos');
  await page.type('input[name="password"]', 'amazoneron4#');
  await page.click(".sc-ispOId");

  await page
      .waitForSelector(".btn-primary",
          timeout: Duration(seconds: 10), visible: true)
      .then((_) {
    print("Botão foi encontrado");
    buttonLogin = true;
  }).catchError((e) => print('Error que gerou: $e'));

  if (buttonLogin) {
    await page.click(".btn-primary");
    await page.waitForNavigation(
        timeout: Duration(seconds: 15), wait: Until.load);
    await page.goto("https://erp.tiny.com.br/orcamentos#list",
        wait: Until.load);
  } else {
    await page.goto("https://erp.tiny.com.br/orcamentos#list",
        wait: Until.load);
  }

  await page.waitForSelector("#idContatoPesquisa");
  await page.type('input[id="idContatoPesquisa"]', codigo,
      delay: Duration(seconds: 2));
  await page.keyboard.press(Key.enter);

  await page.waitForSelector('tr[id^="tr_"]');
  await page.click('tr[id^="tr_"]');

  await page.waitForSelector(
      "#slot_para > div:nth-child(2) > div.col-md-7.form-group > div.input-group.viewing-input-group > p");
  var value = await page.$eval(
      "#slot_para > div:nth-child(2) > div.col-md-7.form-group > div.input-group.viewing-input-group > p",
      "span => span.innerText");
  print(
      "Deseja modificar o preço da proposta PC$codigo do cliente: $value ? [S]/[N]");
  String? response = stdin.readLineSync(retainNewlines: false);

  if (response == 'S' || response == 's' || response == '\n') {
    print("CONTINUANDO O PROGRAMA");
    await page.click(".btn-edicao-item");
    var elements = await page.$$(".coluna-destaque");
    var length = elements.length / 2;
    //print(length.toInt());
    if (length != 0) {
      for (int i = 0; i < length; i++) {
        //print(aplicarPorcentagem(firstLineValue, porcentagem));

        await page.click(
            "#colunaFim$i > button.btn.btn-link.btn-editar.hide-from-view",
            delay: Duration(milliseconds: 500));
        var statusEdicao = await page.$eval(
            "#colunaFim$i > button.btn.btn-link.btn-editar.hide-from-view",
            "span => span.innerText");
        /*while (statusEdicao == "editar") {
          await page.click(
              clickCount: 2,
              "#colunaFim$i > button.btn.btn-link.btn-editar.hide-from-view");
          statusEdicao = await page.$eval(
              "#colunaFim$i > button.btn.btn-link.btn-editar.hide-from-view",
              "span => span.innerText");
        }*/

        print("linha $i - $statusEdicao");
      }
    } else {
      print("PROPOSTA NÃO POSSUI ITENS CADASTRADOS.");
      browser.close();
    }

    /*var firstLineValue = await page.$eval(
        "#detailItem0 > td:nth-child(8) > p", "value => value.innerText");
    print(aplicarPorcentagem(firstLineValue, porcentagem));
    String novoPreco = aplicarPorcentagem(firstLineValue, porcentagem);
    await page
        .click("#colunaFim0 > button.btn.btn-link.btn-editar.hide-from-view");
    var inputPreco = await page.$("#precounitario0");
    await inputPreco.click(clickCount: 3);
    await page.type('input[id="precounitario0"]', novoPreco);
    await page
        .click("#colunaFim0 > button.btn.btn-link.btn-editar.hide-from-view");*/
  } else if (response == 'N' || response == 'n') {
    print("FIM DO PROGRAMA");
    browser.close();
  } else {
    print("RESPONSA NÃO COMPUTADA... FIM DO PROGRAMA");
    browser.close();
  }
  // https://www.geeksforgeeks.org/dart-standard-input-output/
}

String aplicarPorcentagem(String preco, double porcentagem) {
  double formatoDouble =
      double.parse(preco.replaceAll('.', '').replaceAll(',', '.'));
  formatoDouble =
      formatoDouble + (formatoDouble * (porcentagem / 100)).roundToDouble();
  int formatoInt = (formatoDouble + 0.99).round();

  return "$formatoInt,00";
}
