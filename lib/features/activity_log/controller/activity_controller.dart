import 'package:get/get.dart';

import '../../distribution/services/distribution_services.dart';

class ActivityController extends GetxController {
  static ActivityController to = Get.find();

  var isLoading = false.obs;
  var isFound = false.obs;
  var date = ''.obs;

  List<Map> activityModelList = <Map>[].obs;

  void displayActivityLog(String token) async {
    try {
      isLoading(true);
      var faults = await DistributionServices.getActivityLog(
          'marketer/getLogForDate?date=$date', token);
      print("first activity: ${faults}");
      if (faults != null) {
        isFound(true);
        activityModelList = faults;
      } else {
        isFound(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
