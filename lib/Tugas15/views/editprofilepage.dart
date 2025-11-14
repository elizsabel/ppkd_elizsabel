import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_elizsabel/Tugas15/models/profilemodel.dart';
import 'package:ppkd_elizsabel/Tugas15/service/api.dart';

class EditProfilePage extends StatefulWidget {
  final Data userData;

  const EditProfilePage({super.key, required this.userData});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameC;
  late TextEditingController emailC;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameC = TextEditingController(text: widget.userData.name);
    emailC = TextEditingController(text: widget.userData.email);
  }

  Future<void> updateProfile() async {
    setState(() => isLoading = true);

    try {
      final result = await AuthAPI.updateProfile(
        name: nameC.text.trim(),
        email: emailC.text.trim(),
      );

      Fluttertoast.showToast(msg: result.message ?? "Update berhasil!");
      Navigator.pop(context, true);
    } catch (e) {
      Fluttertoast.showToast(msg: "Gagal update: $e");
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE9EF),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit Profil",
          style: TextStyle(
            color: Color(0xFFB56A67),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFB56A67)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// PROFILE IMAGE + NAME
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
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/images/poto.jpg"),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.userData.name ?? "-",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF8B4A4A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// ---------------- FORM CARD ----------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100.withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  /// NAME (bisa diedit)
                  buildInput(
                    label: "Nama Lengkap",
                    controller: nameC,
                    icon: Icons.person_outline,
                    enabled: true,
                  ),

                  const SizedBox(height: 20),

                  /// EMAIL (tidak bisa diklik/edit)
                  buildInput(
                    label: "Email",
                    controller: emailC,
                    icon: Icons.email_outlined,

                    ///  disable email
                    enabled: false,
                  ),

                  const SizedBox(height: 30),

                  /// BUTTON UPDATE
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB56A67),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        shadowColor: Colors.pink.shade200,
                        elevation: 6,
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Simpan Perubahan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- Input Field GlowTap ----------------
  Widget buildInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool enabled,
  }) {
    return TextField(
      controller: controller,
      readOnly: !enabled, // tidak bisa diketik
      enabled: enabled, // tidak bisa diklik, tidak fokus
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFB56A67)),
        filled: true,
        fillColor: enabled
            ? const Color(0xFFFDE9EF)
            : const Color(0xFFECD6D9), // warna lebih gelap jika disable
        labelStyle: const TextStyle(color: Color(0xFF8B4A4A)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: enabled ? Colors.pink.shade200 : Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFB56A67), width: 2),
        ),
      ),
    );
  }
}
