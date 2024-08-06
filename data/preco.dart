import 'package:hive/hive.dart';

void main() async {
  //Hive.init('somePath') -> not needed in browser

  Hive.init("./data_preco/data");

  //var box = Hive.box("teste");

  var box = await Hive.openBox("PRECO");
  // tabela revenda
  box.put("REVENDA#HDF#30X600/700/800#", 145);
  box.put("REVENDA#HDF#30X600/700/800#SOBMEDIDA", 145);
  box.put("REVENDA#HDF#30X900#", 165);
  box.put("REVENDA#HDF#30X900#SOBMEDIDA#", 225);
  box.put("REVENDA#HDF#30X1000#", 195);
  box.put("REVENDA#HDF#30X1000#SOBMEDIDA#", 255);
  box.put("REVENDA#HDF#30X1100#", 225);
  box.put("REVENDA#HDF#30X1100#SOBMEDIDA#", 285);
  box.put("REVENDA#HDF#30X1200#", 255);
  box.put("REVENDA#HDF#30X1200#SOBMEDIDA#", 315);
  box.put("REVENDA#HDF#35X600/700/800#", 205);
  box.put("REVENDA#HDF#35X600/700/800#SOBMEDIDA#", 265);
  box.put("REVENDA#HDF#35X900#", 235);
  box.put("REVENDA#HDF#35X900#SOBMEDIDA#", 295);
  box.put("REVENDA#HDF#35X1000#", 275);
  box.put("REVENDA#HDF#35X1000#SOBMEDIDA#", 335);
  box.put("REVENDA#HDF#35X1100#", 315);
  box.put("REVENDA#HDF#35X1100#SOBMEDIDA#", 375);
  box.put("REVENDA#HDF#35X1200#", 355);
  box.put("REVENDA#HDF#35X1200#SOBMEDIDA#", 415);
  // tabela cliente final
  box.put("FINAL#HDF#30X600/700/800#", 190);
  box.put("FINAL#HDF#30X600/700/800#SOBMEDIDA#", 250);
  box.put("FINAL#HDF#30X900#", 220);
  box.put("FINAL#HDF#30X900#SOBMEDIDA#", 280);
  box.put("FINAL#HDF#30X1000#", 250);
  box.put("FINAL#HDF#30X1000#SOBMEDIDA#", 310);
  box.put("FINAL#HDF#30X1100#", 280);
  box.put("FINAL#HDF#30X1100#SOBMEDIDA#", 340);
  box.put("FINAL#HDF#30X1200#", 310);
  box.put("FINAL#HDF#30X1200#SOBMEDIDA#", 370);
  box.put("FINAL#HDF#35X600/700/800#", 250);
  box.put("FINAL#HDF#35X600/700/800#SOBMEDIDA#", 310);
  box.put("FINAL#HDF#35X900#", 350);
  box.put("FINAL#HDF#35X900#SOBMEDIDA#", 410);
  box.put("FINAL#HDF#35X1000#", 450);
  box.put("FINAL#HDF#35X1000#SOBMEDIDA#", 510);
  box.put("FINAL#HDF#35X1100#", 550);
  box.put("FINAL#HDF#35X1100#SOBMEDIDA#", 610);
  box.put("FINAL#HDF#35X1200#", 650);
  box.put("FINAL#HDF#35X1200#SOBMEDIDA#", 710);
  //var name = box.get('name');
  //print(box.get('REVENDA#HDF#30X600/700/800#'));
  box.keys.forEach((element) => print(element));
  //print(box.keys);
  //print(box.values);
  box.close();
}
