import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/authentication/controller/auth_controller.dart';
import 'package:jedmgr/features/cash_drive/cash_drive_search.dart';
import 'package:jedmgr/features/distribution/search_bill.dart';
import 'package:jedmgr/features/home/fault_reporting.dart';
import 'package:jedmgr/features/ppm_monitoring/create_ppm.dart';

import '../../core/themes/theme_colors.dart';
import '../../core/themes/theme_text.dart';

class HomeScreen extends StatefulWidget {
  final String lat, long;
  final String name, token;
  const HomeScreen({
    Key? key,
    required this.lat,
    required this.long,
    required this.name,
    required this.token,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController auth = AuthController.to;

  @override
  Widget build(BuildContext context) {
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      appBar: myAppBar(context, currentTime),
      body: Container(
        padding: const EdgeInsets.all(9),
        margin: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 80,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8.0,
              offset: Offset(
                0.0,
                4.0,
              ),
              color: ThemeColors.shadowColor,
            )
          ],
        ),
        child: const Text(
          'What Activity do you want to Perform today?',
          style: TextStyle(
            color: ThemeColors.blackColor1,
            fontWeight: JanguAskFontWeight.kBoldText,
            fontSize: 15,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(9),
        margin: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8.0,
              offset: Offset(
                0.0,
                4.0,
              ),
              color: ThemeColors.shadowColor,
            )
          ],
        ),
        child: GridView(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
              crossAxisCount: 2),
          children: [
            HomeCard(
              icon: 'images/bill.png',
              title: 'Bill Distribution',
              onTap: () {
                Get.to(() => BillsDistribution(
                      token: widget.token,
                      latitude: widget.lat,
                      longitude: widget.long,
                    ));
              },
            ),
            HomeCard(
              icon: 'images/cash.png',
              title: 'Cash Drive',
              onTap: () {
                Get.to(() => CashDriveSearch(
                      token: widget.token,
                      latitude: widget.lat,
                      longitude: widget.long,
                    ));
              },
            ),
            HomeCard(
              icon: 'images/monitoring.png',
              title: 'PPM Monitoring',
              onTap: () async {
                Get.to(() => CreatePPM(
                      token: widget.token,
                      latitude: widget.lat,
                      longitude: widget.long,
                    ));
              },
            ),
            HomeCard(
              icon: 'images/fault.jpeg',
              title: 'Fault Reporting',
              onTap: () async {
                Get.to(() => FaultReporting(
                      token: widget.token,
                      latitude: widget.lat,
                      longitude: widget.long,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget myAppBar(BuildContext context, time) => AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.10,
      title: const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text('JED Marketer',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10),
        child: GestureDetector(
          onTap: () {
            auth.marketerLogout(widget.lat, widget.long, widget.token);
          },
          child: const CircleAvatar(
              child: Icon(
            Icons.logout,
            size: 30,
          )),
        ),
      ),
      actions: <Widget>[
        InkWell(
            child: Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Image.network(profilePHOTO))),
            onTap: () {}),
        const SizedBox(width: 20)
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(55))),
      bottom: _appBarBottom(context, time));

  // Widget _bottomNavigationBar() =>
  _appBarBottom(BuildContext context, time) => PreferredSize(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(2.0)))),
                  child: textFieldDecoration(time)))),
      preferredSize: const Size.fromHeight(120.0));

  Widget textFieldDecoration(String time) => Container(
        margin:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'GPRS Coordinate',
                  style: TextStyle(
                    color: ThemeColors.blackColor1,
                    fontWeight: JanguAskFontWeight.kBoldText,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  "${widget.lat}, ${widget.long}",
                  style: const TextStyle(
                    color: ThemeColors.primaryGreyColor,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Logged In time',
                  style: TextStyle(
                    color: ThemeColors.blackColor1,
                    fontWeight: JanguAskFontWeight.kBoldText,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  time,
                  style: const TextStyle(
                    color: ThemeColors.primaryGreyColor,
                    fontSize: 12.0,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.12,
          margin: const EdgeInsets.only(
              top: 17.5, bottom: 5.0, left: 5.0, right: 5.0),
          //padding: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 2.5),
                blurRadius: 10.5,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  icon,
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
              ],
            ),
          ),
        ),
        FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0.400,
          onPressed: onTap,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Colors.black87,
        )
      ],
    );
  }
}
