//declare packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/engineer/my_fault_card.dart';
import 'package:jedmgr/features/fault_reporting/update_fault.dart';

import '../fault_reporting/controller/fault_controller.dart';

class TechnicianFaults extends StatefulWidget {
  final String lat, long;
  final String token, address;
  const TechnicianFaults({
    Key? key,
    required this.lat,
    required this.long,
    required this.token,
    required this.address,
  }) : super(key: key);

  @override
  TechnicianFaultsState createState() => TechnicianFaultsState();
}

class TechnicianFaultsState extends State<TechnicianFaults> {
  FaultController fault = FaultController.to;

  @override
  void initState() {
    fault.displayFaults(widget.token);
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
      body: Obx(() {
        if (fault.isLoading.value) {
          return const Center(child: Text('loading...'));
        } else {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ListView.builder(
                itemCount: fault.faultModelList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return MyFaultCard(
                    color: fault.faultModelList[index]['statusColor'],
                    faultType: fault.faultModelList[index]['type'],
                    createdAt:
                        getDateTime(fault.faultModelList[index]['createdAt']),
                    status: fault.faultModelList[index]['status'],
                    description: fault.faultModelList[index]['description'],
                    updatedAt:
                        getDateTime(fault.faultModelList[index]['updatedAt']),
                    onUpdate: () {
                      Get.to(() => UpdateFault(
                            address: widget.address,
                            statusId: fault.faultModelList[index]['statusId']
                                .toString(),
                            description: fault.faultModelList[index]
                                ['description'],
                            statusName: fault.faultModelList[index]['status'],
                            faultId:
                                fault.faultModelList[index]['id'].toString(),
                            token: widget.token,
                            longitude: widget.long,
                            latitude: widget.lat,
                          ));
                    },
                  );
                }),
          );
        }
      }),
    );
  }
}
