import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jedmgr/features/activity_log/marketer_log_model.dart';
import 'package:jedmgr/features/distribution/model/get_customer_model.dart';
import 'package:jedmgr/features/fault_reporting/get_faults_model.dart';

class DistributionServices {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();

  static Future<GetCustomerModel?> getCustomer(String endpoint, token) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    print('response ${response.body}');
    if (response.statusCode == 200) {
      print('response1 ${getCustomerModelFromJson(response.body)}');
      return getCustomerModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Map>?> getFaults(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    print('response ${response.body}');
    if (response.statusCode == 200) {
      var model = getFaultModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'id': element.id,
          "status": element.status!.name,
          'statusColor': element.status!.color,
          'description': element.description,
          'type': element.faults!.name,
          'statusId': element.status!.id,
          'createdAt': element.updatedAt,
          'updatedAt': element.updatedAt
        });
      });
      print('Response List $list');
      return list;
    } else {
      return null;
    }
  }

  static Future<List<Map>?> getActivityLog(String endpoint, token) async {
    List<Map> list = [];

    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    print('response ${response.body}');
    if (response.statusCode == 200) {
      var model = marketerLogModelFromJson(response.body);
      model.data!.forEach((element) {
        list.add({
          'activity': element.activityType!.description,
          "location": element.resolvedAddress,
          'time': element.createdAt,
          'date': element.createdAt,
          'id': element.id,
        });
      });
      print('activity List $list');
      return list;
    } else {
      return null;
    }
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
