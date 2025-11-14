import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_elizsabel/Tugas15/appcolor.dart';
import 'package:ppkd_elizsabel/Tugas15/preferences/preference_handler.dart';
import 'package:ppkd_elizsabel/Tugas15/service/api.dart';
import 'package:ppkd_elizsabel/Tugas15/views/loginpage.dart';

class RegisterCustglow extends StatefulWidget {
  const RegisterCustglow({super.key});
  static const id = "/registercust";

  @override
  State<RegisterCustglow> createState() => _RegisterCustGlowState();
}

class _RegisterCustGlowState extends State<RegisterCustglow> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildBackground(), buildFormLayer()]),
    );
  }

  /// ===================== UI FORM =====================
  SafeArea buildFormLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 30),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Appcolor.pink1.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Daftar Akun ✨",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.rosegoldDark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Isi data dengan benar ya 💗",
                  style: TextStyle(color: Appcolor.textBrownSoft),
                ),
                const SizedBox(height: 22),

                /// NAMA
                buildTitle("Nama Lengkap"),
                buildTextField(
                  hintText: "Masukkan nama lengkap",
                  icon: Icons.person_outline,
                  controller: nameC,
                  validator: (v) =>
                      v!.isEmpty ? "Nama tidak boleh kosong" : null,
                ),
                const SizedBox(height: 14),

                /// EMAIL
                buildTitle("Email"),
                buildTextField(
                  hintText: "Masukkan email",
                  icon: Icons.email_outlined,
                  controller: emailC,
                  validator: (v) {
                    if (v!.isEmpty) return "Email tidak boleh kosong";
                    if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(v)) {
                      return "Format email tidak valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                /// PASSWORD
                buildTitle("Password"),
                buildTextField(
                  hintText: "Masukkan password",
                  icon: Icons.lock_outline,
                  controller: passC,
                  isPassword: true,
                  validator: (v) => v!.length < 6 ? "Minimal 6 karakter" : null,
                ),
                const SizedBox(height: 22),

                /// REGISTER BUTTON (API TERAPLIKASI)
                ApiButton(
                  text: "Register",
                  isLoading: isLoading,
                  onPressed: registerUser,
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          color: Appcolor.rosegoldDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===================== REGISTER API =====================
  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final result = await AuthAPI.registerUser(
          name: nameC.text.trim(),
          email: emailC.text.trim(),
          password: passC.text.trim(),
        );

        setState(() => isLoading = false);

        // Simpan token (jika API kamu mengembalikan token)
        if (result.data?.token != null) {
          PreferenceHandler.saveToken(result.data!.token!);
        }

        Fluttertoast.showToast(msg: "Registrasi Berhasil!");

        // NAVIGATE KE HOME (atau halaman lain)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginCustGlow()),
        );
      } catch (e) {
        setState(() => isLoading = false);

        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  /// ===================== WIDGET =====================
  Widget buildTitle(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Appcolor.textBrownSoft,
      ),
    ),
  );

  TextFormField buildTextField({
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Appcolor.textBrownSoft),
        filled: true,
        fillColor: Appcolor.softPinkPastel,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () => setState(() => isVisibility = !isVisibility),
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                  color: Appcolor.textBrownSoft,
                ),
              )
            : null,
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// ===================== BUTTON API =====================
class ApiButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  const ApiButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.button1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
