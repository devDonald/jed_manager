import 'package:get/get.dart';
import 'package:jedmgr/features/distribution/services/distribution_services.dart';
import 'package:jedmgr/features/fault_reporting/get_faults_model.dart';
import 'package:jedmgr/features/home/fault_report_model.dart';
import 'package:jedmgr/features/ppm_monitoring/create_ppm_model.dart';

import '../../../core/constants/contants.dart';
import '../../../core/services/network_handler.dart';
import '../../../core/widgets/customFullScreenDialog.dart';

class FaultController extends GetxController {
  static FaultController to = Get.find();
  var isLoading = false.obs;
  var isFound = false.obs;

  var faultModelList = <GetFaultModel>[].obs;

  void displayFaults(String token) async {
    try {
      isLoading(true);
      var faults =
          await DistributionServices.getFaults('technician/getFaults', token);
      print("first fault: $faults");
      if (faults != null) {
        isFound(true);
        faultModelList.value.add(faults);
      } else {
        isFound(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void reportFaults(FaultReportModel model, String token) {
    CustomFullScreenDialog.showDialog();
    try {
      isLoading(true);
      NetworkHandler.postRequest(faultReportModelToJson(model),
              "marketer/createFaultReport", token)
          .then((response) {
        print("response ${response.statusCode}");
        print("responsebody ${response.body}");
        if (response.statusCode == 200) {
          isFound(true);
          successToastMessage(msg: 'Fault Report Created Successfully');
          Get.back();
        } else {
          errorToastMessage(msg: 'please try again with valid data');
        }
      });
    } finally {
      CustomFullScreenDialog.cancelDialog();
      isLoading(false);
    }
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
        successToastMessage(msg: 'PPM created successfully.');
        Get.back();
      } else {
        errorToastMessage(msg: 'please try again with valid data');
      }
    });
  }
}
