import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/features/distribution/model/get_customer_model.dart';
import 'package:jedmgr/features/distribution/update_customer.dart';

import '../../core/themes/theme_colors.dart';
import '../../core/themes/theme_text.dart';
import '../cash_drive/update_bill.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard(
      {Key? key,
      this.customerName,
      this.address,
      this.accountNo,
      this.paymentDate,
      this.feeder,
      this.dtName,
      this.status,
      this.band,
      this.lastPaymentAmount,
      this.areaOffice,
      this.receiverNo,
      this.longitude,
      this.latitude,
      this.token,
      this.dtId,
      this.feederId,
      this.unUnpaidBills,
      required this.mapAddress,
      required this.isCashDrive,
      required this.color})
      : super(key: key);
  final String? customerName;
  final String? address;
  final String? accountNo;
  final String? paymentDate;
  final String? feeder;
  final String mapAddress;
  final String? dtName, areaOffice;
  final String? status, lastPaymentAmount;
  final String? band, receiverNo, token, longitude, latitude, dtId, feederId;
  final List<UnpaidBill?>? unUnpaidBills;
  final bool isCashDrive;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feeder',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              feeder ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'DT Name',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              dtName ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Customer Account No',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              accountNo ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Address',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              address ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Status',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              color: getStyleColor(color),
              padding: const EdgeInsets.all(8),
              child: Text(
                status ?? 'not specified',
                style: const TextStyle(
                  color: ThemeColors.whiteColor,
                  fontSize: 17.0,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Date of Last Payment',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              paymentDate ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Last Payment Amount',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              lastPaymentAmount ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Band',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              band ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Area Office',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              areaOffice ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              "Customer's Name",
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              customerName ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.primaryGreyColor,
                fontSize: 17.0,
              ),
            ),
            const SizedBox(height: 15.0),
            // const Text(
            //   "Receiver's Number",
            //   style: TextStyle(
            //     color: ThemeColors.blackColor1,
            //     fontWeight: JanguAskFontWeight.kBoldText,
            //     fontSize: 17,
            //   ),
            // ),
            // const SizedBox(height: 8.0),
            // Text(
            //   receiverNo ?? 'not specified',
            //   style: TextStyle(
            //     color: ThemeColors.primaryGreyColor,
            //     fontSize: 17.0,
            //   ),
            // ),
            const SizedBox(height: 10.0),
            const Divider(
              height: 2,
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Unpaid Bills',
              style: TextStyle(
                color: ThemeColors.blackColor1,
                fontWeight: JanguAskFontWeight.kBoldText,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              height: 2,
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
                itemCount: unUnpaidBills!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BillsCard(
                    isCashDrive: isCashDrive,
                    status: unUnpaidBills?[index]?.status!.name,
                    color: unUnpaidBills?[index]?.status!.color,
                    receiverNo: unUnpaidBills?[index]?.receiverPhoneNumber,
                    amount: unUnpaidBills?[index]?.amountToPay,
                    billNo: unUnpaidBills?[index]?.id.toString(),
                    amountToPay: unUnpaidBills?[index]?.amount,
                    updateNumBill: () {
                      Get.to(() => UpdateCustomerBill(
                            mapAddress: mapAddress,
                            billId: "${unUnpaidBills?[index]?.id}",
                            dtId: dtId!,
                            dtName: dtName!,
                            statusId: "${unUnpaidBills?[index]?.status!.id}",
                            feederId: feederId!,
                            token: token!,
                            longitude: longitude!,
                            latitude: latitude!,
                            status: "${unUnpaidBills?[index]?.status!.name}",
                            customerNo: accountNo!,
                            feeder: feeder!,
                          ));
                    },
                    updateCashBill: () {
                      Get.to(() => UpdateBill(
                            billId: unUnpaidBills![index]!.id.toString(),
                            statusId: "${unUnpaidBills?[index]?.status!.id}",
                            token: token!,
                            longitude: longitude!,
                            latitude: latitude!,
                            mapAddress: mapAddress,
                            statusName:
                                "${unUnpaidBills?[index]?.status!.name}",
                          ));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class BillsCard extends StatelessWidget {
  final String? receiverNo, amount, amountToPay, billNo, status, color;
  final Function()? updateCashBill, updateNumBill;
  final bool isCashDrive;
  const BillsCard(
      {Key? key,
      required this.receiverNo,
      required this.amount,
      required this.isCashDrive,
      required this.updateCashBill,
      required this.updateNumBill,
      required this.billNo,
      required this.status,
      required this.color,
      required this.amountToPay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 8,
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
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Bill Number",
                        style: TextStyle(
                          color: ThemeColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        billNo ?? 'not specified',
                        style: const TextStyle(
                          color: ThemeColors.primaryGreyColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Receiver's Number",
                        style: TextStyle(
                          color: ThemeColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        receiverNo ?? 'not specified',
                        style: const TextStyle(
                          color: ThemeColors.primaryGreyColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Amount",
                        style: TextStyle(
                          color: ThemeColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        amount ?? 'not specified',
                        style: const TextStyle(
                          color: ThemeColors.primaryGreyColor,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Amount to Pay",
                        style: TextStyle(
                          color: ThemeColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        amountToPay ?? 'not specified',
                        style: const TextStyle(
                          color: ThemeColors.primaryGreyColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Bill Status",
                        style: TextStyle(
                          color: ThemeColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        color: getStyleColor(color!),
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          status ?? 'not specified',
                          style: const TextStyle(
                            color: ThemeColors.whiteColor,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          isCashDrive
              ? Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: updateCashBill,
                    child: const Icon(Icons.update, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: updateNumBill,
                    child: const Icon(Icons.update, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
