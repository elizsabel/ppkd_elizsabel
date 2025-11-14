import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugas14pokemon/views/screenpokemon.dart';

class SplashScreenPokemon extends StatefulWidget {
  const SplashScreenPokemon({super.key});

  @override
  State<SplashScreenPokemon> createState() => _SplashScreenPokemonState();
}

class _SplashScreenPokemonState extends State<SplashScreenPokemon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    // 🎞️ Setup animasi logo & background
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: false);

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // ⏳ Setelah 4 detik → pindah ke halaman Pokémon
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const ScreenPokemon(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFD4D4), // soft pink
              Color(0xFFFFF8C9), // soft yellow
              Color(0xFFE0FFFC), // soft aqua
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 🌀 Pokéball besar berputar di background
            AnimatedBuilder(
              animation: _rotateAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotateAnimation.value,
                  child: child,
                );
              },
              child: Opacity(
                opacity: 0.15,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/53/Poké_Ball_icon.svg",
                  height: 350,
                  fit: BoxFit.contain,
                  color: Colors.black.withOpacity(0.1),
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.catching_pokemon,
                    size: 300,
                    color: Colors.black12,
                  ),
                ),
              ),
            ),

            // ✨ Efek shimmer lembut di atas background
            Positioned.fill(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    colors: [
                      Colors.white54,
                      Colors.transparent,
                      Colors.white54,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.5, 0.9],
                    tileMode: TileMode.mirror,
                  ).createShader(rect);
                },
                blendMode: BlendMode.softLight,
                child: Container(color: Colors.white.withOpacity(0.05)),
              ),
            ),

            // 🎨 Logo + teks utama
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.redAccent, Colors.white],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Image.network(
                          "https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png",
                          height: 120,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.catching_pokemon,
                                size: 100,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "POKÉDEX",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              blurRadius: 8,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "by Elizsabel",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 💫 Footer teks
            const Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Loading Pokédex Data...",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
