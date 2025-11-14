import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenDetailPokemon extends StatefulWidget {
  final List<Map<String, dynamic>> pokemons;
  final int initialIndex;

  const ScreenDetailPokemon({
    super.key,
    required this.pokemons,
    required this.initialIndex,
  });

  @override
  State<ScreenDetailPokemon> createState() => _ScreenDetailPokemonState();
}

class _ScreenDetailPokemonState extends State<ScreenDetailPokemon>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: 0, end: -15).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> fetchPokemonDetail(int id) async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final speciesUrl = data['species']['url'];
      final speciesRes = await http.get(Uri.parse(speciesUrl));
      final speciesData = jsonDecode(speciesRes.body);
      final evoUrl = speciesData['evolution_chain']['url'];
      final evoData = await fetchEvolutionChain(evoUrl);
      return {"data": data, "evolutions": evoData};
    } else {
      throw Exception("Failed to load Pokémon");
    }
  }

  Future<List<Map<String, String>>> fetchEvolutionChain(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) return [];

    final data = jsonDecode(response.body);
    final chain = data['chain'];
    List<Map<String, String>> evolutions = [];

    void parseChain(dynamic evo) {
      evolutions.add({"name": evo['species']['name']});
      if (evo['evolves_to'] != null && evo['evolves_to'].isNotEmpty) {
        parseChain(evo['evolves_to'][0]);
      }
    }

    parseChain(chain);

    for (var evo in evolutions) {
      final res = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/${evo['name']}'),
      );
      if (res.statusCode == 200) {
        final detail = jsonDecode(res.body);
        evo['image'] =
            detail['sprites']['other']['official-artwork']['front_default'] ??
            detail['sprites']['front_default'];
      }
    }
    return evolutions;
  }

  // ✅ Warna dengan aman (tidak pakai .shade700)
  Color getTypeColor(String type, bool isDark) {
    final Map<String, Color> colors = {
      'fire': Colors.orange,
      'water': Colors.blue,
      'grass': Colors.green,
      'electric': Colors.amber,
      'poison': Colors.purple,
      'bug': Colors.lightGreen,
      'ground': Colors.brown,
      'rock': Colors.grey,
      'psychic': Colors.pink,
      'ice': Colors.cyan,
      'fighting': Colors.redAccent,
      'ghost': Colors.deepPurple,
      'dragon': Colors.indigo,
      'fairy': Colors.pinkAccent,
    };
    final base = colors[type] ?? Colors.grey;
    return isDark ? base.withOpacity(0.8) : base.withOpacity(0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Pokémon Detail"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: isDarkMode ? Colors.amber : Colors.blueGrey,
            ),
            onPressed: () => setState(() => isDarkMode = !isDarkMode),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.pokemons.length,
        itemBuilder: (context, index) {
          final p = widget.pokemons[index];
          final id = p['id'];
          final name = p['name'];

          return FutureBuilder<Map<String, dynamic>>(
            future: fetchPokemonDetail(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              final data = snapshot.data!["data"];
              final evolutions = snapshot.data!["evolutions"];
              final mainType = data['types'][0]['type']['name'];
              final color = getTypeColor(mainType, isDarkMode);

              final imageUrl =
                  data['sprites']['other']['official-artwork']['front_default'] ??
                  data['sprites']['front_default'];

              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.9),
                      isDarkMode
                          ? Colors.black87
                          : Colors.white.withOpacity(0.95),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      AnimatedBuilder(
                        animation: _floatAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _floatAnimation.value),
                            child: Hero(
                              tag: id.toString(),
                              child: Image.network(
                                imageUrl,
                                height: 280,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.catching_pokemon,
                                  size: 120,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        backgroundColor: color.withOpacity(
                          isDarkMode ? 0.4 : 0.2,
                        ),
                        label: Text(
                          mainType.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? Colors.white
                                : Colors.grey.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 🌱 Evolution chain
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.grey.shade900
                              : Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Evolution Chain",
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: evolutions.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                              itemBuilder: (context, i) {
                                final evo = evolutions[i];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                          evo['image'] ?? '',
                                        ),
                                        backgroundColor: color.withOpacity(0.4),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        evo['name']![0].toUpperCase() +
                                            evo['name']!.substring(1),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );  
            },
          );
        },
      ),
    );
  }
}
