import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jedmgr/features/fault_reporting/fault_type_model.dart';
import 'package:jedmgr/features/feeders/model/area_office_model.dart';
import 'package:jedmgr/features/feeders/model/dt_model.dart';
import 'package:jedmgr/features/feeders/model/feeder_model.dart';
import 'package:jedmgr/features/feeders/model/status_model.dart';

class HelperServices {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<List<Map>> getFeeder(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var model = feederModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'name': element.name,
          'id': element.id,
        });
      });
    }
    return list;
  }

  static Future<List<Map>> getAreaOffice(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var model = areaOfficeModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'name': element.name,
          'id': element.id,
        });
      });
    }
    return list;
  }

  static Future<List<Map>> getStatus(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var model = statusModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'name': element.name,
          'id': element.id,
        });
      });
    }
    return list;
  }

  static Future<List<Map>> getFaultTypes(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var model = faultTypeModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'name': element.name,
          'id': element.id,
        });
      });
    }
    return list;
  }

  static Future<List<Map>> getDT(String endpoint, token, String feeder) async {
    List<Map> list = [];

    var response = await client.get(buildUrl('$endpoint/$feeder'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var model = dtModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'name': element.name,
          'id': element.id,
        });
      });
    }
    return list;
  }

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
