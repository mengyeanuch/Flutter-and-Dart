import 'dart:convert';

import 'package:flutter_dart/Week10+11/model/user.dart';
import 'package:http/http.dart' as http;

import '../../model/auth_session.dart';

class AuthenticationService {
  static AuthenticationService instance =
      AuthenticationService(); //singleton instance

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password
    Map<String, dynamic> loginJson = {"name": name, "password": password};

    // 2- Fetch the POST/login
    http.Response response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(loginJson),
    );

    // 3- Decode the json
    Map<String, dynamic> json = jsonDecode(response.body);

    // 4 - If failed, throw a AuthException
    if (response.statusCode != 200) {
      throw AuthException(json["error"] ?? "Login failed");
    }
    print(json);
    // 5 -  Get the token
    final String token = json["token"];
    // 5 -  Get the user
    final User user = User.fromJSon(json["user"]);
    // 6 - Update the session
    session = AuthSession(token: token, user: user);
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
