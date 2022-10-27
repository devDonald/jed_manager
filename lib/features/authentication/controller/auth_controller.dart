import 'package:get/get.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/core/services/network_handler.dart';
import 'package:jedmgr/features/authentication/marketer/login_screen.dart';
import 'package:jedmgr/features/authentication/model/login_error_model.dart';
import 'package:jedmgr/features/authentication/model/marketer_auth_model.dart';
import 'package:jedmgr/features/authentication/model/marketer_auth_response.dart';
import 'package:jedmgr/features/authentication/model/marketer_logout_model.dart';
import 'package:jedmgr/features/authentication/model/technician_auth_result_model.dart';
import 'package:jedmgr/features/authentication/model/technician_login_model.dart';
import 'package:jedmgr/features/engineer/engineer_home.dart';
import 'package:jedmgr/features/home/home.dart';

import '../../../core/widgets/customFullScreenDialog.dart';
import '../technician/technician_login.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  void loginMarketer(MarketerAuthModel model) {
    CustomFullScreenDialog.showDialog();
    NetworkHandler.post(marketerAuthModelToJson(model), "login")
        .then((response) {
      print('Response Login: ${response.body}');
      print('Login Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        CustomFullScreenDialog.cancelDialog();
        AuthResultModel authResultModel =
            authResultModelFromJson(response.body);
        NetworkHandler.storeToken(authResultModel.token!);
        successToastMessage(msg: 'Login Successful');
        Get.offAll(() => HomeScreen(
              lat: "${model.latitude}",
              long: "${model.longitude}",
              address: "${model.resolvedAddress}",
              name: authResultModel.data!.name!,
              token: authResultModel.token!,
            ));
      } else {
        CustomFullScreenDialog.cancelDialog();
        LoginErrorModel errorModel = loginErrorModelFromJson(response.body);
        errorToastMessage(msg: errorModel.message!);
      }
    });
  }

  Future<void> marketerLogout(
      String lat, String long, address, String token) async {
    CustomFullScreenDialog.showDialog();
    MarketerLogoutModel model = MarketerLogoutModel(
        longitude: long, latitude: lat, resolvedAddress: address);
    NetworkHandler.postRequest(
            marketerLogoutModelToJson(model), "marketer/marketerLogout", token)
        .then((response) {
      print("marklogout ${response.body}");

      CustomFullScreenDialog.cancelDialog();
      if (response.statusCode == 200) {
        LoginErrorModel errorModel = loginErrorModelFromJson(response.body);
        successToastMessage(msg: errorModel.message!);
        Get.offAll(() => const MarketerLoginScreen());
      }
    });
  }

  Future<void> technicianLogout(
      String lat, String long, String address, String token) async {
    CustomFullScreenDialog.showDialog();
    MarketerLogoutModel model = MarketerLogoutModel(
        longitude: long, latitude: lat, resolvedAddress: address);
    NetworkHandler.postRequest(marketerLogoutModelToJson(model),
            "technician/technicianLogout", token)
        .then((response) {
      print("techlogout ${response.body}");
      CustomFullScreenDialog.cancelDialog();
      if (response.statusCode == 200) {
        LoginErrorModel errorModel = loginErrorModelFromJson(response.body);
        successToastMessage(msg: errorModel.message!);
        Get.offAll(() => const TechnicianLoginScreen());
      }
    });
  }

  void loginTechnician(TechnicianLoginModel model) {
    CustomFullScreenDialog.showDialog();
    NetworkHandler.post(technicianLoginModelToJson(model), "technician/login")
        .then((response) {
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        CustomFullScreenDialog.cancelDialog();
        TechnicianAuthResultModel authResultModel =
            technicianAuthResultModelFromJson(response.body);
        NetworkHandler.storeToken(authResultModel.token!);
        successToastMessage(msg: 'Login Successful');
        Get.offAll(() => EngineerHome(
              lat: "${model.latitude}",
              long: "${model.longitude}",
              name: authResultModel.data!.name!,
              token: authResultModel.token!,
              address: "${model.resolvedAddress}",
            ));
      } else {
        CustomFullScreenDialog.cancelDialog();
        LoginErrorModel errorModel = loginErrorModelFromJson(response.body);
        errorToastMessage(msg: errorModel.message!);
      }
    });
  }
}
