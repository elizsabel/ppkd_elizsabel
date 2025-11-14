import 'package:flutter/material.dart';

class Homecustglow extends StatelessWidget {
  final String userName;
  final VoidCallback onBookNow;

  const Homecustglow({
    super.key,
    required this.userName,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        "name": "Skinbooster",
        "desc": "Hidrasi kulit dari dalam",
        "price": "Rp 1.500.000",
        "duration": "45 menit",
        "image":
            "https://images.unsplash.com/photo-1739981248829-ac9d4a6fecfa?auto=format&fit=crop&w=400&q=80",
        "icon": Icons.water_drop,
      },
      {
        "name": "DNA Salmon",
        "desc": "Regenerasi sel kulit optimal",
        "price": "Rp 2.000.000",
        "duration": "60 menit",
        "image":
            "https://images.unsplash.com/photo-1607205829692-44382aa7c391?auto=format&fit=crop&w=400&q=80",
        "icon": Icons.auto_awesome,
      },
      {
        "name": "Botox",
        "desc": "Anti-aging untuk wajah halus",
        "price": "Rp 2.500.000",
        "duration": "30 menit",
        "image":
            "https://images.unsplash.com/photo-1745336670683-3b5586cb5f19?auto=format&fit=crop&w=400&q=80",
        "icon": Icons.medical_services,
      },
      {
        "name": "Facial Premium",
        "desc": "Perawatan wajah lengkap",
        "price": "Rp 1.200.000",
        "duration": "90 menit",
        "image":
            "https://images.unsplash.com/photo-1739981248829-ac9d4a6fecfa?auto=format&fit=crop&w=400&q=80",
        "icon": Icons.star,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD4A5A5), Color(0xFFE8C4B8)],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  // Greeting Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _headerIcon(Icons.water_drop),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo, $userName 👋",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.9),
                                ),
                              ),
                              const Text(
                                "Selamat Datang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      _headerIcon(Icons.notifications),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Location Box
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lokasi Layanan",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Jakarta Selatan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Ubah",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader(),
                  const SizedBox(height: 12),

                  // Service List
                  ...services.map((service) => _serviceCard(service)).toList(),

                  // Promo Banner
                  _promoBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTS ---

  Widget _headerIcon(IconData icon) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.25),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  Widget _sectionHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Layanan Kami",
          style: TextStyle(color: Color(0xFFD4A5A5), fontSize: 20),
        ),
        Text(
          "Lihat Semua",
          style: TextStyle(color: Color(0xFFD4A5A5), fontSize: 14),
        ),
      ],
    );
  }

  Widget _serviceCard(Map<String, dynamic> s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(18),
            ),
            child: Image.network(
              s["image"],
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          // Text Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s["name"], style: const TextStyle(fontSize: 18)),
                  Text(
                    s["desc"],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "⏱ ${s["duration"]}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s["price"],
                        style: const TextStyle(
                          color: Color(0xFFD4A5A5),
                          fontSize: 16,
                        ),
                      ),

                      // Book Button
                      GestureDetector(
                        onTap: onBookNow,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFD4A5A5), Color(0xFFE8C4B8)],
                            ),
                          ),
                          child: const Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _promoBanner() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF7D5CC), Color(0xFFFFE5E0)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFFD4A5A5)),
              SizedBox(width: 10),
              Text(
                "Promo Spesial!",
                style: TextStyle(fontSize: 18, color: Color(0xFFD4A5A5)),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text("Diskon 20% untuk pemesanan pertama Anda"),
          Text(
            "Gunakan kode: GLOW20",
            style: TextStyle(color: Color(0xFFD4A5A5)),
          ),
        ],
      ),
    );
  }
}
