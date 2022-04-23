import 'package:flutter/material.dart';
import 'package:jedmgr/features/authentication/model/technician_login_model.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../../core/constants/contants.dart';
import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/screen_title.dart';
import '../controller/auth_controller.dart';

class TechnicianLoginScreen extends StatefulWidget {
  const TechnicianLoginScreen({Key? key}) : super(key: key);

  @override
  State<TechnicianLoginScreen> createState() => _TechnicianLoginScreenState();
}

class _TechnicianLoginScreenState extends State<TechnicianLoginScreen> {
  final AuthController authController = AuthController.to;

  final TextEditingController _username = TextEditingController();

  final TextEditingController _password = TextEditingController();
  LocationData? _currentPosition;
  Location location = Location();

  late ProgressDialog pr;
  bool _obscureText = true;

  @override
  void initState() {
    fetchLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(message: 'Please wait, signing in');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              // key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 39.8),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'images/logo.jpeg',
                            width: 220,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 31.1),
                    const ScreenTitleIndicator(
                      title: 'ENGINEER LOGIN',
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: ThemeColors.whiteColor,
                        borderRadius: BorderRadius.circular(2.5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7.5,
                            offset: Offset(0.0, 2.5),
                            color: ThemeColors.shadowColor,
                          )
                        ],
                      ),

                      width: double.infinity,
                      // width: double.infinity,
                      // height: 40.0,
                      child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          controller: _username,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.newline,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: const Icon(Icons.person),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: ThemeColors.whiteColor,
                        borderRadius: BorderRadius.circular(2.5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7.5,
                            offset: Offset(0.0, 2.5),
                            color: ThemeColors.shadowColor,
                          )
                        ],
                      ),
                      width: double.infinity,
                      // height: 40.0,
                      child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          controller: _password,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.newline,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                if (mounted) {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                }
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                    // const SizedBox(height: 10),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: FlatSecondaryButton(
                    //     title: 'Forgot Password? Click Here!',
                    //     color: ThemeColors.primaryColor,
                    //     onTap: () {
                    //       Get.to(() => const ResetPassword());
                    //     },
                    //   ),
                    // ),
                    const SizedBox(height: 50.0),
                    PrimaryButton(
                      width: double.infinity,
                      height: 45.0,
                      buttonTitle: 'Login',
                      color: ThemeColors.primaryColor,
                      blurRadius: 7.0,
                      roundedEdge: 10,
                      onTap: () async {
                        if (validateLogin(_username.text, _password.text)) {
                          print('latitude: ${_currentPosition!.latitude}');
                          print('longitude: ${_currentPosition!.longitude}');
                          authController.loginTechnician(TechnicianLoginModel(
                              technicianId: _username.text,
                              password: _password.text,
                              latitude: _currentPosition!.latitude.toString(),
                              longitude:
                                  _currentPosition!.longitude.toString()));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 23.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          _currentPosition = currentLocation;
        });
      }
    });
  }
}
