import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();
  static Future<http.Response> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-Type": "application/json",
    });

    return response;
  }

  static Future<http.Response> postRequest(
      var body, String endpoint, String token) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    return response;
  }

  static Future<http.Response> get(String endpoint, token) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    return response;
  }
  // static Future<http.Response> logout(String endpoint, token) async {
  //   var response = await client.get(buildUrl(endpoint),
  //       headers: {"Content-Type": "application/json", "Authorization": token});
  //   return response;
  // }

  static Uri buildUrl(String endpoint) {
    String host = "https://jedbat.com/api/v1/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void storeToken(String token) async {
    await storage.write(key: 'token', value: token.trim());
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
