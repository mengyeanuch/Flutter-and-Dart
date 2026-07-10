import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model/button_status.dart';
import '../dto/button_status_dto.dart';
import 'repository_exception.dart';

class ButtonRepository {
  static ButtonRepository instance = ButtonRepository();

  static const String baseUrl =
      "https://scammiee-c136b-default-rtdb.asia-southeast1.firebasedatabase.app/button.json";

  Future<ButtonStatus> getButtonStatus() async {
    Uri url = Uri.parse(baseUrl);

    try {
      Response response = await http.get(url);

      if (response.statusCode != 200) {
        throw RepositoryException(
          "Failed to fetch button status (HTTP ${response.statusCode})",
        );
      }

      if (response.body == "null") {
        throw RepositoryException("No button data found in Firebase");
      }

      Map<String, dynamic> json = jsonDecode(response.body);

      return ButtonStatusDto.fromJson(json);
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  Future<void> updateSelected(bool selected) async {
    Uri url = Uri.parse(baseUrl);

    String body = jsonEncode({ButtonStatusDto.selectedKey: selected});

    try {
      Response response = await http.patch(url, body: body);

      if (response.statusCode != 200) {
        throw RepositoryException(
          "Failed to update button status (HTTP ${response.statusCode})",
        );
      }
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
