//declare packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/distribution/add_customer.dart';
import 'package:jedmgr/features/distribution/controller/distribution_controller.dart';

import '../../core/themes/theme_colors.dart';
import 'customer_card.dart';

class BillsDistribution extends StatefulWidget {
  final String token, longitude, latitude, address;

  const BillsDistribution(
      {Key? key,
      required this.token,
      required this.longitude,
      required this.address,
      required this.latitude})
      : super(key: key);

  @override
  BillsDistributionState createState() => BillsDistributionState();
}

class BillsDistributionState extends State<BillsDistribution> {
  DistributionController cont = DistributionController.to;
  String query = '';
  bool firstLaunch = true;

  @override
  void initState() {
    super.initState();
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Bill Distribution',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    cont.displayCustomer(widget.token, query);
                  },
                  child: const Icon(Icons.search),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                hintText: 'Search Customer Number',
              ),
              onChanged: (string) {
                query = string;
              },
            ),
          ),
          Expanded(child: Obx(() {
            if (cont.isLoading.value) {
              firstLaunch = false;
              return const Center(child: Text('loading...'));
            } else {
              return SingleChildScrollView(
                child: cont.isFound.value && firstLaunch == false
                    ? CustomerCard(
                        mapAddress: widget.address,
                        dtId: cont.customerModel.value.data!.dt!.id.toString(),
                        feederId: cont.customerModel.value.data!.feeder!.id
                            .toString(),
                        color: cont.customerModel.value.data!.status!.color!,
                        customerName: cont.customerModel.value.data!.name,
                        address: cont.customerModel.value.data!.address,
                        accountNo: cont.customerModel.value.data!.accountNumber,
                        receiverNo: cont.customerModel.value.data!.phone,
                        paymentDate: getDateTime(
                            cont.customerModel.value.data!.lastPaymentDate),
                        feeder: cont.customerModel.value.data!.feeder!.name,
                        dtName: cont.customerModel.value.data!.dt!.name,
                        status: cont.customerModel.value.data!.status!.name,
                        band: cont.customerModel.value.data!.band,
                        areaOffice:
                            cont.customerModel.value.data!.areaOffice!.name,
                        lastPaymentAmount:
                            cont.customerModel.value.data!.lastPaymentAmount,
                        unUnpaidBills:
                            cont.customerModel.value.data!.unpaidBills,
                        longitude: widget.longitude,
                        latitude: widget.latitude,
                        token: widget.token,
                        isCashDrive: false,
                      )
                    : !firstLaunch == true
                        ? const Center(
                            child: Text('Customer Not Found'),
                          )
                        : const Center(
                            child: Text('Start a new search'),
                          ),
              );
            }
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: ThemeColors.blackColor1,
        child: const Icon(
          Icons.add,
          color: ThemeColors.whiteColor,
        ),
        onPressed: () {
          Get.to(() => AddDT(
                address: widget.address,
                token: widget.token,
                longitude: widget.longitude,
                latitude: widget.latitude,
              ));
        },
      ),
    );
  }
}
