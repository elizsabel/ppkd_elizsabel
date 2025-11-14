import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screendetailpokemon.dart';

class ScreenPokemon extends StatefulWidget {
  const ScreenPokemon({super.key});

  @override
  State<ScreenPokemon> createState() => _ScreenPokemonState();
}

class _ScreenPokemonState extends State<ScreenPokemon> {
  List<Map<String, dynamic>> pokemons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  // 🌐 Ambil daftar Pokémon sekaligus (tanpa nembak API per item)
  Future<void> fetchPokemons() async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=50'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List;

        // 🔄 Ambil semua detail paralel (lebih cepat dari for-loop biasa)
        final futures = results.map((item) async {
          final detailRes = await http.get(Uri.parse(item['url']));
          if (detailRes.statusCode == 200) {
            final detail = jsonDecode(detailRes.body);
            final types = (detail['types'] as List)
                .map((t) => t['type']['name'] as String)
                .toList();

            return {
              'id': detail['id'],
              'name': item['name'],
              'types': types,
              'image':
                  detail['sprites']['other']['official-artwork']['front_default'] ??
                  detail['sprites']['front_default'] ??
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            };
          }
          return null;
        }).toList();

        final resultsData = await Future.wait(futures);
        setState(() {
          pokemons = resultsData.whereType<Map<String, dynamic>>().toList();
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  // 🎨 Ikon berdasarkan tipe Pokémon
  IconData getTypeIcon(String type) {
    switch (type) {
      case 'fire':
        return Icons.local_fire_department;
      case 'water':
        return Icons.water_drop;
      case 'grass':
        return Icons.eco;
      case 'electric':
        return Icons.flash_on;
      case 'poison':
        return Icons.coronavirus;
      case 'bug':
        return Icons.bug_report;
      case 'ground':
        return Icons.landscape;
      case 'rock':
        return Icons.terrain;
      case 'psychic':
        return Icons.auto_awesome;
      case 'ice':
        return Icons.ac_unit;
      case 'fighting':
        return Icons.sports_mma;
      case 'ghost':
        return Icons.nightlight_round;
      case 'dragon':
        return Icons.bolt;
      case 'fairy':
        return Icons.star;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCB05), // 🎨 kuning khas Pokédex
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFCB05),
        centerTitle: true,
        title: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/9/98/International_Pokémon_logo.svg",
          height: 50,
          errorBuilder: (_, __, ___) => const Text(
            "Pokédex",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),

      // 🔹 Body: Daftar Pokémon
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final p = pokemons[index];
                final delay = 80 * index;

                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 400 + delay),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 40 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ScreenDetailPokemon(
                             pokemons: pokemons,
                              initialIndex: index,
                    
                        ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(2, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        leading: Hero(
                          tag: p['id'].toString(),
                          child: Image.network(
                            p['image'],
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.catching_pokemon,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        title: Text(
                          p['name'][0].toUpperCase() + p['name'].substring(1),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Row(
                          children: p['types']
                              .map<Widget>(
                                (type) => Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        getTypeIcon(type),
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        type[0].toUpperCase() +
                                            type.substring(1),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

      // ⚪ Pokéball tombol di bawah tengah
      floatingActionButton: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.network(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png",
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.catching_pokemon, color: Colors.red),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
//