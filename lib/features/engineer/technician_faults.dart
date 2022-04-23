//declare packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedmgr/features/engineer/my_fault_card.dart';

import '../fault_reporting/controller/fault_controller.dart';

class TechnicianFaults extends StatefulWidget {
  final String lat, long;
  final String token;
  const TechnicianFaults({
    Key? key,
    required this.lat,
    required this.long,
    required this.token,
  }) : super(key: key);

  @override
  TechnicianFaultsState createState() => TechnicianFaultsState();
}

class TechnicianFaultsState extends State<TechnicianFaults> {
  FaultController cont = FaultController.to;
  String query = '';

  @override
  void initState() {
    cont.displayFaults(widget.token);
    print("fault list: ${cont.faultModelList}");
    super.initState();
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Assigned Faults',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Expanded(child: Obx(() {
        if (cont.isLoading.value) {
          return const Center(child: Text('loading...'));
        } else {
          return ListView.builder(
            itemCount: cont.faultModelList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return MyFaultCard();
            },
          );
        }
      })),
    );
  }
}
