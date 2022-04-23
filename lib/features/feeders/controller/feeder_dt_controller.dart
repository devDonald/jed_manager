// import 'package:get/get.dart';
// import 'package:jedmgr/features/feeders/model/feeder_model.dart';
// import 'package:jedmgr/features/feeders/services/feeder_services.dart';
//
// class FeederController extends GetxController {
//   static FeederController to = Get.find();
//   var isLoading = false.obs;
//
//   var customerModel = FeederModel().obs;
//
//   Future<dynamic> displayCustomer(String token, String query) async {
//     try {
//       isLoading(true);
//       var allFeeder =
//           await FeederServices.getFeeder('marketer/getAllFeeders', token);
//       if (allFeeder != null) {
//         return FeederModel.fromJsonList(allFeeder.);
//       } else {
//         return null;
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
