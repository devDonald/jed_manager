import 'package:get/get.dart';
import 'package:jedmgr/features/fault_reporting/update_fault_model.dart';
import 'package:jedmgr/features/home/fault_report_model.dart';
import 'package:jedmgr/features/ppm_monitoring/create_ppm_model.dart';
import 'package:jedmgr/features/ppm_monitoring/ppm_response_model.dart';

import '../../../core/constants/contants.dart';
import '../../../core/services/network_handler.dart';
import '../../../core/widgets/customFullScreenDialog.dart';
import '../../distribution/services/distribution_services.dart';

class FaultController extends GetxController {
  static FaultController to = Get.find();
  var isLoading = false.obs;
  var isFound = false.obs;

  List<Map> faultModelList = <Map>[].obs;

  void displayFaults(String token) async {
    try {
      isLoading(true);
      var faults =
          await DistributionServices.getFaults('technician/getFaults', token);
      print("first fault: ${faults}");
      if (faults != null) {
        isFound(true);
        faultModelList = faults;
      } else {
        isFound(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void reportFaults(FaultReportModel model, String token) {
    CustomFullScreenDialog.showDialog();
    isLoading(true);
    NetworkHandler.postRequest(
            faultReportModelToJson(model), "marketer/createFaultReport", token)
        .then((response) {
      isLoading(false);
      CustomFullScreenDialog.cancelDialog();
      print("response fault ${response.statusCode}");
      print("responsebody ${response.body}");
      if (response.statusCode == 200) {
        isFound(true);
        successToastMessage(msg: 'Fault Report Created Successfully');
        Get.back();
      } else {
        errorToastMessage(msg: 'please try again with valid data');
      }
    });
  }

  void createPPM(CreatePpmModel model, String token) {
    CustomFullScreenDialog.showDialog();
    isLoading(true);
    NetworkHandler.postRequest(
            createPpmModelToJson(model), "marketer/createPPM", token)
        .then((response) {
      CustomFullScreenDialog.cancelDialog();
      isLoading(false);
      print("response ${response.statusCode}");
      print("responsebody ${response.body}");
      if (response.statusCode == 201) {
        isFound(true);
        PpmRespnseModel respnseModel = ppmRespnseModelFromJson(response.body);
        successToastMessage(msg: respnseModel.message!);
        Get.back();
      } else {
        errorToastMessage(msg: 'please try again with valid data');
      }
    });
  }

  void updateFaultStatus(UpdateFaultModel model, String token, String faultId) {
    CustomFullScreenDialog.showDialog();

    NetworkHandler.postRequest(updateFaultModelToJson(model),
            "technician/updateFault/$faultId", token)
        .then((response) {
      CustomFullScreenDialog.cancelDialog();
      print("response update fault ${response.statusCode}");
      print("response update fault ${response.body}");

      if (response.statusCode == 200) {
        isFound(true);
        successToastMessage(msg: 'Fault successfully updated');
        update();
        Get.back();
      } else {
        errorToastMessage(msg: 'Invalid data provided, please try again');
        isFound(false);
      }
    });
  }
}
