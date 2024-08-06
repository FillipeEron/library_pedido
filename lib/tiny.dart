import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _token = '3bafd53e2da95f4bd72afb6874d0e563f90b54bf';
const String _formato = 'json';

class Produto {
  String id, nome, codigo, unidade, descricaoComplementar;
  int preco;
  Produto(
      {required this.id,
      required this.nome,
      required this.codigo,
      required this.unidade,
      required this.preco,
      required this.descricaoComplementar});

  @override
  factory Produto.fromJson(Map<String, dynamic> json) {
    // init code
    final String id = json['retorno']['produto']['id'] as String;
    final String nome = json['retorno']['produto']['nome'] as String;
    final String codigo = json['retorno']['produto']['codigo'] as String;
    final String unidade = json['retorno']['produto']['unidade'] as String;
    final int preco = json['retorno']['produto']['preco'] as int;
    final String descricaoComplementar =
        json['retorno']['produto']['descricao_complementar'] as String;

    return Produto(
      id: id,
      nome: nome,
      codigo: codigo,
      unidade: unidade,
      preco: preco,
      descricaoComplementar: descricaoComplementar,
    );
  }
}

Future<Produto> fetchProduto(String id) async {
  final url = Uri.parse('https://api.tiny.com.br/api2/produto.obter.php')
      .replace(queryParameters: {
    'token': _token,
    'formato': _formato,
    'id': id,
  });

  final response = await http.post(url);
  if (response.statusCode == 200) {
    return Produto.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('FAILED REQUEST: STATUS CODE $response.statusCode');
  }
}
