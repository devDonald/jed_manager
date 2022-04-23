import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jedmgr/core/themes/theme_text.dart';
import 'package:jedmgr/features/authentication/marketer/login_screen.dart';

import '../../../core/themes/theme_colors.dart';
import '../../../core/widgets/jed_brand_name.dart';
import '../technician/technician_login.dart';

class LogInAs extends StatefulWidget {
  static const String id = 'LogInAs';
  const LogInAs({Key? key}) : super(key: key);

  @override
  _LogInAsState createState() => _LogInAsState();
}

class _LogInAsState extends State<LogInAs> {
  //pass value to use

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: SvgPicture.asset(
                'images/weirdShape2.svg',
                width: 96.8,
                height: 264.8,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 64.4,
                    ),
                    Image.asset(
                      'images/logo.jpeg',
                      width: 220,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 75.5,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          'How do you want to use',
                          style: TextStyle(
                            fontFamily: JedFontFamily.secondaryFontMonserat,
                            fontWeight: JanguAskFontWeight.kBoldText,
                            fontSize: 20.0,
                            color: ThemeColors.primaryGreyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            JedText(
                              fontSize: 20.0,
                            ),
                            Text(
                              '?',
                              style: TextStyle(
                                color: ThemeColors.primaryColor,
                                fontSize: 18.0,
                                fontWeight: JanguAskFontWeight.kBoldText,
                                fontFamily: JedFontFamily.secondaryFontMonserat,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    LogInAsButton(
                      title: 'As a Marketer',
                      onTap: () {
                        Get.to(() => const MarketerLoginScreen());
                      },
                    ),
                    LogInAsButton(
                        title: 'As an Engineer / Technician',
                        onTap: () {
                          Get.to(() => const TechnicianLoginScreen());
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogInAsButton extends StatelessWidget {
  const LogInAsButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 107.4,
        margin: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 16.0,
        ),
        decoration: BoxDecoration(
          color: ThemeColors.primaryColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              color: ThemeColors.primaryColor.withOpacity(0.5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 1,
              right: 1,
              bottom: -30,
              child: SvgPicture.asset('images/buttonDesign.svg'),
            ),
            Center(
              child: Text(
                title!,
                style: const TextStyle(
                  color: ThemeColors.whiteColor,
                  fontSize: 18.0,
                  fontFamily: JedFontFamily.secondaryFontMonserat,
                  fontWeight: JanguAskFontWeight.kBoldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
