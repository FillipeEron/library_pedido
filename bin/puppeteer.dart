import 'package:puppeteer/puppeteer.dart';

void main() async {
  var browser = await puppeteer.launch(
      headless: false,
      waitForInitialPage: true,
      slowMo: Duration(milliseconds: 60));

  var myPage = await browser.newPage();

  await myPage.goto(
      "https://accounts.tiny.com.br/realms/tiny/protocol/openid-connect/auth?client_id=tiny-webapp&redirect_uri=https://erp.tiny.com.br/login&scope=openid&response_type=code",
      wait: Until.domContentLoaded);

  await myPage.type('input[name="username"]', 'feron@fpmatos');
  await myPage.type('input[name="password"]', 'amazoneron4#');
  await myPage.click(".sc-ispOId");

  await myPage.waitForSelector(".btn-primary", timeout: Duration(seconds: 30));
  await myPage.click(".btn-primary");

  await myPage.waitForNavigation(
      timeout: Duration(seconds: 15), wait: Until.load);
  await myPage.goto("https://erp.tiny.com.br/orcamentos#add", wait: Until.load);

  await myPage.waitForSelector("#contato");
  await myPage.type('input[id="contato"]', 'CLIENTE EXEMPLO');
  await myPage.waitForXPath('//*[@id="ui-id-2"]/li[1]');
  await myPage.keyboard.press(Key.arrowDown);

  await myPage.keyboard.press(Key.enter);
  await myPage.type('input[id="contato_ac"]', 'FILLIPE ERON');
  await myPage.type('input[id="nomeVendedor"]', 'FILLIPE');

  await myPage.waitForXPath('//*[@id="ui-id-6"]/li[1]');
  await myPage.keyboard.press(Key.arrowDown);
  await myPage.keyboard.press(Key.enter);

  await myPage.type('input[id="produto"]',
      "FOLHA DE PORTA HDF BRANCA LISA 30 X 600 X 2100 MM");
  await myPage.waitForXPath('//*[@id="ui-id-15"]/li[1]');
  await myPage.keyboard.press(Key.arrowDown);
  await myPage.keyboard.press(Key.enter);
  await myPage.click(".btn-salvar-completerLinhaInclusaoProduto");
  await myPage.click("#cond_gerais");

  await myPage.waitForSelector("#validade");
  await myPage.type('input[id="validade"]', '5');
  await myPage.type('input[id="prazo_entrega"]', '15 a 20 DIAS UTEIS');
  await myPage.type('textarea[id="observacao"]',
      '> PRODUTO DE USO INTERNO, NÃO PODENDO ENTRAR EM CONTATO COM A ÁGUA;');
  await myPage.click("#btnSalvar");

  await myPage.waitForNavigation(
      timeout: Duration(seconds: 15), wait: Until.load);
  browser.close();
}
