import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/src/feature/pokemon/model/pokemon.dart';
import 'package:pokemon/src/feature/pokemon/model/pokemon_details.dart';

class DataSourcs {
  Future<DetailPokemon> getPokemonDetail(String name) async {
    try {
      final data = await http
          .get(
            Uri.parse(
              'https://pokeapi.co/api/v2/pokemon/$name',
            ),
          )
          .timeout(const Duration(seconds: 4));
      final datas = DetailPokemon.fromJson(json.decode(data.body));

      return datas;
    } catch (e) {
      throw Exception('error server: $e');
    }
  }

  int counte = 1;
  Future<Pokemon> getPokemon(int page) async {
    counte++;
    int next1 = page * counte;
    int next2 = page * counte + 1;
    print('cargar $next1   $next2');
    try {
      final data = await http
          .get(
            Uri.parse(
              'https://pokeapi.co/api/v2/pokemon/?limit=$next1&offset=$next2',
            ),
          )
          .timeout(const Duration(seconds: 4));
      final datas = Pokemon.fromMap(json.decode(data.body));
      return datas;
      // for (var element in datas.results) {
      //   print('Es la data  ${element.name}  Url: ${element.url}');
      // }
    } catch (e) {
      throw Exception('error server: $e');
    }
  }
}
