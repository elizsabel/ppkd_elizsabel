import 'package:ppkd_elizsabel/tugas14pokemon/model/pokemon_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Result>> fetchPokemon() async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=1302"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List results = data['results'] ?? [];
    return List<Result>.from(results.map((e) => Result.fromJson(e)));
  } else {
    throw Exception('Gagal memuat data (${response.statusCode})');
  }
}
