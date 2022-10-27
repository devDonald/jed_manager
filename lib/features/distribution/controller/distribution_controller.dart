import 'package:get/get.dart';
import 'package:jedmgr/features/cash_drive/cash_drive_model.dart';
import 'package:jedmgr/features/distribution/model/get_customer_model.dart';
import 'package:jedmgr/features/distribution/model/new_customer_details.dart';
import 'package:jedmgr/features/distribution/services/distribution_services.dart';

import '../../../core/constants/contants.dart';
import '../../../core/services/network_handler.dart';
import '../../../core/widgets/customFullScreenDialog.dart';
import '../model/update_customer_model.dart';

class DistributionController extends GetxController {
  static DistributionController to = Get.find();
  var isLoading = false.obs;
  var isFound = false.obs;

  var customerModel = GetCustomerModel().obs;

  void displayCustomer(String token, String query) async {
    try {
      isLoading(true);
      var customerDetails = await DistributionServices.getCustomer(
          'marketer/getCustomer/$query', token);
      if (customerDetails != null) {
        isFound(true);
        customerModel.value = customerDetails;
      } else {
        isFound(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void createAccount(NewCustomerModel model, String token) {
    CustomFullScreenDialog.showDialog();
    isLoading(true);
    NetworkHandler.postRequest(
            newCustomerModelToJson(model), "marketer/createBillRecord", token)
        .then((response) {
      isLoading(false);
      print("response ${response.statusCode}");
      print("responsebody ${response.body}");
      if (response.statusCode == 201) {
        isFound(true);
        successToastMessage(msg: 'Customer created successfully.');
        Get.back();
      } else {
        errorToastMessage(msg: 'please try again with valid data');
      }
    });
  }

  void updateAccount(UpdateCustomerModel model, String token, String customerId,
      String billId) {
    isLoading(true);
    CustomFullScreenDialog.showDialog();

    NetworkHandler.postRequest(updateCustomerModelToJson(model),
            "marketer/updateCustomer/$customerId/bill/$billId", token)
        .then((response) {
      CustomFullScreenDialog.cancelDialog();
      print("response update ${response.statusCode}");
      print("response update ${response.body}");

      if (response.statusCode == 200) {
        isFound(true);
        successToastMessage(msg: 'Customer bill successfully updated');
        update();
        Get.back();
      } else {
        errorToastMessage(msg: 'Invalid data provided, please try again');
        isFound(false);
      }
    });
  }

  void updateBill(UpdateBillModel model, String token, String customerId) {
    isLoading(true);
    CustomFullScreenDialog.showDialog();

    NetworkHandler.postRequest(updateBillModelToJson(model),
            "marketer/updateBill/$customerId", token)
        .then((response) {
      CustomFullScreenDialog.cancelDialog();
      print("response update bill ${response.statusCode}");
      print("response update bill ${response.body}");
      // UpdateResponseModel responseModel =
      // updateResponseModelFromJson(response.body);
      // print("response message ${responseModel.message}");

      if (response.statusCode == 200) {
        isFound(true);
        successToastMessage(msg: 'Bill successfully updated');
        update();
        Get.back();
      } else {
        errorToastMessage(msg: 'Invalid data provided, please try again');
        isFound(false);
      }
    });
  }
}
