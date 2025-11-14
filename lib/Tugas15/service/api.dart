import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_elizsabel/Tugas15/constant/endpoint.dart';
import 'package:ppkd_elizsabel/Tugas15/models/editprofilemodel.dart';
import 'package:ppkd_elizsabel/Tugas15/models/loginmodel.dart';
import 'package:ppkd_elizsabel/Tugas15/models/profilemodel.dart';
import 'package:ppkd_elizsabel/Tugas15/models/registermodel.dart';
import 'package:ppkd_elizsabel/Tugas15/preferences/preference_handler.dart';

class AuthAPI {

  //  REGISTER 
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  //  LOGIN 
  static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  //  GET PROFILE 
  static Future<ProfileModel> getUserData() async {
    final token = await PreferenceHandler.getToken();
    final url = Uri.parse(Endpoint.profile);

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print("GET PROFILE STATUS : ${response.statusCode}");
    print("GET PROFILE BODY   : ${response.body}");

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["message"] ?? "Gagal mengambil data user");
    }
  }

  //  EDIT PROFILE 
  static Future<EditProfileModel> updateProfile({
    required String name,
    required String email,
  }) async {
    final token = await PreferenceHandler.getToken();
    final url = Uri.parse(Endpoint.editprofile);

    final response = await http.put(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: {
        "name": name,
        "email": email,
      },
    );

    print("EDIT PROFILE STATUS : ${response.statusCode}");
    print("EDIT PROFILE BODY   : ${response.body}");

    if (response.statusCode == 200) {
      return EditProfileModel.fromJson(jsonDecode(response.body));
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["message"] ?? "Gagal update profil");
    }
  }
}
