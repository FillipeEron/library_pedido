import 'dart:math';
import 'dart:io';

import 'package:puppeteer/puppeteer.dart';

void main(List<String> arg) async {
  if (arg.length != 2) {
    throw "NECESSÁRIO TRÊS ARGUMENTOS";
  }

  bool buttonLogin = false;

  String codigo = arg[0];
  String porcentagem = arg[1];

  var browser = await puppeteer.launch(
      headless: false,
      waitForInitialPage: true,
      slowMo: Duration(milliseconds: 60));

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
  await page.type('input[id="idContatoPesquisa"]', codigo);
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
  String? response = stdin.readLineSync();
  print(response);

  if (response == "s" || response == "S") {
    print("CONTIANDO O PROGRAMA");
    await page.click(".btn-edicao-item");
    var elements = await page.$$(".coluna-destaque");
    var length = elements.length / 2;
    print(length.toInt());
    var firstLineValue = await page.$eval(
        "#detailItem0 > td:nth-child(8) > p", "value => value.innerText");
    print(double.parse(firstLineValue));
    await page
        .click("#colunaFim0 > button.btn.btn-link.btn-editar.hide-from-view");
  } else if (response == "n" || response == "N") {
    print("FIM DO PROGRAMA");
    browser.close();
  } else {
    print("RESPONSA NÃO COMPUTADA... FIM DO PROGRAMA");
    browser.close();
  }

  // https://www.geeksforgeeks.org/dart-standard-input-output/
}
