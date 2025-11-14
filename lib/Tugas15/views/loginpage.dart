import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_elizsabel/Tugas15/appcolor.dart';
import 'package:ppkd_elizsabel/Tugas15/views/homepage.dart';
import 'package:ppkd_elizsabel/Tugas_11/view/drawer_11.dart';
import 'package:ppkd_elizsabel/Tugas15/preferences/preference_handler.dart';
import 'package:ppkd_elizsabel/Tugas15/service/api.dart';
import 'package:ppkd_elizsabel/Tugas15/views/registerpage.dart';

class LoginCustGlow extends StatefulWidget {
  const LoginCustGlow({super.key});
  static const id = "/logincust";

  @override
  State<LoginCustGlow> createState() => _LoginCustGlowState();
}

class _LoginCustGlowState extends State<LoginCustGlow> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildBackground(), buildLoginForm()]),
    );
  }

  /// ===================== UI =====================
  SafeArea buildLoginForm() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 130, 20, 30),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Appcolor.pink1.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Masuk Akun 💗",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.rosegoldDark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Silakan login untuk melanjutkan",
                  style: TextStyle(color: Appcolor.textBrownSoft),
                ),
                const SizedBox(height: 28),

                /// EMAIL
                buildTitle("Email"),
                buildTextField(
                  hintText: "Masukkan email",
                  icon: Icons.email_outlined,
                  controller: emailC,
                  validator: (v) {
                    if (v!.isEmpty) return "Email tidak boleh kosong";
                    if (!v.contains("@")) return "Email tidak valid";
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
                  validator: (v) =>
                      v!.isEmpty ? "Password tidak boleh kosong" : null,
                ),
                const SizedBox(height: 22),

                /// LOGIN BUTTON API
                ApiButton(
                  text: "Login",
                  isLoading: isLoading,
                  onPressed: loginUser,
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterCustglow(),
                          ),
                        );
                      },
                      child: Text(
                        "Daftar",
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

  /// ===================== LOGIN API =====================
  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final result = await AuthAPI.loginUser(
          email: emailC.text.trim(),
          password: passC.text.trim(),
        );

        setState(() => isLoading = false);

        // Simpan token
        if (result.data?.token != null) {
          await PreferenceHandler.saveToken(result.data!.token!);
        }

        Fluttertoast.showToast(msg: "Login berhasil!");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePageGlowTap()),
        );
      } catch (e) {
        setState(() => isLoading = false);
        Fluttertoast.showToast(msg: "Login gagal: ${e.toString()}");
      }
    }
  }

  /// ===================== WIDGET REUSABLE =====================
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

/// ===================== API BUTTON =====================
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
