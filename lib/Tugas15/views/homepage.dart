import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_elizsabel/Tugas15/models/profilemodel.dart';
import 'package:ppkd_elizsabel/Tugas15/preferences/preference_handler.dart';
import 'package:ppkd_elizsabel/Tugas15/service/api.dart';
import 'package:ppkd_elizsabel/Tugas15/views/editprofilepage.dart';
import 'package:ppkd_elizsabel/Tugas15/views/loginpage.dart';

class HomePageGlowTap extends StatefulWidget {
  const HomePageGlowTap({super.key});

  @override
  State<HomePageGlowTap> createState() => _HomePageGlowTapState();
}

class _HomePageGlowTapState extends State<HomePageGlowTap> {
  bool isLoading = true;
  ProfileModel? profile;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      final result = await AuthAPI.getUserData();

      setState(() {
        profile = result;
        isLoading = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Token invalid, silakan login ulang");
      await PreferenceHandler.removeToken();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginCustGlow()),
      );
    }
  }

  Future<void> logout() async {
    await PreferenceHandler.removeToken();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginCustGlow()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = profile?.data;

    return Scaffold(
      backgroundColor: const Color(0xFFFCE9EF), // Pink pastel GlowTap
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "GlowTap",
          style: TextStyle(
            color: Color(0xFFB56A67),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFFB56A67)),
            onPressed: logout,
          ),
        ],
      ),

      /// ================= BODY =================
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.pink))
          : user == null
          ? const Center(child: Text("Data user tidak ditemukan"))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// -------- PROFILE CARD --------
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFDE4EA), Color(0xFFF7D9DD)],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade100,
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        /// FOTO PROFIL
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("assets/images/poto.jpg"),
                        ),
                        const SizedBox(width: 20),

                        /// NAMA & EMAIL
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name ?? "-",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B4A4A),
                                ),
                              ),
                              Text(
                                user.email ?? "-",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// -------- DETAIL CARD --------
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade100.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        infoItem("User ID", user.id.toString()),
                        infoItem("Nama", user.name ?? "-"),
                        infoItem("Email", user.email ?? "-"),
                        infoItem("Dibuat", user.createdAt.toString()),
                        infoItem("Update", user.updatedAt.toString()),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// -------- EDIT BUTTON --------
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB56A67),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        shadowColor: Colors.pink.shade200,
                        elevation: 6,
                      ),
                      child: const Text(
                        "Edit Profil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditProfilePage(userData: user),
                          ),
                        ).then((value) {
                          if (value == true) fetchProfile();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /// -------- Reusable Item Info --------
  Widget infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF8B4A4A),
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
