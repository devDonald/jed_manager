import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jedmgr/features/distribution/controller/distribution_controller.dart';
import 'package:jedmgr/features/fault_reporting/controller/fault_controller.dart';
import 'package:new_version/new_version.dart';

import 'core/constants/contants.dart';
import 'core/routes/app_pages.dart';
import 'features/authentication/controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  Get.put<AuthController>(AuthController());
  Get.put<DistributionController>(DistributionController());
  Get.put<FaultController>(FaultController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final newVersion = NewVersion(
      iOSId: 'com.gnorizonconsults.jedmgr',
      androidId: 'com.gnorizonconsults.jedmgr',
    );
    newVersion.showAlertIfNecessary(context: context);

    currentTheme.addListener(() {
      //2
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Jed Mgr",
      initialRoute: '/',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
